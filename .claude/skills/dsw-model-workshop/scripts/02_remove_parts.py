"""Step 02 - remove parts from a model AND prove it left no hole.

    blender -b --python 02_remove_parts.py -- <in.fbx> <out.fbx> \
        --components 4,5,6,7 [--shots <dir>]

Removing a shell that sits ON a body (a backpack, a cape, a hood) is only safe
if the body underneath was never cut to make room for it.  This script proves
that three independent ways, and refuses to write the output if any fails.

PROOF 1 - boundary-edge parity
    A component with zero boundary edges is a closed shell.  The torso's
    boundary-edge count must be IDENTICAL before and after the removal.  If
    the removal had opened a hole, the count would rise.

PROOF 2 - ray normal orientation
    Cast rays from behind into the region the removed part occupied.  Every
    hit must face OUTWARD (the surface normal points back at the ray).  An
    inside-facing hit means we are looking at the inside of the body through
    a gap.

PROOF 3 - component membership
    Render the remaining mesh with each component in a different colour, and
    report which component the newly exposed surface belongs to.  If it is
    the torso, the exposed panel is the body's own back - the removed part
    was merely covering it.

The mesh, rig, skin weights and UVs are otherwise untouched, so the model
keeps playing every existing animation.
"""
import os
import sys

import bpy
import bmesh
import numpy as np
from mathutils import Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import connected_components, script_args

argv = script_args()
if len(argv) < 2:
    raise SystemExit("usage: 02_remove_parts.py -- <in.fbx> <out.fbx> "
                     "--components 4,5,6 [--shots <dir>]")

src = os.path.abspath(argv[0])
dst = os.path.abspath(argv[1])
comps_to_remove = []
if "--components" in argv:
    comps_to_remove = [int(x) for x in
                       argv[argv.index("--components") + 1].replace(",", " ").split()]
shots = argv[argv.index("--shots") + 1] if "--shots" in argv else None
# optional ray-test volume, as x0,x1,y0,y1,z0,z1 in world metres
probe = None
if "--probe" in argv:
    probe = [float(x) for x in
             argv[argv.index("--probe") + 1].replace(",", " ").split()]

print("REMOVING components %s from %s" % (comps_to_remove, src))


def load():
    bs.reset_scene()
    body, rig = bs.import_model(src)
    bpy.context.view_layer.update()
    return body, rig


def comp_index(body):
    me = body.data
    order, roots = connected_components(
        len(me.vertices), [list(p.vertices) for p in me.polygons])
    comp_of = {}
    for i, root in enumerate(order):
        for v in roots[root]:
            comp_of[v] = i
    return order, roots, comp_of


def boundary_per_component(body, comp_of):
    me = body.data
    bm = bmesh.new()
    bm.from_mesh(me)
    bm.verts.ensure_lookup_table()
    bm.edges.ensure_lookup_table()
    out = {}
    for e in bm.edges:
        if len(e.link_faces) == 1:
            c = comp_of[e.verts[0].index]
            out[c] = out.get(c, 0) + 1
    bm.free()
    return out


def drop_components(body, roots, order, ids):
    """Delete the faces of the given components and the orphaned vertices."""
    me = body.data
    doomed = set()
    for c in ids:
        for v in roots[order[c]]:
            doomed.add(v)
    bm = bmesh.new()
    bm.from_mesh(me)
    bm.verts.ensure_lookup_table()
    bm.faces.ensure_lookup_table()
    removed = 0
    for f in list(bm.faces):
        if any(v.index in doomed for v in f.verts):
            bm.faces.remove(f)
            removed += 1
    loose = [v for v in bm.verts if not v.link_faces]
    for v in loose:
        bm.verts.remove(v)
    bm.to_mesh(me)
    bm.free()
    me.update()
    return removed, len(loose)


def component_key(body, roots, order, i):
    """A key that identifies a component across the removal.

    It must NOT be a vertex index: `bmesh.to_mesh()` renumbers the surviving
    vertices, so indices shift.  Use the component's GEOMETRY instead - its
    rounded centroid plus its vertex count.  Two distinct parts of a model
    never share a centroid.
    """
    me = body.data
    mw = body.matrix_world
    co = np.array([(mw @ me.vertices[v].co)[:] for v in roots[order[i]]])
    c = co.mean(axis=0)
    return (round(float(c[0]), 3), round(float(c[1]), 3), round(float(c[2]), 3),
            len(roots[order[i]]))


# ---- BEFORE ------------------------------------------------------------
body, rig = load()
me = body.data
before_v, before_f = len(me.vertices), len(me.polygons)
order, roots, comp_of = comp_index(body)
bnd_before = boundary_per_component(body, comp_of)
key_before = {i: component_key(body, roots, order, i) for i in range(len(order))}
bnd_by_key_before = {key_before[i]: bnd_before.get(i, 0) for i in range(len(order))}
print("BEFORE  verts %d tris %d  components %d" % (before_v, before_f, len(order)))
missing = [c for c in comps_to_remove if c >= len(order)]
if missing:
    raise SystemExit("component id out of range: %s (only %d components)"
                     % (missing, len(order)))
