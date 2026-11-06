"""Render vanilla Ship-slot units + our ship at in-game model scale, RTS camera.
    blender -b --factory-startup --python 44_lineup.py -- <out.png> <ship.blend> [ship_scale] [cols]"""
import importlib, math, os, sys
import bpy
from mathutils import Vector, Matrix
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE)
B = importlib.import_module("20_build_variant"); bs, pw = B.bs, B.pw
a = sys.argv[sys.argv.index("--") + 1:]
out, shipblends = os.path.abspath(a[0]), [os.path.abspath(x) for x in a[1].split(",")]
ship_scale = float(a[2]) if len(a) > 2 else 1.6
ONLY = os.environ.get("LINEUP_DONORS")
DON = [("hawk", 1.8, "Atreides Hawk"), ("harpy", 1.6, "Harkonnen Harpy"), ("hammer", 1.6, "Corrino Hammer"),
       ("banshee", 0.9, "Smuggler Banshee"), ("siren", 0.7, "Ecaz Siren"), ("spirit", 0.6, "Vernius Spirit"),
       ("ravager", 1.3, "Renegade Ravager")]
if ONLY:
    DON = [d for d in DON if d[0] in ONLY.split(",")]
bs.reset_scene()
items = []
def real_mat(stem):
    t = B.texture_paths(stem); m = bpy.data.materials.new("M_" + stem.split("/")[-1]); m.use_nodes = True
    nt = m.node_tree; bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
    def tex(p, cs):
        n = nt.nodes.new("ShaderNodeTexImage"); n.image = bpy.data.images.load(p, check_existing=True)
        n.image.colorspace_settings.name = cs; return n
    if t["albedo"]: nt.links.new(tex(t["albedo"], "sRGB").outputs["Color"], bsdf.inputs["Base Color"])
    if t["mgao"]: nt.links.new(tex(t["mgao"], "Non-Color").outputs["Color"], bsdf.inputs["Specular IOR Level"])
    if t["normal"]:
        nm = nt.nodes.new("ShaderNodeNormalMap"); nt.links.new(tex(t["normal"], "Non-Color").outputs["Color"], nm.inputs["Color"])
        nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
    return m
# nose direction per donor in baked space -> rotate so every nose points -Y (toward camera-left-ish)
NOSE = {"hawk": 0, "harpy": None, "hammer": None, "banshee": 0, "siren": None, "spirit": None, "ravager": 90}
for key, sc, label in DON:
    rel, stem = B.donor(key); objs = B.import_and_flatten(rel, key)
    m = real_mat(stem); B.apply_material(objs, m)
    mn, mx = B.bounds(objs); c = (mn + mx) / 2
    rz = math.radians(NOSE.get(key) or 0)
    R = Matrix.Rotation(rz, 4, "Z")
    B.xform(objs, lambda p, c=c, sc=sc, R=R: R @ ((p - c) * sc))
    items.append((objs, label))
for shipblend in shipblends:
    pre = set(bpy.data.objects)
    with bpy.data.libraries.load(shipblend) as (src, dst):
        dst.objects = [n for n in src.objects]
    ship = [o for o in dst.objects if o and o.type == "MESH" and o not in pre]
    for o in ship:
        bpy.context.scene.collection.objects.link(o)
        o.data = o.data.copy()
        mw = o.matrix_world.copy()
        for v in o.data.vertices: v.co = mw @ v.co
        o.matrix_world = Matrix.Identity(4)
    mn, mx = B.bounds(ship); c = (mn + mx) / 2
    B.xform(ship, lambda p, c=c: Matrix.Rotation(math.radians(90), 4, "Z") @ ((p - c) * ship_scale))
    items.append((ship, os.path.basename(shipblend).replace("_tex.blend", "").replace(".blend", "")))
pw.soften_world(); pw.ROUGH_FLOOR = 0.4
for mat in bpy.data.materials:
    if mat.use_nodes: pw.gamelike(mat)
# lay out in a row along X, spacing by width
x = 0; centers = []
for objs, label in items:
    mn, mx = B.bounds(objs); w = mx.x - mn.x
    B.xform(objs, lambda p, d=Vector((x - mn.x, -(mn.y + mx.y) / 2, -mn.z)): p + d)
    centers.append((x + w / 2, label)); x += w + 2.0
for o in list(bpy.data.objects):
    if o.type in ("CAMERA", "LIGHT"): bpy.data.objects.remove(o, do_unlink=True)
bs.setup_render(2400, 700); bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.75, 0.66, 0.5)); bs.setup_lights()
mid = Vector((x / 2, 0, 1)); cam = bs.setup_camera(target=mid, ortho_scale=x * 1.02, distance=60)
cam.location = mid + Vector((0, -1, 1.25)).normalized() * 60
cam.rotation_euler = (mid - cam.location).to_track_quat("-Z", "Y").to_euler()
bs.render_to(out, cam)
open(out + ".labels.txt", "w").write("\n".join("%.4f %s" % (cx / x, l) for cx, l in centers))
print("LINEUP_DONE", out)
