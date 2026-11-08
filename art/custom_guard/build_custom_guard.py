"""Procedurally build the Custom Guard unit model from the reference image.

Builds a rigged, low-poly armoured soldier (kettle helm, respirator, layered
pauldrons, cape) in the teal / crimson / white scheme of
`reference.png`, then:

  * bakes an albedo texture and a faction colour mask (R = primary/teal,
    G = secondary/crimson)
  * exports FBX + GLB with a single textured material
  * saves an editable .blend (one material per colour, easy to recolour)
  * renders preview images (front, three-quarter, back, posed skin test)

Run with Blender's Python (bpy 4.2+ / 5.x):
    blender -b -P build_custom_guard.py          # or
    python build_custom_guard.py                 # with `pip install bpy`

Units are metres, Z up, the model faces -Y (Blender "front").
"""

import math
import os
import sys

import bpy  # must be imported before bmesh/mathutils
import bmesh
from mathutils import Matrix, Vector

OUT_DIR = os.path.dirname(os.path.abspath(__file__))
NAME = "Male01_CustomGuard"
TEX_SIZE = 2048
RENDER = "--no-render" not in sys.argv
QUICK = "--quick" in sys.argv  # front + three-quarter only, fewer samples

TAU = 2 * math.pi
rad = math.radians


# ── Materials ───────────────────────────────────────────────────────────
# Colours sampled from the reference render, lifted slightly to account for
# the reference's viewport shading. (name, rgb hex, metallic, roughness)
MATERIALS = [
    ("Teal",      "#3E6466", 0.35, 0.45),
    ("Crimson",   "#6A1A28", 0.20, 0.50),
    ("White",     "#D0CCC6", 0.05, 0.45),
    ("Gunmetal",  "#2F2B30", 0.70, 0.40),
    ("Leather",   "#1D1C1E", 0.00, 0.60),
    ("Cape",      "#45101A", 0.00, 0.85),
    ("MaskMetal", "#26262A", 0.65, 0.35),
    ("Lens",      "#0A0A0C", 0.30, 0.10),
    ("Silver",    "#A8A8AA", 1.00, 0.30),
    ("Undersuit", "#262A2D", 0.00, 0.70),
    ("BeltRed",   "#4A1820", 0.10, 0.60),
    ("DarkTeal",  "#26393C", 0.40, 0.45),
]
M = {name: i for i, (name, *_rest) in enumerate(MATERIALS)}

# Faction mask channels: primary (R) follows the teal armour, secondary (G)
# follows the crimson trim and cape.
MASK_PRIMARY = {"Teal", "DarkTeal"}
MASK_SECONDARY = {"Crimson", "Cape", "BeltRed"}


def hex_rgb(h):
    h = h.lstrip("#")
    srgb = [int(h[i:i + 2], 16) / 255 for i in (0, 2, 4)]
    return [c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4 for c in srgb]


# ── Skeleton ────────────────────────────────────────────────────────────
# Joint positions measured off the reference (A-pose). name: (head, tail, parent)
def _bones():
    b = {
        "Hips":  ((0, 0, 1.01), (0, 0, 1.12), None),
        "Spine": ((0, 0, 1.12), (0, 0, 1.30), "Hips"),
        "Chest": ((0, 0, 1.30), (0, 0, 1.52), "Spine"),
        "Neck":  ((0, 0, 1.52), (0, 0, 1.63), "Chest"),
        "Head":  ((0, 0, 1.63), (0, 0, 1.90), "Neck"),
        "Cape.1": ((0, 0.17, 1.52), (0, 0.21, 0.95), "Chest"),
        "Cape.2": ((0, 0.21, 0.95), (0, 0.30, 0.30), "Cape.1"),
    }
    for s, sfx in ((1, ".L"), (-1, ".R")):
        b["Clavicle" + sfx] = ((s * 0.02, 0, 1.52), (s * 0.175, 0, 1.515), "Chest")
        b["UpperArm" + sfx] = ((s * 0.175, 0, 1.515), (s * 0.344, 0, 1.30), "Clavicle" + sfx)
        b["LowerArm" + sfx] = ((s * 0.344, 0, 1.30), (s * 0.49, 0, 1.11), "UpperArm" + sfx)
        b["Hand" + sfx] = ((s * 0.49, 0, 1.11), (s * 0.583, 0, 0.975), "LowerArm" + sfx)
        b["UpperLeg" + sfx] = ((s * 0.099, 0, 1.01), (s * 0.136, 0, 0.597), "Hips")
        b["LowerLeg" + sfx] = ((s * 0.136, 0, 0.597), (s * 0.154, 0, 0.218), "UpperLeg" + sfx)
        b["Foot" + sfx] = ((s * 0.154, 0, 0.218), (s * 0.165, -0.12, 0.04), "LowerLeg" + sfx)
    return {k: (Vector(h), Vector(t), p) for k, (h, t, p) in b.items()}


BONES = _bones()


def seg_dist(p, a, b):
    ab = b - a
    t = max(0.0, min(1.0, (p - a).dot(ab) / ab.length_squared))
    return (a + ab * t - p).length


# ── Geometry helpers ────────────────────────────────────────────────────
PARTS = []  # (name, bmesh, material(int | fn(center, normal)), weights)


def add_part(name, bm, mat, weights, solidify=0.0):
    if solidify:
        res = bmesh.ops.solidify(bm, geom=bm.faces[:], thickness=solidify)
        del res
    bmesh.ops.remove_doubles(bm, verts=bm.verts[:], dist=1e-5)
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
    PARTS.append((name, bm, mat, weights))


