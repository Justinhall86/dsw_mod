"""List what a .blend contains (objects, mesh sizes, materials, images) and render front / three-quarter / back previews.

    blender -b --disable-autoexec <file.blend> --python inspect_blend.py -- <out_dir>
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

out = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
os.makedirs(out, exist_ok=True)
print("INSPECT file", bpy.data.filepath)
for o in bpy.data.objects:
    d = o.dimensions
    line = "INSPECT obj %-34s %-9s dims (%.3f %.3f %.3f) loc (%.3f %.3f %.3f) scale (%.2f %.2f %.2f) parent %s" % (
        o.name, o.type, d.x, d.y, d.z, *o.location, *o.scale, o.parent.name if o.parent else None)
    if o.type == "MESH":
        line += " verts %d tris %d mats %s vgroups %d mods %s" % (
            len(o.data.vertices), sum(len(p.vertices) - 2 for p in o.data.polygons),
            [m.name for m in o.data.materials if m], len(o.vertex_groups), [m.type for m in o.modifiers])
    print(line)
for im in bpy.data.images:
    print("INSPECT img %-40s %s packed=%s" % (im.name, tuple(im.size), bool(im.packed_file)))
print("INSPECT collections", [c.name for c in bpy.data.collections])

meshes = [o for o in bpy.data.objects if o.type == "MESH"]
lo = Vector((1e9, 1e9, 1e9))
hi = Vector((-1e9, -1e9, -1e9))
for o in meshes:
    for c in o.bound_box:
        w = o.matrix_world @ Vector(c)
        lo = Vector((min(lo.x, w.x), min(lo.y, w.y), min(lo.z, w.z)))
        hi = Vector((max(hi.x, w.x), max(hi.y, w.y), max(hi.z, w.z)))
print("INSPECT bounds", tuple(round(x, 3) for x in lo), tuple(round(x, 3) for x in hi))
if "--clay" in sys.argv:  # untextured model: grey diffuse, no emission, so the shape reads
    for m in bpy.data.materials:
        if m.use_nodes:
            for n in m.node_tree.nodes:
                if n.type == "BSDF_PRINCIPLED":
                    n.inputs["Base Color"].default_value = (0.45, 0.42, 0.40, 1.0)
                    n.inputs["Emission Strength"].default_value = 0.0
                    n.inputs["Roughness"].default_value = 0.7
    for o in meshes:
        print("INSPECT color attrs", o.name, [c.name for c in o.data.color_attributes])
for o in [o for o in bpy.data.objects if o.type in ("CAMERA", "LIGHT")]:
    bpy.data.objects.remove(o, do_unlink=True)
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(700, 900)
centre = (lo + hi) / 2
scale = max(hi.z - lo.z, hi.x - lo.x) * 1.15
for tag, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0)), ("back", (0, 1, 0))):
    cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=d, distance=scale * 3)
    bs.render_to(os.path.join(out, "meshy_%s.png" % tag), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
