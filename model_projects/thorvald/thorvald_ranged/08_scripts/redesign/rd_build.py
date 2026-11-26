"""Thorvald Ranger REDESIGN recipes (2026-11-26): make the Ranger read as a different unit from the melee Trooper,
the way the Atreides Ranger differs from the Atreides Trooper (no hat / helmet bulk, no tabard, slim trousers, pouches, light upper body).

    python bl.py rd_build.py -- RD1 RD2 ...

Loads ../03_variants_trooper.py (the shared builder, unchanged), adds the RD recipes, writes
03_blender/redesign/<name>.blend and 02_progress_photos/05_redesign/variants/<name>_*.png.
"""
import os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(os.path.dirname(HERE), "03_variants_trooper.py")
sys.path.insert(0, os.path.abspath(os.path.join(HERE, "..", "..", "..", "..", "..", ".claude", "skills", "dsw-part-kitbash", "scripts")))
code = open(SRC, encoding="utf-8").read()
code = code[:code.rindex("keys = script_args()")]
g = {"__file__": SRC, "__name__": "rd_builder"}
exec(compile(code, SRC, "exec"), g)
V = g["VARIANTS"]
# the project moved under model_projects/thorvald/: point units.py at the real model_inputs (its own path is one level short)
sys.modules["units"].MI = os.path.abspath(os.path.join(HERE, "..", "..", "..", "..", "..", "model_inputs", "Character"))
sys.modules["units"]._INDEX.clear()
g["SHOTS"] = os.path.join(g["PROJ"], "02_progress_photos", "05_redesign", "variants")
g["BLENDS"] = os.path.join(g["PROJ"], "03_blender", "redesign")
if os.environ.get("RD_OUT"):                       # test builds: blend + shots go to $RD_OUT instead of the project folders
    g["BLENDS"] = g["SHOTS"] = os.environ["RD_OUT"]

R5 = V["R5_Ranged"]
LEGS = dict(donor="AtreidesSoldier", tag="legs", keep_comps=[4, 5, 13, 14, 20, 21, 30, 31, 61, 62, 79, 80])
# RD1: the R5 Ranger with the two Trooper signatures taken off: no kasa hat, no rust sash/apron. Bare masked head, slim trousers.
RD = {}
SASH_BELT = dict(R5["fill"][1], zmin=1.12)          # Duncan's sash cut to the belt band + a short hem: closes the waist, no apron
RD["RD1"] = dict(R5, hat=None, fill=[R5["fill"][0], SASH_BELT, R5["fill"][2]], title="Ranger RD1: no hat, no apron")
RD["RD2"] = dict(RD["RD1"], donor="Raider", title="Ranger RD2: Raider hood + mask")
RD["RD3"] = dict(RD["RD1"], donor="HeavyWeapon", title="Ranger RD3: HeavyWeapon helmet")
RD["RD4"] = dict(RD["RD1"], donor="Feydakin", title="Ranger RD4: Feydakin breather")
# --- hooded options (2026-11-26, owner: "RD1 is closest", reference = black ninja cowl + rigid half mask, eyes showing) ---
U = sys.modules["units"]
CH = U.MI
U.UNITS["RavagerMelee"] = (os.path.join(CH, "Common", "Ravager", "Ravager_Melee_TRUE_FBX.fbx"), "Ravager", "Common/Ravager")
U.UNITS["Assassin"] = (U.EX + "Female01_Infiltrator_TRUE_FBX.fbx", "Assassin", "Common/Assassin")   # Assassin = Infiltrator mesh + black texture
_paths = U.paths
def _paths_fixed(key):   # the Assassin set has no normal map: use the Infiltrator's (same mesh, same UVs)
    p, w = _paths(key)
    if key == "Assassin":
        w = dict(w, Normal=os.path.join(CH, "Fremen", "Unit", "Infiltrator", "Fremen_Infiltrator_Normal.png"))
    return p, w
