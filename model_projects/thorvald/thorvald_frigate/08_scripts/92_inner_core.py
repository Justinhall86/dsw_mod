"""Dark inner core: a closed, decimated heightfield volume just inside the hull skin, so openings the wreck mesh
has no faces for (missing walls, slots) read as dark recesses instead of see-through gaps in game.

    blender -b 03_blender/cruiser_v6_fixed.blend --python 92_inner_core.py -- <out.blend> [cell=2.5] [margin=1.6] [faces=700]
"""
import json, os, sys
import bmesh, bpy
import numpy as np
from mathutils import Vector
from mathutils.bvhtree import BVHTree

HERE = os.path.dirname(os.path.abspath(__file__)); PROJ = os.path.dirname(HERE)
argv = sys.argv[sys.argv.index("--") + 1:]
OUT = os.path.abspath(argv[0])
CELL = float(argv[1]) if len(argv) > 1 else 2.5
MARGIN = float(argv[2]) if len(argv) > 2 else 1.6
FACES = int(argv[3]) if len(argv) > 3 else 700
SW = json.load(open(os.path.join(PROJ, "04_textures", "cruiser_swatches.json")))
hull = bpy.data.objects["thorvald_cruiser"]
tree = BVHTree.FromObject(hull, bpy.context.evaluated_depsgraph_get())
co = np.array([tuple(v.co) for v in hull.data.vertices]); mn, mx = co.min(0), co.max(0)
xs = np.arange(mn[0] + CELL / 2, mx[0], CELL); ys = np.arange(mn[1] + CELL / 2, mx[1], CELL)
top = np.full((len(xs), len(ys)), np.nan); bot = np.full_like(top, np.nan)
for i, x in enumerate(xs):
    for j, y in enumerate(ys):
        a = tree.ray_cast(Vector((x, y, mx[2] + 50)), Vector((0, 0, -1)), 1000)[0]
        b = tree.ray_cast(Vector((x, y, mn[2] - 50)), Vector((0, 0, 1)), 1000)[0]
        if a is not None and b is not None and a.z - b.z > 2 * MARGIN + 0.5:
            top[i, j], bot[i, j] = a.z, b.z
ok = ~np.isnan(top)
# erode: a cell is kept only if all 8 neighbours are hull too; heights = min top / max bottom of the neighbourhood
pad = lambda a, v: np.pad(a, 1, constant_values=v)
T, Bt, K = pad(np.where(ok, top, np.inf), np.inf), pad(np.where(ok, bot, -np.inf), -np.inf), pad(ok, False)
keep = np.ones_like(ok); tmin = np.full(top.shape, np.inf); bmax = np.full(top.shape, -np.inf)
for di in (-1, 0, 1):
    for dj in (-1, 0, 1):
        sl = (slice(1 + di, 1 + di + ok.shape[0]), slice(1 + dj, 1 + dj + ok.shape[1]))
        keep &= K[sl]; tmin = np.minimum(tmin, T[sl]); bmax = np.maximum(bmax, Bt[sl])
tz, bz = tmin - MARGIN, bmax + MARGIN
keep &= tz > bz + 0.3
bm = bmesh.new(); vt, vb = {}, {}
def vtx(d, z, i, j):
    if (i, j) not in d:
        d[(i, j)] = bm.verts.new((xs[0] - CELL / 2 + i * CELL, ys[0] - CELL / 2 + j * CELL, z))
    return d[(i, j)]
# per-corner heights = min/max over the cells touching that corner (keeps the core inside)
ni, nj = keep.shape
for i in range(ni):
    for j in range(nj):
        if not keep[i, j]:
            continue
        cs = [(i, j), (i + 1, j), (i + 1, j + 1), (i, j + 1)]
        def ch(ci, cj, arr, fn):
            vals = [arr[a, b] for a in (ci - 1, ci) for b in (cj - 1, cj) if 0 <= a < ni and 0 <= b < nj and keep[a, b]]
            return fn(vals)
        t = [vtx(vt, ch(a, b, tz, min), a, b) for a, b in cs]
        b_ = [vtx(vb, ch(a, b, bz, max), a, b) for a, b in cs]
        bm.faces.new(t); bm.faces.new(b_[::-1])
        for k, (di, dj) in enumerate(((0, -1), (1, 0), (0, 1), (-1, 0))):     # walls on the core outline
            a, b = i + di, j + dj
            if not (0 <= a < ni and 0 <= b < nj and keep[a, b]):
                k2 = (k + 1) % 4
                bm.faces.new((t[k2], t[k], b_[k], b_[k2]))
bmesh.ops.remove_doubles(bm, verts=bm.verts, dist=1e-4)
bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
me = bpy.data.meshes.new("thorvald_core"); bm.to_mesh(me); bm.free()
core = bpy.data.objects.new("thorvald_core", me); bpy.context.scene.collection.objects.link(core)
n0 = len(me.polygons)
bpy.context.view_layer.objects.active = core
dec = core.modifiers.new("dec", "DECIMATE"); dec.decimate_type = "DISSOLVE"; dec.angle_limit = 0.06
bpy.ops.object.modifier_apply(modifier="dec")
tri = core.modifiers.new("tri", "TRIANGULATE"); bpy.ops.object.modifier_apply(modifier="tri")
if len(me.polygons) > FACES:
    dec = core.modifiers.new("dec2", "DECIMATE"); dec.ratio = FACES / len(me.polygons)
    bpy.ops.object.modifier_apply(modifier="dec2")
me = core.data
uv = me.uv_layers.new(name="UVMap")
for l in uv.data:
    l.uv = SW["bore"]
me.materials.append(hull.data.materials[0])
for p in me.polygons:
    p.use_smooth = False
c = np.array([tuple(v.co) for v in me.vertices])
print("CORE cells %d, faces %d -> %d, bounds" % (int(keep.sum()), n0, len(me.polygons)), c.min(0).round(1), c.max(0).round(1))
bpy.ops.wm.save_as_mainfile(filepath=OUT)
print("CORE_OK", OUT)
