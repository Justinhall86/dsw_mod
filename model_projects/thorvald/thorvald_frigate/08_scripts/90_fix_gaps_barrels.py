"""Close the holes in the locked V6 cruiser and give the four cannons polished barrels.

    blender -b 03_blender/cruiser_v6.blend --python 90_fix_gaps_barrels.py -- 03_blender/cruiser_v6_fixed.blend

1. hull: cap every closed boundary loop (23 on V6: deck cut-outs, flank slits, keel slot, engine rims);
   caps are triangulated and UV'd to the dark wall swatch ("char"), so cut-outs read as recessed hatches.
2. turrets: weld by distance, drop the old 8-sided stub barrel, cap the remaining open loops (swatch "char"),
   then lathe a new 12-sided barrel (smooth shaded): copper breech collar, polished steel tapered tube,
   copper band, dark muzzle brake with a recessed bore ("steel"/"bore" swatches from 76_paint_variants.py).
3. writes 01_input/cruiser_v6_points.json: the 4 new muzzle tips + the 2 engine centres (V6 frame), for 80.
"""
import json, math, os, sys
import bmesh, bpy
import numpy as np
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__)); PROJ = os.path.dirname(HERE)
OUT = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
SW = json.load(open(os.path.join(PROJ, "04_textures", "cruiser_swatches.json")))
sys.path.insert(0, HERE)
import importlib.util
spec = importlib.util.spec_from_file_location("lock", os.path.join(HERE, "88_lock_v6.py"))
SEG = 12


def set_uv(bm, faces, key):
    uvl = bm.loops.layers.uv.active or bm.loops.layers.uv.new("UVMap")
    for f in faces:
        for l in f.loops:
            l[uvl].uv = SW[key]


def cap_loops(bm, key):
    before = set(bm.faces)
    bmesh.ops.holes_fill(bm, edges=[e for e in bm.edges if e.is_boundary], sides=0)
    new = [f for f in bm.faces if f not in before]
    if new:
        res = bmesh.ops.triangulate(bm, faces=new, quad_method="BEAUTY", ngon_method="BEAUTY")
        new = res["faces"]
        set_uv(bm, new, key)
        for f in new:
            f.smooth = False
        orient_outward(bm, new)
    return new


def hits(tree, o, d, limit=400.0):
    n, o = 0, o.copy()
    for _ in range(50):
        loc, _, _, dist = tree.ray_cast(o, d, limit)
        if loc is None:
            return n
        n += 1; o = loc + d * 1e-3
    return n


def orient_outward(bm, faces):
    """Flip each connected cap patch so it faces the side its rays escape through (fewer surfaces in the way)."""
    from mathutils.bvhtree import BVHTree
    bm.normal_update()
    tree = BVHTree.FromBMesh(bm)
    left, flips = set(faces), 0
    while left:
        seed = left.pop(); grp = [seed]; stack = [seed]
        while stack:
            f = stack.pop()
            for e in f.edges:
                for g in e.link_faces:
                    if g in left:
                        left.discard(g); grp.append(g); stack.append(g)
        score = 0
        for f in grp:
            c, nrm = f.calc_center_median(), f.normal
            if nrm.length < 1e-6:
                continue
            score += hits(tree, c + nrm * 1e-3, nrm) - hits(tree, c - nrm * 1e-3, -nrm)
        if score > 0:                          # more surfaces in front than behind: it faces inward
            bmesh.ops.reverse_faces(bm, faces=grp); flips += len(grp)
    print("  oriented caps: flipped %d of %d" % (flips, len(faces)))


# ---- 1. hull --------------------------------------------------------------------------------------
hull = bpy.data.objects["thorvald_cruiser"]
bm = bmesh.new(); bm.from_mesh(hull.data)
b0 = sum(1 for e in bm.edges if e.is_boundary)
caps = cap_loops(bm, "char")             # holes_fill winds caps to match their neighbours; no global recalc
b1 = sum(1 for e in bm.edges if e.is_boundary)
bm.to_mesh(hull.data); bm.free(); hull.data.update()
print("HULL boundary edges %d -> %d, %d cap triangles" % (b0, b1, len(caps)))

