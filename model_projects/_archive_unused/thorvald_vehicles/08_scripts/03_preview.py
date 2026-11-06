"""Build a preview .blend and render the standard angles for one vehicle/ship.

    blender -b --python 03_preview.py -- <unit> [--no-save]

<unit> is a key of UNITS. The recoloured albedo from 02_recolour.py replaces the
vanilla one, the material is re-wired the way the game reads MetallicGlossAO
(matte, no milky film), and the result is packed into
03_blender/Thorvald_<Name>.blend with renders in 02_progress_photos/<unit>/.
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
MI_DIR = os.path.dirname(os.path.dirname(PROJ)) + os.sep + "model_inputs"
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

UNITS = {
    "fighter": ("Wraith_TRUE_FBX.fbx", "Thorvald_Fighter", "Wraith_Albedo.png"),
    "drone": ("DroneS_TRUE_FBX.fbx", "Thorvald_Drone", "CombatDrone_Smuggler_Albedo.png"),
    "claw": ("Harvester_TRUE_FBX.fbx", "Thorvald_ClawHauler", None),
    "carryall": ("CarryAll_TRUE_FBX.fbx", "Thorvald_Carryall", "CarryAll_Albedo.png"),
}

args = sys.argv[sys.argv.index("--") + 1:]
unit = args[0]
fbx_name, blend_name, _ = UNITS[unit]
save = "--no-save" not in args

bs.reset_scene()
bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", fbx_name))
bpy.context.view_layer.update()
bpy.context.evaluated_depsgraph_get().update()

# junk (Cube/Camera/Light) never renders
for n in bs.JUNK_NAMES:
    o = bpy.data.objects.get(n)
    if o:
        bpy.data.objects.remove(o, do_unlink=True)

# re-point every texture: the recoloured albedo where we have one, and for the
# rest resolve the FBX-relative path (05_fbx_export\...) back onto model_inputs
# so the image actually exists on disk and can be packed.
texdir = os.path.join(PROJ, "04_textures", unit)


def resolve(node):
    fp = bpy.path.abspath(node.image.filepath)
    base = os.path.basename(fp)
    mine = os.path.join(texdir, base)
    if os.path.exists(mine):
        return mine
    norm = fp.replace("\\", "/")
    marker = "/05_fbx_export/"
    tail = norm.split(marker, 1)[-1] if marker in norm else base
    for root in (MI_DIR, PROJ):
        cand = os.path.join(root, tail.replace("/", os.sep))
        if os.path.exists(cand):
            return cand
    cand = os.path.join(MI_DIR, base)
    return cand if os.path.exists(cand) else None


for m in bpy.data.materials:
    if not m.use_nodes:
        continue
    for node in [n for n in m.node_tree.nodes if n.type == "TEX_IMAGE"]:
        if not node.image:
            continue
        found = resolve(node)
        if "--only-albedo" in args and os.path.dirname(found or "") != texdir:
            continue
        if not found:
            print("MISSING TEXTURE", node.image.filepath)
            continue
        img = bpy.data.images.load(found, check_existing=False)
        img.name = os.path.basename(found)
        # a freshly loaded image defaults to sRGB; data textures must be
        # Non-Color or the AO/normal decode is wrong and the model renders black
        base = img.name.lower()
        data_tex = ("normal" in base) or ("metallic" in base) or ("gloss" in base) \
            or ("_ao" in base) or ("rough" in base)
        img.colorspace_settings.name = "Non-Color" if data_tex else "sRGB"
        node.image = img

PW.apply_all()          # matte game-style wiring + neutral world

meshes = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]
lo = Vector((99, 99, 99))
hi = Vector((-99, -99, -99))
for o in meshes:
    a, b = bs.model_bounds(o)
    lo = Vector((min(lo.x, a.x), min(lo.y, a.y), min(lo.z, a.z)))
    hi = Vector((max(hi.x, b.x), max(hi.y, b.y), max(hi.z, b.z)))
centre = (lo + hi) / 2
size = max(hi.x - lo.x, hi.y - lo.y, hi.z - lo.z)

out_dir = os.path.join(PROJ, "02_progress_photos", unit)
os.makedirs(out_dir, exist_ok=True)
bs.setup_render(900, 700)
bs.setup_world()
bs.setup_lights()
scale = size * 1.15
cam = bs.setup_camera(target=centre, ortho_scale=scale, distance=scale * 3.0)
VIEWS = {
    "front": (0.0, -1.0, 0.18),
    "side": (1.0, 0.0, 0.18),
    "back": (0.0, 1.0, 0.18),
    "tq": (0.75, -0.75, 0.42),
}
for name, d in VIEWS.items():
    v = Vector(d).normalized()
    cam.location = centre + v * scale * 3.0
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(out_dir, "%s_%s.png" % (unit, name)), cam)

print("BOUNDS", unit, [round(hi[i] - lo[i], 3) for i in range(3)], "centre", [round(c, 3) for c in centre])

if "--diag" in args:
    import numpy as np
    try:
        bpy.ops.render.render(write_still=False)
    except Exception:
        pass
    rr = bpy.data.images.get("Render Result")
    if rr and rr.size[0]:
        px = np.array(rr.pixels[:]).reshape(-1, 4)
        rgb = px[:, :3]
        bg = (rgb > 0.96).all(-1)
        v = rgb[~bg].max(-1)
        print("DIAG render frac=%.3f mean=%.3f p50=%.3f" % ((~bg).mean(), v.mean(), np.percentile(v, 50)))
    for m in bpy.data.materials:
        if not m.use_nodes:
            continue
        b = next((n for n in m.node_tree.nodes if n.type == "BSDF_PRINCIPLED"), None)
        if b is None:
            continue
        def src(sock):
            l = next((l for l in m.node_tree.links if l.to_node == b and l.to_socket.name == sock), None)
            if l is None:
                return "const%.2f" % b.inputs[sock].default_value[0] if hasattr(b.inputs[sock].default_value, "__len__") else "const%.2f" % b.inputs[sock].default_value
            n = l.from_node
            img = getattr(n, "image", None)
            return "%s<-%s" % (n.type, img.name if img else "")
        print("DIAG mat", m.name, "|", {s: src(s) for s in ("Base Color", "Metallic", "Roughness")})

if save:
    # drop unused datablocks first so only live images get packed
    for coll in (bpy.data.meshes, bpy.data.materials, bpy.data.images):
        for d in list(coll):
            if d.users == 0:
                coll.remove(d)
    for img in bpy.data.images:
        if not img.packed_file:
            try:
                img.pack()
            except Exception as e:
                print("pack failed", img.name, e)
    out = os.path.join(PROJ, "03_blender", blend_name + ".blend")
    try:
        bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
        print("SAVED", out, os.path.getsize(out), "bytes")
    except Exception as e:
        print("SAVE FAILED", e)
