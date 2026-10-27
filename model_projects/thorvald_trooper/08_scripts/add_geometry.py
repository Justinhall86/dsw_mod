"""Add real triangles where the silhouette is faceted: subdivide named parts (skin weights, UVs and materials survive) and report the budget.

    blender -b <unit.blend> --python add_geometry.py -- <out.blend> [--subsurf Obj[:levels]]... [--simple Obj[:levels]]... [--max-tris 9500]

    --subsurf OBJ[:N]   Catmull-Clark N levels (default 1) - rounds collars, hats, coats, cylinders.  Shrinks convex shapes a little: check the render.
    --simple OBJ[:N]    "Simple" subdivision: only adds triangles, keeps the shape exactly (use before a smoothing/relief pass or for even skin deformation).
    --max-tris N        refuse to save when the total passes N (default 12000, the vanilla ceiling).

Each result keeps vertex groups (weights are interpolated), the armature modifier, materials and UV islands (boundaries preserved).
It saves to <out.blend> and never overwrites the input.  Vertex influences are limited to 3 and normalised afterwards (game limit).
Hand-modelled extras (domed buttons, rolled collar rims, buns, sash tails) are separate: see hardware.py and the recipes in dsw-new-unit.
"""
import os
import sys

import bpy

argv = sys.argv[sys.argv.index("--") + 1:]
OUT = os.path.abspath(argv[0])
MAX = int(argv[argv.index("--max-tris") + 1]) if "--max-tris" in argv else 12000


def specs(flag):
    out = []
    for i, a in enumerate(argv):
        if a == flag:
            name, _, lv = argv[i + 1].partition(":")
            out.append((name, int(lv or 1)))
    return out


def tris(o):
    o.data.calc_loop_triangles()
    return len(o.data.loop_triangles)


def subdivide(name, levels, mode):
    obj = bpy.data.objects[name]
    before = tris(obj)
    mod = obj.modifiers.new("up_subsurf", "SUBSURF")
    mod.levels = levels
    mod.render_levels = levels
    mod.subdivision_type = "SIMPLE" if mode == "simple" else "CATMULL_CLARK"
    mod.uv_smooth = "PRESERVE_BOUNDARIES"
    mod.boundary_smooth = "PRESERVE_CORNERS"
    others = [m for m in obj.modifiers if m is not mod]
    shown = [m.show_viewport for m in others]
    for m in others:                                   # apply only the subdivision: the armature modifier must not bake the pose in
        m.show_viewport = False
    with bpy.context.temp_override(object=obj, active_object=obj):
        bpy.ops.object.modifier_apply(modifier=mod.name)
    for m, s in zip(others, shown):
        m.show_viewport = s
    if obj.vertex_groups:
        with bpy.context.temp_override(object=obj, active_object=obj):
            bpy.ops.object.vertex_group_limit_total(group_select_mode="ALL", limit=3)
            bpy.ops.object.vertex_group_normalize_all(group_select_mode="ALL", lock_active=False)
    print("SUBDIVIDED %-20s %s x%d  %d -> %d tris" % (name, mode, levels, before, tris(obj)))


before_total = sum(tris(o) for o in bpy.data.objects if o.type == "MESH")
for name, lv in specs("--subsurf"):
    subdivide(name, lv, "catmull")
for name, lv in specs("--simple"):
    subdivide(name, lv, "simple")
after_total = sum(tris(o) for o in bpy.data.objects if o.type == "MESH")
print("TOTAL tris %d -> %d (ceiling %d)" % (before_total, after_total, MAX))
if after_total > MAX:
    raise SystemExit("over the triangle ceiling (%d > %d): lower a level or subdivide fewer parts" % (after_total, MAX))
if os.path.abspath(OUT) == os.path.abspath(bpy.data.filepath):
    raise SystemExit("refusing to overwrite the input blend")
bpy.ops.wm.save_as_mainfile(filepath=OUT, compress=True)
print("SAVED", OUT)
