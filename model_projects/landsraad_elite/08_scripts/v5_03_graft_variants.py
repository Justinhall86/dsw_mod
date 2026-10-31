"""v5 step 2: graft chosen donor parts onto the VANILLA Landsraad Guard and render comparison variants.

  blender -b --python 08_scripts/v5_03_graft_variants.py -- [variant ...]

A spec entry is (donor, component id, mode): mode "both" = left part + mirrored right copy,
"pair" = the donor already has a left and a right part (give both ids), "as_is" = single part.
Mirroring: mesh x -> -x, faces reversed, vertex groups B_l* <-> B_r* swapped (same skeleton both sides).
Component ids = rank by vertex count, as listed in 12_part_gallery.
"""
import math
import os
import sys

import importlib.util

import bmesh
import bpy
from mathutils import Matrix, Vector

MP = r"C:\Users\justi\Python\dsw_mod\model_projects"
LE = os.path.join(MP, "landsraad_elite")
WEAPON = os.environ.get("WEAPON", "halberd")   # which guard preview .blend (weapon + idle animation) to graft onto
FINAL = os.environ.get("FINAL") == "1"          # posed render + save the finished .blend for WEAPON
GUARD = os.path.join(MP, "landsraad_guard", "03_blender", "landsraad_guard_%s_preview.blend" % WEAPON)
DONOR_BLEND = {
    "sardaukar": os.path.join(MP, "imperial_sardaukar", "03_blender", "Imperial_Sardaukar.blend"),
    "aramsham": os.path.join(MP, "imperial_aramsham", "03_blender", "Imperial_Aramsham.blend"),
    "trooper": os.path.join(MP, "imperial_trooper", "03_blender", "Imperial_Trooper.blend"),
    "houseguard": os.path.join(MP, "imperial_houseguard", "03_blender", "Imperial_HouseGuard.blend"),
    "gurney": os.path.join(MP, "gurney", "03_blender", "Male01_AtreidesGurney.blend"),
}
DONOR_OBJ = {"gurney": "Atreides_Gurney"}   # body object name in the donor .blend (default "Imperial")
OUT = os.path.join(LE, "02_progress_photos", "13_graft_variants")
os.makedirs(OUT, exist_ok=True)

