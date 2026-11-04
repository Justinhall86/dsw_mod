"""Small hard-surface kit for the House Thorvald buildings (bpy module, headless).

Everything is built from bmesh primitives with the house palette (art_direction.md): gunmetal plates, rust-brown
cloth, copper trim, burnt-orange accents and emissive lamps. Z is up, the front faces -Y, the ground is z = 0.
"""
import math
import os

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
EMBLEM_PNG = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))), "house_thorvald", "images", "emblem_gear_star.png")


def lin(h):
    """#RRGGBB -> linear RGBA."""
    c = [int(h[i:i + 2], 16) / 255.0 for i in (1, 3, 5)]
    c = [x / 12.92 if x <= 0.04045 else ((x + 0.055) / 1.055) ** 2.4 for x in c]
    return (c[0], c[1], c[2], 1.0)


# name: (hex, metallic, roughness, emission strength)
PAL = {
    "gun":       ("#37312A", 0.55, 0.55, 0),
    "plate":     ("#4B443B", 0.45, 0.60, 0),
    "slab":      ("#4A433B", 0.05, 0.85, 0),
    "rust":      ("#70341E", 0.10, 0.80, 0),
    "rust_deep": ("#48241A", 0.05, 0.85, 0),
    "copper":    ("#B26E3C", 0.90, 0.35, 0),
    "burnt":     ("#CC5500", 0.20, 0.55, 0),
    "glass":     ("#0B0D10", 0.00, 0.12, 0),
    "lamp":      ("#FF8A2A", 0.00, 0.40, 7.0),
    "rock":      ("#5C4A3A", 0.00, 0.95, 0),
}
M = {}


