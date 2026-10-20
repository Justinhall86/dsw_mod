"""v4 helmet step 2 (Blender, via the bridge): seeded facet fitting of the symmetric helmet sculpt `helm_src`.

Facets designated from the reference picture are given as seeds (view, h, z) in PICTURE coordinates (world metres of the reference
picture: front/back h = x, side h = y). They are mapped to the sculpt frame with PIC2S (the sculpt is ~3 % smaller than the design and
sits ~3 cm further forward), ray-cast onto the sculpt, and used as the first seeds of a variational shape approximation; further seeds
are added automatically until K regions exist. Only the x >= 0 half is fitted (seam vertices are pinned to x = 0); `mirror_full`
then builds the symmetric full mesh.
Result objects: `helm_half` (snapped, labelled half) -> `helm_fit` (mirrored full mesh, face attribute `lab`).
"""
import colorsys
import numpy as np
import bmesh
from mathutils import Vector
from mathutils.bvhtree import BVHTree

PIC2S = dict(zs=0.966, z0p=1.665, z0s=1.655, xs=0.96, dy=-0.032)

# name: (view, h, z) in picture coordinates, right half (x >= 0) / +x side
SEEDS = {
    # --- front view
    "fore_c_hi": ("front", 0.0, 1.990), "fore_c_lo": ("front", 0.0, 1.945),
    "fore_w_hi": ("front", 0.068, 1.984), "fore_w_lo": ("front", 0.076, 1.957),
    "brow_kite": ("front", 0.004, 1.880), "brow_wing_lo": ("front", 0.085, 1.883), "brow_wing_up": ("front", 0.100, 1.918),
    "visor_h": ("front", 0.060, 1.852), "visor_v": ("front", 0.0, 1.775),
    "cheek_top": ("front", 0.065, 1.830), "cheek_f1": ("front", 0.038, 1.745), "cheek_f2": ("front", 0.066, 1.735),
    "cheek_f3": ("front", 0.098, 1.755), "chin": ("front", 0.0, 1.695),
    "side_front_hi": ("front", 0.135, 1.865), "side_front_lo": ("front", 0.135, 1.815),
    # --- back view (rows B/C/D, columns centre / 1 / 2)
    "back_c_hi": ("back", 0.0, 1.965), "back_c_mid": ("back", 0.0, 1.905), "back_c_lo": ("back", 0.0, 1.835),
    "back_1_hi": ("back", 0.08, 1.965), "back_1_mid": ("back", 0.08, 1.905), "back_1_lo": ("back", 0.08, 1.835),
    "back_2_hi": ("back", 0.125, 1.955), "back_2_mid": ("back", 0.135, 1.895), "back_2_lo": ("back", 0.14, 1.835),
}


def pic_to_sculpt(view, h, z):
    zs = PIC2S["z0s"] + (z - PIC2S["z0p"]) * PIC2S["zs"]
    hs = h * PIC2S["xs"] if view in ("front", "back") else h + PIC2S["dy"]
    return hs, zs


def half_mesh(obj):
    me = obj.data
    me.calc_loop_triangles()
    verts = np.array([v.co[:] for v in me.vertices], dtype=np.float64)
    tris = np.array([t.vertices[:] for t in me.loop_triangles], dtype=np.int64)
    keep = np.all(verts[tris][:, :, 0] >= -1e-7, axis=1)
    tris = tris[keep]
    used = np.unique(tris)
    remap = -np.ones(len(verts), dtype=np.int64); remap[used] = np.arange(len(used))
    return verts[used], remap[tris], used


def seed_triangles(verts, tris, seeds):
    bvh = BVHTree.FromPolygons([tuple(v) for v in verts], [tuple(t) for t in tris])
    out = {}
    for name, (view, h, z) in seeds.items():
        hs, zs = pic_to_sculpt(view, h, z)
        if view == "front": o, d = Vector((hs, -1.0, zs)), Vector((0, 1, 0))
        elif view == "back": o, d = Vector((hs, 1.0, zs)), Vector((0, -1, 0))
        else: o, d = Vector((1.0, hs, zs)), Vector((-1, 0, 0))
        hit = bvh.ray_cast(o, d, 3.0)
        if hit[0] is None:
            print("  seed %-14s no hit (%s %.3f %.3f)" % (name, view, hs, zs)); continue
        out[name] = int(hit[2])
    return out


def mirror_full(me_src_half, name="helm_fit"):
    """full symmetric mesh from the labelled half object"""
    old = bpy.data.objects.get(name)
    if old: bpy.data.objects.remove(old, do_unlink=True)
    o = me_src_half.copy(); o.data = me_src_half.data.copy(); o.name = name; o.data.name = name
    bpy.context.collection.objects.link(o)
    return o


def label_materials(n):
    mats = []
    for k in range(n):
        m = bpy.data.materials.get("lab_%d" % k)
        if m is None:
            m = bpy.data.materials.new("lab_%d" % k)
            h = (k * 0.381966) % 1.0
            m.diffuse_color = (*colorsys.hsv_to_rgb(h, 0.55 + 0.35 * ((k * 7) % 3) / 2, 0.55 + 0.4 * ((k * 5) % 4) / 3), 1.0)
        mats.append(m)
    return mats


def show_labels(obj, label):
    me = obj.data; me.materials.clear()
    for m in label_materials(int(label.max()) + 1): me.materials.append(m)
    me.polygons.foreach_set("material_index", label.astype(np.int32)); me.update()


def fit(K=70, iters=14, lam=0.05, max_move=0.02, seeds=SEEDS, source="helm_src", name="helm_half", seed=1):
    src = bpy.data.objects[source]
    verts, tris, used = half_mesh(src)
    st = seed_triangles(verts, tris, seeds)
    names = list(st.keys())
    label, pn, pp = partition(verts, tris, K, iters=iters, seed=seed, init_seeds=[st[n] for n in names])
    new, moved = snap(verts, tris, label, pn, pp, lam=lam, max_move=max_move, seam_x=0.0)
    print("half mesh: %d verts, %d tris | designated seeds %d, regions %d | snapped: mean move %.4f max %.4f" % (
        len(verts), len(tris), len(names), K, moved.mean(), moved.max()))
    old = bpy.data.objects.get(name)
    if old: bpy.data.objects.remove(old, do_unlink=True)
    me = bpy.data.meshes.new(name)
    me.from_pydata([tuple(v) for v in new], [], [tuple(t) for t in tris]); me.update()
    o = bpy.data.objects.new(name, me); bpy.context.collection.objects.link(o)
    for p in me.polygons: p.use_smooth = False
    show_labels(o, label)
    areas = np.bincount(label, minlength=K)
    return o, dict(verts=verts, tris=tris, label=label, pn=pn, pp=pp, new=new, seeds=st, names=names, counts=areas)
