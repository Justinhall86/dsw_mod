"""Step 9: inspect the imported material/texture wiring, then delete the scarf+cape islands (green cloth at the neck:
islands whose bbox z_min >= 1.3 and that contain green faces) and export duncan_modified.fbx."""
import bpy, os, numpy as np, bmesh, mathutils

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified"
SRC = os.path.join(PROJ, "03_blender", "Male01_AtreidesDuncan_src.fbx")
TEX = os.path.join(PROJ, "01_input")
OUT = os.path.join(PROJ, "05_fbx_export", "duncan_modified.fbx")
BLEND = os.path.join(PROJ, "03_blender", "duncan_modified.blend")
PHOTOS = os.path.join(PROJ, "02_progress_photos")

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC, use_anim=False)
scene = bpy.context.scene
me_obj = next(o for o in scene.objects if o.type == 'MESH')
rig = next(o for o in scene.objects if o.type == 'ARMATURE')
mesh = me_obj.data

# ---- material wiring as imported
for m in mesh.materials:
    print("MATERIAL", m.name, "use_nodes", m.use_nodes)
    if m.use_nodes:
        for n in m.node_tree.nodes:
            if n.type == 'TEX_IMAGE':
                print("  node", n.type, repr(n.image.name if n.image else None), "filepath", n.image.filepath if n.image else "-", "->", [l.to_socket.name for l in n.outputs[0].links])

# ensure textures are loaded from 01_input and wired like the toolkit expects
img_files = {
    "Albedo": "Duncan_Albedo.png",
    "MetallicGlossAO": "Duncan_MetallicGlossAO.png",
    "Normal": "Duncan_Normal.png",
    "Emissive": "Duncan_Emissive.png",
}
imgs = {}
for key, fn in img_files.items():
    p = os.path.join(TEX, fn)
    im = bpy.data.images.get(fn)
    if im is None or im.filepath != p:
        im = bpy.data.images.load(p, check_existing=True)
    imgs[key] = im

mat = mesh.materials[0]
if not mat.use_nodes:
    mat.use_nodes = True
nt = mat.node_tree
# rebuild clean wiring: Albedo->Base Color, MetallicGlossAO->Specular IOR Level, Normal->Normal Map, Emissive->Emission
for n in list(nt.nodes): nt.nodes.remove(n)
def tex_node(im, label):
    nd = nt.nodes.new("ShaderNodeTexImage"); nd.image = im; nd.label = label; nd.location = (-600, 200 - 220*list(img_files).index(label))
    return nd
alb = tex_node(imgs["Albedo"], "Albedo"); mg = tex_node(imgs["MetallicGlossAO"], "MetallicGlossAO")
nml = tex_node(imgs["Normal"], "Normal"); emi = tex_node(imgs["Emissive"], "Emissive")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); bsdf.location = (-150, 100)
outn = nt.nodes.new("ShaderNodeOutputMaterial"); outn.location = (200, 100)
nmap = nt.nodes.new("ShaderNodeNormalMap"); nmap.location = (-350, -350)
nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
nt.links.new(mg.outputs["Color"], bsdf.inputs["Specular IOR Level"])
nt.links.new(nml.outputs["Color"], nmap.inputs["Color"])
nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
if "Emission Color" in bsdf.inputs:
    nt.links.new(emi.outputs["Color"], bsdf.inputs["Emission Color"])
elif "Emission" in bsdf.inputs:
    nt.links.new(emi.outputs["Color"], bsdf.inputs["Emission"])
nt.links.new(bsdf.outputs["BSDF"], outn.inputs["Surface"])
nml.image.colorspace_settings.name = "Non-Color"
mg.image.colorspace_settings.name = "Non-Color"
emi.image.colorspace_settings.name = "Non-Color"
print("material rewired")

# ---- islands
bm = bmesh.new(); bm.from_mesh(mesh); bm.verts.ensure_lookup_table()
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

# green-face sampling
img = imgs["Albedo"]
W, H = img.size
px = np.array(img.pixels[:], dtype=np.float32).reshape(H, W, 4)
uvl = mesh.uv_layers.active.data
def face_green(p):
    us = [uvl[li].uv for li in p.loop_indices]
    u, v = np.mean(us, axis=0)
    c = int(np.clip(u * W, 0, W-1)); r = int(np.clip(v * H, 0, H-1))
    rr, gg, bb = px[r, c, :3]
    return bool((gg > rr + 0.08) and (gg > bb + 0.08) and (gg > 0.2))

