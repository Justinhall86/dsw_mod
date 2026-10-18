import math
from mathutils import Matrix, Vector, Euler
G = globals()
rig = bpy.data.objects["Rig"]; lo = bpy.data.objects["ginaz_lo"]
def rot_world(name, axis, deg):
    pb = rig.pose.bones[name]
    head = rig.matrix_world @ pb.head
    R = Matrix.Translation(head) @ Matrix.Rotation(math.radians(deg), 4, axis) @ Matrix.Translation(-head)
    pb.matrix = R @ pb.matrix
    bpy.context.view_layer.update()
def reset():
    for pb in rig.pose.bones: pb.matrix_basis.identity()
    bpy.context.view_layer.update()
rig.hide_set(True)
c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
sp.shading.type = 'MATERIAL'; sp.overlay.show_overlays = False
def view(rz, dist=2.3, loc=(0, 0, 0.95), rx=90):
    r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector(loc); r3d.view_distance = dist
    r3d.view_rotation = Euler((math.radians(rx), 0, math.radians(rz))).to_quaternion()
reset()
# pose 1: head turn, right arm up, left leg forward, spine twist
rot_world("B_Spine01J", 'Z', 15)
rot_world("B_HeadJ", 'Z', 35)
rot_world("B_rShoulderJ", 'Y', 40)
rot_world("B_lHipJ", 'X', -55)
rot_world("B_lKneeJ", 'X', 40)
view(30);  print(shot3("11_pose_test_a"))
view(150); print(shot3("12_pose_test_a_back"))
reset()
# pose 2: lean forward, both arms forward, head down  (stress the shoulders/neck)
rot_world("B_Spine02J", 'X', -25)
rot_world("B_lShoulderJ", 'X', -70); rot_world("B_rShoulderJ", 'X', -70)
rot_world("B_Neck01J", 'X', -20)
view(60);  print(shot3("13_pose_test_b"))
reset()
view(0); sp.overlay.show_overlays = True
print("pose reset")
