"""Structural pass 3/4/5: nudge the Karlin POCs toward the "Thorvald Heavy Infantry" reference sheet
(house_thorvald/images/ref_heavy_infantry_model_sheet.jpg), keeping each POC's own established colour palette.
No kasa hat, no goggles/mask - full face, cloth headwrap, bulkier plate silhouette (2026-11-02 round 3).
Round 4 (2026-11-02): all three POCs get a different, UNUSED-IN-THE-LIVE-GAME face (see face_graft below),
so they no longer reuse Whitmore/Iakin/Duncan's own faces, each of which is already another live hero.

Round 5 (2026-11-02): work narrows to variant B only (the user's chosen POC). No headwrap any more (dropped
per direction - "headwrap" key removed from B's entry). Added forearm_bands: a hand-built copper cuff on each
forearm (the reference sheet calls out "burnt orange ... forearms" explicitly in its material callouts; no
donor in this project has a distinct forearm-plate shape to graft). Built from the BODY'S OWN mesh, not a bone
rest-pose chain - B_lElbowJ/B_lForearmJ/B_lWristJ's head_local/tail_local turned out not to form a clean FK
chain in this rig (elbow.tail and forearm.head are ~0.4m apart), so the band's axis comes from the elbow- and
wrist-weighted vertex centroids instead (reliable: confirmed by a standalone render before wiring it in,
02_progress_photos/12_forearm_bands/).

Round 6 (2026-11-02): hand_graft - B's own (Iakin) hands/gloves are replaced with thorvald_elite's installed
hand geometry (see HAND_GRAFT above). No axis mismatch this time (checked first, unlike the shoulder graft) -
Iakin's and Elite's hand component bboxes line up closely, so it's a straight swap.

Round 7 (2026-11-02): face recolour, B only (FACE_GRAFT_B, a separate dict from the shared FACE_GRAFT so A/C
keep the original Feydakin colours) - hair and eyes black, the half-mask gunmetal grey. Texture edit, not a
graft; see 21_recolour_face.py and 04_textures/B_face_recolour/.

  blender -b --factory-startup --python 20_structure_pass.py -- --variant A|B|C

The kit objects come from thorvald_elite/03_blender/v2_final.blend (TrooperNeck, TrooperEmblem, DuncanFill_sash),
all skinned to the same Male01 bones, so they follow the rig in the game clips. The headwrap is the Marauder's
turban cloth (comp 2 of MarauderHead in kitbash_explore/03_blender/history/V1_DuncanTurban.blend, isolated from
its own metal jaw-mask neighbour comps), recoloured per variant and grafted the same way.

The face is the ORIGINAL (pre-"Rework") Feydakin head (Character/Fremen/Unit/Feydakin/Male01_Feydakin.fbx).
Confirmed unused: data.cdb's model sheet never references Prefab_Feydakin.prefab - only Prefab_FeydakinR.prefab
(the "Rework", which IS the live F_Elite unit). The two have different meshes/textures (4299 vs 5583 verts), so
the original is a genuinely cut, never-shipped design: distinct hair/eyes from anything in our hero donor set.
Its half-mask (comps 1, 2) and neck scarf (comp 7) are separate geometry from the face - confirmed by rendering
each component alone and by a drop-and-render test (02_progress_photos/11_face_graft/) - so they're dropped,
leaving a clean, fully visible face. Source saved at 01_input/donors/Feydakin/Feydakin_unused.blend.

Variant A also replaces its own donor's (Whitmore/Ecaz) shoulder armour: the maroon arm-wrap (comps 5, 6, weighted
partly to the elbow, so it swings loose in the Run/attack clips) and the gold scalloped "crown" pauldron cap
(comps 13, 14, an ornate Ecaz shape that clashes with Thorvald's gunmetal/copper look) are dropped and replaced
with Iakin's rigid clavicle plate (comps 16, 17), recoloured to A's own palette.

Iakin's donor blend has a different forward-axis convention from Whitmore's (its sideways spread is along X,
Whitmore's is along Y), so each shoulder comp is rotated +90 degrees about Z about its own centre, scaled down,
then translated onto Whitmore's own former shoulder-plate position (comp 14's bbox centre for the right side,
mirrored in Y for the left) - NOT dsw_parts.mirror_object, which flips across x=0 and does not apply here.

Round 10 (2026-11-02): leg_graft - B's own (Iakin) legs/boots, bulky and rounded (reads as generic Harkonnen
heavy infantry), are replaced with thorvald_elite's own leg/foot "Fill" objects (MercenaryFill_legs,
DuncanFill_feet - sleek trousers, angular knee plates, slim boots), the same already-Thorvald-styled-donor
pattern as the round 6 hand graft. No axis mismatch (checked first, same lesson as always).
"""
import argparse
import math
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
ELITE = os.path.join(os.path.dirname(PROJ), "thorvald_elite", "03_blender", "v2_final.blend")
ELITE_HEAD_TOP = 2.0          # top of the elite's CommandoHead (where TrooperHat was fitted)

