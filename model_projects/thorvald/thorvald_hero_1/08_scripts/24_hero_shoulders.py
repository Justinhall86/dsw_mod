"""Round 13: Karlin's OWN shoulders, made heroic - Iakin's big round pauldron shells kept (they are what makes him
read as distinct from the rank-and-file Thorvald Elite, whose layered pauldrons round 12 had borrowed), then modded:

  * --lames N   N stacked lames under each shell, made from copies of Iakin's own shell (scaled down, stepped out and
                down), like the layered flare on the Oni Sentinel sheet (house_thorvald/images/ref_oni_sentinel_sheet.jpg)
  * --emblem    the house gear-and-star (TrooperEmblem, the same game part as the chest badge) on each shoulder:
                rank insignia for an aura commander whose whole kit is "the army around me fights better"
  * copper      the scattered copper flecks (Iakin's gold wear marks after the palette pass - they read as rust)
                are cleared to iron, and the shell's perimeter band gets a bold copper rim instead (24b_paint_body.py)
  * bracers     the hand-built beige forearm bands (round 5) and Iakin's forearm are replaced by the Elite's
                forearm armour only (comp-picked by bone, centre |x| >= 0.5); upper arm and elbow stay Iakin's
  * face        re-applies 04_textures/B_face_recolour (21_recolour_face.py: skin fixed, brown eyes)

  blender -b --factory-startup --python 24_hero_shoulders.py -- --tag S2 --lames 2 --emblem

Reads 03_blender/structure/B_foundry_warlord.blend, writes 03_blender/nudge/B_hero_<tag>.blend (so
22_mount_two_swords.py --nudge hero_<tag> puts the swords on it) and renders 02_progress_photos/20_shoulder_colour/<tag>/.
"""
import argparse
import json
import math
import os
import subprocess
import sys
from collections import defaultdict

import bmesh
import bpy
from mathutils import Matrix, Vector
from mathutils.bvhtree import BVHTree
from mathutils.kdtree import KDTree

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
ELITE = os.path.abspath(os.path.join(PROJ, os.pardir, "thorvald_elite", "03_blender", "v2_final.blend"))
BLEND = os.path.join(PROJ, "03_blender", "structure", "B_foundry_warlord.blend")
TEX = os.path.join(PROJ, "04_textures")
BODY_ALBEDO = os.path.join(TEX, "B_foundry_warlord", "B_foundry_warlord_Albedo.png")
REGIONS = os.path.join(TEX, "base_Iakin_H_Hero_2", "region_ids.npy")
FACE_ALBEDO = os.path.join(TEX, "B_face_recolour", "Feydakin_Albedo_eyes_hair_mask.png")
PALETTE = json.load(open(os.path.join(HERE, "palettes", "B_foundry_warlord.json")))["palette"]
COPPER_RIM = (178, 104, 52)      # palette copper, a touch more saturated: brighter (196,122,62) rendered peach

ap = argparse.ArgumentParser()
ap.add_argument("--tag", required=True)
ap.add_argument("--lames", type=int, default=2)
ap.add_argument("--emblem", action="store_true")
ap.add_argument("--rim-frac", type=float, default=0.25,
                help="rim band = shell faces in this lowest fraction of the shell's height")
a = ap.parse_args(P.script_args())
OUT_BLEND = os.path.join(PROJ, "03_blender", "nudge", "B_hero_%s.blend" % a.tag)
OUT_DIR = os.path.join(PROJ, "02_progress_photos", "20_shoulder_colour", a.tag)
OUT_TEX = os.path.join(TEX, "B_hero_shoulders", a.tag)
for d in (os.path.dirname(OUT_BLEND), OUT_DIR, OUT_TEX):
    os.makedirs(d, exist_ok=True)


