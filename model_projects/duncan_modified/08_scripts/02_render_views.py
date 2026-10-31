"""Step 2: render front/side/back/3-4 views of the imported model so the scarf and cape can be located visually."""
import bpy, os, math, numpy as np

SRC = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx"
OUT = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\02_progress_photos"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC, use_anim=False)

scene = bpy.context.scene
me = next(o for o in scene.objects if o.type == 'MESH')

# flat-ish shading via workbench for clarity
scene.render.engine = 'BLENDER_WORKBENCH'
scene.display.shading.light = 'STUDIO'
scene.display.shading.color_type = 'SINGLE'
scene.display.shading.single_color = (0.7, 0.7, 0.75)
scene.display.shading.show_cavity = True
scene.render.resolution_x = 800
scene.render.resolution_y = 1000
scene.render.film_transparent = False
scene.world = bpy.data.worlds.new("W") if not scene.world else scene.world
scene.world.color = (0.15, 0.15, 0.18)

# camera helper
def cam_at(loc, look_at, name):
    cam_data = bpy.data.cameras.new(name)
    cam = bpy.data.objects.new(name, cam_data)
    scene.collection.objects.link(cam)
    cam.location = loc
    d = np.array(look_at) - np.array(loc)
    # point -Z at target
    import mathutils
    cam.rotation_euler = mathutils.Vector(d).to_track_quat('-Z', 'Y').to_euler()
    scene.camera = cam
    return cam

center = (0, 0.04, 1.0)
views = {
    "front": ((0, -3.2, 1.05), center),
    "back":  ((0,  3.2, 1.05), center),
    "left":  ((3.2, 0, 1.05), center),
    "right": ((-3.2, 0, 1.05), center),
    "34":    ((2.3, -2.3, 1.5), center),
}
for name, (loc, tgt) in views.items():
    cam_at(loc, tgt, "cam_" + name)
    scene.render.filepath = os.path.join(OUT, f"src_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("rendered", name)

# also a vertex-colored "island map": color connected components differently to spot cape/scarf shells
import bmesh
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
comps.sort(key=len, reverse=True)
print("islands:", len(comps), "sizes:", [len(c) for c in comps[:20]])
V = np.array([v.co[:] for v in me.data.vertices])
if not any(a.domain == 'POINT' and a.data_type == 'FLOAT_COLOR' for a in me.data.color_attributes):
    ca = me.data.color_attributes.new(name="IslandCol", type='FLOAT_COLOR', domain='POINT')
else:
    ca = me.data.color_attributes["IslandCol"]
rng = np.random.default_rng(7)
for i, c in enumerate(comps):
    col = rng.random(4); col[3] = 1.0
    if i == 0: col[:3] = [0.55, 0.55, 0.55]   # body neutral grey
    for vi in c: ca.data[vi].color = tuple(col)
scene.display.shading.color_type = 'ATTRIBUTE'
scene.display.shading.color_attribute = "IslandCol"
for name in ("front", "back", "left", "right", "34"):
    cam_at(*(views[name]), name="cam_" + name) if False else None
for name, (loc, tgt) in views.items():
    cam = bpy.data.objects.get("cam_" + name)
    scene.camera = cam
    scene.render.filepath = os.path.join(OUT, f"islands_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("rendered islands", name)
for i, c in enumerate(comps[:12]):
    sub = V[c]
    print(f"island {i}: {len(c):5d} verts  x[{sub[:,0].min():+.3f},{sub[:,0].max():+.3f}] y[{sub[:,1].min():+.3f},{sub[:,1].max():+.3f}] z[{sub[:,2].min():+.3f},{sub[:,2].max():+.3f}]")
