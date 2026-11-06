import argparse, os, sys
import bpy
sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P
ap = argparse.ArgumentParser()
ap.add_argument("--blend", required=True)
ap.add_argument("--object", required=True)
ap.add_argument("--out", required=True)
a = ap.parse_args(P.script_args())
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=a.blend) if a.blend.lower().endswith(".fbx") else bpy.ops.wm.open_mainfile(filepath=a.blend)
for o in bpy.data.objects:
    if o.type == "ARMATURE":
        P.rest_pose(o)
obj = bpy.data.objects.get(a.object)
if obj is None:
    print("objects:", [o.name for o in bpy.data.objects if o.type == "MESH"])
    raise SystemExit("not found")
for o in list(bpy.data.objects):
    if o.type == "MESH" and o is not obj:
        bpy.data.objects.remove(o, do_unlink=True)
P.setup_scene(bpy.context.scene)
P.render_views(bpy.context.scene, os.path.abspath(a.out), "head", "close")
