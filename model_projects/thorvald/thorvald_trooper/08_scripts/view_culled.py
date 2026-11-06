"""Render the HEAD object only with back-face culling ON - what the GAME shows (it culls back faces; Blender's render does not).
See-through holes here = faces wound inward.  Run on a variant whose head object name contains "Head".

    blender -b <variant.blend> --python view_culled.py -- <out_dir>
"""
import sys, os, bpy
from mathutils import Vector
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
out=os.path.abspath(sys.argv[sys.argv.index("--")+1])
for m in bpy.data.materials: m.use_backface_culling=True
for o in bpy.data.objects:
    if o.type=="MESH" and "Head" not in o.name: o.hide_render=True
bs.setup_render(700,700)
for n,d in (("back",(0,1,0.15)),("under_back",(0,0.7,-0.7))):
    cam=bs.setup_camera(target=Vector((0,0.03,1.74)),ortho_scale=0.32,direction=d,distance=3)
    bs.render_to(os.path.join(out,"cull_%s.png"%n),cam); bpy.data.objects.remove(cam,do_unlink=True)