def comp_table(obj):
    """[(vert ids, dominant bone (side stripped), {bone: share}, centre, lo, hi)] per component."""
    gn = {g.index: g.name for g in obj.vertex_groups}
    rows = []
    for idx in P.components(obj):
        acc = defaultdict(float)
        for i in idx:
            for g in obj.data.vertices[i].groups:
                nm = gn[g.group]
                acc[nm[3:] if nm[:3] in ("B_l", "B_r") else nm[2:]] += g.weight
        tot = sum(acc.values()) or 1.0
        share = {k: v / tot for k, v in acc.items()}
        dom = max(share, key=share.get) if share else ""
        ps = [obj.matrix_world @ obj.data.vertices[i].co for i in idx]
        lo = Vector([min(p[k] for p in ps) for k in range(3)])
        hi = Vector([max(p[k] for p in ps) for k in range(3)])
        rows.append((set(idx), dom, share, (lo + hi) / 2, lo, hi))
    return rows


def split_copy(src, keep, name):
    ob = src.copy()
    ob.data = src.data.copy()
    bpy.context.collection.objects.link(ob)
    P.delete_verts(ob, keep, invert=True)
    ob.name = name
    ob.data.name = name + "_mesh"
    return ob


bpy.ops.wm.open_mainfile(filepath=BLEND)
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
body = bpy.data.objects["Iakin_H_Hero_2_00"]
action = rig.animation_data.action if rig.animation_data else None
pose_mode = rig.data.pose_position
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
added = []

# --- bracers: Elite forearm armour instead of the beige bands + Iakin's own forearm ----------------------------
for side in ("l", "r"):
    o = bpy.data.objects.get("Kit_forearm_%s" % side)
    if o:
        bpy.data.objects.remove(o, do_unlink=True)
drop = set()
for ids, dom, share, c, lo, hi in comp_table(body):
    if abs(c.x) >= 0.45 and (dom == "ForearmJ" or (dom == "WristJ" and share.get("ForearmJ", 0) >= 0.25)):
        drop |= ids
P.delete_verts(body, drop)
el = P.import_donor(ELITE, "Gurney")
keep = set()
for ids, dom, share, c, lo, hi in comp_table(el):
    if abs(c.x) >= 0.5 and dom in ("ElbowJ", "ForearmJ"):
        keep |= ids
P.delete_verts(el, keep, invert=True)
el.name, el.data.name = "Kit_bracers", "Kit_bracers_mesh"
added.append(el)
print("BRACERS dropped %d Iakin verts, grafted %d Elite verts" % (len(drop), len(el.data.vertices)))

# --- the shell (fresh table: the drop above renumbered everything) ---------------------------------------------
shell = {1: set(), -1: set()}
for ids, dom, share, c, lo, hi in comp_table(body):
    if dom == "ClavicleJ" and abs(c.x) >= 0.2 and len(ids) >= 30:
        shell[1 if c.x > 0 else -1] |= ids
print("SHELL verts L %d R %d" % (len(shell[1]), len(shell[-1])))
all_shell = shell[1] | shell[-1]

# copper rim = the shell's lower lip: faces whose verts all sit in the lowest band of the shell's height (the shell
# is one closed thick cap, so its edge is a band of faces, not open boundary edges). Two wrong tries, recorded:
# open boundary edges only found the neck-side seam (broken strokes); "far from the dome apex" picked the neck/collar
# side, since the apex sits out over the arm. Height works because the lip is lowest all round (outer, front, back).
bm = bmesh.new()
bm.from_mesh(body.data)
uv = bm.loops.layers.uv.active
rim_verts = set()
for side in (1, -1):
    zs = {i: body.data.vertices[i].co.z for i in shell[side]}
    z0, z1 = min(zs.values()), max(zs.values())
    rim_verts |= {i for i, z in zs.items() if z <= z0 + a.rim_frac * (z1 - z0)}
rims = []
for f in bm.faces:
    if all(v.index in rim_verts for v in f.verts):
        rims.append([list(l[uv].uv) for l in f.loops])
bm.free()

# --- lames: copies of the shell, each smaller, stepped out and down ---------------------------------------------
for t in range(1, a.lames + 1):
    ob = split_copy(body, all_shell, "Kit_lame_%d" % t)
    s, dx, dz = 1.0 - 0.08 * t, 0.03 * t, -0.06 * t
    for side in (1, -1):
        cos = [v.co for v in ob.data.vertices if v.co.x * side > 0]
        pivot = Vector((min(c.x * side for c in cos) * side, sum(c.y for c in cos) / len(cos), max(c.z for c in cos)))
        for v in ob.data.vertices:
            if v.co.x * side > 0:
                v.co = pivot + (v.co - pivot) * s + Vector((dx * side, 0.0, dz))
    added.append(ob)

