import bpy
import math
from mathutils import Vector, Matrix

# Open the blend file
bpy.ops.wm.open_mainfile(filepath=r'C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack_scarf\03_blender\Commando_NoBackpack_Scarf.blend')

# Find the body and armature
body = None
armature = None
for obj in bpy.data.objects:
    if obj.type == 'MESH' and 'Commando' in obj.name:
        body = obj
    elif obj.type == 'ARMATURE':
        armature = obj

# Find the head bone
head_bone = None
if armature:
    for bone in armature.data.bones:
        if 'Head' in bone.name or 'head' in bone.name:
            head_bone = bone
            break

# Set up camera for close-up face shot - slightly lower angle to see mouth
cam = bpy.data.objects.get('Camera')
if not cam:
    cam_data = bpy.data.cameras.new('FaceCam')
    cam = bpy.data.objects.new('FaceCam', cam_data)
    bpy.context.collection.objects.link(cam)
    bpy.context.scene.camera = cam

# Position camera for face close-up - slightly below eye level to see mouth
if head_bone and armature:
    bpy.context.view_layer.update()
    head_world = armature.matrix_world @ head_bone.head_local
    # Position camera slightly below eye level, looking slightly up to see mouth
    cam.location = head_world + Vector((0, -0.55, -0.02))
    cam.rotation_euler = (math.radians(92), 0, 0)
else:
    cam.location = (0, -0.6, 1.8)
    cam.rotation_euler = (math.radians(92), 0, 0)

# Set render settings
bpy.context.scene.render.resolution_x = 1024
bpy.context.scene.render.resolution_y = 1024
bpy.context.scene.render.filepath = r'C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack_scarf\02_progress_photos\04_showcase\face_closeup_mouth.png'
bpy.context.scene.render.image_settings.file_format = 'PNG'

# Render
bpy.ops.render.render(write_still=True)
print('Rendered face closeup (mouth view)')