U.paths = _paths_fixed
# Ravager hood islands: 9/10/20 crown, 17/18 sides, 8 front cowl, 11 back cowl (mask 25/26/34/35/46/47 and drape 19 left out)
RD["RH1"] = dict(RD["RD1"], fill=RD["RD1"]["fill"] + [dict(donor="RavagerMelee", tag="hood", keep_comps=[8, 9, 10, 11, 17, 18, 20])],
                 title="Ranger RH1: RD1 + Ravager hood and cowl (no skull mask)")
HOOD_R = dict(donor="RavagerMelee", tag="hood", keep_comps=[8, 9, 10, 11, 17, 18, 20])
# RH2: head not lifted (the +3 cm was for the Trooper's hat), hood 6 % wider and 1.5 cm up so the Commando hair sits inside it
RD["RH2"] = dict(RD["RH1"], head_shift_z=0.0, fill=RD["RD1"]["fill"] + [dict(HOOD_R, scale_xy=1.06, shift_z=0.015)], title="Ranger RH2: Ravager hood, fitted")
# RH3: RH2 + the head 6 % smaller (about the neck), so the hood can stay closer to its own size
RD["RH3"] = dict(RD["RH2"], head_scale=0.94, head_pivot_z=1.70, fill=RD["RD1"]["fill"] + [dict(HOOD_R, scale_xy=1.03, shift_z=0.005)],
                 title="Ranger RH3: Ravager hood, smaller head")
# RH4: the Assassin hood (Infiltrator mesh, black texture): 2/5 hood halves, 13/16 crown + lining, 3 cowl, 31 cowl edge; its mask (20) and goggles left out
RD["RH4"] = dict(RD["RH2"], fill=RD["RD1"]["fill"] + [dict(donor="Assassin", tag="hood", keep_comps=[2, 3, 5, 13, 16, 31], scale_xy=1.10, shift_z=0.015)],
                 title="Ranger RH4: Assassin hood")
# RH5: RH4 without islands 2/5 (they are the Assassin's goggle face, not hood)
RD["RH5"] = dict(RD["RH2"], fill=RD["RD1"]["fill"] + [dict(donor="Assassin", tag="hood", keep_comps=[3, 13, 16, 31], scale_xy=1.10, shift_z=0.015)],
                 title="Ranger RH5: Assassin hood (no goggles)")
# --- fitted ninja hood + rigid mask (owner 2026-11-26: RH5 closest but the shawl reads "Arrakis"; push toward the reference; try a rigid mask) ---
U.UNITS["HarkTrooper"] = (U.EX + "Male01_HarkonnenTrooper_TRUE_FBX.fbx", "Harkonnen_Trooper", "Harkonnen/Unit/Trooper")
U.UNITS["Scout"] = (U.EX + "Male01_Scout_TRUE_FBX.fbx", "Smuggler_Scout", "Smuggler/Unit/Scout")
HOOD_A = dict(donor="Assassin", tag="hood", keep_comps=[13, 16, 31], scale_xy=1.10, shift_z=0.015)     # shell, lining, collar ring (no shawl 3)
MASK_H = dict(donor="HarkTrooper", tag="mask", keep_comps=[28, 29, 43, 44, 82, 84])                     # cheek plates + mouth/chin plate + vents
HEAD = "CommandoHead"
RD["RM1"] = dict(RD["RH2"], fill=RD["RD1"]["fill"] + [HOOD_A, MASK_H],
                 edits=[("clip_in", dict(obj=HEAD, cover="AssassinFill_hood", centre=(0, 0.0, 1.80))),
                        ("clip_in", dict(obj=HEAD, cover="HarkTrooperFill_mask", centre=(0, 0.0, 1.78)))],
                 title="Ranger RM1: Assassin hood without shawl + Harkonnen half mask")
