import math, os
from mathutils import Vector, Euler
cam_d = bpy.data.cameras.get("snapcam") or bpy.data.cameras.new("snapcam")
cam = bpy.data.objects.get("snapcam") or bpy.data.objects.new("snapcam", cam_d)
if cam.name not in bpy.context.scene.collection.objects: bpy.context.scene.collection.objects.link(cam)
cam_d.type = 'ORTHO'
sc = bpy.context.scene; sc.camera = cam
def cshot(name, rz=0, scale=1.9, loc=(0,0,0.13), w=900, h=1000, engine='BLENDER_WORKBENCH', color='MATERIAL', light='STUDIO'):
    cam_d.ortho_scale = scale
    d = 6.0; a = math.radians(rz)
    # rz=0: camera on -Y looking +Y (front); rz=90: camera on +X? (right side); 180: back
    cam.location = Vector(loc) + Vector((math.sin(a) * d, -math.cos(a) * d, 0))
    cam.rotation_euler = Euler((math.radians(90), 0, a))
    sc.render.engine = engine
    sc.render.resolution_x, sc.render.resolution_y, sc.render.resolution_percentage = w, h, 100
    sc.render.film_transparent = False
    if engine == 'BLENDER_WORKBENCH':
        sh = sc.display.shading; sh.light = light; sh.color_type = color; sh.show_shadows = False
        sc.world = sc.world or bpy.data.worlds.new("W"); sc.world.color = (0.2, 0.2, 0.22)
    p = os.path.join(PROG, name + ".png"); sc.render.filepath = p; sc.render.image_settings.file_format = 'PNG'
    bpy.ops.render.render(write_still=True)
    return p
globals().update(cshot=cshot)
print(cshot("04_elite_clean_front", rz=0))
print(cshot("04_elite_clean_side", rz=90))
