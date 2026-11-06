"""Step 2 reference renders: the vanilla Renegade Frigate and the existing
Sentinal recolour from the game camera angle, plus top/side/front for
silhouette reading, plus a few other vanilla ships for DSW's visual language.

  blender -b --python 17_ref_views.py -- <out_dir>
"""
import os
import sys

import bpy

import importlib.util
_spec = importlib.util.spec_from_file_location(
    "variant_lib", os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                "18_variant_lib.py"))
L = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(L)

argv = sys.argv[sys.argv.index("--") + 1:]
OUT = os.path.abspath(argv[0])

SHIPS = [
    ("vanilla", L.HOST_FBX, L.VANILLA_ALB, L.VANILLA_MGAO, L.VANILLA_NRM),
    ("recolour", L.HOST_FBX, L.HOUSE_ALB, L.HOUSE_MGAO, L.HOUSE_NRM),
]

for tag, fbx, alb, mga, nrm in SHIPS:
    h = L.Host(albedo=alb, mgao=mga, normal=nrm, name=tag)
    L.setup_render()
    L.render_views(OUT, tag, size=h.size, res=480)
    print("REF", tag, h.stats())

# other vanilla ships - visual language check
OTHER = r"C:\Users\justi\Python\dsw_mod\model_inputs\Vehicle"
for name, sub in [("banshee", r"Smuggler\Banshee"), ("wraith", r"Smuggler\Wraith"),
                  ("ravager", r"Common\Ravager"), ("harpy", r"Harkonnen\Harpy")]:
    folder = os.path.join(OTHER, sub)
    fbx = None
    for cand in ("preview_textures", ""):
        d = os.path.join(folder, cand) if cand else folder
        for f in sorted(os.listdir(d)) if os.path.isdir(d) else []:
            if f.lower().endswith(".fbx") and "real" in f.lower():
                fbx = os.path.join(d, f)
    if not fbx:
        for root, _dirs, files in os.walk(folder):
            for f in sorted(files):
                if f.lower().endswith(".fbx"):
                    fbx = os.path.join(root, f)
                    break
            if fbx:
                break
    if not fbx:
        print("SKIP", name, "no fbx")
        continue
    try:
        bpy.ops.wm.read_factory_settings(use_empty=True)
        bpy.ops.import_scene.fbx(filepath=fbx)
    except Exception as exc:
        print("SKIP", name, exc)
        continue
    meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
    if not meshes:
        print("SKIP", name, "no mesh")
        continue
    for m in meshes:
        L.bake_pose(m)
    L.setup_render()
    mn, mx = L.bbox_world(meshes)
    size = max(mx[i] - mn[i] for i in range(3))
    c = (mn + mx) / 2
    root = bpy.data.objects.new(name + "_root", None)
    bpy.context.scene.collection.objects.link(root)
    for o in bpy.context.scene.objects:
        if o.parent is None and o is not root:
            o.parent = root
    root.location = -c
    bpy.context.view_layer.update()
    L.render_views(OUT, name, size=size, res=480)
    print("REF", name, round(size, 2))

print("DONE", OUT)
