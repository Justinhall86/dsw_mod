import os
def shot2(name, w=1000, h=900):
    sc = bpy.context.scene; sc.render.resolution_x, sc.render.resolution_y, sc.render.resolution_percentage = w, h, 100
    c = view3d_ctx()
    with bpy.context.temp_override(**c): bpy.ops.render.opengl(view_context=True)
    p = os.path.join(BRIDGE, "shots", name + ".png"); bpy.data.images['Render Result'].save_render(p); return p
G = globals(); G["shot2"] = shot2
def look2(rz=0, dist=2.6, color='VERTEX', loc=(0,0,0.95), name="x", rx=90, shading='SOLID', wire=False):
    c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
    sp.shading.type = shading; sp.shading.color_type = color; sp.overlay.show_overlays = False
    r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector(loc); r3d.view_distance = dist
    r3d.view_rotation = Euler((math.radians(rx), 0, math.radians(rz))).to_quaternion()
    return shot2(name)
G["look2"] = look2
print(look2(rz=0, name="49_front"))
print(look2(rz=180, name="49_back"))
