"""Line up a built design next to the vanilla faction frigates at their IN-GAME size
(mesh x cdb model scale), with vanilla albedo, and render three-quarter + top.

    blender -b --factory-startup --python 28_lineup.py -- <design.blend> <design cdb scale> <outdir>
"""
import importlib, math, os, sys
import bpy
from mathutils import Vector, Matrix

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
B = importlib.import_module("20_build_variant")
bs, pw = B.bs, B.pw
argv = sys.argv[sys.argv.index("--") + 1:]
design_blend, design_scale, outdir = argv[0], float(argv[1]), os.path.abspath(argv[2])
os.makedirs(outdir, exist_ok=True)

# (label, donor key, cdb scale, yaw so the nose points -X like the Lancer)
VANILLA = [("Renegade (Th/A)", "frigate", 1.2, 0), ("Kraken (Atreides)", "kraken", 1.6, 90),
           ("Overlord (Harkonnen)", "overlord", 1.2, 90), ("Chronos (Corrino)", "chronos", 1.7, 90),
           ("Wraith (Smugglers)", "wraith", 1.2, 0)]
# optional 4th arg: comma list of donor keys to show; optional 5th: label for the design
if len(argv) > 3 and argv[3]:
    VANILLA = [v for v in VANILLA if v[1] in argv[3].split(",")]
DESIGN_LABEL = argv[4] if len(argv) > 4 else "THORVALD LANCER"

bs.reset_scene()
groups = []


def plain_material(stem):
    tex = B.texture_paths(stem)
    # true vanilla colours (texture_paths prefers the de-greened kitbash copies in 04_textures/clean)
    van = os.path.join(B.VEH, os.path.dirname(stem.replace("/", os.sep)), "preview_textures", "albedo.png")
    if os.path.exists(van):
        tex["albedo"] = van
    m = bpy.data.materials.new("van_" + os.path.basename(stem)); m.use_nodes = True
    bsdf = m.node_tree.nodes.get("Principled BSDF")
    bsdf.inputs["Roughness"].default_value = 0.6
    if tex.get("albedo"):
        n = m.node_tree.nodes.new("ShaderNodeTexImage"); n.image = bpy.data.images.load(tex["albedo"])
        m.node_tree.links.new(n.outputs["Color"], bsdf.inputs["Base Color"])
    return m


for label, key, sc, yaw in VANILLA:
    rel, stem = B.donor(key)
    objs = B.import_and_flatten(rel, "v_" + key)
    mat = plain_material(stem)
    B.apply_material(objs, mat)
    mn, mx = B.bounds(objs); c = (mn + mx) / 2
    R = Matrix.Rotation(math.radians(yaw), 4, "Z")
    B.xform(objs, lambda p, c=c, R=R, sc=sc: R @ ((p - c) * sc))
    groups.append((label, objs))

with bpy.data.libraries.load(design_blend) as (src, dst):
    dst.objects = list(src.objects)
dobjs = []
for o in dst.objects:
    if o is not None and o.type == "MESH":
        bpy.context.scene.collection.objects.link(o); dobjs.append(o)
B.xform(dobjs, lambda p: p * design_scale)
# optional 6th/7th args: swap the cruiser albedo / MGAO for a paint variant
for i, stem in ((5, "Thorvald_Cruiser_Albedo"), (6, "Thorvald_Cruiser_MetallicGlossAO")):
    if len(argv) > i:
        for img in bpy.data.images:
            if stem in os.path.basename(img.filepath):
                img.filepath = os.path.abspath(argv[i]); img.reload()
for m in bpy.data.materials:
    if m.use_nodes and m.name.startswith("Thorvald_Cruiser"):
        pw.gamelike(m)
groups.insert(0, (DESIGN_LABEL, dobjs))

# lay out left to right with a gap, all sitting on z=0
x = 0.0
for label, objs in groups:
    mn, mx = B.bounds(objs)
    w = mx.y - mn.y
    cx = (mn.x + mx.x) / 2
    # ships side by side along Y (each ship's length runs along X), centred on x=0, on the ground
    B.xform(objs, lambda p, mn=mn, x=x, cx=cx: Vector((p.x - cx, p.y - mn.y + x, p.z - mn.z)))
    mn2, mx2 = B.bounds(objs)
    print("LINEUP %-22s len(x)=%.1f width(y)=%.1f height=%.1f" % (label, mx2.x - mn2.x, mx2.y - mn2.y, mx2.z - mn2.z))
    x += w + 3.0

allo = [o for _, objs in groups for o in objs]
mn, mx = B.bounds(allo); c = (mn + mx) / 2; span = max(mx - mn)
pw.soften_world()
bs.setup_render(1800, 700)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights()
cam = bs.setup_camera(target=c, ortho_scale=span * 1.3, distance=span * 3)
for name, d in {"tq": (-0.55, -0.35, 0.45), "top": (-0.0001, 0, 1)}.items():
    cam.location = c + Vector(d).normalized() * span * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "X" if name == "top" else "Y").to_euler()
    bs.render_to(os.path.join(outdir, "lineup_%s.png" % name), cam)
print("LINEUP_OK")
