"""Cut one chunk out of a donor vehicle, then render it alone with its real
textures so the piece can be judged on its own before it is used.

    blender -b --factory-startup --python 12_isolate.py -- <donor.fbx> <out_dir> <tag> \
            --box x0,x1:y0,y1:z0,z1   [--px 800] [--rot rx,ry,rz]

`--box` is in ABSOLUTE donor world coordinates (the numbers 11_islands_baked.py
and parts_colour.py print), NOT fractions. Coordinates outside the model are
harmless - they just clamp. This is the same space 10_build_variant.py cuts in,
so a box that isolates the right chunk here is the box to paste into the spec.

Everything is baked through the evaluated depsgraph first: HMD-converted meshes
store BIND pose in mesh.data, so raw coordinates do not match what renders.
"""
import math
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

a = sys.argv[sys.argv.index("--") + 1:]
src, out_dir, tag = os.path.abspath(a[0]), os.path.abspath(a[1]), a[2]
px = int(a[a.index("--px") + 1]) if "--px" in a else 800
boxspec = a[a.index("--box") + 1] if "--box" in a else None
rotspec = a[a.index("--rot") + 1] if "--rot" in a else "0,0,0"

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs  # noqa: E402

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=src)
bpy.context.view_layer.update()
for o in list(bpy.data.objects):
    if o.type != "MESH":
        continue
    if o.name.split(".")[0] in bs.JUNK_NAMES:
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
if not meshes:
    raise SystemExit("no mesh in " + src)

# bake evaluated pose into the vertices, drop the rig, local == world
for o in meshes:
    dg = bpy.context.evaluated_depsgraph_get()
    ev = o.evaluated_get(dg)
    me = ev.to_mesh()
    coords = [(o.matrix_world @ me.vertices[i].co).copy() for i in range(len(me.vertices))]
    ev.to_mesh_clear()
    if len(coords) == len(o.data.vertices):
        for i, v in enumerate(o.data.vertices):
            v.co = coords[i]
    else:
        mw = o.matrix_world.copy()
        for v in o.data.vertices:
            v.co = mw @ v.co
    o.data.update()
    for mod in list(o.modifiers):
        if mod.type == "ARMATURE":
            o.modifiers.remove(mod)
    o.parent = None
    o.matrix_world = Matrix.Identity(4)
bpy.context.view_layer.update()


def bounds(objs):
    mn = Vector((1e18,) * 3)
    mx = Vector((-1e18,) * 3)
    for o in objs:
        for v in o.data.vertices:
            p = v.co
            mn.x, mn.y, mn.z = min(mn.x, p.x), min(mn.y, p.y), min(mn.z, p.z)
            mx.x, mx.y, mx.z = max(mx.x, p.x), max(mx.y, p.y), max(mx.z, p.z)
    return mn, mx


mn0, mx0 = bounds(meshes)
print("DONOR dims %.3f %.3f %.3f  lo %.3f %.3f %.3f  hi %.3f %.3f %.3f"
      % (mx0.x - mn0.x, mx0.y - mn0.y, mx0.z - mn0.z, mn0.x, mn0.y, mn0.z, mx0.x, mx0.y, mx0.z))

if boxspec:
    parts = [[float(v) for v in p.split(",")] for p in boxspec.split(":")]
    x0, x1 = parts[0]
    y0, y1 = parts[1]
    z0, z1 = parts[2]
    kept = total = 0
    for o in meshes:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        doomed = []
        for f in bm.faces:
            total += 1
            c = f.calc_center_median()
            if x0 <= c.x <= x1 and y0 <= c.y <= y1 and z0 <= c.z <= z1:
                kept += 1
            else:
                doomed.append(f)
        for f in doomed:
            bm.faces.remove(f)
        for v in [v for v in bm.verts if not v.link_faces]:
            bm.verts.remove(v)
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()
    print("CUT kept %d/%d faces (%.1f%%)" % (kept, total, 100.0 * kept / max(total, 1)))
    if kept == 0:
        raise SystemExit("box kept nothing - box_abs is wrong")
    meshes = [o for o in meshes if len(o.data.polygons)]
    if not meshes:
        raise SystemExit("nothing left after cut")

rx, ry, rz = [math.radians(float(v)) for v in rotspec.split(",")]
rm = Matrix.Rotation(rz, 4, 'Z') @ Matrix.Rotation(ry, 4, 'Y') @ Matrix.Rotation(rx, 4, 'X')
if any(abs(v) > 1e-9 for v in (rx, ry, rz)):
    for o in meshes:
        for v in o.data.vertices:
            v.co = rm @ v.co
        o.data.update()

# centre on the origin so the render is stable
mn, mx = bounds(meshes)
c = (mn + mx) / 2
for o in meshes:
    for v in o.data.vertices:
        v.co = v.co - c
    o.data.update()
mn, mx = bounds(meshes)
d = mx - mn
print("ISOLATED %s dims %.3f x %.3f x %.3f  (x %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f)"
      % (tag, d.x, d.y, d.z, mn.x, mx.x, mn.y, mx.y, mn.z, mx.z))
print("ISOLATED longest=%.3f  tri_count=%d"
      % (max(d.x, d.y, d.z),
         sum(len(o.data.loop_triangles) for o in meshes if o.data.calc_loop_triangles() is None)))

bs.setup_render(px, px)
bs.setup_world()
bs.setup_lights()
size = max(d.x, d.y, d.z)
os.makedirs(out_dir, exist_ok=True)
views = {
    "tq": (0.75, -0.75, 0.35),
    "front": (0.0, -1.0, 0.05),
    "side": (1.0, 0.0, 0.05),
    "top": (0.0, -0.001, 1.0),
}
for name, dirv in views.items():
    dv = Vector(dirv).normalized()
    cam = bs.setup_camera(target=Vector((0, 0, 0)), ortho_scale=size * 1.30, distance=size * 2.5)
    cam.location = dv * size * 2.5
    cam.rotation_euler = (Vector((0, 0, 0)) - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(out_dir, "%s_iso_%s.png" % (tag, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("ISOLATE DONE", tag)
