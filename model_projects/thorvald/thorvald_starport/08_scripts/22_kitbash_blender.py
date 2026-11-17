# Kitbash terminal variants from the split donor .blends made by 20_parts_sheet.py (material "id<g>" = group letter).
# usage: blender -b --factory-startup --python 22_kitbash_blender.py -- <variants.json> <outdir>
import bpy, sys, os, json, math
from mathutils import Vector, Matrix

a = sys.argv[sys.argv.index("--") + 1:]
SPEC = json.load(open(a[0])); OUT = os.path.abspath(a[1]); os.makedirs(OUT, exist_ok=True)
DON = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "03_blender", "kitbash_donors")
texmats = {}


def texmat(donor):
    if donor in texmats:
        return texmats[donor]
    m = bpy.data.materials.new("tex_" + donor); m.use_nodes = True
    b = m.node_tree.nodes["Principled BSDF"]; b.inputs["Roughness"].default_value = 0.8
    p = os.path.join(DON, donor, "albedo.png")
    if os.path.exists(p):
        t = m.node_tree.nodes.new("ShaderNodeTexImage"); t.image = bpy.data.images.load(p)
        m.node_tree.links.new(t.outputs["Color"], b.inputs["Base Color"])
    else:
        b.inputs["Base Color"].default_value = (0.5, 0.48, 0.44, 1)
    texmats[donor] = m
    return m


def add_piece(donor, letters, scale, at, rotz):
    blend = os.path.join(DON, donor, "parts.blend")
    with bpy.data.libraries.load(blend) as (src, dst):
        dst.objects = list(src.objects)
    keep = []
    want = {ord(L) - 65 for L in letters}
    for o in dst.objects:
        if o is None or o.type != "MESH":
            continue
        mn = o.data.materials[0].name if o.data.materials else ""
        base = mn.split(".")[0]                    # a second donor's "id0" arrives as "id0.001"
        g = int(base[2:]) if base[2:].isdigit() else -1
        if not mn.startswith("id") or g not in want:
            continue
        o = o.copy(); o.data = o.data.copy()
        bpy.context.scene.collection.objects.link(o)
        o.data.materials.clear(); o.data.materials.append(texmat(donor))
        o.matrix_world = Matrix.Translation(Vector(at)) @ Matrix.Rotation(math.radians(rotz), 4, "Z") @ Matrix.Scale(scale, 4) @ o.matrix_world
        keep.append(o)
    return keep


def setup():
    sc = bpy.context.scene
    ids = [e.identifier for e in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items]
    sc.render.engine = "CYCLES"                     # EEVEE hangs headless on this PC
    sc.cycles.device = "CPU"; sc.cycles.samples = 24; sc.cycles.use_denoising = False
    sc.render.resolution_x = sc.render.resolution_y = 640
    sc.render.film_transparent = True; sc.view_settings.view_transform = "Standard"
    w = bpy.data.worlds.new("W"); sc.world = w; w.use_nodes = True
    w.node_tree.nodes["Background"].inputs[0].default_value = (0.6, 0.6, 0.6, 1)
    w.node_tree.nodes["Background"].inputs[1].default_value = 0.8
    for d in [(0.3, -0.5, 1), (-0.6, 0.5, 0.5)]:
        ld = bpy.data.lights.new("L", "SUN"); ld.energy = 2.6
        lo = bpy.data.objects.new("L", ld); sc.collection.objects.link(lo)
        lo.rotation_euler = Vector(d).to_track_quat("Z", "Y").to_euler()
    cd = bpy.data.cameras.new("C"); cd.type = "ORTHO"
    cam = bpy.data.objects.new("C", cd); sc.collection.objects.link(cam); sc.camera = cam
    return sc, cam


for v in SPEC:
    bpy.ops.wm.read_factory_settings(use_empty=True); texmats.clear()
    sc, cam = setup()
    objs = []
    for p in v["pieces"]:
        objs += add_piece(p["donor"], p["letters"], p.get("scale", 1.0), p.get("at", (0, 0, 0)), p.get("rotz", 0))
    pts = [o.matrix_world @ Vector(c) for o in objs for c in o.bound_box]
    lo = Vector([min(q[k] for q in pts) for k in range(3)]); hi = Vector([max(q[k] for q in pts) for k in range(3)])
    ctr = (lo + hi) / 2; diag = (hi - lo).length
    cam.data.ortho_scale = diag * 1.0
    for tag, d in (("front", (-0.7, -0.7, 0.6)), ("back", (0.7, 0.7, 0.6))):
        d = Vector(d).normalized()
        cam.location = ctr + d * diag * 3
        cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (v["name"], tag))
        bpy.ops.render.render(write_still=True)
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(OUT, v["name"] + ".blend"))
    print("VAR_DONE", v["name"], [round(x, 2) for x in lo], [round(x, 2) for x in hi])