IAKIN_DONOR = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir,
                            "01_input", "donors", "Iakin", "Iakin_H_Hero_2.blend")
IAKIN_SHOULDER_TEX = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir,
                                   "04_textures", "A_shoulder_from_iakin")
MODEL_PROJECTS = os.path.dirname(os.path.dirname(PROJ))   # .../model_projects (PROJ = thorvald_hero_1, parent = thorvald)
TURBAN_DONOR = os.path.join(MODEL_PROJECTS, "kitbash_explore", "03_blender", "history", "V1_DuncanTurban.blend")
TURBAN_REF_TOP = 1.967    # comp2's own top z in the donor file (used as the "head top" reference for the dz fit)
TEX_ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir, "04_textures")

FEYDAKIN_DONOR = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir,
                               "01_input", "donors", "Feydakin", "Feydakin_unused.blend")
FEYDAKIN_REF_TOP = 1.975   # hair-top z in the donor file, used as the "head top" reference for the dz fit
FEYDAKIN_CHIN_Z = 1.67     # mask-tip (lowest point) z in the donor file - the collar must clear this
# Feydakin_unused.blend is PRE-ISOLATED to head-only (01_input/donors/Feydakin/ - the first attempt saved the
# FULL BODY under this name, which silently doubled up arms/torso under variant A's rig). It KEEPS the original
# half-mask (comps 1, 2 of the raw Feydakin mesh): the bare chin underneath (comp 24) was never painted for
# exposure - the shipped design always hid it under this mask - and reads as a crude flat orange wedge when
# shown (02_progress_photos/11_face_graft/B_face_v9_closeup.png). Only the neck scarf (comp 7) is dropped.
# No drop step needed at graft time any more; kept as an empty tuple for the record.
FEYDAKIN_DROP = ()
COLLAR_RAW_TOP = 1.84      # TrooperNeck's own top z, unshifted (measured straight from thorvald_elite's source file)
COLLAR_CHIN_GAP = 0.02     # how far below the new chin the collar's top should sit


def headwrap(variant_name):
    t = os.path.join(TEX_ROOT, "%s_headwrap" % variant_name, "%s_headwrap" % variant_name)
    return dict(blend=os.path.abspath(TURBAN_DONOR), object="MarauderHead", comp=2,
                albedo=os.path.abspath(t + "_Albedo.png"), normal=os.path.abspath(t + "_Normal.png"),
                mgao=os.path.abspath(t + "_MetallicGlossAO.png"))


FACE_GRAFT = dict(blend=os.path.abspath(FEYDAKIN_DONOR), object="Feydakin", drop=FEYDAKIN_DROP)
# B-only: hair/mask/eyes recoloured (21_recolour_face.py). A separate dict, not a change to FACE_GRAFT itself,
# so A and C (not being developed further right now) keep the original Feydakin colours unless asked.
FACE_RECOLOUR_TEX = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir,
                                  "04_textures", "B_face_recolour", "Feydakin_Albedo_eyes_hair_mask.png")
FACE_GRAFT_B = dict(FACE_GRAFT, albedo=os.path.abspath(FACE_RECOLOUR_TEX))

# B's hands/gloves, matched to the installed thorvald_elite (v2): its body object is literally named "Gurney"
# (the Elite's build chain is Gurney-derived) and already carries the Thorvald-recoloured Mat_Gurney/Mat_Thorvald_Trim
# materials, so no further recolour is needed. Iakin's own hand comps (left: 0, 4, 50, 52, 84, 90; right mirrored)
# and Elite/Gurney's equivalent hand comps (left: 0, 20, 31, 32, 35-38, 45, 83; right mirrored) were each listed by
# rendering every component in both files; their world bboxes line up closely (no axis-convention mismatch this
# time, unlike the A shoulder graft), so this is a straight swap with no rotation needed.
HAND_GRAFT = dict(
    donor_drop=[0, 1, 4, 5, 50, 51, 52, 53, 84, 85, 90, 91],   # Iakin's own hand/finger/wrist comps, both sides
    source_blend=os.path.abspath(ELITE), source_object="Gurney",
    source_keep=[0, 1, 20, 21, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 45, 46, 83, 84],
)

