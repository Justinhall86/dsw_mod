"""Numeric symmetry test for a donor vehicle, plus a per-slice width profile.

    blender -b --factory-startup --python 14_symmetry.py -- <donor.fbx> [more.fbx ...]

A kitbash host has to be mirror-symmetric about x = 0 or the finished fighter
looks lopsided the moment a symmetric donor part is mounted on it. This reports
how far the evaluated mesh deviates from its own mirror image, and prints the
half-width at each station down the y axis so mount points can be placed where
the hull actually has material.
"""
import os
import sys

import bpy
from mathutils import Matrix, Vector

files = sys.argv[sys.argv.index("--") + 1:]

for src in files:
    src = os.path.abspath(src)
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=src)
    bpy.context.view_layer.update()
    for o in list(bpy.data.objects):
        if o.type == "MESH" and o.name.split(".")[0] in ("Cube", "Camera", "Light", "Lamp"):
            bpy.data.objects.remove(o, do_unlink=True)
    meshes = [o for o in bpy.data.objects if o.type == "MESH"]
    pts = []
    for o in meshes:
        dg = bpy.context.evaluated_depsgraph_get()
        ev = o.evaluated_get(dg)
        me = ev.to_mesh()
        mw = o.matrix_world.copy()
        pts.extend([mw @ v.co for v in me.vertices])
        ev.to_mesh_clear()
    if not pts:
        print("EMPTY", src)
        continue

    mn = Vector((min(p.x for p in pts), min(p.y for p in pts), min(p.z for p in pts)))
    mx = Vector((max(p.x for p in pts), max(p.y for p in pts), max(p.z for p in pts)))
    size = mx - mn
    c = (mn + mx) / 2

    # symmetry: bin vertices into a coarse grid, build the x-mirrored occupancy
    # set, and report the fraction of cells that have no mirror partner.
    step = max(size.x, size.y) / 48.0
    grid = set()
    for p in pts:
        key = (round((p.x - c.x) / step),
               round((p.y - c.y) / step),
               round((p.z - c.z) / step))
        grid.add(key)
    unpaired = sum(1 for (ix, iy, iz) in grid if (-ix, iy, iz) not in grid)
    frac = 100.0 * unpaired / max(len(grid), 1)

    print("=" * 74)
    print("%-40s dims %.2f x %.2f x %.2f  verts %d" %
          (os.path.basename(os.path.dirname(src)) + "/" + os.path.basename(src),
           size.x, size.y, size.z, len(pts)))
    print("  SYMMETRY unpaired %.1f%% of %d grid cells (%s)"
          % (frac, len(grid), "symmetric" if frac < 6 else
             "close" if frac < 15 else "ASYMMETRIC"))

    # width profile: half-width of the hull at each y station
    nb = 10
    print("  %-8s %8s %8s  %s" % ("y_frac", "halfw", "height", "comment"))
    for i in range(nb):
        y0 = mn.y + size.y * i / nb
        y1 = mn.y + size.y * (i + 1) / nb
        band = [p for p in pts if y0 <= p.y <= y1]
        if not band:
            print("  %-8.2f %8s %8s  (empty)" % ((i + 0.5) / nb, "-", "-"))
            continue
        bx = max(abs(p.x - c.x) for p in band)
        bz = max(p.z for p in band) - min(p.z for p in band)
        print("  %-8.2f %8.2f %8.2f  %s"
              % (i / (nb - 1.0) - 0.5, bx, bz, "#" * int(bx / max(size.x, 1e-6) * 40)))
print("SYMMETRY DONE")
