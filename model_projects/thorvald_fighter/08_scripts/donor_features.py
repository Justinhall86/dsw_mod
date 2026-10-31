"""Cluster a donor model's islands into features and render each one highlighted.

    blender -b --python donor_features.py -- <model.fbx|.blend> <texture_dir_or_json> <out_dir> <tag>

Why clusters: these game meshes are built from thin plates, so one island is usually a single flat panel.
A feature (command tower, capsule module, pontoon) is a handful of islands that sit on top of each other.
Islands are grouped by bounding-box proximity, then every cluster is rendered in red over the rest of the
ship so donors can be picked by eye and by the printed island list.

Textures come from a preview_textures folder (albedo.png / mgao.png / normal.png) so Blender can actually
load them - the originals are DDS behind a .png name.  Preview wiring is never saved.
"""
import json
import math
import os
import sys
import tempfile

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-vehicle-preview\scripts")
sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\HMD_toolkit\HMD_toolkit\Models")
import preview_wiring as PW  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
src, texdir, out, tag = os.path.abspath(a[0]), os.path.abspath(a[1]), os.path.abspath(a[2]), a[3]
gap = float(a[a.index("--gap") + 1]) if "--gap" in a else 0.45
max_feat = int(a[a.index("--max") + 1]) if "--max" in a else 12
MIN_VERTS = int(a[a.index("--min-verts") + 1]) if "--min-verts" in a else 14
px = int(a[a.index("--px") + 1]) if "--px" in a else 850
os.makedirs(out, exist_ok=True)


def load_textures(mat, folder):
    """Rebuild the material from real PNGs, wired the way render_vehicle.py does."""
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    bsdf.location = (-200, 0)
    outn = nt.nodes.new("ShaderNodeOutputMaterial")
    outn.location = (200, 0)
    nt.links.new(bsdf.outputs["BSDF"], outn.inputs["Surface"])
    pairs = (("albedo.png", "Base Color", "sRGB"),
             ("mgao.png", "Specular IOR Level", "Non-Color"),
             ("normal.png", "Normal", "Non-Color"))
    for fname, target, cs in pairs:
        p = os.path.join(folder, fname)
        if not os.path.exists(p):
            continue
        nd = nt.nodes.new("ShaderNodeTexImage")
        img = bpy.data.images.load(p, check_existing=False)
        img.colorspace_settings.name = cs
        nd.image = img
        nd.location = (-700, 200)
        if target == "Normal":
            nmap = nt.nodes.new("ShaderNodeNormalMap")
            nt.links.new(nd.outputs["Color"], nmap.inputs["Color"])
            nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
        else:
            nt.links.new(nd.outputs["Color"], bsdf.inputs[target])
    PW.gamelike(mat)


bpy.ops.wm.read_factory_settings(use_empty=True)
if src.lower().endswith(".blend"):
    bpy.ops.wm.open_mainfile(filepath=src)
else:
    with open(src, "rb") as fh:
        head = fh.read(3)
    if head == b"HMD":
        import hmd2fbx
        tmp = tempfile.mktemp(suffix=".fbx")
        hmd2fbx.convert(src, tmp, verbose=False)
        src = tmp
    bpy.ops.import_scene.fbx(filepath=src)
bpy.context.view_layer.update()

for o in list(bpy.data.objects):
    if o.type in ("CAMERA", "LIGHT") or o.name.split(".")[0] in ("Cube", "Camera", "Light", "Lamp"):
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
if not meshes:
    raise SystemExit("no mesh")
ob = meshes[0]

if os.path.isdir(texdir):
    mat = bpy.data.materials.new("Donor")
    mat.use_nodes = True
    load_textures(mat, texdir)
    ob.data.materials.clear()
    ob.data.materials.append(mat)

bpy.context.view_layer.update()
lo = Vector((1e9, 1e9, 1e9))
hi = Vector((-1e9, -1e9, -1e9))
for c in ob.bound_box:
    p = ob.matrix_world @ Vector(c)
    for i in range(3):
        lo[i] = min(lo[i], p[i])
        hi[i] = max(hi[i], p[i])
centre = (lo + hi) / 2
size = hi - lo
ortho = 1.15 * max(math.hypot(size.x, size.y), 1.6 * size.z, 1.0)
print("BOUNDS lo", tuple(round(v, 2) for v in lo), "hi", tuple(round(v, 2) for v in hi))

# --- island extraction ------------------------------------------------------
bm = bmesh.new()
bm.from_mesh(ob.data)
bm.verts.ensure_lookup_table()
seen = set()
comps = []
for v in bm.verts:
    if v.index in seen:
        continue
    stack, comp = [v], []
    seen.add(v.index)
    while stack:
        cur = stack.pop()
        comp.append(cur)
        for e in cur.link_edges:
            o = e.other_vert(cur)
            if o.index not in seen:
                seen.add(o.index)
                stack.append(o)
    comps.append(comp)
comps.sort(key=len, reverse=True)

islands = []
for comp in comps:
    if len(comp) < MIN_VERTS:
        continue
    pts = [ob.matrix_world @ vert.co for vert in comp]
    lo_i = Vector((min(p.x for p in pts), min(p.y for p in pts), min(p.z for p in pts)))
    hi_i = Vector((max(p.x for p in pts), max(p.y for p in pts), max(p.z for p in pts)))
    islands.append({"verts": len(comp), "comp": comp, "lo": lo_i, "hi": hi_i, "cen": (lo_i + hi_i) / 2})