# --- shoulder insignia: the chest's own gear emblem, laid on each shell ----------------------------------------
if a.emblem:
    chest = bpy.data.objects["Kit_emblem"]
    dg = bpy.context.evaluated_depsgraph_get()
    bvh = BVHTree.FromObject(body, dg)
    kd = KDTree(len(all_shell))
    for i in all_shell:
        kd.insert(body.data.vertices[i].co, i)
    kd.balance()
    gn = {g.index: g.name for g in body.vertex_groups}
    for side in (1, -1):
        cos = [body.data.vertices[i].co for i in shell[side]]
        ctr = sum(cos, Vector()) / len(cos)
        d = Vector((0.75 * side, -0.45, 0.5)).normalized()
        hit, n, _, _ = bvh.ray_cast(ctr + d * 1.0, -d)
        if hit is None:
            raise SystemExit("emblem ray missed the %s shell" % ("left" if side > 0 else "right"))
        if n.dot(d) < 0:
            n = -n
        em = chest.copy()
        em.data = chest.data.copy()
        bpy.context.collection.objects.link(em)
        em.name = em.data.name = "Kit_emblem_shoulder_%s" % ("l" if side > 0 else "r")
        ecos = [v.co for v in em.data.vertices]
        ec = sum(ecos, Vector()) / len(ecos)
        en = (sum((p.normal for p in em.data.polygons), Vector())).normalized()
        rot = en.rotation_difference(n).to_matrix().to_4x4()
        em.data.transform(Matrix.Translation(hit + n * 0.006) @ rot @ Matrix.Scale(1.6, 4) @ Matrix.Translation(-ec))
        em.vertex_groups.clear()
        groups = {}
        for v in em.data.vertices:
            _, j, _ = kd.find(v.co)
            for g in body.data.vertices[j].groups:
                nm = gn[g.group]
                if nm not in groups:
                    groups[nm] = em.vertex_groups.new(name=nm)
                groups[nm].add([v.index], g.weight, "REPLACE")
        added.append(em)
    print("EMBLEMS placed on both shells")

# --- colour pass: body albedo (flecks cleared, copper rims), face texture ---------------------------------------
spec_path = os.path.join(OUT_TEX, "paint_spec.json")
out_albedo = os.path.join(OUT_TEX, "B_hero_body_Albedo.png")
json.dump(dict(src=BODY_ALBEDO, regions=REGIONS, out=out_albedo, iron=PALETTE["iron"], copper=COPPER_RIM,
               clear_regions=[6], rims=rims), open(spec_path, "w"))
r = subprocess.run(["python", os.path.join(HERE, "24b_paint_body.py"), spec_path], capture_output=True, text=True)
print(r.stdout.strip(), r.stderr.strip())
if r.returncode:
    raise SystemExit("24b_paint_body.py failed")
body_img = bpy.data.images.load(out_albedo, check_existing=False)
body_img.pack()
for ob in [body] + [o for o in added if o.name.startswith("Kit_lame")]:
    for slot in ob.material_slots:
        for nd in slot.material.node_tree.nodes:
            if nd.type == "TEX_IMAGE" and nd.image and "albedo" in nd.image.name.lower():
                nd.image = body_img
face_img = bpy.data.images.load(FACE_ALBEDO, check_existing=False)
face_img.pack()
for slot in bpy.data.objects["Kit_face"].material_slots:
    for nd in slot.material.node_tree.nodes:
        if nd.type == "TEX_IMAGE" and nd.image and "albedo" in nd.image.name.lower():
            nd.image = face_img

for ob in added:
    P.attach_to_rig(ob, rig)
rig.data.pose_position = pose_mode
if action is not None:
    rig.animation_data.action = action
bpy.context.view_layer.update()
P.purge_orphans()

P.setup_scene(sc)
cams = P.render_views(sc, OUT_DIR, "B_hero_%s" % a.tag, "posed")
sc.camera = cams["tq"]
sc.frame_set(sc.frame_start)
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("SAVED", OUT_BLEND)
