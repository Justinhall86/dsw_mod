"""Build one Sentinal concept variant from a JSON config.

  blender -b --python 19_build_variant.py -- <config.json>

Config keys
-----------
name        file stem suffix (sentinal_concept_<name>.blend)
paint       list of world-space paint ops, each with a `box` (fractional,
            ORIGINAL hull coordinates - paint runs before any deform)
ops         geometry ops:
              {"op":"delete_islands", "box":[[lo,hi]x3]}
              {"op":"deform", "band":[axis,w0,w1] or "box":[[lo,hi]x3],
               "scale":[x,y,z], "delta":[x,y,z], "pivot":[x,y,z],
               "shear":[axis, sh_axis, factor]}
            all in fractional coords of the ORIGINAL hull
parts       hand-modelled additions, `loc` fractional of the CURRENT hull
            after the ops:
              {"kind":"box","size":[..],"loc":[..],"rot":[deg,deg,deg],
               "taper":[tx,ty]}
              {"kind":"cyl","radius":..,"depth":..,"axis":"x|y|z",
               "segments":n,"hollow":0..1,"loc":[..],"rot":[..]}
              {"kind":"wedge","size":[..],"loc":[..],"rot":[..],"nose":"y"}
"""
import importlib.util
import json
import os
import sys

import bpy

_HERE = os.path.dirname(os.path.abspath(__file__))
_spec = importlib.util.spec_from_file_location(
    "variant_lib", os.path.join(_HERE, "18_variant_lib.py"))
L = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(L)

VANILLA_SIZE = 10.2
ROOT = L.ROOT
PHOTO = os.path.join(ROOT, "02_progress_photos", "05_variants")
BLEND = os.path.join(ROOT, "03_blender")
TEXOUT = os.path.join(ROOT, "04_textures")

cfg = json.load(open(sys.argv[sys.argv.index("--") + 1]))
NAME = cfg["name"]
TAG = "sentinal_concept_" + NAME

os.makedirs(PHOTO, exist_ok=True)
os.makedirs(BLEND, exist_ok=True)
os.makedirs(TEXOUT, exist_ok=True)

# ------------------------------------------------------------- 1. texture
host = L.Host()                       # house palette base
print("BASE", host.stats())

paint_ops = []
import numpy as np
for op in cfg.get("paint", []):
    op = dict(op)
    if "box" in op:
        op["mask"] = host.uv_mask(op["box"])
    else:                      # whole-texture op (stealth flatten, etc.)
        op["mask"] = np.ones((512, 512), dtype=bool)
    paint_ops.append(op)
    print(f"  mask {op.get('mode')} coverage={int(op['mask'].sum())} px")

variant_alb = None
if paint_ops:
    variant_alb = os.path.join(TEXOUT, f"Sentinal_{NAME}_Albedo.png")
    L.paint_albedo(L.HOUSE_ALB, variant_alb, paint_ops)
    # swap the datablock (never re-point + reload: the packed pixels stay)
    mat = host.mesh.data.materials[0]
    for node in mat.node_tree.nodes:
        if node.type == "TEX_IMAGE" and node.image and \
                os.path.basename(node.image.filepath or "") == \
                os.path.basename(L.HOUSE_ALB):
            node.image = bpy.data.images.load(variant_alb, check_existing=False)
            node.image.pack()
            break
    print("PAINTED", variant_alb)

# ------------------------------------------------------------ 2. geometry
for op in cfg.get("ops", []):
    kind = op["op"]
    if kind == "delete_islands":
        box = op["box"]
        if op.get("probe"):
            host.probe(box, op.get("label", NAME))
        n_isl, n_faces = host.delete_islands(box)
        print(f"DELETE {op.get('label','')}: {n_isl} islands, {n_faces} faces")
        host.refresh()
    elif kind == "deform":
        kwargs = {}
        for k in ("scale", "delta", "pivot", "shear", "box", "band"):
            if k in op:
                kwargs[k] = tuple(op[k]) if k != "shear" else tuple(op[k])
        host.deform(**kwargs)
        host.refresh()
        print("DEFORM", op.get("label", ""), kwargs)
    else:
        raise SystemExit("unknown op " + kind)
print("SHAPED", host.stats())

# --------------------------------------------------------------- 3. parts
rect = L._rect_from_island(host)
print("UV RECT", tuple(round(x, 3) for x in rect))
parts = []
for p in cfg.get("parts", []):
    kind = p["kind"]
    loc = host.to_world_current(tuple(p["loc"]))
    rot = tuple(__import__("math").radians(a) for a in p.get("rot", [0, 0, 0]))
    if kind == "box":
        ob = L.add_box(host, f"{NAME}_{p.get('name','part')}",
                       tuple(p["size"]), loc, rot=rot,
                       taper=p.get("taper"))
    elif kind == "cyl":
        ob = L.add_cylinder(f"{NAME}_{p.get('name','part')}", p["radius"],
                            p["depth"], loc, rot=rot,
                            segments=p.get("segments", 10),
                            hollow=p.get("hollow", 0.0), axis=p.get("axis", "z"))
    elif kind == "wedge":
        ob = L.add_wedge(f"{NAME}_{p.get('name','part')}", tuple(p["size"]),
                         loc, rot=rot, nose=p.get("nose", "y"))
    else:
        raise SystemExit("unknown part " + kind)
    parts.append(ob)
if parts:
    L.finish_parts(host, parts, rect=rect)
    print("PARTS", len(parts), L.scene_tris())

# -------------------------------------------------------------- 4. render
L.setup_render()
# frame by the CURRENT bounding box (some variants are much longer/wider
# than the stock hull); the contact sheet below stays on the stock framing
# so relative size differences read.
_mn, _mx = L.bbox_world([o for o in bpy.context.scene.objects
                         if o.type == "MESH"])
csize = max(_mx[i] - _mn[i] for i in range(3))
print("CURRENT SIZE", tuple(round(x, 2) for x in (_mx - _mn)))
view_dir = os.path.join(PHOTO, f"{NAME}_views")
L.render_views(view_dir, NAME, size=csize, res=480)

# fixed-framing "game" shot for the contact sheet (same camera for every
# ship, so relative size differences are visible)
os.makedirs(os.path.join(PHOTO, "contact"), exist_ok=True)
L.cam_frame(VANILLA_SIZE, dist_mult=1.75, elev_deg=52.0, yaw_deg=45.0)
L.render_still(os.path.join(PHOTO, "contact", f"{NAME}.png"), 480)
L.cam_frame(VANILLA_SIZE, dist_mult=1.75, elev_deg=88.0, yaw_deg=90.0)
L.render_still(os.path.join(PHOTO, "contact", f"{NAME}_top.png"), 480)

turn_dir = os.path.join(PHOTO, f"{NAME}_turn")
L.render_turntable(turn_dir, NAME, size=csize, n_frames=16, res=480)

# drop the FBX's own unpacked albedo (the material was rewired to the
# Sentinal textures) so the .blend has no dangling external file paths
for _ in range(3):
    for _coll in (bpy.data.images, bpy.data.materials, bpy.data.meshes):
        for _d in list(_coll):
            if _d.users == 0 and _d.name != "Render Result":
                try:
                    _coll.remove(_d)
                except Exception:
                    pass

L.save_blend(os.path.join(BLEND, f"{TAG}.blend"))
print("DONE", TAG, host.stats())
