"""Step 03 - build the purple coat (and collar) and the topknot, and fit them to
the base Ginaz body.

The coat is a single lofted shell: a closed tube over the torso that opens into
two front panels below the belt and flares into a funnel collar above the
shoulders.  Width/depth come from the concept art's silhouette (see
extract_coat_profile.py) widened until it clears the body mesh by 12 mm.

Run inside Blender.
"""
import bpy
import bmesh
import math
import os
import json
import sys
from mathutils import Vector
from mathutils.kdtree import KDTree

PROJ = r"C:/Users/justi/OneDrive/Python/dsw_mod/model_projects/ginaz_swordmaster_purple"
MID = os.path.join(PROJ, "08_scripts", "intermediate_data")

body = bpy.data.objects["GinazSwordmaster"]
arm = bpy.data.objects["Armature"]

# ---------------------------------------------------------------- profile
# (z, half_width, half_depth, front_gap_deg)   measured from the concept art
COAT = [
    (1.680, 0.145, 0.135, 95.0),   # collar rim
    (1.620, 0.132, 0.126, 92.0),
    (1.560, 0.180, 0.168, 74.0),
    (1.500, 0.245, 0.205, 40.0),
    (1.460, 0.270, 0.225, 16.0),
    (1.400, 0.300, 0.235, 0.0),    # shoulders
    (1.300, 0.312, 0.240, 0.0),    # chest
    (1.180, 0.305, 0.238, 0.0),
    (1.100, 0.282, 0.230, 0.0),
    (1.040, 0.262, 0.226, 2.0),    # belt
    (0.980, 0.258, 0.224, 4.0),
    (0.900, 0.266, 0.220, 6.0),    # hip
    (0.720, 0.280, 0.224, 9.0),    # thigh
    (0.530, 0.294, 0.230, 12.0),   # knee
    (0.350, 0.304, 0.235, 14.0),   # shin
    (0.300, 0.300, 0.232, 14.0),   # hem
]
Y_CENTRE = {                      # body centre in Y per height (from body_profile)
    1.68: -0.02, 1.62: -0.02, 1.56: -0.01, 1.50: -0.01, 1.46: -0.01,
    1.40: -0.02, 1.30: -0.02, 1.18: -0.02, 1.10: -0.02, 1.04: -0.01,
    0.98: 0.01, 0.90: 0.03, 0.72: 0.02, 0.53: 0.01, 0.35: 0.01, 0.30: 0.01,
}
COLS = 56                          # columns around the shell


def coat_point(z, w, d, gap_deg, theta):
    """theta in radians, 0 = front (-Y), positive toward +X."""
    yc = Y_CENTRE.get(z, 0.0)
    return Vector((w * math.sin(theta), yc - d * math.cos(theta), z))


def build_coat(scale=1.0, thickness=0.012):
    bm = bmesh.new()
    rows = []
    for (z, w, d, gap) in COAT:
        half = math.radians(gap) / 2.0
        row = []
        for i in range(COLS + 1):
            t = i / COLS
            theta = math.pi - t * (2.0 * math.pi - gap * math.pi / 180.0)
            row.append(bm.verts.new(coat_point(z, w * scale, d * scale, gap, theta)))
        rows.append(row)
    bm.verts.ensure_lookup_table()
    for r0, r1 in zip(rows, rows[1:]):
        for i in range(COLS):
            bm.faces.new((r0[i], r0[i + 1], r1[i + 1], r1[i]))
    # close the seam where the row has no front gap (gap == 0 -> ends coincide)
    bmesh.ops.remove_doubles(bm, verts=bm.verts, dist=1e-5)
    bm.normal_update()
    return bm


def body_bvh():
    from mathutils.bvhtree import BVHTree
    return BVHTree.FromPolygons([v.co.copy() for v in body.data.vertices],
                                [list(p.vertices) for p in body.data.polygons],
                                all_triangles=False)


def clearance(bm, bvh):
    worst = 1e9
    for v in bm.verts:
        loc, nor, idx, dist = bvh.find_nearest(v.co)
        worst = min(worst, dist)
    return worst


def push_out(bm, bvh, margin=0.014, iters=6):
    """Push every coat vertex away from the body surface until it clears it."""
    for _ in range(iters):
        moved = 0
        for v in bm.verts:
            loc, nor, idx, dist = bvh.find_nearest(v.co)
            if dist < margin:
                if nor.length < 1e-6:
                    nor = (v.co - loc)
                    if nor.length < 1e-6:
                        nor = Vector((0, 0, 1))
                    nor.normalize()
                v.co = v.co + nor * (margin - dist + 0.0015)
                moved += 1
        if not moved:
            break
    return moved


def make_coat_object(scale):
    bm = build_coat(scale)
    me = bpy.data.meshes.new("Coat")
    bm.to_mesh(me)
    bm.free()
    ob = bpy.data.objects.new("Coat", me)
    bpy.context.scene.collection.objects.link(ob)
    return ob


# ---------------------------------------------------------------- topknot
def make_bun():
    bm = bmesh.new()
    bmesh.ops.create_uvsphere(bm, u_segments=16, v_segments=10, radius=1.0)
    bmesh.ops.scale(bm, verts=bm.verts, vec=Vector((0.052, 0.046, 0.042)))
    bmesh.ops.translate(bm, verts=bm.verts, vec=Vector((0.0, -0.020, 1.858)))
    me = bpy.data.meshes.new("Bun")
    bm.to_mesh(me)
    bm.free()
    ob = bpy.data.objects.new("Bun", me)
    bpy.context.scene.collection.objects.link(ob)
    return ob


# ---------------------------------------------------------------- run
for name in ("Coat", "Bun"):
    old = bpy.data.objects.get(name)
    if old:
        bpy.data.objects.remove(old, do_unlink=True)

bvh = body_bvh()
coat = make_coat_object(1.0)
bm = bmesh.new()
bm.from_mesh(coat.data)
before = clearance(bm, bvh)
push_out(bm, bvh, margin=0.014, iters=8)
after = clearance(bm, bvh)
bm.to_mesh(coat.data)
bm.free()
for p in coat.data.polygons:
    p.use_smooth = True
print("clearance %.4f -> %.4f" % (before, after))

bun = make_bun()
for p in bun.data.polygons:
    p.use_smooth = True

result = {
    "clearance_before": round(before, 4),
    "clearance_after": round(after, 4),
    "coat_verts": len(coat.data.vertices),
    "coat_faces": len(coat.data.polygons),
    "bun_verts": len(bun.data.vertices),
    "bun_faces": len(bun.data.polygons),
}
print(json.dumps(result))