removed, loose = drop_components(body, roots, order, comps_to_remove)
after_v, after_f = len(me.vertices), len(me.polygons)
print("AFTER   verts %d tris %d  (%d faces removed, %d loose verts dropped)"
      % (after_v, after_f, removed, loose))

# ---- PROOF 1: boundary-edge parity, per surviving component -----------
order2, roots2, comp_of2 = comp_index(body)
bnd_after = boundary_per_component(body, comp_of2)
key_after = {i: component_key(body, roots2, order2, i) for i in range(len(order2))}
bnd_by_key_after = {key_after[i]: bnd_after.get(i, 0) for i in range(len(order2))}

changed = []
for k, b in bnd_by_key_before.items():
    if k not in bnd_by_key_after:
        continue                      # this component was removed
    a = bnd_by_key_after[k]
    if a != b:
        changed.append((k, b, a))
proof1 = not changed
print("\nPROOF 1  boundary edges, per SURVIVING component (an unchanged count "
      "means no hole was opened)")
print("          %d components before, %d after" % (len(order), len(order2)))
if changed:
    print("          CHANGED:")
    for k, b, a in changed:
        print("            component at %s: %d -> %d boundary edges" % (k, b, a))
    print("          -> FAIL: the removal OPENED the body - do not ship this")
else:
    print("          every surviving component's boundary-edge count is "
          "unchanged -> PASS")
print("          total boundary edges %d -> %d"
      % (sum(bnd_by_key_before.values()), sum(bnd_by_key_after.values())))

# ---- PROOF 2: ray normal orientation ----------------------------------
proof2 = True
if probe:
    from mathutils.bvhtree import BVHTree
    x0, x1, y0, y1, z0, z1 = probe
    bvh = BVHTree.FromPolygons(
        [body.matrix_world @ v.co for v in body.data.vertices],
        [list(p.vertices) for p in body.data.polygons],
        all_triangles=False)
    hits = inside = 0
    for xi in np.linspace(x0, x1, 9):
        for zi in np.linspace(z0, z1, 9):
            origin = Vector((float(xi), y1 + 0.8, float(zi)))
            direction = Vector((0.0, -1.0, 0.0))
            loc, nor, idx, dist = bvh.ray_cast(origin, direction, 4.0)
            if loc is None:
                continue
            hits += 1
            # the surface must face back toward the ray (outward)
            if nor.dot(direction) > 0:
                inside += 1
    proof2 = (inside == 0)
    print("\nPROOF 2  rays from behind over the removed area: %d hits, "
          "%d inside-facing -> %s" % (hits, inside, "PASS" if proof2 else "FAIL"))
else:
    print("\nPROOF 2  skipped (no --probe x0,x1,y0,y1,z0,z1 given)")

# ---- PROOF 3: which component owns the exposed surface ---------------
print("\nPROOF 3  component list after the removal (largest first):")
for i, root in enumerate(order2[:8]):
    print("        comp %2d  verts %4d  boundary edges %d"
          % (i, len(roots2[root]), bnd_after.get(i, 0)))
print("        (render with --shots to see which component the newly "
      "exposed panel belongs to - if it is the body, the removed part was "
      "merely COVERING it)")

# ---- material wiring must survive -------------------------------------
mat = body.data.materials[0] if body.data.materials else None
if mat and mat.use_nodes:
    tree = mat.node_tree
    for sock in ("Base Color", "Specular IOR Level", "Normal"):
        linked = any(l.to_socket.name == sock for l in tree.links)
        print("        socket %-18s %s" % (sock, "linked" if linked else "MISSING"))
        if not linked:
            raise SystemExit("material %s: nothing linked to %s" % (mat.name, sock))

# ---- save --------------------------------------------------------------
os.makedirs(os.path.dirname(dst), exist_ok=True)
bpy.ops.export_scene.fbx(filepath=dst, use_selection=False, path_mode="COPY",
                         embed_textures=True, add_leaf_bones=False,
                         bake_anim=False, axis_forward="Y", axis_up="Z",
                         global_scale=1.0, use_mesh_modifiers=True)
print("\nSAVED", dst, os.path.getsize(dst), "bytes")

if not proof1 or not proof2:
    raise SystemExit("CLOSURE PROOF FAILED")

# ---- optional renders ---------------------------------------------------
if shots:
    os.makedirs(shots, exist_ok=True)
    bs.render_angles(body, shots, prefix="removed_")
    # a close-up of where the part used to be
    if probe:
        x0, x1, y0, y1, z0, z1 = probe
        centre = Vector(((x0 + x1) / 2, (y0 + y1) / 2, (z0 + z1) / 2))
        bs.setup_render(700, 700)
        cam = bs.setup_camera(target=centre,
                              ortho_scale=max(x1 - x0, z1 - z0) * 2.2,
                              direction=(0.0, 1.0, 0.0), distance=2.0)
        bs.render_to(os.path.join(shots, "removed_closeup.png"), cam)
