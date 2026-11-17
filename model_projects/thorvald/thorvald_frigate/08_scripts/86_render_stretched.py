"""Render the cruiser blend with a Z stretch (about the keel) and a paint variant, via 73_render_blend.py.
    ZS=1.39 blender -b 03_blender/cruiser_turrets.blend --python 86_render_stretched.py -- <outdir> <views> <albedo> <mgao>"""
import os, runpy, sys
import bpy
ZS = float(os.environ.get("ZS", "1.39"))
objs = [o for o in bpy.data.objects if o.type == "MESH"]
for o in objs:
    o.data.transform(o.matrix_world); o.matrix_world = o.matrix_world.__class__.Identity(4)
z0 = min(v.co.z for o in objs for v in o.data.vertices)
for o in objs:
    for v in o.data.vertices:
        v.co.z = z0 + (v.co.z - z0) * ZS
    o.data.update()
runpy.run_path(os.path.join(os.path.dirname(os.path.abspath(__file__)), "73_render_blend.py"), run_name="__main__")
