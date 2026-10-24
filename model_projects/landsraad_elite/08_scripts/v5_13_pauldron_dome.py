"""v5 hand-built pauldron, step 2 (Blender module): model a NEW pauldron per shoulder - one curved armour shell
(part of an ellipsoid) over the top and outside of the shoulder, open toward the neck, with real thickness, a
flared lower edge, a gold rim band and a gold centre ridge. Textured from flat patches of the guard's own
texture (v5_12_pick_uv_patches.py), weighted mostly to the clavicle so it does not flap with the arm.

Used by v5_11_handrolled.py when a variant has a "dome" dict.
"""
import json
import math
import os

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PATCH = json.load(open(os.path.join(HERE, "intermediate_data", "v5_uv_patches.json")))


def _uv(kind, a, b):
    """Spread a face's UVs a little inside the chosen flat patch (a, b in 0..1) so shading is not dead flat."""
    cu, cv = PATCH[kind]
    r = PATCH["radius_uv"]
    return (cu + (a - 0.5) * r, cv + (b - 0.5) * r)


def build_pauldron(guard, rig, side, p):
    """side +1 = left (x > 0), -1 = right. p = dict(off, radii, phi, theta, seg, thick, flare, rim_rows, ridge,
    w_shoulder_bottom). Returns the new object (shares the guard's material, armature-deformed by rig)."""
    sname = "B_lShoulderJ" if side > 0 else "B_rShoulderJ"
    cname = "B_lClavicleJ" if side > 0 else "B_rClavicleJ"
    S = rig.matrix_world @ rig.data.bones[sname].head_local
    C = S + Vector((side * p["off"][0], p["off"][1], p["off"][2]))
    rx, ry, rz = p["radii"]
    nphi, nth = p["seg"]
    phis = [math.radians(-p["phi"] + 2 * p["phi"] * i / nphi) for i in range(nphi + 1)]
    ths = [math.radians(p["theta"][0] + (p["theta"][1] - p["theta"][0]) * j / nth) for j in range(nth + 1)]

    def surf(phi, th, inset=0.0, lift=0.0):
        fl = 1 + p["flare"] * max(0.0, -th) / max(1e-6, -math.radians(p["theta"][0]))
        d = Vector((side * rx * math.cos(th) * math.cos(phi) * fl, ry * math.cos(th) * math.sin(phi) * fl, rz * math.sin(th)))
        n = Vector((d.x / rx ** 2, d.y / ry ** 2, d.z / rz ** 2)).normalized()
        return C + d - n * inset + n * lift, (th - ths[0]) / (ths[-1] - ths[0])

    bm = bmesh.new()
    deform = bm.verts.layers.deform.verify()
    uvl = bm.loops.layers.uv.verify()
    grp = {}
    for n in (sname, cname):
        vg = guard.vertex_groups.get(n)
        grp[n] = vg.index

    def vert(co, t):
        v = bm.verts.new(co)
        ws = p["w_shoulder_bottom"] * (1 - t)       # lower = follows the arm a bit more
        v[deform][grp[cname]] = 1 - ws
        if ws > 0:
            v[deform][grp[sname]] = ws
        return v

    outer = [[vert(*surf(ph, th)) for th in ths] for ph in phis]
    inner = [[vert(*surf(ph, th, inset=p["thick"])) for th in ths] for ph in phis]
    rim = p["rim_rows"]

    def face(vs, kind, ab):
        f = bm.faces.new(vs)
        for lp, (a, b) in zip(f.loops, ab):
            lp[uvl].uv = _uv(kind, a, b)
        f.smooth = True
        return f

    ab4 = [(0, 0), (1, 0), (1, 1), (0, 1)]
    for i in range(nphi):
        for j in range(nth):
            edge = j < rim or i < 1 or i >= nphi - 1          # band along the lower rim and both side edges
            kind = "gold" if edge else "armour"
            face([outer[i][j], outer[i + 1][j], outer[i + 1][j + 1], outer[i][j + 1]], kind,
                 [(i / nphi, j / nth), ((i + 1) / nphi, j / nth), ((i + 1) / nphi, (j + 1) / nth), (i / nphi, (j + 1) / nth)])
            face([inner[i][j + 1], inner[i + 1][j + 1], inner[i + 1][j], inner[i][j]], "armour", ab4)
    # close the open boundary (lower ring, two side meridians, top ring) -> solid plate with a gold edge
    for i in range(nphi):
        for j in (0, nth):
            face([outer[i][j], inner[i][j], inner[i + 1][j], outer[i + 1][j]], "gold", ab4)
    for i in (0, nphi):
        for j in range(nth):
            face([outer[i][j], outer[i][j + 1], inner[i][j + 1], inner[i][j]], "gold", ab4)
    # gold ridge along the centre meridian (raised spine = "forged" look)
    if p.get("ridge"):
        rw, rh = math.radians(p["ridge"][0]), p["ridge"][1]
        rows = [j for j in range(nth + 1) if ths[j] >= math.radians(p["theta"][0] + 8)]
        L = [vert(*surf(-rw, ths[j], lift=0.002)) for j in rows]
        M = [vert(*surf(0.0, ths[j], lift=rh)) for j in rows]
        R = [vert(*surf(rw, ths[j], lift=0.002)) for j in rows]
        for k in range(len(rows) - 1):
            face([L[k], M[k], M[k + 1], L[k + 1]], "gold", ab4)
            face([M[k], R[k], R[k + 1], M[k + 1]], "gold", ab4)
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
    me = bpy.data.meshes.new("Pauldron_%s" % ("L" if side > 0 else "R"))
    bm.to_mesh(me)
    bm.free()
    ob = bpy.data.objects.new(me.name, me)
    bpy.context.collection.objects.link(ob)
    for vg in guard.vertex_groups:            # same group layout as the guard -> indices line up
        ob.vertex_groups.new(name=vg.name)
    me.materials.append(guard.data.materials[0])
    ob.parent = rig
    md = ob.modifiers.new("Armature", "ARMATURE")
    md.object = rig
    return ob


def add_pauldrons(guard, p):
    rig = next(m.object for m in guard.modifiers if m.type == "ARMATURE")
    return [build_pauldron(guard, rig, s, p) for s in (1, -1)]
