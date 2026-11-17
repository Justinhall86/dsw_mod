"""House Guard helmet + Karlin antennae on the crown + (optional) Karlin half-mask instead of the chin vent.
env: TAG, MASK (1/0), ANT_X (half spacing m), ANT_Y (fwd offset from crown top, m), ANT_SCALE, ANT_TILT (deg),
     MASK_SCALE, MASK_DY, MASK_DZ, CHIN (drop|keep)"""
import os, sys, math, bmesh, bpy
from mathutils import Vector, Matrix
from mathutils.bvhtree import BVHTree
import os as _os, sys as _sys
_sys.path.insert(0, _os.path.dirname(_os.path.abspath(__file__)))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs
S = P.WORK + "/house_guard/"
D = P.HG_DIR
KB = P.KARLIN_H2F4
E = os.environ.get
TAG = E("TAG", "A1"); MASK = E("MASK", "1") == "1"
AX, AY, AS, AT = float(E("ANT_X", "0.035")), float(E("ANT_Y", "0.0")), float(E("ANT_SCALE", "0.85")), float(E("ANT_TILT", "0"))
MS, MY, MZ = float(E("MASK_SCALE", "1.0")), float(E("MASK_DY", "0")), float(E("MASK_DZ", "0"))
OUT = P.GAL + "/house_guard_study/antenna_breather/renders/" + TAG + "/"
os.makedirs(OUT, exist_ok=True)

bs.reset_scene()
body, rig = bs.import_model(D + "Male01_HouseGuard_TRUE_FBX.fbx")
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
HG_HEAD = rig.matrix_world @ rig.data.bones["B_HeadJ"].matrix_local
wanted = {"Base Color": S + "H5_copper_crown_chin_collar_smooth.png", "Specular IOR Level": S + "HG_Metal_smooth.png",
          "Normal": S + "HG_Normal_smooth.png"}
for mat in body.data.materials:
    if mat and mat.use_nodes:
        for _ in bs.wire_textures(mat, wanted):
            pass
