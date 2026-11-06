"""Step 01 - analyse a model to find removable parts.

Prints, for every connected component of the mesh:
  * vertex and triangle count
  * world bounding box
  * the dominant bone of its vertices
  * the number of boundary (open) edges

Then optionally renders each component on its own so it can be identified.

    blender -b --python 01_analyse_mesh.py -- <model.fbx> [--shots <dir>]

THE MOST IMPORTANT RULE: to identify a piece, RENDER IT ALONE.  Hiding a
component and rendering the rest is not enough - the rest of the model still
occludes the view and the shot is misleading.  This script removes every
other component for each shot.
"""
import os
import sys
from collections import Counter

import bpy
import bmesh
import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import connected_components, script_args

argv = script_args()
model = argv[0] if argv else ""
shots = None
if "--shots" in argv:
    shots = argv[argv.index("--shots") + 1]

if not model:
    raise SystemExit("usage: 01_analyse_mesh.py -- <model.fbx> [--shots <dir>]")

bs.reset_scene()
body, rig = bs.import_model(model)
me = body.data
print("MODEL", model)
print("MESH verts %d tris %d vgroups %d"
      % (len(me.vertices), len(me.polygons), len(body.vertex_groups)))
if rig:
    print("RIG bones %d" % len(rig.data.bones))

order, roots = connected_components(len(me.vertices), [list(p.vertices) for p in me.polygons])
print("\nCOMPONENTS: %d" % len(order))

# boundary edges per component
comp_of = {}
for i, root in enumerate(order):
    for v in roots[root]:
        comp_of[v] = i
bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
bm.edges.ensure_lookup_table()
boundary = {}
for e in bm.edges:
    if len(e.link_faces) == 1:
        c = comp_of[e.verts[0].index]
        boundary[c] = boundary.get(c, 0) + 1
bm.free()

dom = bs.dominant_bone_per_vertex(body)
wp = bs.world_positions(body)

info = []
for i, root in enumerate(order):
    verts = roots[root]
    co = wp[verts]
    tris = sum(1 for p in me.polygons if comp_of[p.vertices[0]] == i)
    bones = Counter(dom[v] for v in verts).most_common(1)[0][0]
    info.append({
        "id": i, "verts": len(verts), "tris": tris,
        "lo": co.min(axis=0), "hi": co.max(axis=0), "bone": bones,
        "boundary": boundary.get(i, 0),
    })

info.sort(key=lambda d: -d["verts"])
print("\n  id  verts   tris  bnd   bone                 x                y                z")
for d in info:
    print("  %2d %6d %6d %4d  %-18s %5.2f..%5.2f  %5.2f..%5.2f  %5.2f..%5.2f"
          % (d["id"], d["verts"], d["tris"], d["boundary"], d["bone"],
             d["lo"][0], d["hi"][0], d["lo"][1], d["hi"][1], d["lo"][2], d["hi"][2]))

# ---- render each component alone -------------------------------------
if shots:
    os.makedirs(shots, exist_ok=True)
    bs.setup_render(560, 700)
    bs.setup_world(strength=2.4, color=(0.72, 0.74, 0.78))
    bs.setup_lights(sun_energy=3.0, fill_energy=100)

    for d in info:
        keep = set(roots[order[d["id"]]])
        bm = bmesh.new()
        bm.from_mesh(me)
        bm.verts.ensure_lookup_table()
        for f in list(bm.faces):
            if f.verts[0].index not in keep:
                bm.faces.remove(f)
        bm.to_mesh(me)
        bm.free()
        me.update()

        co = wp[sorted(keep)]
        centre = ((co[:, 0].min() + co[:, 0].max()) / 2,
                  (co[:, 1].min() + co[:, 1].max()) / 2,
                  (co[:, 2].min() + co[:, 2].max()) / 2)
        h = max(co[:, 2].max() - co[:, 2].min(), 0.10)
        w = max(co[:, 0].max() - co[:, 0].min(), co[:, 1].max() - co[:, 1].min(), 0.10)
        cam = bs.setup_camera(target=centre, ortho_scale=max(h, w) * 1.4,
                              direction=(0.0, 1.0, 0.0),
                              distance=max(h, w) * 2.5)
        path = os.path.join(shots, "comp_%02d.png" % d["id"])
        bs.render_to(path, cam)
        print("SHOT comp %02d -> %s" % (d["id"], path))

        # restore for the next component
        bs.reset_scene()
        body, rig = bs.import_model(model)
        me = body.data
        order, roots = connected_components(
            len(me.vertices), [list(p.vertices) for p in me.polygons])
        comp_of = {}
        for i, root in enumerate(order):
            for v in roots[root]:
                comp_of[v] = i
        dom = bs.dominant_bone_per_vertex(body)
        wp = bs.world_positions(body)
        bpy.context.view_layer.update()
