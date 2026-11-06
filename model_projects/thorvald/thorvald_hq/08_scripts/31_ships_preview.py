"""Check the ship animation the way the game will play it: the toolkit turns RIG_BaseArrakeen_Ships + our
Anim_ThorvaldCitadel_Ships HMD into an animated FBX (hmdanim2fbx, the same mirroring as the model converter), and
Blender plays it over the saved citadel (.blend from 20_build_hq.py --save), scaled like the prefab's rig node.

    python 31_ships_preview.py [H3] [--step 30]

Output: ../02_progress_photos/03_animation/<name>_ships.gif (one frame per --step game frames, default 1 s)
and a few stills.
"""
import json
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
argv, sys.argv = sys.argv[1:], sys.argv[:1]
import build_previews as B  # noqa: E402
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Animations"))
import hmdanim2fbx  # noqa: E402

A = __import__("30_ships_anim")
SCR = os.path.join(B.SCRATCH, "thv_hq")
OUT = os.path.join(PROJ, "02_progress_photos", "03_animation")
RIG = os.path.join(REPO, "model_inputs", "Structure", "Base", "Arrakeen", "RIG_BaseArrakeen_Ships.fbx")

BLENDER_SIDE = r'''
import bpy, json, sys, os, math
sys.path.insert(0, os.path.dirname(sys.argv[sys.argv.index("--") + 2]))
cfg = json.load(open(sys.argv[sys.argv.index("--") + 1]))
bpy.ops.wm.open_mainfile(filepath=cfg["blend"])
import hq_scene as S
from mathutils import Vector
groups = [o for o in bpy.data.objects if o.type == "MESH"]
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=cfg["ships_fbx"], use_anim=True, automatic_bone_orientation=False)
new = [o for o in bpy.data.objects if o not in before]
root = bpy.data.objects.new("RigNode", None)
bpy.context.scene.collection.objects.link(root)
for o in new:
    if o.parent is None:
        o.parent = root
    if o.type == "MESH":
        o.data.materials.clear()
        o.data.materials.append(S.material("ships", **cfg["ship_tex"]))
root.scale = (cfg["rig_scale"],) * 3
arm = next(o for o in new if o.animation_data and o.animation_data.action)
lo, hi = S.bounds(groups)
c = (lo + hi) / 2
c.z = 6
cam = S.lights_and_camera(c, 95)
sc = bpy.context.scene
sc.render.fps = 30
os.makedirs(cfg["frames"], exist_ok=True)
for i, f in enumerate(range(0, cfg["n_frames"], cfg["step"])):
    sc.frame_set(f)
    S.shoot(cam, c, -60, 38, os.path.join(cfg["frames"], "frame_%04d.png" % i), px=(720, 540))
for f in cfg["stills"]:
    sc.frame_set(f)
    S.shoot(cam, c, -60, 38, os.path.join(cfg["out"], "%s_ships_f%04d.png" % (cfg["name"], f)), px=(1400, 1050))
'''


def main():
    name = next((a for a in argv if not a.startswith("--") and not a.isdigit()), "H3")
    step = int(argv[argv.index("--step") + 1]) if "--step" in argv else 30
    os.makedirs(OUT, exist_ok=True)
    ships_fbx = os.path.join(SCR, "ships_anim.fbx")
    hmdanim2fbx.export(RIG, A.OUT, ships_fbx)
    tex = os.path.join(SCR, "tex")
    frames = os.path.join(SCR, "ship_frames_" + name)
    for f in (os.listdir(frames) if os.path.isdir(frames) else []):
        os.remove(os.path.join(frames, f))
    import hmd_anim as HA
    n = HA.load_animation(A.OUT)[1].frames
    cfg = dict(blend=os.path.join(PROJ, "03_blender", name + ".blend"), ships_fbx=ships_fbx, rig_scale=A.RIG_SCALE,
               ship_tex=dict(albedo=os.path.join(tex, "ArrakeenAsset_Albedo.png"),
                             normal=os.path.join(tex, "ArrakeenAsset_Normal.png"),
                             mgao=os.path.join(tex, "ArrakeenAsset_MetallicGlossAO.png")),
               frames=frames, n_frames=n, step=step, out=OUT, name=name,
               stills=[int(30 * s) for s in (12.0, 24.0, 45.0, 75.0)])
    cp = os.path.join(SCR, "ships_preview.json")
    json.dump(cfg, open(cp, "w"))
    side = os.path.join(SCR, "ships_preview_side.py")
    open(side, "w").write(BLENDER_SIDE)
    r = subprocess.run([B.BLENDER, "-b", "--python", side, "--", cp, os.path.join(HERE, "hq_scene.py")],
                       capture_output=True, text=True)
    errs = [ln for ln in (r.stdout + r.stderr).splitlines() if "Error" in ln or "Traceback" in ln]
    print("\n".join(errs[:10]))
    from PIL import Image
    paths = sorted(os.path.join(frames, f) for f in os.listdir(frames))
    ims = [Image.open(p).convert("RGB") for p in paths]
    pal = ims[len(ims) // 3].quantize(colors=256, method=Image.Quantize.MEDIANCUT)
    gif = os.path.join(OUT, name + "_ships.gif")
    q = [im.quantize(palette=pal) for im in ims]
    q[0].save(gif, save_all=True, append_images=q[1:], duration=int(1000 * step / 30 / 4), loop=0)
    print("GIF", gif, len(ims), "frames (4x speed)")


if __name__ == "__main__":
    main()
