import sys, os, bpy
from mathutils import Vector
sys.path.insert(0,r"C:/Users/justi/Python/dsw_mod/model_projects/kitbash_explore/08_scripts")
import blender_scene as bs
out=os.path.abspath(sys.argv[sys.argv.index("--")+1])
bs.setup_render(700,700)
for n,d in (("back",(0,1,0.15)),("bq",(0.6,0.8,0.2)),("under",(0.0,0.6,-0.5))):
    cam=bs.setup_camera(target=Vector((0,0.03,1.76)),ortho_scale=0.32,direction=d,distance=3)
    bs.render_to(os.path.join(out,"nape_%s.png"%n),cam); bpy.data.objects.remove(cam,do_unlink=True)