def frame(t, hint):
    e1 = Vector(hint).cross(t)
    if e1.length < 1e-6:
        e1 = Vector((1, 0, 0)).cross(t)
    e1.normalize()
    return e1, t.cross(e1)


def tube(pts, radii, segs=16, hint=(0, -1, 0), a0=0.0, a1=TAU,
         loop=False, cap=True):
    """Sweep an ellipse along a polyline.

    radii[i] is r or (r1, r2): r1 along e1 = hint x tangent, r2 along
    e2 = tangent x e1. With the default hint on a vertical path, angle 90deg
    points to the front (-Y). a0/a1 limit the sweep to an arc (open shell).
    hint may be a callable(i, point) for per-station hints.
    """
    pts = [Vector(p) for p in pts]
    n = len(pts)
    full = abs((a1 - a0) - TAU) < 1e-6
    ring = segs if full else segs + 1
    bm = bmesh.new()
    rings = []
    for i, c in enumerate(pts):
        if loop:
            t = pts[(i + 1) % n] - pts[i - 1]
        elif i == 0:
            t = pts[1] - pts[0]
        elif i == n - 1:
            t = pts[-1] - pts[-2]
        else:
            t = pts[i + 1] - pts[i - 1]
        t.normalize()
        h = hint(i, c) if callable(hint) else hint
        e1, e2 = frame(t, h)
        r = radii[i]
        rx, ry = r if isinstance(r, (tuple, list)) else (r, r)
        rings.append([bm.verts.new(c + e1 * (rx * math.cos(a0 + (a1 - a0) * j / segs))
                                   + e2 * (ry * math.sin(a0 + (a1 - a0) * j / segs)))
                      for j in range(ring)])
    for i in range(n if loop else n - 1):
        r0, r1 = rings[i], rings[(i + 1) % n]
        for j in range(segs):
            j2 = (j + 1) % ring
            try:
                bm.faces.new((r0[j], r0[j2], r1[j2], r1[j]))
            except ValueError:
                pass
    if full and cap and not loop:
        for r in (rings[0], rings[-1]):
            if (r[0].co - r[ring // 2].co).length < 1e-6:
                continue  # pole, nothing to cap
            try:
                bm.faces.new(r)
            except ValueError:
                pass
    return bm


def lathe(profile, center=(0, 0), scale=(1, 1), segs=24, a0=0.0, a1=TAU):
    """Revolve (r, z) profile points around a vertical axis."""
    cx, cy = center
    pts = [(cx, cy, z) for _r, z in profile]
    radii = [(r * scale[0], r * scale[1]) for r, _z in profile]
    return tube(pts, radii, segs=segs, a0=a0, a1=a1, cap=True)


def box(center, size, axes=None, bevel=0.0, segs=2):
    bm = bmesh.new()
    bmesh.ops.create_cube(bm, size=1.0)
    bmesh.ops.scale(bm, vec=Vector(size), verts=bm.verts)
    if bevel:
        bmesh.ops.bevel(bm, geom=bm.edges[:] + bm.verts[:], offset=bevel,
                        segments=segs, profile=0.5, affect='EDGES')
    m = Matrix.Identity(3)
    if axes is not None:
        m = Matrix((axes[0], axes[1], axes[2])).transposed()
    bmesh.ops.transform(bm, matrix=Matrix.Translation(center) @ m.to_4x4(), verts=bm.verts)
    return bm


def ellipsoid(center, radii, segs=16, rings=10):
    bm = bmesh.new()
    bmesh.ops.create_uvsphere(bm, u_segments=segs, v_segments=rings, radius=1.0)
    bmesh.ops.scale(bm, vec=Vector(radii), verts=bm.verts)
    bmesh.ops.translate(bm, vec=Vector(center), verts=bm.verts)
    return bm


def ellipse_path(z, rx, ry, a0, a1, n, cx=0.0, cy=0.0):
    """Horizontal ellipse points; a=90deg is front (-Y), a=0 is +X."""
    return [(cx + rx * math.cos(a0 + (a1 - a0) * i / (n - 1)),
             cy - ry * math.sin(a0 + (a1 - a0) * i / (n - 1)), z) for i in range(n)]


def lerp_table(table, z):
    """Interpolate (z, *values) rows sorted by z."""
    if z <= table[0][0]:
        return table[0][1:]
    for a, b in zip(table, table[1:]):
        if a[0] <= z <= b[0]:
            f = (z - a[0]) / (b[0] - a[0])
            return tuple(x + (y - x) * f for x, y in zip(a[1:], b[1:]))
    return table[-1][1:]


def fixed(**w):
    return {"fixed": {k.replace("_L", ".L").replace("_R", ".R"): v for k, v in w.items()}}


def auto(*bones):
    return {"auto": list(bones)}


# ── Head: helmet, mask, collar ──────────────────────────────────────────
HELM_DROP = 0.025
HELM = [(z - HELM_DROP, r) for z, r in [  # (z, r) outer dome profile, top to brim
    (1.955, 0.0), (1.950, 0.05), (1.930, 0.095), (1.890, 0.123), (1.830, 0.137),
    (1.780, 0.140), (1.755, 0.145), (1.730, 0.160), (1.712, 0.172), (1.703, 0.174),
    (1.698, 0.168), (1.708, 0.150), (1.716, 0.128), (1.716, 0.0),
]]
HELM_SY = 1.08


def helm_r(z):
    dome = sorted(HELM[:10])
    return lerp_table(dome, z)[0]


def build_head():
    add_part("Helmet", lathe([(r, z) for z, r in HELM], scale=(1, HELM_SY), segs=32),
             M["Gunmetal"], fixed(Head=1))

    def on_dome(a, z, out=0.003):
        r = helm_r(z) + out
        return (r * math.cos(a), -r * HELM_SY * math.sin(a), z)

    dome_c = Vector((0, 0, 1.80 - HELM_DROP))
    normal_hint = lambda i, p: (Vector(p) - dome_c).normalized()

    # Crimson stripe over the crown (front to back) and cross bar on the brow.
    zs = [1.945 - HELM_DROP - k * 0.015 for k in range(10)]
    for side in (math.pi / 2, -math.pi / 2):
        pts = [on_dome(side, z) for z in zs]
        add_part("HelmStripe", tube(pts, [(0.013, 0.004)] * len(pts), segs=8, hint=normal_hint),
                 M["Crimson"], fixed(Head=1))
    bar = [on_dome(a, 1.86 - HELM_DROP) for a in [math.pi / 2 + rad(d) for d in range(-22, 23, 4)]]
    add_part("HelmCross", tube(bar, [(0.004, 0.011)] * len(bar), segs=8, hint=(0, 0, 1)),
             M["Crimson"], fixed(Head=1))
    for dz in (0.0, 0.03):
        pip = [on_dome(math.pi / 2 + rad(d), 1.885 - HELM_DROP + dz) for d in range(-10, 11, 4)]
        add_part("HelmCross", tube(pip, [(0.004, 0.007)] * len(pip), segs=8, hint=(0, 0, 1)),
                 M["Crimson"], fixed(Head=1))

    # Visor slit with a white frame, and the white brim lip.
    arc = [math.pi / 2 + rad(d) for d in range(-56, 57, 8)]
    slit = [on_dome(a, 1.782 - HELM_DROP, 0.002) for a in arc]
    add_part("Visor", tube(slit, [(0.006, 0.012)] * len(slit), segs=8, hint=(0, 0, 1)),
             M["Lens"], fixed(Head=1))
    for z in (1.800, 1.764):
        trim = [on_dome(a, z - HELM_DROP, 0.004) for a in arc]
        add_part("VisorTrim", tube(trim, [(0.004, 0.0035)] * len(trim), segs=6, hint=(0, 0, 1)),
                 M["White"], fixed(Head=1))
    lip = ellipse_path(1.703 - HELM_DROP, 0.176, 0.176 * HELM_SY, 0, TAU, 40)[:-1]
    add_part("BrimLip", tube(lip, [(0.006, 0.006)] * len(lip), segs=6, hint=(0, 0, 1), loop=True),
             M["White"], fixed(Head=1))
    band = ellipse_path(1.742 - HELM_DROP, 0.150, 0.150 * HELM_SY, 0, TAU, 40)[:-1]
    add_part("HelmBand", tube(band, [(0.005, 0.009)] * len(band), segs=6, hint=(0, 0, 1), loop=True),
             M["Crimson"], fixed(Head=1))

    # Hooded head and respirator.
    add_part("HeadBase", ellipsoid((0, 0.005, 1.66), (0.098, 0.10, 0.11)), M["Undersuit"], fixed(Head=1))
    add_part("MaskPlate", ellipsoid((0, -0.035, 1.64), (0.096, 0.082, 0.075)), M["MaskMetal"], fixed(Head=1))
    add_part("MaskSnout", tube([(0, -0.082, 1.645), (0, -0.114, 1.617), (0, -0.124, 1.607)],
                               [(0.045, 0.03), (0.034, 0.024), (0.0, 0.0)], segs=12, hint=(1, 0, 0)),
             M["MaskMetal"], fixed(Head=1))
    add_part("MaskRidge", box((0, -0.102, 1.675), (0.016, 0.03, 0.06), bevel=0.005),
             M["MaskMetal"], fixed(Head=1))
    for s in (1, -1):
        add_part("Lens", ellipsoid((s * 0.04, -0.093, 1.672), (0.027, 0.012, 0.017)),
                 M["Lens"], fixed(Head=1))
        a, b = Vector((s * 0.065, -0.07, 1.615)), Vector((s * 0.1, -0.095, 1.59))
        add_part("Filter", tube([a, b], [0.026, 0.026], segs=14), M["MaskMetal"], fixed(Head=1))
        add_part("FilterRing", tube([b, b + (b - a).normalized() * 0.008], [0.029, 0.029], segs=14),
                 M["Silver"], fixed(Head=1))

    # Neck and the high crimson collar.
    add_part("Neck", tube([(0, 0, 1.54), (0, 0, 1.70)], [(0.062, 0.06)] * 2, segs=16),
             M["Undersuit"], auto("Neck", "Head", "Chest"))
    collar = lathe([(0.13, 1.53), (0.122, 1.59), (0.112, 1.655)], center=(0, 0.005),
                   scale=(1, 0.92), segs=24, a0=rad(-60), a1=rad(240))
    add_part("Collar", collar, M["Crimson"], auto("Chest", "Neck"), solidify=0.01)


# ── Torso, belt, cape ───────────────────────────────────────────────────
TORSO = [  # (z, rx, ry)
    (0.935, 0.0, 0.0), (0.94, 0.06, 0.06), (0.97, 0.13, 0.10), (1.02, 0.165, 0.115),
    (1.10, 0.17, 0.12), (1.20, 0.165, 0.115), (1.28, 0.172, 0.122), (1.36, 0.188, 0.132),
    (1.44, 0.198, 0.138), (1.51, 0.195, 0.132), (1.56, 0.165, 0.11), (1.59, 0.10, 0.085),
    (1.60, 0.0, 0.0),
]


def torso_point(x, z, out=0.004):
    rx, ry = lerp_table(TORSO, z)
    x = max(-rx * 0.98, min(rx * 0.98, x))
    y = -ry * math.sqrt(max(0.0, 1 - (x / rx) ** 2))
    n = Vector((x / rx ** 2, y / ry ** 2, 0)).normalized()
    return Vector((x, y, z)) + n * out, n


def offset_path(path2d, d):
    """Offset an (x, z) polyline sideways by d."""
    out = []
    for i, p in enumerate(path2d):
        a = Vector(path2d[max(i - 1, 0)])
        b = Vector(path2d[min(i + 1, len(path2d) - 1)])
        t = (b - a).normalized()
        nrm = Vector((t.y, -t.x))
        out.append((p[0] + nrm.x * d, p[1] + nrm.y * d))
    return out


def surface_strip(name, path2d, width, mat, weights, out=0.006):
    pts, hints = [], []
    for x, z in path2d:
        p, n = torso_point(x, z, out)
        pts.append(p)
        hints.append(n)
    add_part(name, tube(pts, [(width / 2, 0.005)] * len(pts), segs=8,
                        hint=lambda i, _p: hints[i]), mat, weights)


def build_torso():
    def torso_mat(c, _n):
        if 1.175 < c.z < 1.335 and c.y < 0.03:
            return M["Crimson"]
        return M["Teal"]

    pts = [(0, 0, z) for z, *_ in TORSO]
    radii = [(rx, ry) for _z, rx, ry in TORSO]
    add_part("Torso", tube(pts, radii, segs=28), torso_mat, auto("Hips", "Spine", "Chest"))

    # Segmented abdomen plates.
    for z in (1.235, 1.29):
        rx, ry = lerp_table(TORSO, z)
        p = ellipse_path(z, rx + 0.006, ry + 0.006, rad(15), rad(165), 14)
        add_part("AbsBand", tube(p, [(0.007, 0.012)] * len(p), segs=8, hint=(0, 0, 1)),
                 M["Crimson"], auto("Spine", "Chest"))

    # White / crimson / white chevrons running from the collar to the ribs.
    for s in (1, -1):
        base = [(s * 0.035, 1.585), (s * 0.045, 1.49), (s * 0.065, 1.445),
                (s * 0.125, 1.405), (s * 0.135, 1.33)]
        for d, mat in ((0.0, "White"), (0.023, "Crimson"), (0.046, "White"),
                       (0.074, "White"), (0.097, "Crimson"), (0.12, "White")):
            path = offset_path(base, -s * d)
            surface_strip("ChestTrim", path, 0.019 if mat == "White" else 0.022, M[mat],
                          auto("Spine", "Chest"), out=0.006 if mat == "White" else 0.004)

    # Belt, buckle, pouches, sash.
    belt = ellipse_path(1.165, 0.178, 0.126, 0, TAU, 40)[:-1]
    add_part("Belt", tube(belt, [(0.016, 0.042)] * len(belt), segs=8, hint=(0, 0, 1), loop=True),
             M["BeltRed"], fixed(Hips=1))
    add_part("Buckle", box((0, -0.146, 1.165), (0.07, 0.018, 0.058), bevel=0.006),
             M["Gunmetal"], fixed(Hips=1))
    for x in (-0.13, -0.075, 0.075):
        rx, ry = 0.178, 0.126
        y = -ry * math.sqrt(1 - (x / rx) ** 2) - 0.018
        add_part("Pouch", box((x, y, 1.162), (0.045, 0.03, 0.055), bevel=0.007),
                 M["BeltRed"], fixed(Hips=1))
    tilt = Matrix.Rotation(rad(-7), 3, 'Y')
    for i, mat in enumerate(("Teal", "Crimson", "Teal", "Crimson")):
        x = 0.10 + 0.024 * i
        rx, ry = 0.178, 0.126
        y = -ry * math.sqrt(max(0.0, 1 - (min(x, 0.17) / rx) ** 2)) - 0.03
        axes = [tilt @ Vector(v) for v in ((1, 0, 0), (0, 1, 0), (0, 0, 1))]
        add_part("Sash", box((x, y, 1.105), (0.024, 0.016, 0.21), axes=axes, bevel=0.004),
                 M[mat], fixed(Hips=1))
    knot = ellipsoid((0.11, -0.15, 1.175), (0.045, 0.025, 0.035))
    add_part("SashKnot", knot, M["Teal"], fixed(Hips=1))

    # Codpiece.
    add_part("Codpiece", box((0, -0.10, 1.0), (0.11, 0.04, 0.12), bevel=0.02),
             M["Teal"], fixed(Hips=1))


def build_cape():
    cols, rows = 22, 26
    bm = bmesh.new()
    grid = []
    for r in range(rows + 1):
        v = r / rows
        z = 1.565 - v * (1.565 - 0.275)
        w = 0.21 + 0.12 * v
        row = []
        for c in range(cols + 1):
            u = -1 + 2 * c / cols
            y = 0.15 + 0.10 * v + (0.035 + 0.05 * v) * (1 - u * u) + 0.012 * math.sin(u * math.pi * 3) * v
            zz = z + (0.012 * math.sin(u * 5.0) if r == rows else 0.0)
            row.append(bm.verts.new((u * w, y, zz)))
        grid.append(row)
    for r in range(rows):
        for c in range(cols):
            bm.faces.new((grid[r][c], grid[r][c + 1], grid[r + 1][c + 1], grid[r + 1][c]))
    add_part("Cape", bm, M["Cape"], auto("Chest", "Cape.1", "Cape.2"), solidify=0.008)


# ── Arms ────────────────────────────────────────────────────────────────
def build_arm(s):
    sfx = ".L" if s > 0 else ".R"
    sh, el = BONES["UpperArm" + sfx][0], BONES["UpperArm" + sfx][1]
    wr, tip = BONES["LowerArm" + sfx][1], BONES["Hand" + sfx][1]

    # Pauldron: a dome over the shoulder, open underneath, with two nested
    # U-shaped white / crimson / white bands on its front and back faces.
    C = Vector((s * 0.245, 0.0, 1.49))
    R, RY, EXP = 0.16, 0.155, 0.8
    pw = fixed(**{"Clavicle" + sfx.replace(".", "_"): 0.45, "UpperArm" + sfx.replace(".", "_"): 0.55})
    a0, a1 = rad(-40), rad(220)  # path runs along +Y: a=0 is -X, 90 is up, 180 is +X
    SZ = 1.15  # taller than wide, so the bands read as horseshoes
    ys = [RY * (-1 + 2 * i / 10) for i in range(11)]
    pts = [C + Vector((0, y, 0)) for y in ys]
    radii = [R * max(0.0, 1 - (y / RY) ** 2) ** (0.5 * EXP) for y in ys]
    radii = [(r, r * SZ) for r in radii]
    tilt = Matrix.Rotation(s * rad(18), 3, 'Y')  # droop the outer edge over the arm
    up = tuple(tilt @ Vector((0, 0, 1)))
    add_part("Pauldron", tube(pts, radii, segs=22, hint=up, a0=a0, a1=a1),
             M["DarkTeal"], pw, solidify=0.012)
    e1, e2 = frame(Vector((0, 1, 0)), up)
    for f in (-1, 1):
        for rho, w, mat in ((0.95, 0.011, "White"), (0.85, 0.014, "Crimson"), (0.75, 0.011, "White"),
                            (0.57, 0.011, "White"), (0.47, 0.014, "Crimson"), (0.37, 0.011, "White")):
            r = R * rho
            y = f * (RY * math.sqrt(max(0.0, 1 - rho ** (2 / EXP))) + 0.006)
            arc = [C + Vector((0, y, 0)) + e1 * ((r + 0.003) * math.cos(a)) + e2 * ((r + 0.003) * SZ * math.sin(a))
                   for a in [a0 + (a1 - a0) * i / 28 for i in range(29)]]
            add_part("PauldronTrim", tube(arc, [(w, 0.006)] * len(arc), segs=6, hint=(0, 1, 0)),
                     M[mat], pw)

    # Upper arm: dark sleeve, teal plate on the outside, elbow cop.
    add_part("UpperArm", tube([sh, el], [0.058, 0.05], segs=16),
             M["Undersuit"], auto("Clavicle" + sfx, "UpperArm" + sfx, "LowerArm" + sfx))
    p0, p1 = sh.lerp(el, 0.35), sh.lerp(el, 0.92)
    add_part("Rerebrace", tube([p0, p1], [0.067, 0.06], segs=16, a0=rad(-100), a1=rad(100)),
             M["Teal"], auto("UpperArm" + sfx), solidify=0.008)
    add_part("Elbow", ellipsoid(el, (0.056, 0.056, 0.056)), M["Undersuit"],
             auto("UpperArm" + sfx, "LowerArm" + sfx))

    # Forearm: crimson vambrace with the white stepped pattern and cuff.
    f0 = el.lerp(wr, 0.08)
    add_part("Vambrace", tube([f0, el.lerp(wr, 0.5), wr], [0.05, 0.053, 0.06], segs=16),
             M["Crimson"], auto("LowerArm" + sfx, "Hand" + sfx))
    t = (wr - el).normalized()
    fe1, fe2 = frame(t, (0, -1, 0))
    rows = [(0.30, (-30, 0, 30)), (0.45, (-15, 15)), (0.60, (-30, 0, 30)), (0.75, (-15, 15))]
    for u, angs in rows:
        c = el.lerp(wr, u)
        r = 0.05 + 0.01 * u
        for ang in angs:
            a = rad(ang)
            nrm = (fe1 * math.cos(a) + fe2 * math.sin(a)).normalized()
            side = t.cross(nrm).normalized()
            add_part("VambracePattern", box(c + nrm * (r + 0.002), (0.022, 0.026, 0.01),
                                            axes=[side, t, nrm], bevel=0.002, segs=1),
                     M["White"], auto("LowerArm" + sfx))
    cuff = [wr - t * 0.01 + fe1 * (0.064 * math.cos(a)) + fe2 * (0.064 * math.sin(a))
            for a in [TAU * i / 24 for i in range(24)]]
    add_part("Cuff", tube(cuff, [(0.008, 0.012)] * 24, segs=6, hint=tuple(t), loop=True),
             M["White"], auto("LowerArm" + sfx, "Hand" + sfx))

    # Glove: palm faces the body, white plate on the back of the hand.
    h = (tip - wr).normalized()
    he1, he2 = frame(h, (0, -1, 0))  # he1 ~ back of hand (outward), he2 ~ front
    hand_w = fixed(**{"Hand" + sfx.replace(".", "_"): 1})
    add_part("Palm", box(wr + h * 0.05, (0.042, 0.10, 0.095), axes=[he1, h, he2], bevel=0.012),
             M["Leather"], hand_w)
    add_part("Fingers", box(wr + h * 0.13 - he1 * 0.006, (0.03, 0.075, 0.088),
                            axes=[he1, h, he2], bevel=0.01), M["Leather"], hand_w)
    add_part("Thumb", tube([wr + h * 0.03 - he2 * 0.035, wr + h * 0.085 - he2 * 0.06 - he1 * 0.01],
                           [0.016, 0.013], segs=10), M["Leather"], hand_w)
    add_part("Knuckles", box(wr + h * 0.07 + he1 * 0.02, (0.012, 0.07, 0.07),
                             axes=[he1, h, he2], bevel=0.005), M["White"], hand_w)


# ── Legs ────────────────────────────────────────────────────────────────
def build_leg(s):
    sfx = ".L" if s > 0 else ".R"
    hip, knee = BONES["UpperLeg" + sfx][0], BONES["UpperLeg" + sfx][1]
    ankle = BONES["LowerLeg" + sfx][1]
    outer = 0.0 if s > 0 else math.pi  # angle of the outside of the leg in tube space
    ul, ll, ft = "UpperLeg" + sfx, "LowerLeg" + sfx, "Foot" + sfx

    top = hip + Vector((0, 0, 0.06))
    add_part("Thigh", tube([top, hip.lerp(knee, 0.5), knee], [(0.09, 0.092), (0.077, 0.08), (0.062, 0.065)],
                           segs=16), M["Undersuit"], auto("Hips", ul, ll))
    t0, t1 = hip.lerp(knee, 0.08), hip.lerp(knee, 0.82)
    add_part("ThighPlate", tube([t0, hip.lerp(knee, 0.45), t1], [(0.10, 0.10), (0.088, 0.09), (0.073, 0.075)],
                                segs=16, a0=rad(35), a1=rad(145)), M["Teal"], auto(ul, "Hips"), solidify=0.01)
    s0, s1 = hip.lerp(knee, 0.0), hip.lerp(knee, 0.62)
    add_part("Tasset", tube([s0, s1], [(0.108, 0.10), (0.09, 0.088)], segs=12,
                            a0=outer - rad(55), a1=outer + rad(55)), M["Teal"], auto("Hips", ul), solidify=0.01)

    add_part("KneeCop", ellipsoid(knee + Vector((0, -0.045, 0.005)), (0.05, 0.035, 0.056)),
             M["Teal"], auto(ul, ll))
    add_part("Shin", tube([knee, ankle], [0.06, 0.05], segs=16), M["Undersuit"], auto(ul, ll, ft))
    sp0, sp1 = knee.lerp(ankle, 0.08), knee.lerp(ankle, 0.30)
    add_part("ShinPlate", tube([sp0, sp1], [(0.074, 0.074), (0.072, 0.073)], segs=12,
                               a0=rad(20), a1=rad(160)), M["Teal"], auto(ll), solidify=0.01)

    boot_top = knee.lerp(ankle, 0.27)
    boot_end = Vector((ankle.x, ankle.y, 0.09))
    add_part("Boot", tube([boot_top, ankle.lerp(boot_top, 0.5), boot_end],
                          [(0.071, 0.073), (0.066, 0.068), (0.062, 0.066)], segs=16),
             M["Leather"], auto(ll, ft))
    for z_lerp, mat, r in ((0.0, "White", 0.074), (0.92, "Silver", 0.066)):
        c = boot_top.lerp(ankle, z_lerp)
        ring = [c + Vector((r * math.cos(a), r * 1.03 * math.sin(a), 0)) for a in [TAU * i / 24 for i in range(24)]]
        add_part("BootBand", tube(ring, [(0.006, 0.011)] * 24, segs=6, hint=(0, 0, 1), loop=True),
                 M[mat], auto(ll, ft))
    fx = s * 0.162
    add_part("Foot", box((fx, -0.05, 0.068), (0.1, 0.26, 0.12), bevel=0.04, segs=3),
             M["Leather"], auto(ll, ft))
    add_part("Sole", box((fx, -0.055, 0.013), (0.104, 0.27, 0.026), bevel=0.008),
             M["Undersuit"], auto(ft))


# ── Assembly ────────────────────────────────────────────────────────────
def reset_scene():
    bpy.ops.wm.read_factory_settings(use_empty=True)


def make_materials():
    mats = []
    for name, hx, metal, rough in MATERIALS:
        m = bpy.data.materials.new("M_Guard_" + name)
        m.use_nodes = True
        bsdf = m.node_tree.nodes["Principled BSDF"]
        bsdf.inputs["Base Color"].default_value = (*hex_rgb(hx), 1)
        bsdf.inputs["Metallic"].default_value = metal
        bsdf.inputs["Roughness"].default_value = rough
        mats.append(m)
    return mats


def make_armature():
    arm_data = bpy.data.armatures.new(NAME + "_Rig")
    arm = bpy.data.objects.new(NAME + "_Rig", arm_data)
    bpy.context.scene.collection.objects.link(arm)
    bpy.context.view_layer.objects.active = arm
    bpy.ops.object.mode_set(mode='EDIT')
    eb = {}
    for name, (h, t, _p) in BONES.items():
        b = arm_data.edit_bones.new(name)
        b.head, b.tail = h, t
        b.roll = 0.0
        eb[name] = b
    for name, (_h, _t, p) in BONES.items():
        if p:
            eb[name].parent = eb[p]
            eb[name].use_connect = (eb[name].head - eb[p].tail).length < 1e-4
    bpy.ops.object.mode_set(mode='OBJECT')
    arm.show_in_front = True
    return arm


def realise_parts(mats):
    objs = []
    for i, (name, bm, mat, weights) in enumerate(PARTS):
        me = bpy.data.meshes.new(f"{name}_{i}")
        for m in mats:
            me.materials.append(m)
        for f in bm.faces:
            f.material_index = mat(f.calc_center_median(), f.normal) if callable(mat) else mat
        bm.to_mesh(me)
        bm.free()
        ob = bpy.data.objects.new(f"{name}_{i}", me)
        bpy.context.scene.collection.objects.link(ob)

        groups = {}
        if "fixed" in weights:
            for bone, w in weights["fixed"].items():
                groups.setdefault(bone, ob.vertex_groups.new(name=bone)).add(range(len(me.vertices)), w, 'REPLACE')
        else:
            cands = weights["auto"]
            for v in me.vertices:
                ds = [(seg_dist(v.co, BONES[b][0], BONES[b][1]), b) for b in cands]
                ds.sort()
                ds = ds[:2]
                ws = [(1.0 / max(d, 0.004) ** 6, b) for d, b in ds]
                tot = sum(w for w, _ in ws)
                for w, b in ws:
                    if w / tot > 0.01:
                        if b not in groups:
                            groups[b] = ob.vertex_groups.new(name=b)
                        groups[b].add([v.index], w / tot, 'REPLACE')
        objs.append(ob)

    bpy.ops.object.select_all(action='DESELECT')
    for ob in objs:
        ob.select_set(True)
    bpy.context.view_layer.objects.active = objs[0]
    bpy.ops.object.join()
    body = bpy.context.view_layer.objects.active
    body.name = body.data.name = NAME
    try:
        body.data.shade_smooth()
        body.data.set_sharp_from_angle(angle=rad(40))
    except AttributeError:
        for p in body.data.polygons:
            p.use_smooth = True
    return body


def rig(body, arm):
    body.parent = arm
    mod = body.modifiers.new("Armature", 'ARMATURE')
    mod.object = arm


def uv_unwrap(body):
    bpy.ops.object.select_all(action='DESELECT')
    body.select_set(True)
    bpy.context.view_layer.objects.active = body
    bpy.ops.object.mode_set(mode='EDIT')
    bpy.ops.mesh.select_all(action='SELECT')
    bpy.ops.uv.smart_project(angle_limit=rad(66), island_margin=0.004)
    bpy.ops.object.mode_set(mode='OBJECT')


def bake(body, mats, image_name, colour_fn):
    """Bake flat colours into an image. colour_fn(material_name) -> rgb or None (keep)."""
    scene = bpy.context.scene
    scene.render.engine = 'CYCLES'
    scene.cycles.device = 'CPU'
    scene.cycles.samples = 1
    img = bpy.data.images.new(image_name, TEX_SIZE, TEX_SIZE, alpha=False)
    saved = []
    for (name, *_r), m in zip(MATERIALS, mats):
        nt = m.node_tree
        bsdf = nt.nodes["Principled BSDF"]
        saved.append(tuple(bsdf.inputs["Base Color"].default_value))
        c = colour_fn(name)
        if c is not None:
            bsdf.inputs["Base Color"].default_value = (*c, 1)
        node = nt.nodes.new("ShaderNodeTexImage")
        node.image = img
        node.name = "_bake"
        nt.nodes.active = node
    bpy.ops.object.select_all(action='DESELECT')
    body.select_set(True)
    bpy.context.view_layer.objects.active = body
    bpy.ops.object.bake(type='DIFFUSE', pass_filter={'COLOR'}, margin=8, use_clear=True)
    for m, c in zip(mats, saved):
        nt = m.node_tree
        nt.nodes["Principled BSDF"].inputs["Base Color"].default_value = c
        nt.nodes.remove(nt.nodes["_bake"])
    img.filepath_raw = os.path.join(OUT_DIR, image_name + ".png")
    img.file_format = 'PNG'
    img.save()
    return img


def export(body, arm, albedo, mask):
    # Export copy: one material driven by the baked albedo.
    exp = body.copy()
    exp.data = body.data.copy()
    bpy.context.scene.collection.objects.link(exp)
    exp.modifiers[0].object = arm
    m = bpy.data.materials.new("M_" + NAME)
    m.use_nodes = True
    nt = m.node_tree
    bsdf = nt.nodes["Principled BSDF"]
    tex = nt.nodes.new("ShaderNodeTexImage")
    tex.image = albedo
    nt.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
    bsdf.inputs["Metallic"].default_value = 0.3
    bsdf.inputs["Roughness"].default_value = 0.5
    exp.data.materials.clear()
    exp.data.materials.append(m)

    bpy.ops.object.select_all(action='DESELECT')
    exp.select_set(True)
    arm.select_set(True)
    bpy.context.view_layer.objects.active = arm
    bpy.ops.export_scene.fbx(filepath=os.path.join(OUT_DIR, NAME + ".fbx"), use_selection=True,
                             object_types={'ARMATURE', 'MESH'}, add_leaf_bones=False,
                             mesh_smooth_type='FACE', path_mode='RELATIVE', bake_anim=False)
    bpy.ops.export_scene.gltf(filepath=os.path.join(OUT_DIR, NAME + ".glb"), export_format='GLB',
                              use_selection=True, export_animations=False)
    bpy.data.objects.remove(exp)
    bpy.data.materials.remove(m)


# ── Preview renders ─────────────────────────────────────────────────────
def setup_render_scene():
    scene = bpy.context.scene
    scene.render.engine = 'CYCLES'
    scene.cycles.device = 'CPU'
    scene.cycles.samples = 16 if QUICK else 48
    try:
        scene.cycles.use_denoising = True
    except AttributeError:
        pass
    scene.render.resolution_x, scene.render.resolution_y = 900, 1300
    scene.render.film_transparent = False
    scene.view_settings.view_transform = 'Standard'
    world = bpy.data.worlds.new("World")
    world.use_nodes = True
    world.node_tree.nodes["Background"].inputs["Color"].default_value = (0.045, 0.045, 0.05, 1)
    world.node_tree.nodes["Background"].inputs["Strength"].default_value = 1.0
    scene.world = world

    def light(name, kind, loc, rot, energy, size=1.0):
        ld = bpy.data.lights.new(name, kind)
        ld.energy = energy
        if kind == 'AREA':
            ld.size = size
        lo = bpy.data.objects.new(name, ld)
        lo.location, lo.rotation_euler = loc, [rad(r) for r in rot]
        scene.collection.objects.link(lo)

    light("Key", 'AREA', (-1.6, -2.4, 3.0), (55, 0, -35), 320, 2.0)
    light("Fill", 'AREA', (2.2, -2.0, 1.6), (70, 0, 45), 110, 2.5)
    light("Rim", 'AREA', (0.5, 2.6, 2.6), (-55, 0, 170), 350, 1.5)

    gd = bpy.data.meshes.new("Ground")
    bm = bmesh.new()
    bmesh.ops.create_grid(bm, x_segments=1, y_segments=1, size=4)
    bm.to_mesh(gd)
    g = bpy.data.objects.new("Ground", gd)
    gm = bpy.data.materials.new("Ground")
    gm.use_nodes = True
    gm.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = (0.08, 0.08, 0.085, 1)
    gd.materials.append(gm)
    scene.collection.objects.link(g)

    cam_d = bpy.data.cameras.new("Cam")
    cam = bpy.data.objects.new("Cam", cam_d)
    scene.collection.objects.link(cam)
    scene.camera = cam
    return cam


def look_at(cam, loc, target):
    cam.location = loc
    direction = Vector(target) - Vector(loc)
    cam.rotation_euler = direction.to_track_quat('-Z', 'Y').to_euler()


def render(cam, path, loc, target=(0, 0, 1.0), ortho=None, lens=70):
    if ortho:
        cam.data.type = 'ORTHO'
        cam.data.ortho_scale = ortho
    else:
        cam.data.type = 'PERSP'
        cam.data.lens = lens
    look_at(cam, loc, target)
    bpy.context.scene.render.filepath = path
    bpy.ops.render.render(write_still=True)


def render_previews(arm):
    cam = setup_render_scene()
    prev = os.path.join(OUT_DIR, "previews")
    os.makedirs(prev, exist_ok=True)
    render(cam, os.path.join(prev, "front.png"), (0, -6, 1.0), (0, 0, 1.0), ortho=2.25)
    render(cam, os.path.join(prev, "three_quarter.png"), (-2.6, -3.9, 1.7), (0, 0, 0.98), lens=60)
    if QUICK:
        return
    render(cam, os.path.join(prev, "back.png"), (0.8, 4.4, 1.5), (0, 0, 0.98), lens=60)
    render(cam, os.path.join(prev, "head_closeup.png"), (-0.55, -1.2, 1.85), (0, 0, 1.72), lens=60)

    # Skinning check: put the rig in an action pose and render it.
    pb = arm.pose.bones
    pose = {
        "UpperArm.L": (0, rad(-55), 0), "LowerArm.L": (rad(-70), 0, 0),
        "UpperArm.R": (rad(40), 0, 0), "LowerArm.R": (rad(-45), 0, 0),
        "UpperLeg.L": (rad(-35), 0, 0), "LowerLeg.L": (rad(50), 0, 0),
        "Head": (0, 0, rad(25)), "Spine": (0, 0, rad(-10)), "Cape.1": (rad(15), 0, 0),
    }
    for name, e in pose.items():
        pb[name].rotation_mode = 'XYZ'
        pb[name].rotation_euler = e
    bpy.context.view_layer.update()
    render(cam, os.path.join(prev, "pose_test.png"), (-2.6, -3.9, 1.7), (0, 0, 0.98), lens=60)
    for name in pose:
        pb[name].rotation_euler = (0, 0, 0)


def main():
    reset_scene()
    build_head()
    build_torso()
    build_cape()
    for s in (1, -1):
        build_arm(s)
        build_leg(s)

    mats = make_materials()
    arm = make_armature()
    body = realise_parts(mats)
    rig(body, arm)
    uv_unwrap(body)

    albedo = bake(body, mats, NAME + "_Albedo", lambda _n: None)
    bake(body, mats, NAME + "_Mask",
         lambda n: (1, 0, 0) if n in MASK_PRIMARY else (0, 1, 0) if n in MASK_SECONDARY else (0, 0, 0))
    export(body, arm, albedo, None)

    tris = sum(len(p.vertices) - 2 for p in body.data.polygons)
    print(f"[guard] parts={len(PARTS)} verts={len(body.data.vertices)} tris={tris} bones={len(BONES)}")

    if RENDER:
        render_previews(arm)
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(OUT_DIR, NAME + ".blend"))


if __name__ == "__main__":
    main()