names = {g.index: g.name for g in body.vertex_groups}
dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in body.data.vertices if v.groups}
bm = bmesh.new()
bm.from_mesh(body.data)
bmesh.ops.delete(bm, geom=[f for f in bm.faces if not all(dom.get(v.index) in ("B_HeadJ", "B_Neck01J") for v in f.verts)], context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
mw = body.matrix_world
zs = [(mw @ v.co).z for v in bm.verts]
z0, z1 = min(zs), max(zs)
H = z1 - z0
cy = sum((mw @ v.co).y for v in bm.verts) / len(bm.verts)
bm.faces.ensure_lookup_table()
seen = set()
chin = []
for f0 in bm.faces:
    if f0.index in seen:
        continue
    st = [f0]
    seen.add(f0.index)
    grp = []
    while st:
        f = st.pop()
        grp.append(f)
        for e in f.edges:
            for g in e.link_faces:
                if g.index in seen or g is f or f.normal.angle(g.normal) > math.radians(32):
                    continue
                seen.add(g.index)
                st.append(g)
    cs = [mw @ f.calc_center_median() for f in grp]
    c = sum(cs, Vector()) / len(cs)
    zr = (c.z - z0) / H
    if c.y < cy - 0.01 and abs(c.x) < 0.05 and zr < 0.42:
        chin += grp
print("CHIN faces", len(chin), "helmet z %.3f-%.3f" % (z0, z1))
if MASK and E("CHIN", "drop") == "drop":
    bmesh.ops.delete(bm, geom=list(set(chin)), context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
bm.to_mesh(body.data)
bm.free()
hv = [mw @ v.co for v in body.data.vertices]
bvh = BVHTree.FromPolygons(hv, [tuple(p.vertices) for p in body.data.polygons])

want = ["Kit_antenna_l", "Kit_antenna_r"] + (["Kit_face"] if MASK else [])
with bpy.data.libraries.load(KB, link=False) as (s, d):
    d.objects = want + [n for n in s.objects if n in ("Rig", "Armature")][:1]
krig = next(o for o in d.objects if o.type == "ARMATURE")
K_HEAD = krig.matrix_world @ krig.data.bones["B_HeadJ"].matrix_local
M = HG_HEAD @ K_HEAD.inverted()
parts = {}
for o in d.objects:
    if o.type != "MESH":
        continue
    bpy.context.scene.collection.objects.link(o)
    for m in list(o.modifiers):
        o.modifiers.remove(m)
    o.parent = None
    o.data.transform(M @ o.matrix_world)
    o.matrix_world = Matrix.Identity(4)
    parts[o.name.split(".")[0]] = o
bpy.data.objects.remove(krig, do_unlink=True)

top = max(hv, key=lambda p: p.z - 3 * abs(p.x))
print("CROWN top", tuple(round(x, 3) for x in top), "front y %.3f" % min(p.y for p in hv))
for nm in ("Kit_antenna_l", "Kit_antenna_r"):
    o = parts[nm]
    vs = [v.co.copy() for v in o.data.vertices]
    sgn = 1 if sum(v.x for v in vs) > 0 else -1
    zmin = min(v.z for v in vs)
    bv = [v for v in vs if v.z < zmin + 0.015]
    base = sum(bv, Vector()) / len(bv)
    loc, nrm, idx, dist = bvh.ray_cast(Vector((sgn * AX, top.y + AY, z1 + 0.3)), Vector((0, 0, -1)))
    if loc is None:
        print("NO HIT", nm)
        continue
    R = Matrix.Rotation(math.radians(AT), 4, "X")
    T = Matrix.Translation(loc - Vector((0, 0, 0.006))) @ R @ Matrix.Scale(AS, 4) @ Matrix.Translation(-base)
    o.data.transform(T)
    o.data.update()
    print("ANT", nm, "base", tuple(round(x, 3) for x in base), "-> hit", tuple(round(x, 3) for x in loc))

if MASK:
    f = parts["Kit_face"]
    imgs = [n.image for n in f.active_material.node_tree.nodes if n.type == "TEX_IMAGE" and n.image]
    img = next((i for i in imgs if "lbedo" in (i.name + i.filepath)), imgs[0])
    w, h = img.size
    px = list(img.pixels)

    def col(u, v):
        x = min(w - 1, max(0, int((u % 1) * w)))
        y = min(h - 1, max(0, int((v % 1) * h)))
        i = (y * w + x) * 4
        return px[i], px[i + 1], px[i + 2]
    fb = bmesh.new()
    fb.from_mesh(f.data)
    uv = fb.loops.layers.uv.active
    fz = [v.co.z for v in fb.verts]
    fz0, fz1 = min(fz), max(fz)
    fyy = min(v.co.y for v in fb.verts)
    kill = []
    for fc in fb.faces:
        c = fc.calc_center_median()
        cc = [col(*l[uv].uv) for l in fc.loops]
        r = sum(x[0] for x in cc) / len(cc)
        g = sum(x[1] for x in cc) / len(cc)
        b = sum(x[2] for x in cc) / len(cc)
        mx, mn = max(r, g, b), min(r, g, b)
        sat = (mx - mn) / mx if mx > 0 else 0
        if not (sat < 0.30 and c.y < fyy + 0.07 and (c.z - fz0) / (fz1 - fz0) < 0.62):
            kill.append(fc)
    bmesh.ops.delete(fb, geom=kill, context="FACES")
    bmesh.ops.delete(fb, geom=[v for v in fb.verts if not v.link_faces], context="VERTS")
    fb.to_mesh(f.data)
    fb.free()
    vs = [v.co.copy() for v in f.data.vertices]
    c = sum(vs, Vector()) / max(1, len(vs))
    for v in f.data.vertices:
        v.co = c + (v.co - c) * MS + Vector((0, MY, MZ))
    f.data.update()
    print("MASK faces", len(f.data.polygons), "z %.3f-%.3f, front y %.3f, x %.3f..%.3f" % (
        min(v.co.z for v in f.data.vertices), max(v.co.z for v in f.data.vertices), min(v.co.y for v in f.data.vertices),
        min(v.co.x for v in f.data.vertices), max(v.co.x for v in f.data.vertices)))

bpy.ops.wm.save_as_mainfile(filepath=OUT + TAG + ".blend")
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(500, 500)
VIEWS = {"front": (0, -1, 0.05), "tq_left": (-0.75, -0.65, 0.1), "tq_right": (0.75, -0.65, 0.1), "side_left": (-1, 0, 0.05),
         "side_right": (1, 0, 0.05), "back": (0, 1, 0.05), "back_tq_left": (-0.75, 0.65, 0.1), "back_tq_right": (0.75, 0.65, 0.1),
         "top": (0, -0.05, 1), "below": (0, -0.3, -1), "front_high": (0, -1, 0.7), "front_low": (0, -1, -0.45)}
only = E("VIEWS")
for tg, dd in VIEWS.items():
    if only and tg not in only.split(","):
        continue
    cam = bs.setup_camera(target=Vector((0, cy, (z0 + z1) / 2 + float(E("CAM_DZ", "0.09")))), ortho_scale=float(E("ORTHO", "0.62")),
                          direction=dd, distance=4)
    bs.render_to(OUT + tg + ".png", cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("DONE", TAG)
