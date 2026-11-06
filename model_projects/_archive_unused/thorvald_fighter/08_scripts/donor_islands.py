"""Render a donor vehicle with each large island highlighted in turn, using its real preview textures.

    blender -b --python donor_islands.py -- <model.fbx|.blend> <texture_dir> <out_dir> <tag> [--n 16] [--px 800]

The game's .fbx files are HMD (Blender refuses them) and the textures are DDS behind a .png name, so the
script converts the model and loads the real PNGs from a preview_textures folder.  Islands are connected
components of the mesh sorted by vertex count; each render paints one island red over the unlit ship so the
donor can be identified by number.
"""
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
n_iso = int(a[a.index("--n") + 1]) if "--n" in a else 16
px = int(a[a.index("--px") + 1]) if "--px" in a else 800
os.makedirs(out, exist_ok=True)


def load_textures(mat, folder):
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    bsdf.location = (-200, 0)
    outn = nt.nodes.new("ShaderNodeOutputMaterial")
    outn.location = (200, 0)
    nt.links.new(bsdf.outputs["BSDF"], outn.inputs["Surface"])
    for fname, target, cs in (("albedo.png", "Base Color", "sRGB"),
                              ("mgao.png", "Specular IOR Level", "Non-Color"),
                              ("normal.png", "Normal", "Non-Color")):
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
dims = hi - lo
ortho = 1.15 * max(math.hypot(dims.x, dims.y), 1.6 * dims.z, 1.0)
print("BOUNDS lo", tuple(round(v, 2) for v in lo), "hi", tuple(round(v, 2) for v in hi))

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
# bmesh verts die with the bmesh, so record plain vertex indices now
comps = [[v.index for v in comp] for comp in comps[:n_iso]]
bm.free()

vert_isl = {}
for i, comp in enumerate(comps):
    for vi in comp:
        vert_isl[vi] = i

attr = ob.data.attributes.new("isl", "INT", "FACE")
for poly in ob.data.polygons:
    attr.data[poly.index].value = vert_isl.get(ob.data.vertices[poly.vertices[0]].index, -1)

red = bpy.data.materials.new("ISO")
red.use_nodes = True
r = next(n for n in red.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
r.inputs["Base Color"].default_value = (0.92, 0.08, 0.05, 1)
ob.data.materials.append(red)
IDX_RED = len(ob.data.materials) - 1

world = bpy.data.worlds.new("W")
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


print("ISLAND vert-counts:", [len(c) for c in comps])
for i in range(len(comps)):
    for poly in ob.data.polygons:
        poly.material_index = IDX_RED if attr.data[poly.index].value == i else 0
    place((0.7, -0.7, 0.35))
    p = os.path.join(out, "%s_i%02d.png" % (tag, i))
    sc.render.filepath = os.path.abspath(p)
    bpy.ops.render.render(write_still=True)
    print("ISL_RENDER", i, "verts", len(comps[i]), p)
print("DONE ->", out)
