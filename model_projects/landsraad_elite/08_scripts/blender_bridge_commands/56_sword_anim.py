import math, os
from mathutils import Euler, Vector
ANIM = os.path.join(BRIDGE, "..", "anim")
sc = bpy.context.scene
cam_d = bpy.data.cameras.new("snapcam"); cam = bpy.data.objects.new("snapcam", cam_d); sc.collection.objects.link(cam); cam_d.type = 'ORTHO'; sc.camera = cam
ld = bpy.data.lights.new("keylight", "SUN"); ld.energy = 3.0; kl = bpy.data.objects.new("keylight", ld); sc.collection.objects.link(kl); kl.rotation_euler = Euler((math.radians(50), 0, math.radians(-30)))
w = sc.world or bpy.data.worlds.new("W"); sc.world = w; w.use_nodes = True
bg = w.node_tree.nodes.get("Background"); bg.inputs["Color"].default_value = (0.55, 0.57, 0.62, 1); bg.inputs["Strength"].default_value = 1.0
def shot(name, rz, scale=2.6, loc=(0,0,1.0), w_=700, h_=800):
    cam_d.ortho_scale = scale; a = math.radians(rz)
    cam.location = Vector(loc) + Vector((math.sin(a)*6, -math.cos(a)*6, 0)); cam.rotation_euler = Euler((math.radians(90), 0, a))
    sc.render.engine = 'BLENDER_EEVEE'; sc.render.resolution_x, sc.render.resolution_y, sc.render.resolution_percentage = w_, h_, 100
    sc.render.filepath = os.path.join(PROG, name + ".png"); bpy.ops.render.render(write_still=True); return sc.render.filepath
rig = bpy.data.objects["Armature"]
rig.animation_data_create(); 
def load_action(fn):
    b = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(ANIM, fn), use_anim=True, use_manual_orientation=False, automatic_bone_orientation=False, primary_bone_axis='Y', secondary_bone_axis='X')
    nw = [o for o in bpy.data.objects if o not in b]; act = next(o for o in nw if o.type == 'ARMATURE').animation_data.action
    for o in nw: bpy.data.objects.remove(o, do_unlink=True)
    return act
for tag, fn, rz in (("attack", "trooper_AttackMelee01.fbx", 35), ("run", "trooper_Run.fbx", 60), ("idle", "trooper_Idle.fbx", 30)):
    act = load_action(fn); rig.animation_data.action = act
    if hasattr(rig.animation_data, "action_slot") and act.slots: rig.animation_data.action_slot = act.slots[0]
    f0, f1 = map(int, act.frame_range)
    for k, t in enumerate((0.15, 0.4, 0.7)):
        sc.frame_set(f0 + int((f1 - f0) * t))
        print(shot(f"30_sword_{tag}_{k}", rz))
