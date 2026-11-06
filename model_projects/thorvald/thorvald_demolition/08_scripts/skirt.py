"""Hand-modelled skirt for the T5 Trooper (reference: a plain rust apron with a patterned hem in front, long dark coat tails at the sides and back).

Panels are lofted around the pelvis axis.  For every ring height and angle the radius comes from the body underneath (legs + hips): the furthest
vertex in that direction over the ring AND everything above it, plus an offset, so the cloth hangs straight or flares outward and never tucks in.
Each panel is a thin closed slab (outer + inner wall + edge strips) so it holds up from any angle with back-face culling.  Skinned ROOT at the top
blending into the thigh on its side lower down.  UVs: u across the panel, v hem (0) -> waist (1), into trim atlas boxes.
"""
import math

import bmesh
import bpy
from mathutils import Vector

import trim_layout as TL


def _envelope(pts, z, a, cy, dz_above=0.12, win_deg=9.0):
    dx, dy = math.sin(a), -math.cos(a)
    cw = math.cos(math.radians(win_deg))
    best = 0.0
    for w in pts:
        if not (z - 0.03 <= w.z <= z + dz_above):
            continue
        rx, ry = w.x, w.y - cy
        rr = math.hypot(rx, ry)
        if rr < 1e-6:
            continue
        c = (rx * dx + ry * dy) / rr
        if c > cw:
            best = max(best, rr * c)
    return best


def build_skirt(rig, bodies, p, trim_mat, uv_name):
    pts = []
    for o in bodies:
        mw = o.matrix_world
        pts += [mw @ v.co for v in o.data.vertices if 0.40 < (mw @ v.co).z < p["z_top"] + 0.06 and abs((mw @ v.co).x) < 0.32]
    cy = p.get("cy", 0.0)
    zt = p["z_top"]
    bm = bmesh.new()
    uvl = bm.loops.layers.uv.new(uv_name)
    dl = bm.verts.layers.deform.new()
    bones = ["B_ROOTJ", "B_lHipJ", "B_rHipJ"]
    total = 0
    for pan in p["panels"]:
        a0, a1 = math.radians(pan["a0"]), math.radians(pan["a1"])
        zh = pan["z_hem"]
        nr = max(3, int(round((zt - zh) / p.get("dz", 0.045))))
        nc = pan["cols"]
        zs = [zt - (zt - zh) * i / nr for i in range(nr + 1)]           # top -> hem
        R = [[0.0] * (nc + 1) for _ in zs]
        for j in range(nc + 1):
            a = a0 + (a1 - a0) * j / nc
            prev = 0.0
            for i, z in enumerate(zs):
                e = _envelope(pts, z, a, cy)
                r = max(e + p.get("offset", 0.018), prev + pan.get("flare", p.get("flare", 0.010)) * (zs[i - 1] - z) / 0.1 if i else 0.0)
                R[i][j] = r
                prev = r
        # smooth across columns (never below the raw envelope)
        for _ in range(2):
            R = [[max(R[i][j], (R[i][max(j - 1, 0)] + 2 * R[i][j] + R[i][min(j + 1, nc)]) / 4) for j in range(nc + 1)] for i in range(len(zs))]
        # cloth folds: a ripple around the panel that grows toward the hem (silhouette, not just texture)
        fa, fn = pan.get("fold_amp", p.get("fold_amp", 0.0)), pan.get("folds", 5)
        if fa:
            for i, z in enumerate(zs):
                t = ((zt - z) / (zt - zh)) ** 1.5
                for j in range(nc + 1):
                    u = j / nc
                    R[i][j] *= 1.0 + fa * t * math.sin(2 * math.pi * fn * u + pan.get("phase", 0.0))
        th = p.get("thick", 0.005)
        grid = {}
        for side, dr in (("o", 0.0), ("i", -th)):
            for i, z in enumerate(zs):
                for j in range(nc + 1):
                    a = a0 + (a1 - a0) * j / nc
                    r = R[i][j] + dr
                    v = bm.verts.new((r * math.sin(a), cy - r * math.cos(a), z))
                    t = (zt - z) / (zt - zh)
                    hip = p.get("hip_max", 0.6) * min(1.0, max(0.0, (t - 0.12) / 0.88)) ** 1.2
                    l_share = min(1.0, max(0.0, 0.5 + v.co.x / p.get("hip_split", 0.14)))
                    v[dl][0] = 1.0 - hip
                    if hip * l_share > 1e-4:
                        v[dl][1] = hip * l_share
                    if hip * (1 - l_share) > 1e-4:
                        v[dl][2] = hip * (1 - l_share)
                    grid[side, i, j] = v
        faces = []
        for i in range(len(zs) - 1):
            for j in range(nc):
                fo = bm.faces.new((grid["o", i, j], grid["o", i, j + 1], grid["o", i + 1, j + 1], grid["o", i + 1, j]))
                fi = bm.faces.new((grid["i", i, j], grid["i", i + 1, j], grid["i", i + 1, j + 1], grid["i", i, j + 1]))
                faces += [(fo, "o"), (fi, "i")]
        last = len(zs) - 1
        for j in range(nc):                                              # hem strip
            faces.append((bm.faces.new((grid["o", last, j], grid["o", last, j + 1], grid["i", last, j + 1], grid["i", last, j])), "e"))
        for j in (0, nc):                                                # side strips
            for i in range(len(zs) - 1):
                faces.append((bm.faces.new((grid["o", i, j], grid["o", i + 1, j], grid["i", i + 1, j], grid["i", i, j])), "e"))
        bm.normal_update()
        for f, kind in faces:
            c = f.calc_center_median()
            rad = Vector((c.x, c.y - cy, 0.0))
            want = -1 if kind == "i" else 1
            if kind == "e":
                continue
            if f.normal.dot(rad) * want < 0:
                f.normal_flip()
        for f, kind in faces:                                            # edge strips: face away from the panel centre
            if kind != "e":
                continue
            c = f.calc_center_median()
            am = (a0 + a1) / 2
            mid = Vector((math.sin(am) * 0.2, cy - math.cos(am) * 0.2, (zt + zh) / 2))
            if f.normal.dot(c - mid) < 0:
                f.normal_flip()
        box = pan["box"]
        span = pan.get("u_span", 1.0)
        for f, kind in faces:
            for lp in f.loops:
                vv = lp.vert
                a = math.atan2(vv.co.x, -(vv.co.y - cy))
                u = (a - a0) / (a1 - a0)
                if pan.get("mirror_inner") and kind == "i":
                    u = 1 - u
                v = (vv.co.z - zh) / (zt - zh)
                lp[uvl].uv = TL.uv(box, max(0.0, min(1.0, 0.5 + (u - 0.5) * span)), max(0.0, min(1.0, v)))
            f.smooth = kind != "e"
        total += len(faces)
    me = bpy.data.meshes.new("TrooperSkirt")
    bm.to_mesh(me)
    bm.free()
    obj = bpy.data.objects.new("TrooperSkirt", me)
    bpy.context.collection.objects.link(obj)
    me.materials.append(trim_mat)
    for n in bones:
        obj.vertex_groups.new(name=n)
    obj.parent = rig
    mod = obj.modifiers.new("Armature", "ARMATURE")
    mod.object = rig
    print("   skirt: %d panels, %d faces" % (len(p["panels"]), total))
    return obj