# B's legs/boots, matched to thorvald_elite's installed look: sleek trousers, angular knee plates, slim
# boots (Mercenary's legs + Duncan's boots, already dedicated "Fill" objects in the Elite's own blend - no
# component filtering needed, both are already scoped to just the legs/feet). Iakin's own bulky rounded
# armour legs read as generic Harkonnen heavy infantry, not the house's sleeker silhouette. Bboxes line up
# closely with Iakin's own hip/knee/ankle comps (same X-sideways convention), so again no rotation needed.
# donor_drop_bones (not component ids): component ids are only valid for the EXACT mesh state they were
# listed from, and by the time leg_graft runs, hand_graft has already dropped vertices and renumbered
# everything (hit this directly: IndexError on the first attempt, ids listed from the raw untouched donor).
# A live bone-weight query is immune to that - it reads whatever the CURRENT mesh state actually is.
LEG_GRAFT = dict(
    donor_drop_bones=["B_lHipJ", "B_rHipJ", "B_lKneeJ", "B_rKneeJ", "B_lAnkleJ", "B_rAnkleJ",
                       "B_lBallJ", "B_rBallJ"],
    sources=[
        dict(source_blend=os.path.abspath(ELITE), source_object="MercenaryFill_legs"),
        dict(source_blend=os.path.abspath(ELITE), source_object="DuncanFill_feet"),
    ],
)

VARIANTS = {
    # Whitmore's maroon arm-wrap (5, 6, elbow-weighted - swings loose) and gold crown pauldron cap (13, 14,
    # Ecaz-ornate, wrong palette family) are dropped and replaced by a shoulder_graft below.
    "A": dict(name="A_academy_commandant", body="Whitmore_E_Hero_1_00", kit=["neck", "emblem", "apron"], mask=False,
              drop=[5, 6, 13, 14], headwrap=headwrap("A_academy_commandant"), face_graft=FACE_GRAFT,
              shoulder_graft=dict(
                  blend=os.path.abspath(IAKIN_DONOR), object="Iakin_H_Hero_2_00", scale=0.60,
                  # comp id -> target bbox centre in Whitmore's frame (right = old comp14 centre, left mirrored in y)
                  targets={16: (0.066, 0.36, 1.58), 17: (0.066, -0.36, 1.58)},
                  albedo=os.path.abspath(os.path.join(IAKIN_SHOULDER_TEX, "A_shoulder_Albedo.png")),
                  normal=os.path.abspath(os.path.join(IAKIN_SHOULDER_TEX, "A_shoulder_Normal.png")),
                  mgao=os.path.abspath(os.path.join(IAKIN_SHOULDER_TEX, "A_shoulder_MetallicGlossAO.png")))),
    # mask=False now: round 2 used the elite's masked/goggled CommandoHead for B; the reference sheet shows a
    # fully visible face under a cloth headwrap, so B now keeps its own (Iakin) head like A and C - until round 4,
    # where all three get face_graft instead (a different, unused face, not any donor's own).
    # Round 5: no "headwrap" key any more (dropped). forearm_bands added instead.
    "B": dict(name="B_foundry_warlord", body="Iakin_H_Hero_2_00", kit=["neck", "emblem", "apron"], mask=False,
              face_graft=FACE_GRAFT_B, hand_graft=HAND_GRAFT, leg_graft=LEG_GRAFT,
              forearm_bands=dict(color=(178 / 255, 110 / 255, 58 / 255), radius_mul=1.15, half_len_frac=0.22)),
    "C": dict(name="C_kinsman_of_the_earl", body="Duncan_A_Hero_1_00", kit=["neck", "emblem", "apron"], mask=False,
              headwrap=headwrap("C_kinsman_of_the_earl"), face_graft=FACE_GRAFT),
}
KIT_OBJECTS = {"neck": "TrooperNeck", "emblem": "TrooperEmblem", "head": "CommandoHead",
               "apron": "DuncanFill_sash"}      # the rust apron at waist height; no hat (dropped)

