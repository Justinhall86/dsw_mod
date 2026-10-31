"""House Thorvald tower shield: every shape in (x, z) metres, shield-centred (z = 0 at the shield centre; make_shield adds Z0).
Shared by make_shield.py (geometry, Blender) and paint_shield.py (texture, PIL), so the paint lands exactly on the geometry.

The reference sheet's shield: a bevelled outer copper rim; inside it a second raised copper frame with a stepped outline (wide upper panel,
narrower lower panel); the gear-and-star emblem raised inside a dark disc in the upper panel; a viewing slot cut through above it; bolts
along the rim and at the frame's corners.
"""
import math

W, H = 0.28, 0.60                 # half width, half height
CT, CB = 0.06, 0.11               # top / bottom corner chamfers
RIM = 0.045                       # outer rim width
Z0 = -0.08                        # shield centre below the hand
BEND = 0.05                       # edges this much further back than the middle

# y (front = -y): back plate, rim bevel bottom / top, field, inner frame top, emblem heights
Y_BACK, Y_RIM_EDGE, Y_RIM_TOP, Y_FIELD = 0.015, -0.040, -0.054, -0.030
Y_FRAME = -0.041
Y_DISC, Y_GEAR, Y_STAR = -0.034, -0.043, -0.048

# inner raised frame: stepped panel (the sheet's second copper line), as a polygon (clockwise from top-left)
PANEL = [(-0.17, 0.36), (0.17, 0.36), (0.20, 0.33), (0.20, 0.00), (0.16, -0.08), (0.16, -0.45), (0.10, -0.51),
         (-0.10, -0.51), (-0.16, -0.45), (-0.16, -0.08), (-0.20, 0.00), (-0.20, 0.33)]
FRAME_W = 0.018

EMBLEM_C = (0.0, 0.15)
DISC_R, GEAR_R, GEAR_ROOT, GEAR_HOLE, TEETH = 0.118, 0.092, 0.076, 0.048, 10
STAR_R, STAR_r = 0.040, 0.017

SLOT = (-0.07, 0.07, 0.415, 0.478)  # x0, x1, z0, z1 of the opening
SLOT_FRAME = 0.014
SLOT_ROUND = 0.012


def outline():
    return [(-W + CT, H), (W - CT, H), (W, H - CT), (W, -H + CB), (W - CB, -H), (-W + CB, -H), (-W, -H + CB), (-W, H - CT)]


def offset(poly, d):
    """Offset a closed polygon (clockwise, seen from the front) inward by d: every edge moved d toward the inside, corners re-intersected."""
    n = len(poly)
    area = sum(poly[i][0] * poly[(i + 1) % n][1] - poly[(i + 1) % n][0] * poly[i][1] for i in range(n))
    s = 1.0 if area < 0 else -1.0        # clockwise -> inward normal is (dz, -dx) rotated accordingly
    lines = []
    for i in range(n):
        (x0, z0), (x1, z1) = poly[i], poly[(i + 1) % n]
        dx, dz = x1 - x0, z1 - z0
        ln = math.hypot(dx, dz)
        nx, nz = s * dz / ln, -s * dx / ln
        lines.append(((x0 + nx * d, z0 + nz * d), (dx, dz)))
    out = []
    for i in range(n):
        (p, r), (q, t) = lines[i - 1], lines[i]
        den = r[0] * t[1] - r[1] * t[0]
        if abs(den) < 1e-12:
            out.append(q)
            continue
        u = ((q[0] - p[0]) * t[1] - (q[1] - p[1]) * t[0]) / den
        out.append((p[0] + r[0] * u, p[1] + r[1] * u))
    return out


def rounded_rect(x0, x1, z0, z1, r, seg=3):
    pts = []
    for cx, cz, a0 in ((x0 + r, z1 - r, 180), (x1 - r, z1 - r, 90), (x1 - r, z0 + r, 0), (x0 + r, z0 + r, -90)):   # clockwise
        for k in range(seg + 1):
            a = math.radians(a0 - 90 * k / seg)
            pts.append((cx + r * math.cos(a), cz + r * math.sin(a)))
    return pts


def slot_outer():
    x0, x1, z0, z1 = SLOT
    f = SLOT_FRAME
    return rounded_rect(x0 - f, x1 + f, z0 - f, z1 + f, SLOT_ROUND + f)


def slot_inner():
    x0, x1, z0, z1 = SLOT
    return rounded_rect(x0, x1, z0, z1, SLOT_ROUND)


def circle(c, r, n=24):
    return [(c[0] + r * math.cos(-2 * math.pi * k / n + math.pi / 2), c[1] + r * math.sin(-2 * math.pi * k / n + math.pi / 2)) for k in range(n)]


def gear():
    pts = []
    n = TEETH * 4
    for k in range(n):
        a = math.pi / 2 - 2 * math.pi * k / n
        r = GEAR_R if (k % 4) in (1, 2) else GEAR_ROOT
        pts.append((EMBLEM_C[0] + r * math.cos(a), EMBLEM_C[1] + r * math.sin(a)))
    return pts


def star():
    pts = []
    for k in range(10):
        a = math.pi / 2 - k * math.pi / 5
        r = STAR_R if k % 2 == 0 else STAR_r
        pts.append((EMBLEM_C[0] + r * math.cos(a), EMBLEM_C[1] + r * math.sin(a)))
    return pts


def bolts():
    """Bolt centres: along the middle of the rim every ~7.5 cm, plus the inner frame's corners."""
    ring = offset(outline(), RIM * 0.5)
    out = []
    n = len(ring)
    for i in range(n):
        (x0, z0), (x1, z1) = ring[i], ring[(i + 1) % n]
        ln = math.hypot(x1 - x0, z1 - z0)
        k = max(1, int(round(ln / 0.075)))
        for j in range(k):
            t = j / k
            out.append((x0 + (x1 - x0) * t, z0 + (z1 - z0) * t, "rim"))
    for x, z in offset(PANEL, FRAME_W * 0.5):
        out.append((x, z, "frame"))
    return out


BOLT_R, BOLT_H = 0.0075, 0.006