def make_materials():
    M.clear()
    for name, (hx, met, rough, emit) in PAL.items():
        m = bpy.data.materials.new("Thorvald_" + name)
        m.use_nodes = True
        b = next(n for n in m.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
        b.inputs["Base Color"].default_value = lin(hx)
        b.inputs["Metallic"].default_value = met
        b.inputs["Roughness"].default_value = rough
        if emit:
            b.inputs["Emission Color"].default_value = lin(hx)
            b.inputs["Emission Strength"].default_value = emit
        M[name] = m
    m = bpy.data.materials.new("Thorvald_emblem")
    m.use_nodes = True
    nt = m.node_tree
    b = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
    t = nt.nodes.new("ShaderNodeTexImage")
    t.image = bpy.data.images.load(EMBLEM_PNG)
    t.image.colorspace_settings.name = "sRGB"
    nt.links.new(t.outputs["Color"], b.inputs["Base Color"])
    nt.links.new(t.outputs["Alpha"], b.inputs["Alpha"])
    b.inputs["Roughness"].default_value = 0.5
    M["emblem"] = m


OBJS = []


def _obj(name, bm, mat, loc, rot=(0, 0, 0)):
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
    me = bpy.data.meshes.new(name)
    bm.to_mesh(me)
    bm.free()
    ob = bpy.data.objects.new(name, me)
    bpy.context.scene.collection.objects.link(ob)
    ob.location = loc
    ob.rotation_euler = rot
    me.materials.append(M[mat])
    OBJS.append(ob)
    return ob


def box(name, size, loc, mat, bevel=0.04, rot=(0, 0, 0), center=False):
    """loc = bottom centre unless center=True."""
    sx, sy, sz = size
    bm = bmesh.new()
    bmesh.ops.create_cube(bm, size=1.0)
    for v in bm.verts:
        v.co.x *= sx
        v.co.y *= sy
        v.co.z *= sz
    b = min(bevel, 0.4 * min(size))
    if b > 0.004:
        bmesh.ops.bevel(bm, geom=bm.edges[:], offset=b, segments=1, affect="EDGES")
    x, y, z = loc
    if not center:
        z += sz / 2
    return _obj(name, bm, mat, (x, y, z), rot)


def cyl(name, r, h, loc, mat, r2=None, segs=24, rot=(0, 0, 0), center=False, scale=(1, 1, 1)):
    """Cylinder / frustum along local Z (rot it for other axes). loc = bottom centre unless center=True."""
    bm = bmesh.new()
    bmesh.ops.create_cone(bm, cap_ends=True, cap_tris=False, segments=segs,
                          radius1=r, radius2=r if r2 is None else r2, depth=h)
    for v in bm.verts:
        v.co.x *= scale[0]
        v.co.y *= scale[1]
        v.co.z *= scale[2]
    x, y, z = loc
    if not center:
        z += h * scale[2] / 2
    return _obj(name, bm, mat, (x, y, z), rot)


def half_barrel(name, r, length, loc, mat, squash=0.7, segs=32):
    """Upper half of a cylinder lying along X (a barrel vault roof). loc = centre of the flat side."""
    bm = bmesh.new()
    bmesh.ops.create_cone(bm, cap_ends=True, cap_tris=False, segments=segs, radius1=r, radius2=r, depth=length)
    for v in bm.verts:
        v.co = Vector((v.co.z, v.co.x, v.co.y * 0 + v.co.y))          # axis Z -> axis X
    for v in bm.verts:
        v.co.z *= squash
    geom = bm.verts[:] + bm.edges[:] + bm.faces[:]
    bmesh.ops.bisect_plane(bm, geom=geom, plane_co=(0, 0, 0), plane_no=(0, 0, 1), clear_inner=True)
    return _obj(name, bm, mat, loc)


def sphere(name, r, loc, mat, scale=(1, 1, 1), seed=0):
    bm = bmesh.new()
    bmesh.ops.create_icosphere(bm, subdivisions=2, radius=r)
    import random
    rnd = random.Random(seed)
    for v in bm.verts:
        v.co.x *= scale[0] * (0.85 + 0.3 * rnd.random())
        v.co.y *= scale[1] * (0.85 + 0.3 * rnd.random())
        v.co.z *= scale[2] * (0.85 + 0.3 * rnd.random())
    return _obj(name, bm, mat, loc)


def beam(name, p0, p1, thick, mat, bevel=0.02):
    """Square-section beam between two points."""
    a, b = Vector(p0), Vector(p1)
    d = b - a
    L = d.length
    ob = box(name, (thick, thick, L), tuple((a + b) / 2), mat, bevel=bevel, center=True)
    ob.rotation_mode = "QUATERNION"
    ob.rotation_quaternion = Vector((0, 0, 1)).rotation_difference(d)
    return ob


def emblem(name, size, loc, rot=(math.pi / 2, 0, 0)):
    """The gear-and-star emblem on a quad (default: facing -Y)."""
    bm = bmesh.new()
    uv = bm.loops.layers.uv.new("UVMap")
    h = size / 2
    vs = [bm.verts.new(p) for p in ((-h, -h, 0), (h, -h, 0), (h, h, 0), (-h, h, 0))]
    f = bm.faces.new(vs)
    for lp, co in zip(f.loops, ((0, 0), (1, 0), (1, 1), (0, 1))):
        lp[uv].uv = co
    return _obj(name, bm, "emblem", loc, rot)


def banner(name, loc, height=3.2, width=1.1, facing=0.0):
    """Rust pennant on a copper pole with the emblem. facing = rotation about Z (0 faces -Y)."""
    x, y, z = loc
    c, s = math.cos(facing), math.sin(facing)

    def at(dx, dy, dz):
        return (x + dx * c - dy * s, y + dx * s + dy * c, z + dz)
    cyl(name + "_pole", 0.07, height + 0.8, at(0, 0, 0), "copper", segs=10)
    box(name + "_cloth", (width, 0.06, height), at(0, -0.1, 0.4), "rust_deep", bevel=0.01, rot=(0, 0, facing))
    box(name + "_trim", (width + 0.1, 0.08, 0.14), at(0, -0.1, 0.4 + height - 0.07), "burnt", bevel=0.01, rot=(0, 0, facing))
    emblem(name + "_emblem", width * 0.85, at(0, -0.16, 0.4 + height * 0.55), rot=(math.pi / 2, 0, facing))


def lamp(name, size, loc, center=False, rot=(0, 0, 0)):
    return box(name, size, loc, "lamp", bevel=0.0, center=center, rot=rot)


def lamp_post(name, loc, h=4.0):
    x, y, z = loc
    cyl(name + "_pole", 0.1, h, loc, "gun", segs=8)
    box(name + "_arm", (0.7, 0.12, 0.12), (x, y - 0.3, z + h), "gun", bevel=0.01)
    lamp(name + "_lamp", (0.5, 0.3, 0.12), (x, y - 0.55, z + h - 0.12))


def container(name, loc, mat="rust", rot_z=0.0):
    x, y, z = loc
    box(name, (3.2, 1.3, 1.3), loc, mat, bevel=0.03, rot=(0, 0, rot_z))
    c, s = math.cos(rot_z), math.sin(rot_z)
    for i in range(-3, 4):
        dx = i * 0.42
        box(name + "_rib%d" % i, (0.08, 1.34, 1.2), (x + dx * c, y + dx * s, z + 0.05), "gun", bevel=0.0, rot=(0, 0, rot_z))


def join_all(final_name):
    """One mesh, one material slot per palette entry used."""
    for o in bpy.context.view_layer.objects:
        o.select_set(False)
    for o in OBJS:
        o.select_set(True)
    bpy.context.view_layer.objects.active = OBJS[0]
    bpy.ops.object.join()
    ob = bpy.context.view_layer.objects.active
    ob.name = final_name
    ob.data.name = final_name
    # apply object-level rotation/scale baked by join; set a clean origin at the footprint centre
    OBJS.clear()
    return ob


def tri_count(ob):
    me = ob.data
    me.calc_loop_triangles()
    return len(me.loop_triangles)


def reset():
    bpy.ops.wm.read_factory_settings(use_empty=True)
    OBJS.clear()
    make_materials()