ap = argparse.ArgumentParser()
ap.add_argument("--variant", required=True, choices=sorted(VARIANTS))
a = ap.parse_args(P.script_args())
V = VARIANTS[a.variant]
BASE = os.path.join(PROJ, "03_blender", "pass2", "%s.blend" % V["name"])
OUT_BLEND = os.path.join(PROJ, "03_blender", "structure", "%s.blend" % V["name"])
OUT_DIR = os.path.join(PROJ, "02_progress_photos", "05_structure_pass", V["name"])
os.makedirs(os.path.dirname(OUT_BLEND), exist_ok=True)
os.makedirs(OUT_DIR, exist_ok=True)

bpy.ops.wm.open_mainfile(filepath=BASE)
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
body = bpy.data.objects[V["body"]]
action = rig.animation_data.action if rig.animation_data else None
pose_mode = rig.data.pose_position


def world_pts(obj):
    """Deformed vertices in world space at the current pose (evaluated, so the armature is applied)."""
    dg = bpy.context.evaluated_depsgraph_get()
    ev = obj.evaluated_get(dg)
    me = ev.to_mesh()
    pts = [obj.matrix_world @ v.co for v in me.vertices]
    ev.to_mesh_clear()
    return pts


def bone_weight_ids(obj, bone, min_w=0.5):
    gi = obj.vertex_groups[bone].index
    out = set()
    for v in obj.data.vertices:
        for g in v.groups:
            if g.group == gi and g.weight >= min_w:
                out.add(v.index)
    return out


def shift_object(obj, dz=0.0, dy=0.0):
    """Move an object's mesh in world space (its rig binding is in rest space, so move the vertices, not the object)."""
    wi = obj.matrix_world.inverted()
    off = Vector((0.0, dy, dz))
    for v in obj.data.vertices:
        v.co = wi @ (obj.matrix_world @ v.co + off)


def bone_weighted_pts(obj, bone, min_w=0.3):
    """World-space points of obj's own vertices weighted to bone - used to find a limb's real position/axis,
    since this rig's bone rest chain (head_local/tail_local) does not trace a clean FK chain (confirmed by
    printing B_lElbowJ/B_lForearmJ/B_lWristJ - elbow.tail and forearm.head sit ~0.4m apart)."""
    gi = obj.vertex_groups[bone].index
    pts = []
    for v in obj.data.vertices:
        for g in v.groups:
            if g.group == gi and g.weight >= min_w:
                pts.append(obj.matrix_world @ v.co)
                break
    return pts


def centroid(pts):
    return Vector([sum(p[k] for p in pts) / len(pts) for k in range(3)])


def build_band(name, centre, axis, radius, half_len, color, bone, segs=14):
    """A plain copper cuff: a short cylinder centred on `centre`, its axis along `axis`, skinned 100% to `bone`.
    Flat-coloured material (no UV/texture dependency), so it carries no cross-file coordinate risk - everything
    here is built directly in the target rig's own coordinate frame."""
    d = Vector(axis).normalized()
    up = Vector((0, 0, 1)) if abs(d.z) < 0.9 else Vector((1, 0, 0))
    right = d.cross(up).normalized()
    up2 = right.cross(d).normalized()
    p0 = Vector(centre) - d * half_len
    p1 = Vector(centre) + d * half_len

    bm = bmesh.new()
    ring0, ring1 = [], []
    for i in range(segs):
        ang = 2 * math.pi * i / segs
        off = (right * math.cos(ang) + up2 * math.sin(ang)) * radius
        ring0.append(bm.verts.new(p0 + off))
        ring1.append(bm.verts.new(p1 + off))
    bm.verts.ensure_lookup_table()
    for i in range(segs):
        j = (i + 1) % segs
        bm.faces.new((ring0[i], ring0[j], ring1[j], ring1[i]))
    bm.faces.new(reversed(ring0))
    bm.faces.new(ring1)
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces)

    me = bpy.data.meshes.new(name + "_mesh")
    bm.to_mesh(me)
    bm.free()
    obj = bpy.data.objects.new(name, me)
    bpy.context.collection.objects.link(obj)

    mat = bpy.data.materials.new(name + "_mat")
    mat.use_nodes = True
    bsdf = mat.node_tree.nodes.get("Principled BSDF")
    bsdf.inputs["Base Color"].default_value = (*color, 1.0)
    bsdf.inputs["Roughness"].default_value = 0.45
    if "Metallic" in bsdf.inputs:
        bsdf.inputs["Metallic"].default_value = 0.7
    obj.data.materials.append(mat)

    vg = obj.vertex_groups.new(name=bone)
    vg.add(range(len(obj.data.vertices)), 1.0, "REPLACE")
    return obj


