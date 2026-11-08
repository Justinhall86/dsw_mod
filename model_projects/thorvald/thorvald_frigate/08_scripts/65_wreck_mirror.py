"""Step 2: make the levelled wreck whole. Drop loose flakes (small islands), find the real
centreline (best mirror plane y = y0), cut there and mirror one half onto the other.
Builds both choices (keep +Y half / keep -Y half) and renders them side by side.

    blender -b --factory-startup --python 65_wreck_mirror.py -- [keep=+|-]
"""
import importlib, os, sys
import bpy, bmesh
from mathutils import Vector, kdtree

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
B = importlib.import_module("20_build_variant")
bs, pw = B.bs, B.pw
argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
KEEP = [a.split("=")[1] for a in argv if a.startswith("keep=")]
FLAKE = 9.0          # islands whose largest side is below this are crash flakes

bpy.ops.wm.open_mainfile(filepath=os.path.join(PROJ, "03_blender", "wreck_level.blend"))
src = bpy.data.objects["wreck_hull"]

# --- drop flakes -----------------------------------------------------------
bm = bmesh.new(); bm.from_mesh(src.data)
nv = len(bm.verts)
bmesh.ops.remove_doubles(bm, verts=bm.verts[:], dist=0.02)   # game mesh is split per UV island
print("welded", nv - len(bm.verts))
bm.verts.ensure_lookup_table(); bm.verts.index_update()
seen, kill, islands = set(), [], []
for v0 in bm.verts:
    if v0.index in seen:
        continue
    stack, isl = [v0], []
    seen.add(v0.index)
    while stack:
        v = stack.pop(); isl.append(v)
        for e in v.link_edges:
            w = e.other_vert(v)
            if w.index not in seen:
                seen.add(w.index); stack.append(w)
    lo = Vector((min(v.co[i] for v in isl) for i in range(3)))
    hi = Vector((max(v.co[i] for v in isl) for i in range(3)))
    islands.append((max(hi - lo), len(isl)))
    if max(hi - lo) < FLAKE:
        kill += isl
print("islands", len(islands), "flake verts removed", len(kill),
      "biggest", sorted(islands, reverse=True)[:6])
bmesh.ops.delete(bm, geom=list(set(kill)), context="VERTS")
bm.to_mesh(src.data); bm.free()

# --- best mirror plane -----------------------------------------------------
co = [v.co.copy() for v in src.data.vertices]
kd = kdtree.KDTree(len(co))
for i, p in enumerate(co):
    kd.insert(p, i)
kd.balance()


def score(y0):
    ds = sorted(kd.find(Vector((p.x, 2 * y0 - p.y, p.z)))[2] for p in co[::3])
    return sum(ds[:len(ds) // 2]) / (len(ds) // 2)     # median-half: damage on one side is ignored


best = min(((score(y / 10), y / 10) for y in range(-80, 81, 2)))
y0 = min(((score(best[1] + d / 100), best[1] + d / 100) for d in range(-25, 26)))[1]
print("MIRROR plane y0 = %.2f  (score %.3f, at 0: %.3f)" % (y0, score(y0), score(0)))


def mirrored(keep):
    o = src.copy(); o.data = src.data.copy(); o.name = "wreck_keep" + keep
    bpy.context.scene.collection.objects.link(o)
    bm = bmesh.new(); bm.from_mesh(o.data)
    n = Vector((0, 1, 0))
    # clear_outer drops the +normal side: keep '+' -> clear the inner (-Y) side
    r = bmesh.ops.bisect_plane(bm, geom=bm.verts[:] + bm.edges[:] + bm.faces[:], plane_co=(0, y0, 0),
                               plane_no=n, clear_inner=(keep == "+"), clear_outer=(keep == "-"))
    for v in bm.verts:
        v.co.y -= y0                                  # centreline at y = 0
    dup = bmesh.ops.duplicate(bm, geom=bm.verts[:] + bm.edges[:] + bm.faces[:])
    dv = [g for g in dup["geom"] if isinstance(g, bmesh.types.BMVert)]
    for v in dv:
        v.co.y = -v.co.y
    bmesh.ops.reverse_faces(bm, faces=[g for g in dup["geom"] if isinstance(g, bmesh.types.BMFace)])
    seam = [v for v in bm.verts if abs(v.co.y) < 1e-3]
    bmesh.ops.remove_doubles(bm, verts=seam, dist=1e-3)
    bm.to_mesh(o.data); bm.free()
    o.data.update()
    mn, mx = B.bounds([o])
    print("KEEP", keep, "tris", sum(len(p.vertices) - 2 for p in o.data.polygons),
          "dims", tuple(round(v, 1) for v in (mx - mn)))
    return o


outs = [mirrored(k) for k in (KEEP or ["+", "-"])]
src.hide_render = True
out = os.path.join(PROJ, "02_progress_photos", "wreck_mirror"); os.makedirs(out, exist_ok=True)
pw.soften_world(); bs.setup_render(1200, 800)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights()
for o in outs:
    for p in outs:
        p.hide_render = p is not o
    mn, mx = B.bounds([o]); span = max(mx - mn)
    cam = bs.setup_camera(target=Vector(), ortho_scale=span * 1.1, distance=span * 3)
    for name, dv in {"tq": (-0.7, -0.7, 0.5), "tq_rear": (0.7, 0.7, 0.5), "top": (-0.0001, 0, 1),
                     "bottom": (-0.0001, 0, -1)}.items():
        cam.location = Vector(dv).normalized() * span * 3
        cam.rotation_euler = (-cam.location).to_track_quat("-Z", "X" if name in ("top", "bottom") else "Y").to_euler()
        bs.render_to(os.path.join(out, "%s_%s.png" % (o.name, name)), cam)
for o in outs:
    o.hide_render = False
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "wreck_mirror.blend"))
print("MIRROR_OK")
