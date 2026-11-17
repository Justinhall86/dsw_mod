# Build the kitbashed Consignment Terminal (design D5, after the user's paint-over) as ONE mesh on ONE atlas.
# usage: blender -b --factory-startup --python 27_terminal_build.py
# Parts: Propaganda box hall (copper trim), Guild landing pad on its roof, Guild tower (grey, no logo), Military tank row
# + pylons, new hex slab, new copper slope. Atlas: 26_terminal_atlas.py. Output: ../03_blender/terminal_kitbash.blend
import bpy, bmesh, os, math
from mathutils import Vector, Matrix

HERE = os.path.dirname(os.path.abspath(__file__)); PROJ = os.path.dirname(HERE)
DON = os.path.join(PROJ, "03_blender", "kitbash_donors")
ATLAS = os.path.join(PROJ, "04_textures", "terminal_kitbash", "Terminal_Albedo.png")
SHOTS = os.path.join(PROJ, "02_progress_photos", "13_terminal_kitbash"); os.makedirs(SHOTS, exist_ok=True)
G, M, P = "SpacingGuildBranch", "MilitaryBase", "PropagandaOffice"
QUAD = {G: (0, 1), P: (1, 1), M: (0, 0)}
r = lambda a, b: ["%03d" % i for i in range(a, b + 1)]
COMP = {
    "pad": (G, ["026", "027", "028", "029", "030", "024", "025"] + r(2, 17)),
    "tower": (G, ["021", "018", "019"]),
    "tanks": (M, ["015", "011", "008", "013"]),
    "pylon": (M, ["007"]),
    "box": (P, ["018", "019", "005", "007", "026", "006"]),
}
PIECES = [
    dict(comp="box", scale=[1.9, 1.7, 1.2], at=(0.1, 0.1, 0.05)),
    dict(comp="pad", scale=[0.62, 0.62, 0.45], at=(0.1, 0.1, 1.15)),
    dict(comp="tower", scale=0.8, rotz=90, at=(-1.25, 0.1, 0.05)),
    dict(comp="tanks", scale=1.5, rotz=90, at=(1.62, 0.3, 0.05)),
    dict(comp="pylon", scale=1.1, at=(-1.75, 0.95, 0.05)),
    dict(comp="pylon", scale=1.1, at=(1.2, 1.4, 0.05)),
]
bpy.ops.wm.read_factory_settings(use_empty=True)
sc = bpy.context.scene
cache = {}


def donor(d):
    if d not in cache:
        with bpy.data.libraries.load(os.path.join(DON, d, "parts.blend")) as (src, dst):
            names = list(src.objects); dst.objects = list(src.objects)
        cache[d] = {}
        for n, o in zip(names, dst.objects):
            suf = n.rsplit(".", 1)[1] if "." in n and n.rsplit(".", 1)[1].isdigit() else "000"
            if o is not None and o.type == "MESH":
                cache[d][suf] = o
    return cache[d]


objs = []
for p in PIECES:
    d, sufs = COMP[p["comp"]]
    src = [donor(d)[s] for s in sufs if s in donor(d)]
    pts = [o.matrix_world @ Vector(c) for o in src for c in o.bound_box]
    lo = Vector([min(q[k] for q in pts) for k in range(3)]); hi = Vector([max(q[k] for q in pts) for k in range(3)])
    piv = Vector(((lo.x + hi.x) / 2, (lo.y + hi.y) / 2, lo.z))
    s = p.get("scale", 1.0); s = [s, s, s] if not isinstance(s, list) else s
    T = (Matrix.Translation(Vector(p["at"])) @ Matrix.Rotation(math.radians(p.get("rotz", 0)), 4, "Z")
         @ Matrix.Diagonal((s[0], s[1], s[2], 1)) @ Matrix.Translation(-piv))
    cx, cy = QUAD[d]
    for o in src:
        c = o.copy(); c.data = o.data.copy(); sc.collection.objects.link(c); c.matrix_world = T @ o.matrix_world
        uv = c.data.uv_layers.active.data
        us = [l.uv[0] for l in uv] + [l.uv[1] for l in uv]
        if min(us) < -0.01 or max(us) > 1.01:
            print("UV_OUT", p["comp"], o.name, round(min(us), 2), round(max(us), 2))
        for l in uv:
            l.uv = (min(max(l.uv[0], 0.004), 0.996) * 0.5 + cx * 0.5, min(max(l.uv[1], 0.004), 0.996) * 0.5 + cy * 0.5)
        objs.append(c)


def new_mesh(name, verts, faces, uvf):
    me = bpy.data.meshes.new(name); me.from_pydata(verts, [], faces); me.update()
    ul = me.uv_layers.new(name="UVMap")
    for poly in me.polygons:
        for li in poly.loop_indices:
            ul.data[li].uv = uvf(Vector(verts[me.loops[li].vertex_index]), poly)
    o = bpy.data.objects.new(name, me); sc.collection.objects.link(o); objs.append(o)
    return o


# hex slab: top planar-mapped into the paint quadrant (x, y in [-2.6, 2.6] -> left 384 px of the quadrant)
R, H, K = 2.44, 0.05, 384 / 512
hx = [(R * math.cos(math.radians(k * 60)), R * math.sin(math.radians(k * 60))) for k in range(6)]
v = [(x, y, H) for x, y in hx] + [(x * 1.02, y * 1.02, 0) for x, y in hx]
f = [tuple(range(6))] + [(k, k + 6, (k + 1) % 6 + 6, (k + 1) % 6) for k in range(6)]
new_mesh("slab", v, f, lambda q, poly: (0.5 + ((q.x + 2.6) / 5.2 * K) * 0.5, ((q.y + 2.6) / 5.2 * K) * 0.5)
         if poly.index == 0 else (0.5 + 0.02, 0.5 * K + 0.02))