# RM2: hood at its own size (head hair is clipped inside instead), tightened front-to-back, front rim pulled down to the brows; no collar ring
HOOD_A2 = dict(HOOD_A, keep_comps=[13, 16], scale_xy=1.0, shift_z=0.0)
HD = "AssassinFill_hood"
RD["RM2"] = dict(RD["RM1"], fill=RD["RD1"]["fill"] + [HOOD_A2, MASK_H],
                 edits=[("xform", dict(obj=HD, scale=(0.97, 0.86, 0.97), pivot=(0, -0.02, 1.80))),                      # shallower: no box behind the skull
                        ("xform", dict(obj=HD, move=(0, -0.008, -0.028), falloff=(1, 0.04, -0.10))),                    # front pulled down + forward (soft)
                        ("clip_in", dict(obj=HEAD, cover=HD, centre=(0, 0.0, 1.80), margin=0.005)),
                        ("clip_in", dict(obj=HEAD, cover="HarkTrooperFill_mask", centre=(0, 0.0, 1.78)))],
                 title="Ranger RM2: fitted hood + Harkonnen half mask")
# RM3: RM2 + the head's skin and hair above the brow line deleted (z > 1.858): the hood's black lining shows there = the reference's black cap band
CAP = ("delete", dict(obj=HEAD, lo=(-1, -1, 1.858), hi=(1, 1, 3)))
RD["RM3"] = dict(RD["RM2"], edits=RD["RM2"]["edits"] + [CAP], title="Ranger RM3: fitted hood, black cap to the brows, Harkonnen half mask")
# RM4: RM3 with the Scout's face plate cut below its eye slots as the mask (smooth, one piece)
MASK_S = dict(donor="Scout", tag="mask", keep_comps=[12, 13], zmax=1.815)
RD["RM4"] = dict(RD["RM3"], fill=RD["RD1"]["fill"] + [HOOD_A2, MASK_S],
                 edits=[e if e[1].get("cover") != "HarkTrooperFill_mask" else ("clip_in", dict(e[1], cover="ScoutFill_mask")) for e in RD["RM3"]["edits"]],
                 title="Ranger RM4: fitted hood, black cap, Scout half mask")
# RM5: RM3 with the cap cut taking every face that crosses z 1.860 (RM3 left a square of skin mid-forehead), and the Harkonnen mask
# compressed toward the face: 15 % shorter from its top edge and 12 % shallower, so the respirator snout no longer hangs below the chin
MK = "HarkTrooperFill_mask"
RD["RM5"] = dict(RD["RM3"], edits=RD["RM2"]["edits"][:2] + [
                     ("xform", dict(obj=MK, scale=(1.0, 0.88, 0.85), pivot=(0, -0.10, 1.835))),
                     ("clip_in", dict(obj=HEAD, cover=HD, centre=(0, 0.0, 1.80), margin=0.005)),
                     ("clip_in", dict(obj=HEAD, cover=MK, centre=(0, 0.0, 1.78))),
                     ("delete", dict(obj=HEAD, lo=(-1, -1, 1.860), hi=(1, 1, 3), mode="any"))],
                 title="Ranger RM5: fitted hood, black cap, compact Harkonnen half mask")
# RM6: RM5 + the Commando's own black neck wrap (lower part of its head islands 2/3, cut at z 1.725 under the chin) as the snood over the
# Gurney collar; eye band opened (cap cut 8 mm higher, mask 6 mm lower)
SNOOD = dict(donor="Commando", tag="snood", keep_comps=[2, 3], zmax=1.725)
RD["RM6"] = dict(RD["RM5"], fill=RD["RD1"]["fill"] + [HOOD_A2, MASK_H, SNOOD],
                 edits=RD["RM2"]["edits"][:2] + [
                     ("xform", dict(obj=MK, scale=(1.0, 0.88, 0.85), pivot=(0, -0.10, 1.835), move=(0, 0, -0.006))),
                     ("clip_in", dict(obj=HEAD, cover=HD, centre=(0, 0.0, 1.80), margin=0.005)),
                     ("clip_in", dict(obj=HEAD, cover=MK, centre=(0, 0.0, 1.78))),
                     ("delete", dict(obj=HEAD, lo=(-1, -1, 1.868), hi=(1, 1, 3), mode="any")),
                     ("push_out", dict(obj="CommandoFill_snood", solid="Gurney", centre=(0, 0.0, 1.66), margin=0.006))],
                 title="Ranger RM6: fitted hood, black cap, compact half mask, black snood")
