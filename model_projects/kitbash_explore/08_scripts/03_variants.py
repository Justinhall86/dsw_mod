"""Build removal-kitbash variants: base body MINUS parts, with a DONOR head grafted on.

    blender -b --python 03_variants.py -- [V1 V2 ...]

Component ids come from 02_gallery.py (ids = rank by vertex count, deterministic per unit).
Head = faces whose vertices are all dominated by B_HeadJ.  Both pieces share the base's armature.
"""
import os
import sys

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))),
                                ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs  # noqa: E402
import dsw_parts as P  # noqa: E402
from dsw_core import script_args  # noqa: E402
from units import material_paths, paths  # noqa: E402

PROJ = os.path.dirname(HERE)
SHOTS = os.path.join(PROJ, "02_progress_photos", "03_variants")
BLENDS = os.path.join(PROJ, "03_blender")

# name -> dict(base, donor, remove=[base comp ids], title)
VARIANTS = {
    "V1_DuncanTurban": dict(base="Duncan", donor="Marauder", remove=[0, 26, 20, 21, 22, 6, 13, 25, 45, 46, 49, 50, 51],
                            title="Duncan armour - scarf, sash, pouches + Marauder turban head"),
    "V2_CommandoNoPack": dict(base="Commando", donor="Feydakin", remove=[4, 5, 6, 7, 41, 42, 43, 44],
                              title="Commando - backpack + Feydakin head"),
    "V3_BannerjeeHooded": dict(base="Bannerjee", donor="Raider", remove=[1, 40, 51, 52],
                               title="Bannerjee - blue scarf + Raider hooded head"),
    "V4_MarauderBare": dict(base="Marauder", donor="Otheym", remove=[2, 19, 14, 22],
                            title="Marauder - scarf, belt, pouches + Otheym head"),
    "V5_MercenaryStripped": dict(base="Mercenary", donor="Bannerjee", remove=[13, 16, 6, 33, 34, 20, 23, 24, 17, 37, 55, 103, 40, 52, 67],
                                 title="Mercenary - cape, scarf, pouches, strap, staff + Bannerjee head"),
    "V6_RangerMasked": dict(base="Ranger", donor="HeavyWeapon", remove=[16, 17, 22, 23],
                            title="Ranger - baked-in rifle, hip pouches + HeavyWeapon helmet"),
    "V7_FreeCompanyHooded": dict(base="FreeCompany", donor="Raider", remove=[0, 32, 33, 36, 37, 40, 41, 46, 47],
                                 title="Free Company - scarf, apron + Raider hood head"),
    "V8_WardenUnmasked": dict(base="Warden", donor="Otheym", remove=[23, 24, 8, 9],
                              title="Warden - weapon, coat skirt panels + Otheym head"),
}


def dominant(obj):
    names = {g.index: g.name for g in obj.vertex_groups}
    return {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in obj.data.vertices if v.groups}


def keep_faces(obj, pred):
    dom = dominant(obj)
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.faces.ensure_lookup_table()
    kill = [f for f in bm.faces if not pred([dom.get(v.index) for v in f.verts])]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(kill)


def import_unit(key):
    before = {o.name for o in bpy.data.objects}
    fbx, wanted = paths(key)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o.name not in before]
    for o in list(new):
        if o.name.split(".")[0] in bs.JUNK_NAMES and o.type in ("MESH", "CAMERA", "LIGHT"):
            bpy.data.objects.remove(o, do_unlink=True)
            new.remove(o)
    body = max([o for o in new if o.type == "MESH"], key=lambda o: len(o.data.polygons))
    rig = [o for o in new if o.type == "ARMATURE"][0]
    for mat in body.data.materials:
        if mat and mat.use_nodes:
            bs.wire_textures(mat, material_paths(key, mat.name))
    return body, rig


def build(name, v):
    bs.reset_scene()
    base, rig = import_unit(v["base"])
    base.name, base.data.name = v["base"], v["base"] + "Mesh"
    rig.name = "Armature"
    comps = P.components(base)
    ids = set(v["remove"])
    for k, comp in enumerate(comps):  # baked-in weapon/scabbard islands (the stick under the feet)
        w = P.comp_info(base, comp)["bones"]
        if w and any(s in w[0][0] for s in ("Weapon", "Scabbard")):
            ids.add(k)
    rem = [i for k in sorted(ids) for i in comps[k]]
    P.delete_verts(base, rem)
    cut = keep_faces(base, lambda ds: "B_HeadJ" not in ds)
    donor, drig = import_unit(v["donor"])
    donor.name, donor.data.name = v["donor"] + "Head", v["donor"] + "HeadMesh"
    keep_faces(donor, lambda ds: all(d == "B_HeadJ" for d in ds))
    donor.parent = rig
    for m in donor.modifiers:
        if m.type == "ARMATURE":
            m.object = rig
    bpy.data.objects.remove(drig, do_unlink=True)
    bpy.context.view_layer.update()
    print(name, "removed verts", len(rem), "head faces", cut, "donor head tris", len(donor.data.polygons))

    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    for img in list(bpy.data.images):
        if img.users == 0:
            bpy.data.images.remove(img)
    bs.pack_all_images()
    lo, hi = bs.model_bounds(base)
    hlo, hhi = bs.model_bounds(donor)
    top = max(hi.z, hhi.z)
    centre = Vector((0, 0, (lo.z + top) / 2))
    scale = (top - lo.z) * 1.1
    os.makedirs(SHOTS, exist_ok=True)
    for tag, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0)), ("back", (0, 1, 0))):
        bs.setup_render(500, 700)
        cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=d, distance=scale * 2.5)
        bs.render_to(os.path.join(SHOTS, "%s_%s.png" % (name, tag)), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    bs.setup_render(500, 500)
    cam = bs.setup_camera(target=Vector((0, 0, 1.68)), ortho_scale=0.75, direction=(0.5, -0.85, 0.05), distance=4)
    bs.render_to(os.path.join(SHOTS, "%s_head.png" % name), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
    cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=(0.7, -0.7, 0), distance=scale * 2.5)
    bs.setup_render(1000, 1300)
    os.makedirs(BLENDS, exist_ok=True)
    try:
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(BLENDS, name + ".blend"), compress=True)
    except Exception as e:
        print("save failed", e)


keys = script_args() or list(VARIANTS)
for k in keys:
    build(k, VARIANTS[k])
