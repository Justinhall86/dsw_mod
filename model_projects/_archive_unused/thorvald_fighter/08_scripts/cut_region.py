"""Cut a bounding-box region out of a donor mesh and render it alone, so a kitbash part can be picked by eye.

    blender -b --python cut_region.py -- <model.fbx|.blend> <texture_dir> <out_dir> <tag> \
        <x0> <x1> <y0> <y1> <z0> <z1> [--px 800]

Prints the region's world bounds and vertex/face count, and renders the cut part on its own plus in place
on the donor (red) so fit can be judged before anything is grafted.
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
x0, x1, y0, y1, z0, z1 = (float(v) for v in a[4:10])
px = int(a[a.index("--px") + 1]) if "--px" in a else 800
os.makedirs(out, exist_ok=True)
BOX = (Vector((x0, y0, z0)), Vector((x1, y1, z1)))


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
ob = meshes[0]

mat = bpy.data.materials.new("Donor")
mat.use_nodes = True
load_textures(mat, texdir)
ob.data.materials.clear()
ob.data.materials.append(mat)
bpy.context.view_layer.update()

# --- extract the region into its own object --------------------------------
mw = ob.matrix_world
mwi = mw.inverted()
lo_l = mwi @ BOX[0]
hi_l = mwi @ BOX[1]
lo_l, hi_l = Vector((min(lo_l[i], hi_l[i]) for i in range(3))), Vector((max(lo_l[i], hi_l[i]) for i in range(3)))


def inside(co):
    return all(lo_l[i] - 1e-4 <= co[i] <= hi_l[i] + 1e-4 for i in range(3))


bm = bmesh.new()
bm.from_mesh(ob.data)
bm.faces.ensure_lookup_table()
kill = [f for f in bm.faces if not all(inside(v.co) for v in f.verts)]
n_faces_total = len(bm.faces)
bmesh.ops.delete(bm, geom=kill, context="FACES")
# drop verts no longer used
loose = [v for v in bm.verts if not v.link_faces]
bmesh.ops.delete(bm, geom=loose, context="VERTS")
n_v, n_f = len(bm.verts), len(bm.faces)
print("REGION world %s..%s" % (tuple(round(v, 2) for v in BOX[0]), tuple(round(v, 2) for v in BOX[1])))
print("CUT verts %d faces %d (of %d faces)" % (n_v, n_f, n_faces_total))
if n_f == 0:
    raise SystemExit("region is empty - adjust the box")
pts = [mw @ v.co for v in bm.verts]
r_lo = Vector((min(p[i] for p in pts) for i in range(3)))
r_hi = Vector((max(p[i] for p in pts) for i in range(3)))
print("CUT world bbox %s .. %s  size %s" % (tuple(round(v, 2) for v in r_lo),
                                            tuple(round(v, 2) for v in r_hi),
                                            tuple(round(v, 2) for v in (r_hi - r_lo))))

# save the cut region as its own object for the graft step
cut = bpy.data.objects.new(tag + "_cut", ob.data.copy())
bpy.context.scene.collection.objects.link(cut)
cut.matrix_world = mw
for m in list(cut.data.materials):
    pass
# keep only the faces we want: rebuild mesh from bm
bm.to_mesh(cut.data)
bm.free()
cut.data.materials.clear()
cut.data.materials.append(mat)

# hide the full donor, show only the cut
ob.hide_render = True
ob.hide_set(True)

bpy.context.view_layer.update()
lo2 = Vector((1e9, 1e9, 1e9))
hi2 = Vector((-1e9, -1e9, -1e9))
for c in cut.bound_box:
    p = cut.matrix_world @ Vector(c)
    for i in range(3):
        lo2[i] = min(lo2[i], p[i])
        hi2[i] = max(hi2[i], p[i])
centre = (lo2 + hi2) / 2
dims = hi2 - lo2
ortho = 1.3 * max(math.hypot(dims.x, dims.y), 1.6 * dims.z, 0.5)

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
sc.render.resolution_y = int(px * 0.85)
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"
sc.render.image_settings.file_format = "PNG"
DIST = ortho * 3.0

for name, d in (("tq", (0.7, -0.7, 0.35)), ("front", (0, -1, 0.1)), ("top", (0.05, -0.15, 1.0))):
    v = Vector(d).normalized()
    cam.location = centre + v * DIST
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    p = os.path.join(out, "%s_%s.png" % (tag, name))
    sc.render.filepath = os.path.abspath(p)
    bpy.ops.render.render(write_still=True)
    print("RENDER", name, p)

blend_out = os.path.join(out, tag + "_cut.blend")
bpy.ops.wm.save_as_mainfile(filepath=blend_out, compress=True)
print("SAVED", blend_out)
print("DONE")