SALB = os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png")
# guard components: 07/08 dark sleeves, 17/18 hood yoke (KEEP), 21/22 small shoulder pads
VARIANTS = {
    "S1_sardaukar_pauldron": dict(parts=[("sardaukar", 14, "both")], drop_guard=[21, 22]),
    "S2_sardaukar_pauldron_arms": dict(parts=[("sardaukar", 14, "both"), ("sardaukar", 0, "as_is"), ("sardaukar", 1, "as_is")],
                                       drop_guard=[21, 22, 7, 8]),
    # nudged: part scaled about a pivot near the clavicle, then moved down (opts = dict(scale, pivot, dz))
    "S3_sardaukar_pauldron_nudged": dict(parts=[("sardaukar", 14, "both", dict(scale=0.72, pivot=(0.2, 0.0, 1.5), dz=-0.07))],
                                         drop_guard=[21, 22]),
    # pauldron placement candidates (close the gap to the helmet's hood flare)
    "P1": dict(parts=[("sardaukar", 14, "both", dict(scale=0.80, pivot=(0.12, 0, 1.6), dx=-0.02, dz=-0.05))], drop_guard=[21, 22]),
    "P2": dict(parts=[("sardaukar", 14, "both", dict(scale=0.90, pivot=(0.12, 0, 1.6), dx=-0.04, dz=-0.07))], drop_guard=[21, 22]),
    "P3": dict(parts=[("sardaukar", 14, "both", dict(scale=0.85, pivot=(0.12, 0, 1.6), dx=-0.08, dz=-0.04))], drop_guard=[21, 22]),
    "R1": dict(parts=[("sardaukar", 14, "both", dict(scale=0.80, pivot=(0.12, 0, 1.6), dx=-0.02, dz=-0.05,
                                                  albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png")))],
               drop_guard=[21, 22]),
    # hood flare clipped (guard comps 17/18 below cut_z removed); pauldrons then own the shoulder
    "C1": dict(parts=[("sardaukar", 14, "both", dict(scale=0.80, pivot=(0.12, 0, 1.6), dx=-0.02, dz=-0.05, albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png")))],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    "C2": dict(parts=[("sardaukar", 14, "both", dict(scale=0.88, pivot=(0.12, 0, 1.6), dx=-0.06, dz=-0.02, albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png")))],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    "C3": dict(parts=[("sardaukar", 14, "both", dict(scale=0.88, pivot=(0.12, 0, 1.6), dx=-0.06, dz=-0.02, albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png")))],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.76)),
    # hood flare clipped + a replacement collar filling helmet -> shoulders (HouseGuard idea)
    "D1": dict(parts=[("sardaukar", 14, "both", dict(scale=0.88, pivot=(0.12, 0, 1.6), dx=-0.06, dz=-0.02, albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png"))), ("sardaukar", 18, "as_is"), ("sardaukar", 19, "as_is")],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    "D2": dict(parts=[("sardaukar", 14, "both", dict(scale=0.88, pivot=(0.12, 0, 1.6), dx=-0.06, dz=-0.02, albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png"))), ("houseguard", 14, "as_is"), ("houseguard", 15, "as_is")],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    "D3": dict(parts=[("sardaukar", 14, "both", dict(scale=0.88, pivot=(0.12, 0, 1.6), dx=-0.06, dz=-0.02, albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png"))), ("sardaukar", 18, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55))),
                      ("sardaukar", 19, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55)))],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    # FINAL v5: recoloured Sardaukar pauldrons + recoloured Sardaukar collar (x1.12), hood flare clipped at z 1.70
    "E1": dict(parts=[("sardaukar", 14, "both", dict(scale=0.88, pivot=(0.12, 0, 1.6), dx=-0.06, dz=-0.02, albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png"))),
                      ("sardaukar", 18, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png"))),
                      ("sardaukar", 19, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=os.path.join(LE, "04_textures", "v5_kitbash", "Sardaukar_pauldron_landsraad_Albedo.png")))],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    # E1 collar kept, pauldrons swapped for modest Landsraad-style ones (user: Sardaukar pads stick out too much)
    "G1": dict(parts=[("sardaukar", 18, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB)),
                      ("sardaukar", 19, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB)),
                      ("gurney", [17, 18], "as_is", dict(albedo=os.path.join(LE, "04_textures", "v5_kitbash", "gurney_parts_landsraad_Albedo.png")))],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    "H1": dict(parts=[("sardaukar", 18, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB)),
                      ("sardaukar", 19, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB)),
                      ("houseguard", [20, 21, 30, 31, 35, 36, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54], "as_is",
                       dict(albedo=os.path.join(LE, "04_textures", "v5_kitbash", "houseguard_parts_landsraad_Albedo.png")))],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    # hand-built B4 body (thick shells, fanned own pads) + the kept Sardaukar collar, hood flare clipped
    "BC": dict(handrolled="B5", parts=[("sardaukar", 18, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB)),
                      ("sardaukar", 19, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB))], drop_guard=[], cut_guard=([17, 18], 1.70)),
    # H1 without the studs (user: the little nodes look silly) = frame + two plates only
    "H2": dict(parts=[("sardaukar", 18, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB)),
                      ("sardaukar", 19, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB)),
                      ("houseguard", [20, 21, 30, 31, 35, 36], "as_is",
                       dict(albedo=os.path.join(LE, "04_textures", "v5_kitbash", "houseguard_parts_landsraad_Albedo.png")))],
               drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    # hand-modelled pauldron shells (v5_13 via v5_11 "R2c") + the kept collar
    "R2C": dict(handrolled="R2c", parts=[("sardaukar", 18, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB)),
                      ("sardaukar", 19, "as_is", dict(scale=1.12, pivot=(0, 0, 1.55), albedo=SALB))], drop_guard=[21, 22], cut_guard=([17, 18], 1.70)),
    "A1_aramsham_pauldron": dict(parts=[("aramsham", 20, "both")], drop_guard=[21, 22]),
    "T1_trooper_pauldron_gorget": dict(parts=[("trooper", 21, "as_is"), ("trooper", 22, "as_is"), ("trooper", 13, "as_is")],
                                       drop_guard=[21, 22]),
}


_spec = importlib.util.spec_from_file_location("v5_11", os.path.join(os.path.dirname(os.path.abspath(__file__)), "v5_11_handrolled.py"))
HANDROLLED = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(HANDROLLED)


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


def delete_verts(obj, idx, invert=False):
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    idx = set(idx)
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if (v.index in idx) != invert], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()


def swap_lr(name):
    if len(name) > 3 and name.startswith("B_") and name[2] in "lr" and name[3].isupper():
        return "B_" + ("r" if name[2] == "l" else "l") + name[3:]
    return name


def mirror_part(src):
    m = src.copy()
    m.data = src.data.copy()
    bpy.context.collection.objects.link(m)
    m.data.transform(Matrix.Scale(-1, 4, Vector((1, 0, 0))))
    bm = bmesh.new()
    bm.from_mesh(m.data)
    bmesh.ops.reverse_faces(bm, faces=bm.faces)
    bm.to_mesh(m.data)
    bm.free()
    for vg in m.vertex_groups:
        vg.name = "TMP_" + swap_lr(vg.name)
    for vg in m.vertex_groups:
        vg.name = vg.name[4:]
    return m


def lights_and_world(sc):
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


CLOSE = os.environ.get("CLOSE") == "1"   # shoulder/neck close-ups, rest pose
POSED = os.environ.get("POSED") == "1" or FINAL   # keep the idle animation + weapon, render game-facing (-X)


def build(name, spec):
    bpy.ops.wm.open_mainfile(filepath=GUARD)
    sc = bpy.context.scene
    rig = bpy.data.objects["Male01_LandsraadGuard"]
    guard = bpy.data.objects["LandsraadGuard"]
    weapon_types = ("CAMERA", "LIGHT") if POSED else ("MESH", "CAMERA", "LIGHT")
    for o in [o for o in bpy.data.objects if o.type in weapon_types and o is not guard]:
        bpy.data.objects.remove(o, do_unlink=True)
    if not POSED:
        rig.data.pose_position = "REST"
        if rig.animation_data:
            rig.animation_data.action = None
    gcomps = components(guard)       # computed BEFORE hand edits: those only move verts or append new ones
    if spec.get("handrolled"):
        HANDROLLED.edit_guard(guard, HANDROLLED.VARIANTS[spec["handrolled"]])
    drop = set()
    for ci in spec["drop_guard"]:
        drop.update(gcomps[ci])
    if spec.get("cut_guard"):
        ids, cut_z = spec["cut_guard"]
        for ci in ids:
            drop.update(i for i in gcomps[ci] if (guard.matrix_world @ guard.data.vertices[i].co).z < cut_z)
    delete_verts(guard, drop)

    added = []
    for entry in spec["parts"]:
        donor, ci, mode = entry[:3]
        opts = entry[3] if len(entry) > 3 else None
        with bpy.data.libraries.load(DONOR_BLEND[donor], link=False) as (src, dst):
            dst.objects = [n for n in src.objects if n == DONOR_OBJ.get(donor, "Imperial")]
        dob = dst.objects[0]
        bpy.context.collection.objects.link(dob)
        comps = components(dob)
        keep = set()
        for c in (ci if isinstance(ci, (list, tuple)) else [ci]):   # a part may be several components
            keep.update(comps[c])
        delete_verts(dob, keep, invert=True)
        if opts:   # nudge in rest pose, before mirroring, so both sides match
            piv = Vector(opts.get("pivot", (0, 0, 0)))
            dob.data.transform(Matrix.Translation(piv) @ Matrix.Scale(opts.get("scale", 1.0), 4)
                               @ Matrix.Translation(-piv) @ Matrix.Translation((opts.get("dx", 0.0), opts.get("dy", 0.0), opts.get("dz", 0.0))))
        if opts and opts.get("albedo"):   # recoloured albedo replaces the donor's albedo image (packed in the .blend)
            img = bpy.data.images.load(opts["albedo"], check_existing=False)
            img.pack()
            for mat in dob.data.materials:
                for nd in mat.node_tree.nodes:
                    if nd.type == "TEX_IMAGE" and "Albedo" in nd.image.name:
                        nd.image = img
        world_m = dob.matrix_world.copy()
        dob.name = "%s_%s" % (donor, ci if isinstance(ci, int) else "set")
        group = [dob]
        if mode == "both":
            m = mirror_part(dob)
            m.name = dob.name + "_mirror"
            group.append(m)
        for p in group:
            for md in list(p.modifiers):
                p.modifiers.remove(md)
            md = p.modifiers.new("Armature", "ARMATURE")
            md.object = rig
            p.parent = rig
            p.matrix_world = world_m
            added.append(p)
    bpy.context.view_layer.update()
    tris = sum(len(p.data.polygons) for p in added)
    print("V", name, "added", len(added), "objects,", tris, "tris; guard now", len(guard.data.polygons), "polys")

    lights_and_world(sc)
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x, sc.render.resolution_y = 700, 700
    sc.view_settings.view_transform = "Standard"
    centre = Vector((-0.3, 0, 1.2)) if POSED else Vector((0, 0, 1.4))
    if CLOSE:
        centre = Vector((0, 0, 1.6))
    dirs = ((("front", Vector((-1, 0, 0))), ("tq", Vector((-1, -0.9, 0))), ("back", Vector((1, 0, 0))))
            if POSED else (("front", Vector((0, -1, 0))), ("tq", Vector((-0.9, -1, 0))), ("back", Vector((0, 1, 0)))))
    for tag, direction in dirs:
        cd = bpy.data.cameras.new(tag)
        cam = bpy.data.objects.new(tag, cd)
        bpy.context.collection.objects.link(cam)
        cam.location = centre + direction.normalized() * 4
        cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
        cd.type, cd.ortho_scale = "ORTHO", 0.9 if CLOSE else (2.6 if POSED else 1.7)
        sc.camera = cam
        sc.render.filepath = os.path.join(OUT, "%s%s_%s.png" % ("close_" if CLOSE else ("final_%s_" % WEAPON if FINAL else ("posed_" if POSED else "")), name, tag))
        bpy.ops.render.render(write_still=True)
    if FINAL:
        sc.camera = bpy.data.objects["tq"]
        sc.frame_set(sc.frame_start)
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(LE, "03_blender", "landsraad_elite_v5_%s_%s_preview.blend" % (name, WEAPON)))
    elif not POSED and not CLOSE:
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(LE, "03_blender", "v5_%s.blend" % name))


args = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else list(VARIANTS)
for n in args:
    build(n, VARIANTS[n])
