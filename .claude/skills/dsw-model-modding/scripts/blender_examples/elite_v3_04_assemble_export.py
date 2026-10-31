"""v3 step 4: skin the new parts, join them into guard_mod (vanilla guard body without its head), set up the two materials
and export Male01_LandsraadGuardElite.fbx for the HMD Toolkit.

 slot 0  Mat_LandsraadGuard1  - the vanilla guard body; placeholder images named like the vanilla textures (convert_model.py
                                rewrites its paths to Character/Common/Landsraad/LandsraadGuard_*.png)
 slot 1  Mat_ElitePart        - helmet + pauldrons with the baked Part_*.png textures
Weights: helmet 100% B_SpineTopJ (the vanilla head never moved on its own: it was bound to SpineTop); pauldrons 85% clavicle +
15% SpineTop (same rule as the full Elite)."""
import os, numpy as np, bmesh
PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\landsraad_elite"
OUT = os.path.join(PROJ, "05_fbx_export", "Male01_LandsraadGuardElite.fbx")
g = bpy.data.objects["guard_mod"]; parts = bpy.data.objects["parts_lo"]; rig = bpy.data.objects["GuardRig"]
for nm in ("guard_vanilla", "elite_hi", "parts_hi", "snapcam", "keylight"):
    o = bpy.data.objects.get(nm)
    if o: bpy.data.objects.remove(o, do_unlink=True)
parts.hide_viewport = False; parts.hide_render = False; parts.hide_set(False); g.hide_viewport = False; g.hide_render = False; g.hide_set(False)

# ---------------------------------------------------------------- 1. weights on the parts (helmet / left pad / right pad by connectivity)
pm = parts.data; n = len(pm.vertices)
co = np.array([v.co[:] for v in pm.vertices])
bm = bmesh.new(); bm.from_mesh(pm); bm.verts.ensure_lookup_table()
seen = set(); comps = []
for v in bm.verts:
    if v.index in seen: continue
    st = [v]; c = []; seen.add(v.index)
    while st:
        x = st.pop(); c.append(x.index)
        for e in x.link_edges:
            w = e.other_vert(x)
            if w.index not in seen: seen.add(w.index); st.append(w)
    comps.append(c)
bm.free()
for gr in list(parts.vertex_groups): parts.vertex_groups.remove(gr)
def vg(name): return parts.vertex_groups.get(name) or parts.vertex_groups.new(name=name)
helmet_comp = max(comps, key=lambda c: co[c, 2].mean() - abs(co[c, 0].mean()))
for comp in comps:
    if comp is helmet_comp:
        vg("B_SpineTopJ").add([int(i) for i in comp], 1.0, "REPLACE"); print("helmet piece:", len(comp), "verts")
    else:
        side = "l" if co[comp, 0].mean() > 0 else "r"
        vg(f"B_{side}ClavicleJ").add([int(i) for i in comp], 0.85, "REPLACE"); vg("B_SpineTopJ").add([int(i) for i in comp], 0.15, "REPLACE")
        print("pauldron piece:", len(comp), "verts ->", side, "clavicle")

# ---------------------------------------------------------------- 2. guard material: placeholders named like the vanilla textures
tmp = os.path.join(BRIDGE, "..", "guard_dummy"); os.makedirs(tmp, exist_ok=True)
for _m in list(bpy.data.materials):
    if _m.name.startswith("Mat_LandsraadGuard1"): _m.name = "old_" + _m.name      # free the exact name (the imported vanilla material)
gm = bpy.data.materials.new("Mat_LandsraadGuard1"); gm.use_nodes = True; nt = gm.node_tree
for nd in list(nt.nodes): nt.nodes.remove(nd)
def img(fname, nonc, label):
    im = bpy.data.images.new(fname, 8, 8, alpha=True); im.filepath_raw = os.path.join(tmp, fname); im.file_format = "PNG"
    im.pixels = [0.5, 0.5, 0.5, 1.0] * 64; im.save(); im.colorspace_settings.name = "Non-Color" if nonc else "sRGB"
    nd = nt.nodes.new("ShaderNodeTexImage"); nd.image = im; nd.label = label; return nd
alb = img("LandsraadGuard_Albedo.png", False, "Albedo"); mg = img("LandsraadGuard_MetallicGlossAO.png", True, "MetallicGlossAO"); nm_ = img("LandsraadGuard_Normal.png", True, "Normal")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); out = nt.nodes.new("ShaderNodeOutputMaterial"); nmap = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"]); nt.links.new(mg.outputs["Color"], bsdf.inputs["Specular IOR Level"])
nt.links.new(nm_.outputs["Color"], nmap.inputs["Color"]); nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"]); nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
g.data.materials.clear(); g.data.materials.append(gm)
for a in list(g.data.color_attributes): g.data.color_attributes.remove(a)
for a in list(parts.data.color_attributes): parts.data.color_attributes.remove(a)

# ---------------------------------------------------------------- 3. join
parts.data.uv_layers[0].name = g.data.uv_layers[0].name
for o in bpy.context.view_layer.objects: o.select_set(False)
parts.select_set(True); g.select_set(True); bpy.context.view_layer.objects.active = g
bpy.ops.object.join()
me = g.data
cnt = {}
for p in me.polygons: cnt[p.material_index] = cnt.get(p.material_index, 0) + 1
print("joined:", len(me.vertices), "verts |", len(me.polygons), "faces | materials", [m.name for m in me.materials], "| faces per slot", cnt)
print("max influences:", max(len([x for x in v.groups if x.weight > 1e-4]) for v in me.vertices), "| armature modifier:", [(m.type, m.object.name) for m in g.modifiers])

# ---------------------------------------------------------------- 4. export
g.name = "LandsraadElite"; me.name = "LandsraadElite"; rig.name = "Armature"; rig.data.name = "Armature"
if rig.animation_data: rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
for bn in rig.data.bones: bn.use_deform = True
bpy.context.scene.frame_set(1)
rig.hide_set(False); rig.hide_viewport = False; rig.hide_render = False
for o in bpy.context.view_layer.objects: o.select_set(False)
g.select_set(True); bpy.context.view_layer.objects.active = g
with bpy.context.temp_override(**view3d_ctx()):
    try: bpy.ops.mesh.customdata_custom_splitnormals_clear()
    except Exception as e: print("clear custom normals:", e)
for p in me.polygons: p.use_smooth = True
if "sharp_edge" in me.attributes:
    try: me.attributes.remove(me.attributes["sharp_edge"])
    except Exception as e: print("sharp_edge:", e)
me.update()
for o in bpy.context.view_layer.objects: o.select_set(o in (rig, g))
bpy.context.view_layer.objects.active = rig
print("export: tris", len(me.polygons), "| attrs", [a.name for a in me.attributes if not a.name.startswith('.')])
with bpy.context.temp_override(**view3d_ctx()):
    bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward='Y', axis_up='Z', add_leaf_bones=False,
        bake_anim=False, path_mode='COPY', embed_textures=True, apply_scale_options='FBX_SCALE_UNITS',
        primary_bone_axis='Y', secondary_bone_axis='X', mesh_smooth_type='FACE')
print("exported", OUT, os.path.getsize(OUT), "bytes")
try:
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "v3_guard_elite_final.blend"))
except RuntimeError as e:
    print("save skipped:", str(e)[:60])