# --- measure the POC in the rest pose (deformed mesh), keep the posed state for saving
rig.data.pose_position = "REST"
if rig.animation_data:
    rig.animation_data.action = None
bpy.context.view_layer.update()
pts = world_pts(body)
head_ids = bone_weight_ids(body, "B_HeadJ")
head_top = max(pts[i].z for i in head_ids)
# chest surface where the emblem sits: cast from in front of the body straight back at the emblem's spot (x 0.085, z 1.44)
from mathutils.bvhtree import BVHTree  # noqa: E402
bvh = BVHTree.FromObject(body, bpy.context.evaluated_depsgraph_get())
hit = bvh.ray_cast(Vector((0.085, -1.0, 1.44)), Vector((0.0, 1.0, 0.0)))   # rest pose faces -Y: come in from the front
chest_front_y = hit[0].y
print("MEASURE %s head_top %.3f chest_front_y %.3f" % (V["name"], head_top, chest_front_y))
dz = head_top - ELITE_HEAD_TOP
dz_face = head_top - FEYDAKIN_REF_TOP   # same shift face_graft will use, needed here to fit the collar under the new chin

# --- import the kit
added = []
for part in V["kit"]:
    obj = P.import_donor(ELITE, KIT_OBJECTS[part])
    obj.name = "Kit_" + part
    obj.data.name = "Kit_" + part + "_mesh"
    if part == "neck":
        # fit the collar's TOP below the new (Feydakin) chin, not the old donor head's chin - the two
        # are different sizes, and shifting by the old dz left the collar covering half the new face.
        neck_shift = (FEYDAKIN_CHIN_Z + dz_face - COLLAR_CHIN_GAP) - COLLAR_RAW_TOP
        shift_object(obj, dz=neck_shift)
    if part == "emblem":
        emb_min_y = min((obj.matrix_world @ v.co).y for v in obj.data.vertices)
        shift_object(obj, dy=(chest_front_y - 0.006) - emb_min_y)
    added.append(obj)

if V.get("drop"):
    comps = P.components(body)                 # ids on the untouched donor mesh (same numbering as the survey)
    P.delete_verts(body, {i for c in V["drop"] for i in comps[c]})

if V.get("shoulder_graft"):
    g = V["shoulder_graft"]
    for comp_id, target in g["targets"].items():
        dob = P.import_donor(g["blend"], g["object"])
        dcomps = P.components(dob)
        keep = set(dcomps[comp_id])
        P.delete_verts(dob, keep, invert=True)
        dob.name = "Kit_shoulder_%d" % comp_id
        dob.data.name = dob.name + "_mesh"
        pts = [v.co.copy() for v in dob.data.vertices]
        centre = Vector(((min(p.x for p in pts) + max(p.x for p in pts)) / 2,
                          (min(p.y for p in pts) + max(p.y for p in pts)) / 2,
                          (min(p.z for p in pts) + max(p.z for p in pts)) / 2))
        m = (Matrix.Translation(Vector(target)) @ Matrix.Scale(g["scale"], 4) @ Matrix.Rotation(math.radians(90), 4, "Z")
             @ Matrix.Translation(-centre))
        dob.data.transform(m)
        P.set_textures(dob, albedo=g["albedo"], normal=g["normal"], mgao=g["mgao"])
        added.append(dob)

if V.get("headwrap"):
    g = V["headwrap"]
    dob = P.import_donor(g["blend"], g["object"])
    dcomps = P.components(dob)
    P.delete_verts(dob, set(dcomps[g["comp"]]), invert=True)
    dob.name = "Kit_headwrap"
    dob.data.name = "Kit_headwrap_mesh"
    shift_object(dob, dz=head_top - TURBAN_REF_TOP)
    P.set_textures(dob, albedo=g["albedo"], normal=g["normal"], mgao=g["mgao"])
    added.append(dob)

