# Compose terminal designs from single components (loose islands) of the donor buildings.
# usage: blender -b --factory-startup --python 24_compose_blender.py -- <designs.json> <outdir> [name,name]
# A piece = {"comp": name, "at": [x, y, z], "scale": s | [sx, sy, sz], "rotz": deg}; "at" is where the component's
# bottom-centre goes. Components are lists of island suffixes per donor ("000" = the unsuffixed object).
import bpy, sys, os, json, math
from mathutils import Vector, Matrix

a = sys.argv[sys.argv.index("--") + 1:]
SPEC = json.load(open(a[0])); OUT = os.path.abspath(a[1]); os.makedirs(OUT, exist_ok=True)
DON = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "03_blender", "kitbash_donors")
G, S, M, P, I = "SpacingGuildBranch", "SupplyDepot", "MilitaryBase", "PropagandaOffice", "ImperialStation"
r = lambda a, b: ["%03d" % i for i in range(a, b + 1)]
COMP = {
    "pad": (G, ["026", "027", "028", "029", "030", "024", "025"] + r(2, 17)),
    "disc": (G, ["000"]),
    "tower": (G, ["021", "018", "019"]),
    "minitower": (G, ["020", "023"]),
    "neck": (G, ["022"]),
    "depot": (S, ["003", "004", "005", "007", "010", "011", "012", "013", "014", "001"]),
    "crate": (S, ["002"]),
    "container": (S, ["008", "000"]),
    "hexfloor": (S, ["009"]),
    "tanks": (M, ["015", "011", "008", "013"]),
    "bunker": (M, ["012", "010", "006", "000", "014", "001", "005", "003"]),
    "pylon": (M, ["007"]),
    "wall": (M, ["009"]),
    "box": (P, ["018", "019", "005", "007", "026", "006", "009", "023", "022"]),
    "ramp": (P, ["020", "024", "014", "015", "010", "011"]),
    "annex": (P, ["002"]),
    "mast": (P, ["003", "008", "004", "000", "001"]),
    "kiosk": (I, ["000", "002", "004", "001", "005", "003"]),
}
cache, texmats = {}, {}


def donor_objs(d):
    if d not in cache:
        with bpy.data.libraries.load(os.path.join(DON, d, "parts.blend")) as (src, dst):
            names = list(src.objects); dst.objects = list(src.objects)
        cache[d] = {}
        for n, o in zip(names, dst.objects):
            suf = n.rsplit(".", 1)[1] if "." in n and n.rsplit(".", 1)[1].isdigit() else "000"
            if o is not None and o.type == "MESH":
                cache[d][suf] = o
    return cache[d]


def texmat(d):
    if d not in texmats:
        m = bpy.data.materials.new("tex_" + d); m.use_nodes = True
        b = m.node_tree.nodes["Principled BSDF"]; b.inputs["Roughness"].default_value = 0.8
        p = os.path.join(DON, d, "albedo.png")
        if os.path.exists(p):
            t = m.node_tree.nodes.new("ShaderNodeTexImage"); t.image = bpy.data.images.load(p)
            m.node_tree.links.new(t.outputs["Color"], b.inputs["Base Color"])
        else:
            b.inputs["Base Color"].default_value = (0.5, 0.48, 0.44, 1)
        texmats[d] = m
    return texmats[d]


def place(p):
    d, sufs = COMP[p["comp"]]
    src = [donor_objs(d)[s] for s in sufs if s in donor_objs(d)]
    pts = [o.matrix_world @ Vector(c) for o in src for c in o.bound_box]
    lo = Vector([min(q[k] for q in pts) for k in range(3)]); hi = Vector([max(q[k] for q in pts) for k in range(3)])
    piv = Vector(((lo.x + hi.x) / 2, (lo.y + hi.y) / 2, lo.z))
    s = p.get("scale", 1.0); s = [s, s, s] if not isinstance(s, list) else s
    T = (Matrix.Translation(Vector(p.get("at", (0, 0, 0)))) @ Matrix.Rotation(math.radians(p.get("rotz", 0)), 4, "Z")
         @ Matrix.Diagonal((s[0], s[1], s[2], 1)) @ Matrix.Translation(-piv))
    out = []
    for o in src:
        c = o.copy(); c.data = o.data.copy(); bpy.context.scene.collection.objects.link(c)
        c.data.materials.clear(); c.data.materials.append(texmat(d)); c.matrix_world = T @ o.matrix_world
        c["donor"] = d; out.append(c)
    return out


def setup():
    sc = bpy.context.scene
    sc.render.engine = "CYCLES"; sc.cycles.device = "CPU"; sc.cycles.samples = 24; sc.cycles.use_denoising = False
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


only = a[2].split(",") if len(a) > 2 else None
for v in SPEC:
    if only and v["name"] not in only:
        continue
    bpy.ops.wm.read_factory_settings(use_empty=True); cache.clear(); texmats.clear()
    sc, cam = setup()
    objs = []
    for p in v["pieces"]:
        objs += place(p)
    pts = [o.matrix_world @ Vector(c) for o in objs for c in o.bound_box]
    lo = Vector([min(q[k] for q in pts) for k in range(3)]); hi = Vector([max(q[k] for q in pts) for k in range(3)])
    ctr = (lo + hi) / 2; diag = (hi - lo).length
    cam.data.ortho_scale = diag * 0.95
    clay = bpy.data.materials.new("clay"); clay.use_nodes = True
    clay.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = (0.16, 0.16, 0.17, 1)
    clay.node_tree.nodes["Principled BSDF"].inputs["Roughness"].default_value = 0.6
    for mode in ("tex", "clay"):
        if mode == "clay":                          # one colour: judge the shape without the mismatched donor paint
            for o in objs:
                o.data.materials.clear(); o.data.materials.append(clay)
        for tag, d in (("front", (-0.7, -0.7, 0.62)), ("back", (0.7, 0.7, 0.62))):
            if mode == "clay" and tag == "back":
                continue
            d = Vector(d).normalized()
            cam.location = ctr + d * diag * 3
            cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()
            sc.render.filepath = os.path.join(OUT, "%s_%s_%s.png" % (v["name"], mode, tag))
            bpy.ops.render.render(write_still=True)
    for o in objs:
        o.data.materials.clear(); o.data.materials.append(texmat(o["donor"]))
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(OUT, v["name"] + ".blend"))
    print("VAR_DONE", v["name"], [round(x, 2) for x in lo], [round(x, 2) for x in hi])