# RM7: RM6 + the Gurney collar (studs, edges) pressed under the snood, only inside the collar box (chest armour untouched)
RD["RM7"] = dict(RD["RM6"], edits=RD["RM6"]["edits"] + [
                     ("clip_in", dict(obj="Gurney", cover="CommandoFill_snood", centre=(0, 0.0, 1.62), margin=0.004, box=((-0.32, -0.30, 1.50), (0.32, 0.30, 1.86))))],
                 title="Ranger RM7: RM6 with the collar under the snood")
# RM8 (owner: "RM7!!!", colours approved): shape fixes only
#  - hood crown rounded: back-top pulled in (y x0.80) and down (z x0.95), fading in from z 1.80 to 1.92 (the boxy profile)
#  - mask mouth plate flattened toward the face (y x0.70 below z 1.775, soft), no respirator snout
#  - snood cut at z 1.58: a neck wrap, not a bib hanging to mid-chest
e7 = RD["RM7"]["edits"]
RD["RM8"] = dict(RD["RM7"], edits=e7[:2] + [
                     ("xform", dict(obj=HD, scale=(1.0, 0.80, 0.95), pivot=(0, 0.0, 1.80), box=((-1, 0.0, 1.80), (1, 1, 3)), falloff=(2, 1.80, 1.92))),
                     e7[2],
                     ("xform", dict(obj=MK, scale=(1.0, 0.70, 1.0), pivot=(0, -0.10, 1.76), box=((-1, -1, 0), (1, 1, 1.775)), falloff=(2, 1.775, 1.752))),
                 ] + e7[3:6] + [
                     ("cut", dict(obj="CommandoFill_snood", z=1.58, keep="above")),
                 ] + e7[6:],
                 title="Ranger RM8: RM7 with a round crown, flat mask, short snood")
# RM9: RM8 pushed harder: crown y x0.70 / z x0.92; mask's chin block trimmed at z 1.728 (the snood covers the chin)
e8 = RD["RM8"]["edits"]
RD["RM9"] = dict(RD["RM8"], edits=e8[:2] + [
                     ("xform", dict(obj=HD, scale=(1.0, 0.70, 0.92), pivot=(0, 0.0, 1.80), box=((-1, 0.0, 1.80), (1, 1, 3)), falloff=(2, 1.80, 1.92))),
                 ] + e8[3:5] + [("cut", dict(obj=MK, z=1.728, keep="above"))] + e8[5:],
                 title="Ranger RM9: round crown, trimmed mask, short snood")
# RM10: RM9 with the snood pushed out HORIZONTALLY from the neck axis (the point-centred push slid it down the chest into a bib)
RD["RM10"] = dict(RD["RM9"], edits=[e if e[0] != "push_out" else ("push_out", dict(e[1], centre=(0, 0.0, 0), axis=True)) for e in RD["RM9"]["edits"]],
                  title="Ranger RM10: round crown, trimmed mask, neck snood")
# RM11: RM9 with the snood skinned like the body under it (builder's weights_from_base: nearest-surface weights from the uncut Gurney),
# so its lower edge moves with the chest plate instead of the neck (Run test: the ochre plate poked through the snood's lower edge)
RD["RM11"] = dict(RD["RM9"], fill=RD["RD1"]["fill"] + [HOOD_A2, MASK_H, dict(SNOOD, weights_from_base=True)],
                  title="Ranger RM11: RM9 with the snood skinned to the body")
