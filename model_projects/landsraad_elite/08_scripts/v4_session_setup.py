"""v4: prepare a fresh Blender session (03_blender/v2_stage2_baked.blend opened) for the v4 part builders.
Carves helmet_hi / padL_hi / padR_hi out of the sculpt elite_hi, builds the symmetric helm_src, and defines the render helpers
vis(), shotc(), shot3() and parts_material() in the bridge namespace."""
import math, os
import numpy as np, bmesh
from mathutils import Euler, Vector

SC = "C:/Users/justi/OneDrive/Python/dsw_mod/model_projects/landsraad_elite/08_scripts/"
PH = "C:/Users/justi/OneDrive/Python/dsw_mod/model_projects/landsraad_elite/02_progress_photos/10_parts_quality"
TEXD = "C:/Users/justi/OneDrive/Python/dsw_mod/model_projects/landsraad_elite/04_textures/v4_parts_1024/"

# ------------------------------------------------------------------ carve the sculpt pieces
hi = bpy.data.objects["elite_hi"]; me = hi.data
bm = bmesh.new(); bm.from_mesh(me); bm.verts.ensure_lookup_table()
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
bm.free(); comps.sort(key=len, reverse=True)
co = np.array([v.co[:] for v in me.vertices]); pads = {}
for comp in comps[1:]:
    cx, cz = co[comp, 0].mean(), co[comp, 2].mean()
    if abs(cx) > 0.15 and cz > 1.25: pads["L" if cx > 0 else "R"] = set(comp)
main = set(comps[0]); helmet = {i for i in main if co[i, 2] > 1.64 and abs(co[i, 0]) < 0.30}


def carve(name, keep):
    o = bpy.data.objects.get(name)
    if o: bpy.data.objects.remove(o, do_unlink=True)
    o = hi.copy(); o.data = hi.data.copy(); o.name = name; o.data.name = name; bpy.context.collection.objects.link(o)
    b = bmesh.new(); b.from_mesh(o.data); b.verts.ensure_lookup_table(); b.faces.ensure_lookup_table()
    bmesh.ops.delete(b, geom=[f for f in b.faces if not all(v.index in keep for v in f.verts)], context="FACES")
    bmesh.ops.delete(b, geom=[v for v in b.verts if not v.link_faces], context="VERTS")
    b.to_mesh(o.data); b.free()
    return o


for nm, keep in (("helmet_hi", helmet), ("padL_hi", pads["L"]), ("padR_hi", pads["R"])):
    carve(nm, keep)
hi.hide_viewport = True; hi.hide_render = True
lo = bpy.data.objects.get("elite_lo")
if lo: lo.hide_viewport = True; lo.hide_render = True
exec(open(SC + "v4_helmet_prep.py", encoding="utf-8").read(), globals())
prep()

# ------------------------------------------------------------------ render helpers
sc = bpy.context.scene
cam = bpy.data.objects.get("snapcam")
if cam is None:
    cd = bpy.data.cameras.new("snapcam"); cam = bpy.data.objects.new("snapcam", cd); sc.collection.objects.link(cam)
cam.data.type = 'ORTHO'; sc.camera = cam


def vis(*names):
    for o in bpy.data.objects:
        if o.type == 'MESH': o.hide_render = o.name not in names; o.hide_viewport = o.name not in names


def shot3(name, rz, rx, loc, width_m, w_, h_, color_type='SINGLE', light='STUDIO', single=(0.6, 0.6, 0.66), dist=6.0):
    """ortho camera orbiting `loc`: rz = azimuth (0 = from -y), rx = elevation (deg)"""
    cam = bpy.data.objects["snapcam"]; cam.data.ortho_scale = width_m; cam.data.clip_end = 50
    az = math.radians(rz); el = math.radians(rx)
    cam.location = Vector(loc) + Vector((math.sin(az) * math.cos(el), -math.cos(az) * math.cos(el), math.sin(el))) * dist
    cam.rotation_euler = Euler((math.radians(90) - el, 0, az))
    sc.render.engine = 'BLENDER_WORKBENCH'; sc.render.resolution_x, sc.render.resolution_y, sc.render.resolution_percentage = w_, h_, 100
    sh = sc.display.shading; sh.light = light; sh.color_type = color_type; sh.single_color = single
    sc.render.filepath = os.path.join(PH, name + ".png"); bpy.ops.render.render(write_still=True); return sc.render.filepath


def shotc(name, rz, loc, width_m, w_, h_, color_type='MATERIAL', light='STUDIO'):
    return shot3(name, rz, 0, loc, width_m, w_, h_, color_type=color_type, light=light)


def parts_material(name="Mat_ElitePart"):
    for m in list(bpy.data.materials):
        if m.name == name: bpy.data.materials.remove(m)
    mat = bpy.data.materials.new(name); mat.use_nodes = True; nt = mat.node_tree
    for n in list(nt.nodes): nt.nodes.remove(n)

    def img(fname, nonc, label):
        old = bpy.data.images.get(fname)
        if old: bpy.data.images.remove(old)
        im = bpy.data.images.load(TEXD + fname); im.colorspace_settings.name = "Non-Color" if nonc else "sRGB"
        nd = nt.nodes.new("ShaderNodeTexImage"); nd.image = im; nd.label = label; return nd
    a = img("Part_Albedo.png", False, "Albedo"); m = img("Part_MetallicGlossAO.png", True, "MetallicGlossAO"); n = img("Part_Normal.png", True, "Normal")
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); out = nt.nodes.new("ShaderNodeOutputMaterial"); nmap = nt.nodes.new("ShaderNodeNormalMap")
    nt.links.new(a.outputs["Color"], bsdf.inputs["Base Color"]); nt.links.new(m.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    nt.links.new(n.outputs["Color"], nmap.inputs["Color"]); nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"]); nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    nt.nodes.active = a
    return mat


def apply_parts_material(names=("helm_loft", "padL_new", "padR_new")):
    mat = parts_material()
    for nm in names:
        o = bpy.data.objects.get(nm)
        if not o: continue
        o.data.materials.clear(); o.data.materials.append(mat)
        for p in o.data.polygons: p.material_index = 0


globals().update(vis=vis, shot3=shot3, shotc=shotc, parts_material=parts_material, apply_parts_material=apply_parts_material, PH=PH)
print("session ready:", sorted(o.name for o in bpy.data.objects if o.type == 'MESH'))
