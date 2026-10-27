"""Hand-modelled hood + face mask (House Thorvald reference: a black cloth hood under the hat, masked to the eyes).

One smooth closed shell fitted around the donor head and neck: for every ring height and angle around the neck axis the radius is the furthest head/neck
vertex in that direction plus an offset, smoothed across angle and height, so the hood follows the skull, the nose and the jaw without touching them.
A slit is left at the eyes.  Skinned by height (SpineTop -> Neck -> Head) so it follows nods and turns; UVs into the trim atlas' 'hood' box
(u = angle, v = height).  The donor head's faces hidden inside the hood are deleted (saves ~1,300 triangles), only the eye band is kept.
"""
import math

import bmesh
import bpy
from mathutils import Vector

import trim_layout as TL


def _smoothstep(a, b, x):
    t = max(0.0, min(1.0, (x - a) / (b - a)))
    return t * t * (3 - 2 * t)


def build_hood(rig, head, body, p, trim_mat):
    mw = head.matrix_world
    hv = [mw @ v.co for v in head.data.vertices]
    cx = sum(v.x for v in hv) / len(hv)
    cy = p.get("cy", sum(v.y for v in hv) / len(hv))
    bw = body.matrix_world
    neck = [bw @ v.co for v in body.data.vertices]
    neck = [w for w in neck if w.z > p["z0"] - 0.02 and math.hypot(w.x - cx, w.y - cy) < p.get("neck_r", 0.115)]
    pts = hv + neck
    zs = p["rings"]
    segs = p.get("segs", 32)
    off = p.get("offset", 0.012)
    top = max(v.z for v in hv)
    # radius table r[i][j]
    R = []
    for i, z in enumerate(zs):
        dz = p.get("dz", 0.022)
        row = []
        sel = [w for w in pts if abs(w.z - z) < dz]
        for j in range(segs):
            a = 2 * math.pi * j / segs - math.pi / 2          # j = 0 faces the front (-y)
            dx, dy = math.cos(a), math.sin(a)
            best = 0.0
            for w in sel:
                rx, ry = w.x - cx, w.y - cy
                rr = math.hypot(rx, ry)
                if rr < 1e-6:
                    continue
                c = (rx * dx + ry * dy) / rr
                if c > math.cos(1.6 * math.pi / segs) + 0.0:   # inside this angular wedge
                    best = max(best, rr * c)
            row.append(best)
        R.append(row)
    # holes in the table (no samples): take the ring below / neighbours
    for i in range(len(zs)):
        for j in range(segs):
            if R[i][j] <= 0.0:
                nb = [R[i][(j + k) % segs] for k in (-2, -1, 1, 2) if R[i][(j + k) % segs] > 0]
                R[i][j] = max(nb) if nb else (R[i - 1][j] * 0.9 if i else 0.08)
    for _ in range(p.get("smooth", 2)):                       # smooth across angle (keep the max envelope: smooth then never shrink below raw)
        R = [[max(R[i][j], (R[i][(j - 1) % segs] + 2 * R[i][j] + R[i][(j + 1) % segs]) / 4) for j in range(segs)] for i in range(len(zs))]
    for _ in range(p.get("smooth_z", 1)):
        R = [[max(R[i][j], (R[max(i - 1, 0)][j] + 2 * R[i][j] + R[min(i + 1, len(zs) - 1)][j]) / 4) for j in range(segs)] for i in range(len(zs))]
    flare = p.get("flare", {})                                # extra radius at the bottom rings (sits over the collar opening)
    bm = bmesh.new()
    uvl = bm.loops.layers.uv.new(head.data.uv_layers.active.name)
    rings = []
    for i, z in enumerate(zs):
        ring = []
        for j in range(segs):
            a = 2 * math.pi * j / segs - math.pi / 2
            r = R[i][j] + off + flare.get(i, 0.0)
            ring.append(bm.verts.new((cx + r * math.cos(a), cy + r * math.sin(a), z)))
        rings.append(ring)
    pole = bm.verts.new((cx, cy + p.get("pole_dy", 0.01), top + off + p.get("crown", 0.004)))
    zr = (zs[0], pole.co.z)

    def vfr(z):
        return (z - zr[0]) / (zr[1] - zr[0])

    slit = p["slit"]                                           # (ring index lo, ring index hi, half angle deg)
    faces = []
    for i in range(len(zs) - 1):
        for j in range(segs):
            j2 = (j + 1) % segs
            am = (j + 0.5) / segs * 360.0
            am = min(am, 360 - am)                              # angle from the front
            if slit[0] <= i < slit[1] and am < slit[2]:
                continue
            f = bm.faces.new((rings[i][j], rings[i][j2], rings[i + 1][j2], rings[i + 1][j]))
            faces.append((f, j, j + 1, i, i + 1))
    for j in range(segs):
        f = bm.faces.new((rings[-1][j], rings[-1][(j + 1) % segs], pole))
        faces.append((f, j, j + 1, len(zs) - 1, None))
    bm.normal_update()
    out_ok = 0
    for f, *_ in faces:                                        # outward winding
        c = f.calc_center_median()
        if f.normal.dot(Vector((c.x - cx, c.y - cy, 0.0 if c.z < top - 0.03 else c.z - (top - 0.1)))) < 0:
            f.normal_flip()
        else:
            out_ok += 1
    for f, j0, j1, i0, i1 in faces:
        for lp in f.loops:
            vv = lp.vert
            if vv is pole:
                u = (j0 + 0.5) / segs
                v = 1.0
            else:
                jj = rings[[k for k in range(len(zs)) if vv in rings[k]][0]].index(vv)
                if jj == 0 and j0 == segs - 1:
                    jj = segs
                u = jj / segs
                v = vfr(vv.co.z)
            lp[uvl].uv = TL.uv("hood", u, v)
        f.smooth = True
    me = bpy.data.meshes.new("TrooperHood")
    bm.to_mesh(me)
    bm.free()
    obj = bpy.data.objects.new("TrooperHood", me)
    bpy.context.collection.objects.link(obj)
    me.materials.append(trim_mat)
    gs = {n: obj.vertex_groups.new(name=n) for n in ("B_SpineTopJ", "B_Neck01J", "B_HeadJ")}
    hz = p.get("head_ramp", (1.70, 1.76))
    nz = p.get("neck_ramp", (1.60, 1.66))
    for v in me.vertices:
        z = v.co.z
        wh = _smoothstep(hz[0], hz[1], z)
        wn = (1 - wh) * _smoothstep(nz[0], nz[1], z)
        ws = 1 - wh - wn
        for n, w in (("B_HeadJ", wh), ("B_Neck01J", wn), ("B_SpineTopJ", ws)):
            if w > 1e-4:
                gs[n].add([v.index], w, "REPLACE")
    obj.parent = rig
    mod = obj.modifiers.new("Armature", "ARMATURE")
    mod.object = rig
    print("   hood: %d rings x %d, faces %d, crown %.3f, slit rings %s" % (len(zs), segs, len(me.polygons), pole.co.z if False else top + off, slit))
    # drop the donor head faces the hood hides: keep only the eye band at the front
    ez = p["keep_band"]
    hb = bmesh.new()
    hb.from_mesh(head.data)
    kill = []
    for f in hb.faces:
        c = mw @ f.calc_center_median()
        a = math.degrees(math.atan2(c.x - cx, -(c.y - cy)))
        if not (ez[0] <= c.z <= ez[1] and abs(a) < p.get("keep_deg", 75)):
            kill.append(f)
    n0 = len(hb.faces)
    bmesh.ops.delete(hb, geom=kill, context="FACES")
    bmesh.ops.delete(hb, geom=[v for v in hb.verts if not v.link_faces], context="VERTS")
    hb.to_mesh(head.data)
    hb.free()
    head.data.update()
    print("   head under the hood: %d -> %d faces" % (n0, len(head.data.polygons)))
    return obj