if V.get("face_graft"):
    # full head swap: drop the body's OWN head entirely and graft in the unused Feydakin face.
    # head_ids/pts were captured before any earlier deletion (variant A's shoulder drop runs first and
    # renumbers body's vertex indices), so recompute fresh here rather than reuse the stale top-level set.
    g = V["face_graft"]
    # a 0.5 threshold leaves neck-seam vertices blended mostly to B_Neck01J still attached to the old head -
    # they showed through as a dark fringe around the new face's jaw. Drop anything touched by B_HeadJ at all.
    fresh_head_ids = bone_weight_ids(body, "B_HeadJ", min_w=0.02)
    P.delete_verts(body, fresh_head_ids)
    fob = P.import_donor(g["blend"], g["object"])
    fcomps = P.components(fob)
    P.delete_verts(fob, {i for c in g["drop"] for i in fcomps[c]})
    fob.name = "Kit_face"
    fob.data.name = "Kit_face_mesh"
    shift_object(fob, dz=head_top - FEYDAKIN_REF_TOP)
    if g.get("albedo"):
        P.set_textures(fob, albedo=g["albedo"])
    added.append(fob)

if V.get("forearm_bands"):
    fb = V["forearm_bands"]
    for side, bone_prefix in (("l", "B_l"), ("r", "B_r")):
        elbow_c = centroid(bone_weighted_pts(body, bone_prefix + "ElbowJ"))
        wrist_c = centroid(bone_weighted_pts(body, bone_prefix + "WristJ"))
        forearm_pts = bone_weighted_pts(body, bone_prefix + "ForearmJ")
        centre = centroid(forearm_pts)
        axis = (wrist_c - elbow_c)
        d = axis.normalized()
        rs = sorted((Vector(p) - centre - d * (Vector(p) - centre).dot(d)).length for p in forearm_pts)
        radius = rs[int(0.7 * len(rs))] * fb["radius_mul"]
        half_len = axis.length * fb["half_len_frac"]
        band = build_band("Kit_forearm_%s" % side, centre, d, radius, half_len, fb["color"],
                           bone_prefix + "ForearmJ")
        added.append(band)

if V.get("hand_graft"):
    hg = V["hand_graft"]
    body_comps = P.components(body)   # fresh query - safe regardless of any earlier deletion on body
    P.delete_verts(body, {i for c in hg["donor_drop"] for i in body_comps[c]})
    hob = P.import_donor(hg["source_blend"], hg["source_object"])
    hcomps = P.components(hob)
    keep = {i for c in hg["source_keep"] for i in hcomps[c]}
    P.delete_verts(hob, keep, invert=True)
    hob.name = "Kit_hands"
    hob.data.name = "Kit_hands_mesh"
    added.append(hob)

if V.get("leg_graft"):
    lg = V["leg_graft"]
    drop_ids = set()
    for bn in lg["donor_drop_bones"]:
        drop_ids |= bone_weight_ids(body, bn, min_w=0.3)   # live query on body's CURRENT state, index-safe
    P.delete_verts(body, drop_ids)
    for i, src in enumerate(lg["sources"]):
        lob = P.import_donor(src["source_blend"], src["source_object"])
        lob.name = "Kit_leg_%d" % i
        lob.data.name = "Kit_leg_%d_mesh" % i
        added.append(lob)

if V["mask"]:
    # replace the body's own head with the masked Commando head: drop the head faces above the collar line
    drop = {i for i in head_ids if pts[i].z > 1.66}
    P.delete_verts(body, drop)
    head = P.import_donor(ELITE, KIT_OBJECTS["head"])
    head.name = "Kit_head"
    head.data.name = "Kit_head_mesh"
    shift_object(head, dz=dz)
    added.append(head)

for obj in added:
    P.attach_to_rig(obj, rig)

# --- restore the posed state for the render and the saved blend
rig.data.pose_position = pose_mode
if action is not None:
    rig.animation_data.action = action
bpy.context.view_layer.update()
P.purge_orphans()

P.setup_scene(sc)
cams = P.render_views(sc, OUT_DIR, "posed_%s" % V["name"], "posed")
sc.camera = cams["tq"]
sc.frame_set(sc.frame_start)
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("STRUCTURE %s kit %s mask %s dz %.3f saved %s" % (V["name"], V["kit"], V["mask"], dz, OUT_BLEND))