# RM12 (owner: fix the gaps and jagged edges; gap finder qa/gap_check.py): RM11 +
#  - Gurney's open neck rim (the two halves are not joined at x = 0) welded and capped: no view into the hollow body at the nape when the head tips forward
#  - the snood's lower edge pulled down onto the chest (a slit of light showed under it from the side)
#  - back pouches skinned from the sash they sit on and snapped flush to it (they drifted off the belt when the spine bent)
#  (the orange sawtooth is fixed in the recolour: rd_uvdump.py picks the ochre plate by face direction)
PCH = "MercenaryFill_pouches"; SASH = "DuncanFill_sash"
RD["RM12"] = dict(RD["RM11"], edits=RD["RM11"]["edits"] + [
                      ("cap", dict(obj="Gurney", box=((-0.115, -0.05, 1.575), (0.115, 0.15, 1.78)))),
                      ("snap_to", dict(obj="CommandoFill_snood", solid="Gurney", max_dist=0.03, margin=0.002, box=((-0.3, -0.3, 1.40), (0.3, 0.3, 1.66)))),
                      ("transfer_weights", dict(obj=PCH, src=SASH)),
                      ("snap_to", dict(obj=PCH, solid=SASH, max_dist=0.02, margin=0.001, boundary_only=False))],
                  title="Ranger RM12: RM11 with the gaps closed")
# RM13: second gap pass (qa/gap_check.py on RM12):
#  - front V-notch of Gurney's collar welded + capped (the slit seen from the side under the snood)
#  - small socket hole at the centre of the back plate (two 6-edge loops at x = 0) welded + capped
#  - nape: Gurney's collar panel and torso panel edges meet at rest but pull apart in Run (different bones); edge weights averaged within 2.5 cm
#  - pouches back to RM11's placement, but one rigid weight set per pouch from the sash (RM12's per-vertex weights let the strap bend away)
RD["RM13"] = dict(RD["RM11"], edits=RD["RM11"]["edits"] + [
                      ("cap", dict(obj="Gurney", box=((-0.115, -0.05, 1.575), (0.115, 0.15, 1.78)))),
                      ("cap", dict(obj="Gurney", box=((-0.065, -0.145, 1.600), (0.065, -0.07, 1.72)))),
                      ("cap", dict(obj="Gurney", box=((-0.05, 0.165, 1.355), (0.05, 0.205, 1.40)))),
                      ("weld_weights", dict(obj="Gurney", box=((-0.20, 0.0, 1.55), (0.20, 0.26, 1.72)), radius=0.025)),
                      ("snap_to", dict(obj="CommandoFill_snood", solid="Gurney", max_dist=0.03, margin=0.002, box=((-0.3, -0.3, 1.40), (0.3, 0.3, 1.66)))),
                      ("rigid_weights", dict(obj=PCH, src=SASH))],
                  title="Ranger RM13: second gap pass")
V.update(RD)

keys = [k for k in sys.argv[sys.argv.index("--") + 1:]] if "--" in sys.argv else list(RD)
import bpy
from mathutils import Vector
import rd_edit
bs = g["bs"]


def shots(name):
    """The builder's standard views (front / tq / back / head), re-rendered after the edits."""
    meshes = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]
    lo = Vector((9, 9, 9)); hi = Vector((-9, -9, -9))
    for o in meshes:
        a, b = bs.model_bounds(o)
        lo = Vector(map(min, lo, a)); hi = Vector(map(max, hi, b))
    centre = Vector((0, 0, (lo.z + hi.z) / 2)); scale = (hi.z - lo.z) * 1.1
    for tag, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0)), ("back", (0, 1, 0))):
        bs.setup_render(500, 700)
        cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=d, distance=scale * 2.5)
        bs.render_to(os.path.join(g["SHOTS"], "%s_%s.png" % (name, tag)), cam); bpy.data.objects.remove(cam, do_unlink=True)
    for tag, d in (("head", (0.5, -0.85, 0.05)), ("headfront", (0, -1, 0.04)), ("headside", (1, 0, 0.04))):
        bs.setup_render(500, 500)
        cam = bs.setup_camera(target=Vector((0, 0, 1.74)), ortho_scale=0.62, direction=d, distance=4)
        bs.render_to(os.path.join(g["SHOTS"], "%s_%s.png" % (name, tag)), cam); bpy.data.objects.remove(cam, do_unlink=True)


sys.path.insert(0, HERE)
for k in keys:
    print("=== BUILD", k)
    g["build"](k, V[k])
    if V[k].get("edits"):
        rd_edit.run(V[k]["edits"], g)
        shots(k)
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(g["BLENDS"], k + ".blend"), compress=True)
        print("EDITED", k)