print("ISLANDS", len(islands), "of", len(comps), "(min_verts", MIN_VERTS, ")")

# --- cluster by bounding-box proximity --------------------------------------
parent = list(range(len(islands)))


def find(x):
    while parent[x] != x:
        parent[x] = parent[parent[x]]
        x = parent[x]
    return x


def near(a_, b_):
    # boxes closer than `gap` on every axis count as one feature
    d = 0.0
    for i in range(3):
        if a_["hi"][i] < b_["lo"][i]:
            d += (b_["lo"][i] - a_["hi"][i]) ** 2
        elif b_["hi"][i] < a_["lo"][i]:
            d += (a_["lo"][i] - b_["hi"][i]) ** 2
    return d <= gap * gap


for i in range(len(islands)):
    for j in range(i + 1, len(islands)):
        if near(islands[i], islands[j]):
            ri, rj = find(i), find(j)
            if ri != rj:
                parent[ri] = rj

groups = {}
for i in range(len(islands)):
    groups.setdefault(find(i), []).append(i)
feats = sorted(groups.values(), key=lambda g: -sum(islands[i]["verts"] for i in g))
feats = feats[:max_feat]
print("FEATURES", len(feats))

feat_rows = []
for fi, g in enumerate(feats):
    lo_f = Vector((1e9, 1e9, 1e9))
    hi_f = Vector((-1e9, -1e9, -1e9))
    for i in g:
        lo_f = Vector((min(lo_f[k], islands[i]["lo"][k]) for k in range(3)))
        hi_f = Vector((max(hi_f[k], islands[i]["hi"][k]) for k in range(3)))
    cen = (lo_f + hi_f) / 2
    dims = hi_f - lo_f
    feat_rows.append({"feature": fi, "islands": sorted(g), "n_islands": len(g),
                      "verts": sum(islands[i]["verts"] for i in g),
                      "cx": round(cen.x, 2), "cy": round(cen.y, 2), "cz": round(cen.z, 2),
                      "sx": round(dims.x, 2), "sy": round(dims.y, 2), "sz": round(dims.z, 2)})
    print("FEAT %2d islands=%-16s verts=%4d  c(%.2f,%.2f,%.2f)  size(%.2f,%.2f,%.2f)"
          % (fi, str(sorted(g)), feat_rows[-1]["verts"], cen.x, cen.y, cen.z, dims.x, dims.y, dims.z))

if a[a.index("--out") + 1] if "--out" in a else None:
    with open(os.path.abspath(a[a.index("--out") + 1]), "w", encoding="utf-8") as fh:
        json.dump({"source": src, "features": feat_rows,
                   "islands": [{"verts": i["verts"],
                                "cx": round(i["cen"].x, 2), "cy": round(i["cen"].y, 2),
                                "cz": round(i["cen"].z, 2)} for i in islands]}, fh, indent=1)

# --- render each feature highlighted ----------------------------------------
attr = ob.data.attributes.new("feat", "INT", "FACE")
vert_feat = {}
for fi, g in enumerate(feats):
    for i in g:
        for vert in islands[i]["comp"]:
            vert_feat[vert.index] = fi
for poly in ob.data.polygons:
    v0 = ob.data.vertices[poly.vertices[0]].index
    attr.data[poly.index].value = vert_feat.get(v0, -1)

red = bpy.data.materials.new("ISO_RED")
red.use_nodes = True
rbsdf = next(n for n in red.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
rbsdf.inputs["Base Color"].default_value = (0.9, 0.06, 0.06, 1)
ob.data.materials.append(red)
idx_red = len(ob.data.materials) - 1
orig_mat = 0

world = bpy.data.worlds.new("World")
world.use_nodes = True
bpy.context.scene.world = world
PW.soften_world()
sun_d = bpy.data.lights.new("Sun", type="SUN")
sun_d.energy = 3.0
sun_d.angle = math.radians(3)
sun = bpy.data.objects.new("Sun", sun_d)
bpy.context.scene.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
fill_d = bpy.data.lights.new("Fill", type="AREA")
fill_d.energy = 120.0
fill_d.size = 3.0
fill = bpy.data.objects.new("Fill", fill_d)
bpy.context.scene.collection.objects.link(fill)
fill.location = (-1.6, -2.2, 1.6)
fill.rotation_euler = (math.radians(65), 0.0, math.radians(-40))
cam_d = bpy.data.cameras.new("Cam")
cam_d.type = "ORTHO"
cam_d.ortho_scale = ortho
cam_d.clip_end = 1000.0
cam = bpy.data.objects.new("Cam", cam_d)
bpy.context.scene.collection.objects.link(cam)
bpy.context.scene.camera = cam
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = px
sc.render.resolution_y = int(px * 0.8)
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"
sc.render.image_settings.file_format = "PNG"
DIST = ortho * 3.0


def place(d):
    v = Vector(d).normalized()
    cam.location = centre + v * DIST
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()


for fi in range(len(feats)):
    for poly in ob.data.polygons:
        poly.material_index = idx_red if attr.data[poly.index].value == fi else orig_mat
    place((0.7, -0.7, 0.35))
    p = os.path.join(out, "%s_f%02d.png" % (tag, fi))
    sc.render.filepath = os.path.abspath(p)
    bpy.ops.render.render(write_still=True)
    print("FEAT_RENDER", fi, p)
print("DONE ->", out)
