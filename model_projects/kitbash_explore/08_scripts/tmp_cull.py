import sys, os, bpy
from mathutils import Vector
sys.path.insert(0,r"C:/Users/justi/Python/dsw_mod/model_projects/kitbash_explore/08_scripts")
import blender_scene as bs
out=os.path.abspath(sys.argv[sys.argv.index("--")+1])
for m in bpy.data.materials: m.use_backface_culling=True
for o in bpy.data.objects:
    if o.type=="MESH" and "Head" not in o.name: o.hide_render=True
bs.setup_render(700,700)
for n,d in (("back",(0,1,0.15)),("under_back",(0,0.7,-0.7))):
    cam=bs.setup_camera(target=Vector((0,0.03,1.74)),ortho_scale=0.32,direction=d,distance=3)
    bs.render_to(os.path.join(out,"cull_%s.png"%n),cam); bpy.data.objects.remove(cam,do_unlink=True)
