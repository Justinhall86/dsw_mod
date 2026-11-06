"""Render a donor vehicle with a candidate extract box drawn as a translucent
cage, so an extract region is CHOSEN BY LOOKING, not guessed.

    blender -b --factory-startup --python 09_probe_box.py -- <donor.fbx> <out_dir> <tag> \
            --box x0,x1,y0,y1,z0,z1

The box is in FRACTIONS of the donor's own half-extent (-1..1 each axis), the
same convention 10_build_variant.py uses, so a box that looks right here is
exactly the box that will be cut.
"""
import os
import sys
import math

import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
src = os.path.abspath(a[0])
out_dir = os.path.abspath(a[1])
tag = a[2]
boxspec = a[a.index("--box") + 1]
box = [[float(v) for v in part.split(",")] for part in boxspec.split(":")]
# "--box x0,x1:y0,y1:z0,z1"

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs  # noqa: E402

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=src)
for junk in bs.JUNK_NAMES:
    o = bpy.data.objects.get(junk)
    if o and o.type == "MESH":
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
body = max(meshes, key=lambda o: len(o.data.polygons))


def bake_pose(obj):
    dg = bpy.context.evaluated_depsgraph_get()
    ev = obj.evaluated_get(dg)
    me = ev.to_mesh()
    if len(me.vertices) == len(obj.data.vertices):
        for i, v in enumerate(obj.data.vertices):
            v.co = me.vertices[i].co
    ev.to_mesh_clear()
    obj.data.update()
    for mod in list(obj.modifiers):
        if mod.type == "ARMATURE":
            obj.modifiers.remove(mod)
    if obj.parent is not None and obj.parent.type == "ARMATURE":
        arm = obj.parent
        newp = arm.parent
        if newp is not None:
            obj.matrix_parent_inverse = newp.matrix_world.inverted()
        obj.parent = newp


for m in meshes:
    bake_pose(m)
bpy.context.view_layer.update()


def world_bounds(objs):
    mn = Vector((1e9,) * 3)
    mx = Vector((-1e9,) * 3)
    mw_pts = []
    for o in objs:
        mw = o.matrix_world
        for v in o.data.vertices:
            p = mw @ v.co
            mw_pts.append(p)
            mn.x, mn.y, mn.z = min(mn.x, p.x), min(mn.y, p.y), min(mn.z, p.z)
            mx.x, mx.y, mx.z = max(mx.x, p.x), max(mx.y, p.y), max(mx.z, p.z)
    return mn, mx


mn, mx = world_bounds(meshes)
half = (mx - mn) / 2
centre = (mn + mx) / 2

# box corners in world space
bx0 = centre.x + box[0][0] * half.x
bx1 = centre.x + box[0][1] * half.x
by0 = centre.y + box[1][0] * half.y
by1 = centre.y + box[1][1] * half.y
bz0 = centre.z + box[2][0] * half.z
bz1 = centre.z + box[2][1] * half.z

# how many faces fall inside -> is the box actually capturing anything?
inside = 0
total = 0
for o in meshes:
    mw = o.matrix_world
    for poly in o.data.polygons:
        c = mw @ poly.center
        total += 1
        if bx0 <= c.x <= bx1 and by0 <= c.y <= by1 and bz0 <= c.z <= bz1:
            inside += 1

# translucent cage
mat = bpy.data.materials.new("BoxCage")
mat.use_nodes = True
mat.blend_method = "BLEND"
nt = mat.node_tree
for n in list(nt.nodes):
    nt.nodes.remove(n)
emit = nt.nodes.new("ShaderNodeEmission")
emit.inputs[0].default_value = (1.0, 0.35, 0.05, 1)
emit.inputs[1].default_value = 1.4
out = nt.nodes.new("ShaderNodeOutputMaterial")
nt.links.new(emit.outputs[0], out.inputs[0])

bpy.ops.mesh.primitive_cube_add(
    size=1,
    location=((bx0 + bx1) / 2, (by0 + by1) / 2, (bz0 + bz1) / 2),
)
cage = bpy.context.active_object
cage.scale = (max(bx1 - bx0, 1e-4), max(by1 - by0, 1e-4), max(bz1 - bz0, 1e-4))
cage.data.materials.append(mat)
cage.display_type = "WIRE"

# shrink the donor to solid dark so the cage reads
for o in meshes:
    mm = bpy.data.materials.new("Clay_" + o.name)
    mm.use_nodes = True
    b = mm.node_tree.nodes.get("Principled BSDF")
    if b:
        b.inputs["Base Color"].default_value = (0.30, 0.31, 0.33, 1)
        b.inputs["Roughness"].default_value = 0.6
    o.data.materials.clear()
    o.data.materials.append(mm)

size = max(mx.x - mn.x, mx.y - mn.y, mx.z - mn.z)
bs.setup_render(900, 900)
bs.setup_world()
bs.setup_lights()
target = centre
cam = bs.setup_camera(target=target, ortho_scale=size * 1.25, distance=size * 2.5)

os.makedirs(out_dir, exist_ok=True)
views = {
    "tq": (0.75, -0.75, 0.35),
    "front": (0.0, -1.0, 0.05),
    "side": (1.0, 0.0, 0.05),
    "top": (0.0, -0.001, 1.0),
}
for name, d in views.items():
    dv = Vector(d).normalized()
    cam.location = Vector(target) + dv * size * 2.5
    cam.rotation_euler = (Vector(target) - cam.location).to_track_quat("-Z", "Y").to_euler()
    p = os.path.join(out_dir, "%s_box_%s.png" % (tag, name))
    bs.render_to(p, cam)

print("PROBE %s box=[%s] faces_inside=%d/%d (%.1f%%)"
      % (tag, boxspec, inside, total, 100.0 * inside / max(total, 1)))