# ---- 2. turrets + barrels -------------------------------------------------------------------------
# radius profile along the barrel, distances from the mantlet front face (positive = towards the bow, -X)
PROFILE = [  # (dist, radius, swatch of the band that ENDS here)
    (-0.6, 1.30, None), (1.3, 1.30, "copper"),        # breech collar (sunk 0.6 into the mantlet)
    (1.3, 0.95, "copper"), (1.6, 0.95, "steel"),       # step down
    (6.6, 0.80, "steel"),                              # tapered polished tube
    (6.6, 0.98, "steel"), (7.4, 0.98, "copper"),       # copper band
    (7.4, 0.80, "copper"), (7.8, 0.80, "steel"),
    (7.8, 1.12, "steel"), (9.4, 1.12, "bore"),         # muzzle brake
]
BORE_R, BORE_D = 0.55, 0.9
muzzles = {}
for t in sorted([o for o in bpy.data.objects if o.name.startswith("turret_")], key=lambda o: o.name):
    bm = bmesh.new(); bm.from_mesh(t.data)
    bmesh.ops.remove_doubles(bm, verts=bm.verts, dist=0.02)
    xs = np.array([v.co.x for v in bm.verts]); x0 = xs.min()
    old = [v for v in bm.verts if v.co.x < x0 + 6.6]                 # the stub barrel (tip .. -2.28)
    axis_y = float(np.mean([v.co.y for v in old])); axis_z = float(np.mean([v.co.z for v in old]))
    bmesh.ops.delete(bm, geom=old, context="VERTS")
    front = x0 + 5.22                                                 # mantlet front face (x = -3.52 on turret_14)
    cap_loops(bm, "char")
    # lathe: one ring of SEG verts per profile point; each band gets its own verts so steps stay crisp
    uvl = bm.loops.layers.uv.active

    def ring(d, r):
        return [bm.verts.new((front - d, axis_y + r * math.cos(2 * math.pi * k / SEG),
                              axis_z + r * math.sin(2 * math.pi * k / SEG))) for k in range(SEG)]

    def band(ra, rb, key, smooth):
        fs = []
        for k in range(SEG):
            k2 = (k + 1) % SEG
            fs.append(bm.faces.new((ra[k], ra[k2], rb[k2], rb[k])))
        for f in fs:
            f.smooth = smooth
        set_uv(bm, fs, key)
        return fs

    lathe = []
    prev = ring(*PROFILE[0][:2])
    for (da, ra_, _), (db, rb_, key) in zip(PROFILE[:-1], PROFILE[1:]):
        cur = ring(db, rb_)
        lathe += band(prev, cur, key, smooth=abs(da - db) > 1e-6)   # flat = annular step faces
        prev = cur
    tip = PROFILE[-1][0]
    inner = ring(tip, BORE_R); lathe += band(prev, inner, "bore", False)      # muzzle face
    deep = ring(tip - BORE_D, BORE_R); lathe += band(inner, deep, "bore", True)  # bore wall
    f = bm.faces.new(deep[::-1]); f.smooth = False; set_uv(bm, [f], "bore"); lathe.append(f)
    bmesh.ops.recalc_face_normals(bm, faces=lathe)
    for e in {e for f in lathe for e in f.edges}:                    # crisp steps: flat|smooth borders sharp
        if len({lf.smooth for lf in e.link_faces}) > 1:
            e.smooth = False
    bm.to_mesh(t.data); bm.free(); t.data.update()
    muzzles[t.name] = [round(front - tip, 3), round(axis_y, 3), round(axis_z, 3)]
    print("TURRET", t.name, "barrel axis y %.2f z %.2f, tip x %.2f" % (axis_y, axis_z, front - tip))

# ---- 3. points for the export ---------------------------------------------------------------------
lock = importlib.util.module_from_spec(spec)
src = open(os.path.join(HERE, "88_lock_v6.py"), encoding="utf-8").read()
warp_src = src[src.index("def warp"):src.index("meshes = ")]
ns = {"np": np}; exec("Z0, ZH, XH, YH, ZS = -17.5, 35.0, 83.0, 48.9, 1.39\n" + warp_src, ns)
eng = ns["warp"](np.array([[80.2, 15.3, 0.6], [80.2, -15.3, 0.6]])).round(3).tolist()
names = {"turret_14_L": "MuzzleA", "turret_14_R": "MuzzleB", "turret_40_L": "MuzzleC", "turret_40_R": "MuzzleD"}
pts = {"note": "V6 frame (cruiser_v6_fixed.blend). Muzzles = new barrel tips; engines = 74/83 engine centres warped by 88.",
       "muzzles": {names[k]: {"turret": k, "mesh": v, "fire_dir_mesh": [-1, 0, 0]} for k, v in muzzles.items()},
       "engines": eng}
json.dump(pts, open(os.path.join(PROJ, "01_input", "cruiser_v6_points.json"), "w"), indent=1)
print("ENGINES", eng)
bpy.ops.wm.save_as_mainfile(filepath=OUT)
print("FIXED", OUT)
