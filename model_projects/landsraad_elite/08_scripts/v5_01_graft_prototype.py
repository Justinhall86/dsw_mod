"""v5 kitbash prototype: graft donor shoulder parts onto the VANILLA Landsraad Guard.

  blender -b --python 08_scripts/v5_01_graft_prototype.py

Every Male01 body shares the same skeleton, so a donor part keeps its own skin weights and
needs no re-rigging; it only needs the guard's armature modifier. Each donor part keeps the
donor's material/texture set (own atlas) - no baking, so no softness.
Parts are picked by connected component id (see components.py listing, sorted by size).
"""
import math
import os
import sys
from collections import defaultdict

import bmesh
import bpy
from mathutils import Vector

MP = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects"
GUARD = os.path.join(MP, "landsraad_guard", "03_blender", "landsraad_guard_halberd_preview.blend")
DONOR = os.path.join(MP, "imperial_houseguard", "03_blender", "Imperial_HouseGuard.blend")
OUT = os.path.join(MP, "landsraad_elite", "02_progress_photos", "11_kitbash_survey")
BLEND = os.path.join(MP, "landsraad_elite", "03_blender", "v5_kitbash_proto.blend")


def components(obj):
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    seen, comps = set(), []
    for v in bm.verts:
        if v.index in seen:
            continue
        stack, comp = [v], []
        seen.add(v.index)
        while stack:
            x = stack.pop()
            comp.append(x.index)
            for e in x.link_edges:
                o = e.other_vert(x)
                if o.index not in seen:
                    seen.add(o.index)
                    stack.append(o)
        comps.append(comp)
    bm.free()
    return sorted(comps, key=len, reverse=True)


def keep_only(obj, keep_idx):
    """Delete every vertex not in keep_idx (faces go with them)."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    kill = [v for v in bm.verts if v.index not in keep_idx]
    bmesh.ops.delete(bm, geom=kill, context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()


def delete_verts(obj, idx):
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    bmesh.ops.delete(bm, geom=[bm.verts[i] for i in idx], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()


def main(variant, donor_parts, remove_guard_parts):
    bpy.ops.wm.open_mainfile(filepath=GUARD)
    sc = bpy.context.scene
    rig = bpy.data.objects["Male01_LandsraadGuard"]
    guard = bpy.data.objects["LandsraadGuard"]
    for o in list(bpy.data.objects):
        if o.type == "MESH" and o not in (guard,):
            bpy.data.objects.remove(o, do_unlink=True)      # weapon
    rig.data.pose_position = "REST"
    if rig.animation_data:
        rig.animation_data.action = None
    gcomps = components(guard)
    drop = set()
    for ci in remove_guard_parts:
        drop.update(gcomps[ci])
    if drop:
        delete_verts(guard, drop)

    with bpy.data.libraries.load(DONOR, link=False) as (src, dst):
        dst.objects = [n for n in src.objects if n == "Imperial"]
    donor = dst.objects[0]
    bpy.context.collection.objects.link(donor)
    dcomps = components(donor)
    donor_world = donor.matrix_world.copy()
    made = []
    for ci in donor_parts:
        part = donor.copy()
        part.data = donor.data.copy()
        bpy.context.collection.objects.link(part)
        keep_only(part, set(dcomps[ci]))
        part.name = "HG_part%02d" % ci
        for m in list(part.modifiers):
            part.modifiers.remove(m)
        mod = part.modifiers.new("Armature", "ARMATURE")
        mod.object = rig
        part.parent = rig
        part.matrix_world = donor_world
        made.append(part)
    bpy.data.objects.remove(donor, do_unlink=True)
    for o in bpy.data.objects:
        if o.type in ("CAMERA", "LIGHT"):
            bpy.data.objects.remove(o, do_unlink=True)
    bpy.context.view_layer.update()
    print("P", variant, "donor parts", donor_parts, "removed guard comps", remove_guard_parts,
          "-> added tris", sum(len(p.data.polygons) for p in made))

    world = bpy.data.worlds.new("W")
    sc.world = world
    world.use_nodes = True
    world.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.58, 0.64, 1)
    world.node_tree.nodes["Background"].inputs[1].default_value = 1.6
    for nm, kind, en, loc, rot, size in (("Sun", "SUN", 3.5, (0, 0, 5), (52, 0, 35), None),
                                         ("Fill", "AREA", 160, (-1.8, -2.4, 1.8), (68, 0, -40), 3.0),
                                         ("Rim", "AREA", 120, (1.6, 2.6, 2.2), (115, 0, 200), 2.0)):
        ld = bpy.data.lights.new(nm, kind)
        ld.energy = en
        if size:
            ld.size = size
        o = bpy.data.objects.new(nm, ld)
        bpy.context.collection.objects.link(o)
        o.location = loc
        o.rotation_euler = [math.radians(a) for a in rot]
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x, sc.render.resolution_y = 800, 800
    sc.view_settings.view_transform = "Standard"
    centre = Vector((0, 0, 1.45))
    for name, direction, scale in (("front", Vector((0, -1, 0)), 1.0), ("tq", Vector((-0.9, -1, 0)), 1.0),
                                   ("back", Vector((0, 1, 0)), 1.0)):
        d = bpy.data.cameras.new(name)
        c = bpy.data.objects.new(name, d)
        bpy.context.collection.objects.link(c)
        c.location = centre + direction.normalized() * 4 + Vector((0, 0, 0.1))
        c.rotation_euler = (centre - c.location).to_track_quat("-Z", "Y").to_euler()
        d.type, d.ortho_scale = "ORTHO", 1.45
        sc.camera = c
        sc.render.filepath = os.path.join(OUT, "proto_%s_%s.png" % (variant, name))
        bpy.ops.render.render(write_still=True)
    if variant == "C":
        bpy.ops.wm.save_as_mainfile(filepath=BLEND)


# guard comps: 21/22 = shoulder pads, 17/18 = hood/cowl yoke.  houseguard comps: 20/21 pauldrons, 16/17 collar
main("A", [20, 21], [])
main("B", [20, 21], [21, 22])
main("C", [20, 21, 16, 17], [21, 22])
