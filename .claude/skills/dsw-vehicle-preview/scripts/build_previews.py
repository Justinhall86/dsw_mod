"""Build the preview set for vehicle folders under model_inputs/Vehicle.

    python build_previews.py                  # every vehicle in catalog.json
    python build_previews.py Tank Hawk        # only these names (the catalog "name")
    python build_previews.py --diag Tank      # world-fixed views (front=-Y, back=+Y, x_pos, x_neg)
    python build_previews.py --regen Hawk     # rebuild a turntable GIF that already exists

Per vehicle, into its own folder:
    <Name>_preview.gif                  turntable, 36 frames at 60 ms
    <Name>_front.png / _back.png / _three_quarter.png
and the converted inputs into <folder>/preview_textures/ (the layout the older previews use).

Needs Blender 5.2 (BLENDER_EXE overrides the path) and Pillow in the Python that runs this.
"""
import copy
import glob
import json
import os
import shutil
import subprocess
import sys
import tempfile
import traceback

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))   # .claude/skills/<skill>/scripts -> repo root
VEH = os.path.join(REPO, "model_inputs", "Vehicle")
HMD_MODELS = os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models")
BLENDER = os.environ.get("BLENDER_EXE", r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe")
RENDER = os.path.join(HERE, "render_vehicle.py")
SCRATCH = os.path.join(tempfile.gettempdir(), "dsw_vehicle_preview")
N_FRAMES = 36
FRAME_MS = 60
DIAG = "--diag" in sys.argv
REGEN = "--regen" in sys.argv

sys.path.insert(0, HMD_MODELS)
import hmd2fbx  # noqa: E402
import hmd_reader as H  # noqa: E402

REAL_LOAD = H.load          # kept before any patching; see convert_model()

with open(os.path.join(HERE, "catalog.json"), encoding="utf-8") as fh:
    CATALOG = json.load(fh)


def dds_as_png(src, dst):
    """The game's textures are DDS data behind a .png name; Blender cannot read them, Pillow can."""
    Image.open(src).convert("RGBA").save(dst)
    return dst


def qmul(a, b):
    """Hamilton product of quaternions stored as (x, y, z, w)."""
    ax, ay, az, aw = a
    bx, by, bz, bw = b
    return (aw * bx + ax * bw + ay * bz - az * by,
            aw * by - ax * bz + ay * bw + az * bx,
            aw * bz + ax * by - ay * bx + az * bw,
            aw * bw - ax * bx - ay * by - az * bz)


def flatten_multi_model(path):
    """The converter takes exactly one model. A multi-part HMD (SpaceShuttle: Root -> Shuttle -> mesh)
    keeps its one mesh model, with the parents' rotations folded into the mesh's own transform.
    Parents that carry a translation or scale raise, because folding those in is not done here."""
    d = REAL_LOAD(path)
    meshes = [i for i, m in enumerate(d.models) if m.geometry >= 0]
    if len(meshes) != 1:
        raise RuntimeError("%d mesh models in %s; needs a manual split" % (len(meshes), path))
    i = meshes[0]
    chain = []
    k = i
    while k >= 0:
        chain.append(d.models[k])
        k = d.models[k].parent
    q = (0.0, 0.0, 0.0, 1.0)
    for m in reversed(chain):                        # root first, so world = root * ... * self
        p = m.position
        if (p.x, p.y, p.z) != (0.0, 0.0, 0.0) or (p.sx, p.sy, p.sz) != (1.0, 1.0, 1.0):
            raise RuntimeError("parent %r in %s has a translation or scale" % (m.name, path))
        q = qmul(q, (p.qx, p.qy, p.qz, p.qw))
    mesh = d.models[i]
    p = copy.copy(mesh.position)
    if q[3] < 0:                                     # qw is derived (always >= 0); -q is the same rotation
        q = tuple(-c for c in q)
    p.qx, p.qy, p.qz = q[0], q[1], q[2]
    mesh.position = p
    d.models = [mesh]
    return d


def convert_model(hmd, out_fbx):
    """HMD -> real FBX, with the one multi-part fallback. Checks the magic bytes afterwards."""
    try:
        hmd2fbx.convert(hmd, out_fbx, verbose=False)
    except NotImplementedError:                      # "expected 1 model, got N"
        H.load = lambda _path: flatten_multi_model(hmd)
        try:
            hmd2fbx.convert(hmd, out_fbx, verbose=False)
        finally:
            H.load = REAL_LOAD
    with open(out_fbx, "rb") as fh:
        if not fh.read(18).startswith(b"Kaydara FBX Binary"):
            raise RuntimeError("not a real FBX: " + out_fbx)
    return out_fbx


def make_gif(frames_dir, out_gif):
    paths = sorted(glob.glob(os.path.join(frames_dir, "frame_*.png")))
    if len(paths) != N_FRAMES:
        raise RuntimeError("expected %d frames, found %d" % (N_FRAMES, len(paths)))
    frames = [Image.open(p).convert("RGB") for p in paths]
    # One palette for the whole loop: per-frame palettes make the colours shimmer.
    picks = [frames[i] for i in range(0, len(frames), len(frames) // 4)][:4]
    w, h = frames[0].size
    sheet = Image.new("RGB", (w * len(picks), h))
    for i, p in enumerate(picks):
        sheet.paste(p, (i * w, 0))
    palette_ref = sheet.quantize(colors=256, method=Image.Quantize.MEDIANCUT)
    pal = [f.quantize(palette=palette_ref) for f in frames]
    pal[0].save(out_gif, save_all=True, append_images=pal[1:], duration=FRAME_MS, loop=0, optimize=False)
    return out_gif


def build(entry):
    name = entry["name"]
    vdir = os.path.join(VEH, *entry["folder"].split("/"))
    tdir = os.path.join(vdir, "preview_textures")
    os.makedirs(tdir, exist_ok=True)
    gif_path = os.path.join(vdir, name + "_preview.gif")
    turntable = (REGEN or not os.path.exists(gif_path)) and not DIAG

    fbx_paths = []
    for m in entry["models"]:
        stem = os.path.splitext(m)[0]
        fbx_paths.append(convert_model(os.path.join(vdir, m), os.path.join(tdir, stem + "_real.fbx")))

    def tex_or_none(key, out_name):
        if not entry.get(key):
            return None
        return dds_as_png(os.path.join(vdir, entry[key]), os.path.join(tdir, out_name))

    frames_dir = os.path.join(SCRATCH, "frames", name)
    shutil.rmtree(frames_dir, ignore_errors=True)
    cfg = dict(
        fbx=fbx_paths,
        name=name,
        front="-Y" if DIAG else entry.get("front", "-Y"),
        albedo=tex_or_none("albedo", "albedo.png"),
        mgao=tex_or_none("mgao", "mgao.png"),
        normal=tex_or_none("normal", "normal.png"),
        emissive=tex_or_none("emissive", "emissive.png"),
        flat_colour=entry.get("flat_colour"),
        turntable=turntable,
        frames_dir=frames_dir,
        n_frames=N_FRAMES,
    )
    if DIAG:
        diag = os.path.join(SCRATCH, "diag")
        os.makedirs(diag, exist_ok=True)
        cfg["stills"] = {v: os.path.join(diag, "%s_%s.png" % (name, v))
                         for v in ("front", "back", "three_quarter", "x_pos", "x_neg")}
    else:
        cfg["stills"] = {
            "front": os.path.join(vdir, name + "_front.png"),
            "back": os.path.join(vdir, name + "_back.png"),
            "three_quarter": os.path.join(vdir, name + "_three_quarter.png"),
        }

    cfg_path = os.path.join(SCRATCH, "cfg", name + ".json")
    os.makedirs(os.path.dirname(cfg_path), exist_ok=True)
    with open(cfg_path, "w", encoding="utf-8") as fh:
        json.dump(cfg, fh, indent=1)

    log_path = os.path.join(SCRATCH, "logs", name + ".log")
    os.makedirs(os.path.dirname(log_path), exist_ok=True)
    with open(log_path, "w", encoding="utf-8") as log:
        subprocess.run([BLENDER, "--background", "--factory-startup", "--python", RENDER, "--", cfg_path],
                       stdout=log, stderr=subprocess.STDOUT, check=True)

    missing = [p for p in cfg["stills"].values() if not os.path.exists(p)]
    if missing:
        raise RuntimeError("Blender did not write %s (see %s)" % (missing, log_path))
    if turntable:
        make_gif(frames_dir, gif_path)
    return {"name": name, "gif": gif_path if turntable else "kept existing",
            "stills": list(cfg["stills"].values()), "log": log_path}


if __name__ == "__main__":
    wanted = {a for a in sys.argv[1:] if not a.startswith("--")}
    failed = []
    for entry in CATALOG:
        if wanted and entry["name"] not in wanted:
            continue
        try:
            print("OK", json.dumps(build(entry)))
        except Exception as exc:                     # keep going: one bad vehicle must not stop the set
            failed.append(entry["name"])
            print("FAIL", entry["name"], "-", exc)
            traceback.print_exc()
    print("FAILED:", failed or "none")
