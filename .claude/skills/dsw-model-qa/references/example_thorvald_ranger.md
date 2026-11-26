# Worked example: Thorvald Ranger RM11 → RM12 → RM13 (2026-11-26)

Unit: `model_projects/thorvald/thorvald_ranged`, redesign recipes in `08_scripts/redesign/rd_build.py` (edits via `fit_ops`).
Kitbash: Gurney upper body (pauldrons removed), Atreides Soldier legs, Duncan sash cut to a belt, Mercenary back pouches, Assassin hood,
Harkonnen Trooper half mask, Commando head + neck wrap. Scans: `gap_check.py --drop Sniper --clip Sniper_Run:6 --clip Sniper_AttackRange:30`.
Images: `02_progress_photos/05_redesign/qa` (project-version scans) and `qa2` (this skill's scripts).

## What the owner saw
"Gaps in the model" in the animation sheets, and an orange sawtooth at the armpit.

## RM11 scan: 41 candidates (rest 10, Run f6 13, AttackRange f30 18)
Natural (left alone): between the legs (the 3,600 px ones at rest 135°/225°), arm-to-body space in poses, the pouch handle loop, finger gaps,
anything on the rifle. Real:
| Gap | at (rest) | Cause found |
|---|---|---|
| slit at the collar front, seen from the side | `Gurney + CommandoFill_snood [0.048, -0.066, 1.598]` | snood edge floating above the chest + open V-notch |
| hole at the nape, Run only | `Gurney [-0.129, 0.131, 1.615]` | uncovered when the pauldrons were removed; opens in motion |
| hole mid back, AttackRange | `Gurney [-0.004, 0.165, 1.359]` | at the x = 0 seam (Gurney halves unwelded) |
| three slits in a line, AttackRange front | `DuncanFill_sash + MercenaryFill_pouches` | pouches drift off the belt in the pose |
| orange sawtooth at the armpit | (colour) | ochre plate region = 3D box cutting through triangles |

## RM12: cap neck, snap snood, per-vertex pouch weights from the sash
- Pouch slits: **fixed** (per-vertex weights make the pouch's inner face follow the sash).
- But the pouch's side strap got different weights from the pouch body and **bent away** (bigger slit at 45°/315°). Lesson: props want one
  weight set; cloth wants per-vertex.

## RM13: welds + weld_weights at the nape + rigid pouch weights
`gap_compare.py RM11 → RM13`: **fixed 2, remains 39, new 0**: almost nothing changed. `diff_blends.py` showed why in seconds:
- `rigid_weights` on the pouches changed 0 weights: the builder had already given each pouch one weight set (ROOT 0.52 / Spine01 0.48), the
  RM11 state. The slits need the pouch to follow the sash *per vertex at its inner face* and stay rigid elsewhere (see "Next" below).
- `weld_weights` at the nape changed 10 Gurney weights: the boundary verts there already shared weights, so the gap is not a weight split
  between those panels. Find it with `loops_near.py` on the posed position before choosing an op.
- Welds removed 56 duplicate verts and `cap` added 3 faces at the neck rim; the rest-pose slit at the collar changed 25 → 24 px (the snap).
- Colour: the plate region by face direction removed the sawtooth from the front; check it in AttackRange before calling it done.

## What this example teaches (now in SKILL.md)
1. Run `diff_blends.py` after every fix before rescanning: a no-op fix costs seconds to detect, a rescan costs 15 minutes.
2. `gap_compare.py` showing **identical pixel counts** means the fix did not touch that gap.
3. Localise with the posed geometry in mind: a gap that only opens in Run is usually weights, and the bone pair involved decides the fix.

## Next for this unit (not done at the time of writing)
- Pouches: transfer per-vertex weights to the inner (sash-facing) verts only, then give the rest of each island the weights of its nearest inner vert.
- Nape: `loops_near.py Gurney -0.129,0.131,1.615` with the RM13 blend, then compare the weights on both sides of that loop in the Run pose.
- Collar slit: cap the front notch with a tighter box after the weld, or snap the notch edge to the snood.