V = np.array([v.co[:] for v in mesh.vertices])
kill = []
for i, c in enumerate(comps):
    sub = V[c]
    zmin = sub[:,2].min()
    ngreen = sum(1 for p in mesh.polygons if set(p.vertices) & set(c) and face_green(p))
    if ngreen and zmin >= 1.3:
        kill.append(i)
        print(f"KILL island {i}: {len(c)} verts, {ngreen} green faces, z[{zmin:+.3f},{sub[:,2].max():+.3f}]")
assert kill, "no scarf/cape islands found"
kill_verts = sorted(vi for i in kill for vi in comps[i])
print("deleting", len(kill_verts), "verts")
bmm = bmesh.new(); bmm.from_mesh(mesh); bmm.verts.ensure_lookup_table()
bmesh.ops.delete(bmm, geom=[bmm.verts[i] for i in kill_verts], context='VERTS')
bmm.to_mesh(mesh); bmm.free()
mesh.update()
print("after:", len(mesh.vertices), "verts,", len(mesh.polygons), "faces")

# tidy: drop empty vertex groups
for vg in list(me_obj.vertex_groups):
    if not any(vg.index in [g.group for g in v.groups] for v in mesh.vertices):
        me_obj.vertex_groups.remove(vg)

# rename
me_obj.name = "duncan_modified"; mesh.name = "duncan_modified"

# ---- export (modeling.md section 4 settings)
if rig.animation_data: rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
scene.frame_set(1)
rig.hide_set(False); rig.hide_viewport = False; rig.hide_render = False
me_obj.hide_set(False); me_obj.hide_viewport = False; me_obj.hide_render = False
for o in scene.objects: o.select_set(o in (rig, me_obj))
bpy.context.view_layer.objects.active = rig
try:
    with bpy.context.temp_override(**{k: bpy.context.view_layer.window.view_layer if False else None for k in ()}):
        pass
except Exception:
    pass
# clear custom normals/sharp (export gotcha from ginaz work)
override = None
for win in bpy.context.window_manager.windows:
    for area in win.screen.areas:
        if area.type == 'VIEW_3D':
            for region in area.regions:
                if region.type == 'WINDOW':
                    override = {"window": win, "screen": win.screen, "area": area, "region": region}
if override:
    try:
        with bpy.context.temp_override(**override):
            bpy.ops.object.select_all(action='DESELECT')
            me_obj.select_set(True); bpy.context.view_layer.objects.active = me_obj
            bpy.ops.mesh.customdata_custom_splitnormals_clear()
    except Exception as e:
        print("clear custom normals:", e)
for a in list(mesh.color_attributes): mesh.attributes.remove(a)
if "sharp_edge" in mesh.attributes:
    try: mesh.attributes.remove(mesh.attributes["sharp_edge"])
    except Exception as e: print("sharp_edge:", e)
mesh.update()
for o in scene.objects: o.select_set(o in (rig, me_obj))
bpy.context.view_layer.objects.active = rig

os.makedirs(os.path.dirname(OUT), exist_ok=True)
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward='Y', axis_up='Z',
    add_leaf_bones=False, bake_anim=False, path_mode='COPY', embed_textures=True,
    apply_scale_options='FBX_SCALE_UNITS', primary_bone_axis='Y', secondary_bone_axis='X',
    mesh_smooth_type='FACE')
print("exported", OUT, os.path.getsize(OUT), "bytes")

# ---- after-photos
scene.render.engine = 'BLENDER_WORKBENCH'
scene.display.shading.light = 'STUDIO'
scene.display.shading.color_type = 'TEXTURE'
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
views = {"front": ((0, -2.6, 1.35), (0, 0, 1.35)), "back": ((0, 2.6, 1.4), (0, 0.05, 1.4)),
         "left": ((2.6, 0.2, 1.45), (0, 0.03, 1.45)), "34": ((1.9, -1.9, 1.5), (0, 0, 1.3))}
for name, (loc, tgt) in views.items():
    scene.camera = cam_at(loc, tgt, "cam_" + name)
    scene.render.filepath = os.path.join(PHOTOS, f"out_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("rendered", name)

try:
    bpy.ops.wm.save_as_mainfile(filepath=BLEND)
    print("saved", BLEND)
except RuntimeError as e:
    print("save skipped:", str(e)[:80])
