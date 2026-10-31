"""Step 4: color-code each connected island and render views, to positively identify the scarf and cape shells."""
import bpy, os, math, numpy as np, bmesh, mathutils

SRC = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx"
OUT = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\02_progress_photos"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC, use_anim=False)
scene = bpy.context.scene
me = next(o for o in scene.objects if o.type == 'MESH')

bm = bmesh.new(); bm.from_mesh(me.data); bm.verts.ensure_lookup_table()
seen = set(); comps = []
for v in bm.verts:
    if v.index in seen: continue
    st = [v.index]; c = []; seen.add(v.index)
    while st:
        x = st.pop(); c.append(x)
        for e in bm.verts[x].link_edges:
            w = e.other_vert(bm.verts[x]).index
            if w not in seen: seen.add(w); st.append(w)
    comps.append(c)
bm.free()
comps.sort(key=lambda c: -len(c))

ca = me.data.color_attributes.get("IslandCol") or me.data.color_attributes.new(name="IslandCol", type='FLOAT_COLOR', domain='POINT')
# distinct hues; biggest island (likely torso shell) stays grey-ish
import colorsys
for i, c in enumerate(comps):
    h = (i * 0.61803398875) % 1.0
    r, g, b = colorsys.hsv_to_rgb(h, 0.85 if i else 0.0, 1.0)
    if i == 0: r, g, b = 0.62, 0.62, 0.62
    for vi in c:
        ca.data[vi].color = (r, g, b, 1.0)

scene.render.engine = 'BLENDER_WORKBENCH'
scene.display.shading.light = 'STUDIO'
scene.display.shading.color_type = 'VERTEX'
scene.display.shading.show_cavity = True
scene.render.resolution_x = 800
scene.render.resolution_y = 1000

def cam_at(loc, look_at, name):
    cam_data = bpy.data.cameras.new(name)
    cam = bpy.data.objects.new(name, cam_data)
    scene.collection.objects.link(cam)
    cam.location = loc
    d = mathutils.Vector(look_at) - mathutils.Vector(loc)
    cam.rotation_euler = d.to_track_quat('-Z', 'Y').to_euler()
    return cam

center = (0, 0.04, 1.0)
views = {
    "front": ((0, -3.2, 1.05), center),
    "back":  ((0,  3.2, 1.05), center),
    "left":  ((3.2, 0, 1.05), center),
    "34b":   ((-2.3, 2.3, 1.5), center),
}
for name, (loc, tgt) in views.items():
    cam = cam_at(loc, tgt, "cam_" + name)
    scene.camera = cam
    scene.render.filepath = os.path.join(OUT, f"islands_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("rendered", name)

V = np.array([v.co[:] for v in me.data.vertices])
for i, c in enumerate(comps[:20]):
    sub = V[c]
    print(f"island {i:2d}: {len(c):5d} verts  x[{sub[:,0].min():+.3f},{sub[:,0].max():+.3f}] y[{sub[:,1].min():+.3f},{sub[:,1].max():+.3f}] z[{sub[:,2].min():+.3f},{sub[:,2].max():+.3f}]")