# copper slope on the hall's front face (replaces the blocked door / ramp)
x0, x1, yt, zt, yb = -0.2, 0.75, -0.88, 1.0, -1.72
v = [(x0 + 0.1, yt, zt), (x1 - 0.1, yt, zt), (x0, yb, H), (x1, yb, H), (x0, yt, H), (x1, yt, H)]
f = [(0, 2, 3, 1), (0, 4, 2), (1, 3, 5)]
new_mesh("slope", v, f, lambda q, poly: (0.5 + (K + (1 - K) * (0.15 + 0.7 * (q.x - x0) / (x1 - x0))) * 0.5,
                                         (0.1 + 0.8 * q.z / zt) * 0.5))

# grey trim beams on the slope's two side edges and across its top, in the wall-grey strip of the paint quadrant
def beam(a, b, side, w=0.09, h=0.07):
    a, b, side = Vector(a), Vector(b), Vector(side).normalized()
    up = (b - a).cross(side).normalized()
    if up.z < 0:
        up = -up
    c = [a, a + side * w, b + side * w, b]
    vs = [tuple(p) for p in c] + [tuple(p + up * h) for p in c]
    fs = [(4, 5, 6, 7), (0, 1, 5, 4), (1, 2, 6, 5), (2, 3, 7, 6), (3, 0, 4, 7)]
    L = (b - a).length
    new_mesh("trim", vs, fs, lambda q, poly: (0.5 + (0.02 + 0.7 * min((q - a).dot((b - a).normalized()) / L, 1)) * K * 0.5,
                                              0.5 * (K + 0.02 + 0.2 * (1 - K) * (poly.index % 2))))
beam((x0 + 0.1, yt, zt), (x0, yb, H), (1, 0, 0))
beam((x1 - 0.1, yt, zt), (x1, yb, H), (-1, 0, 0))
beam((x0 + 0.1, yt + 0.02, zt), (x1 - 0.1, yt + 0.02, zt), (0, -1, -1.2))
beam((x0, yb, H), (x1, yb, H), (0, 1, 0), w=0.12, h=0.09)

bpy.ops.object.select_all(action="DESELECT")
for o in objs:
    o.select_set(True)
bpy.context.view_layer.objects.active = objs[0]
bpy.ops.object.join()
obj = bpy.context.view_layer.objects.active; obj.name = "Thorvald_Starport"
bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
bpy.ops.object.mode_set(mode="EDIT"); bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.mesh.normals_make_consistent(inside=False); bpy.ops.object.mode_set(mode="OBJECT")
for o in list(bpy.data.objects):
    if o != obj:
        bpy.data.objects.remove(o)
mat = bpy.data.materials.new("Mat_Terminal"); mat.use_nodes = True
b = mat.node_tree.nodes["Principled BSDF"]; b.inputs["Roughness"].default_value = 0.85
t = mat.node_tree.nodes.new("ShaderNodeTexImage"); t.image = bpy.data.images.load(ATLAS)
t.image.name = "Thorvald_Starport_Albedo"
for stem in ("MetallicGlossAO", "Normal"):           # carried for 10_export_building.py, which rewires all three
    n = mat.node_tree.nodes.new("ShaderNodeTexImage")
    n.image = bpy.data.images.load(ATLAS.replace("Albedo", stem)); n.image.name = "Thorvald_Starport_" + stem
mat.node_tree.links.new(t.outputs["Color"], b.inputs["Base Color"])
obj.data.materials.clear(); obj.data.materials.append(mat)
print("MESH", len(obj.data.vertices), "verts", len(obj.data.polygons), "faces",
      [round(x, 2) for x in obj.dimensions])

sc.render.engine = "CYCLES"; sc.cycles.device = "CPU"; sc.cycles.samples = 32; sc.cycles.use_denoising = False
sc.render.film_transparent = True; sc.view_settings.view_transform = "Standard"
w = bpy.data.worlds.new("W"); sc.world = w; w.use_nodes = True
w.node_tree.nodes["Background"].inputs[0].default_value = (0.6, 0.6, 0.6, 1)
w.node_tree.nodes["Background"].inputs[1].default_value = 0.8
for d in [(0.3, -0.5, 1), (-0.6, 0.5, 0.5)]:
    ld = bpy.data.lights.new("L", "SUN"); ld.energy = 2.6
    lo_ = bpy.data.objects.new("L", ld); sc.collection.objects.link(lo_)
    lo_.rotation_euler = Vector(d).to_track_quat("Z", "Y").to_euler()
cd = bpy.data.cameras.new("C"); cd.type = "ORTHO"; cd.ortho_scale = 6.4
cam = bpy.data.objects.new("C", cd); sc.collection.objects.link(cam); sc.camera = cam
ctr = Vector((0, 0, 0.9))
for tag, d, res in (("front", (-0.7, -0.7, 0.62), 900), ("back", (0.7, 0.7, 0.62), 900), ("side", (0.75, -0.65, 0.62), 900),
                    ("zoom", (-0.7, -0.7, 0.9), 200)):
    d = Vector(d).normalized()
    cam.location = ctr + d * 20; cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()
    sc.render.resolution_x = sc.render.resolution_y = res
    sc.render.filepath = os.path.join(SHOTS, "terminal_%s.png" % tag)
    bpy.ops.render.render(write_still=True)
bpy.ops.file.pack_all()
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "terminal_kitbash.blend"))
print("BUILD_DONE")
