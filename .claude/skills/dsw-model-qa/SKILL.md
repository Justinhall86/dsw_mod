---
name: dsw-model-qa
description: Find and fix see-through gaps, cracks, seams that open in motion, clipping and jagged colour edges in a Dune Spice Wars (D4X) unit model before it goes to the game - turnaround sheets, a back-face-culled gap finder that renders the unit at rest and in real animation clips and locates every hole in 3D, triage of real gaps vs natural openings, a toolbox of fitting ops (cap/weld seams, snap cloth edges down, weld skin weights across panels, rigid weights for props, world-space cuts, horizontal push-out), and a before/after comparison. Use this whenever the user mentions gaps, holes, cracks, slits, see-through bits, light showing through, jagged / sawtooth / torn edges, parts separating or clipping in animation, "check the model", "QA", "clean it up", "polish the mesh", a front/side/back/three-quarter sheet, or is refining any kitbashed unit (Thorvald, Ginaz, anything built with dsw-new-unit or dsw-part-kitbash), even if they do not say "QA".
---

# DSW model QA: find gaps and jagged edges, fix them, prove it

Kitbashed units leak light. Donor parts are open shells, mirror halves are not welded, panels from different donors sit on
different bones, and removing a part (a pauldron, a backpack) uncovers holes it used to hide. Most of it is invisible in a
normal Blender render because **Blender draws back faces and the game culls them**, and much of it only opens **in motion**.
This skill is the loop that found and fixed them on the Thorvald Ranger (RM11 → RM13, `references/example_thorvald_ranger.md`).

## The loop

| # | Step | Script (in `scripts/`) | Output |
|---|------|------------------------|--------|
| 1 | Turnaround sheet for the user (they spot things you miss) | `turnaround.py` | front / side / back / ¾ + posed panels |
| 2 | Gap scan at rest **and** in 2-3 clip poses, back faces culled | `gap_check.py` | circled PNGs, `<tag>_gaps.json`, `<tag>_gap_sheet.png` |
| 3 | Triage: real gap or natural opening? | read `references/triage.md`; `loops_near.py` for the mesh edge it sits on | a short list of real gaps with rest positions |
| 4 | Fix with the smallest op that matches the cause | `fit_ops.py` (in a recipe, or on a finished blend from a JSON list) | new blend |
| 4b | Prove the fix changed something (seconds, not a 15-minute rescan) | `diff_blends.py` before → after | verts moved / weights changed per object |
| 5 | Rescan with identical settings and compare | `gap_check.py` again → `gap_compare.py` | fixed / remains / NEW table + crops |
| 6 | Look at the fixes in motion, then send the sheets | `anim_shots.py` of the unit project (sampled frames) | before/after images to the user |

Repeat 3-5 until only natural openings remain. Expect two passes: the first fix often reveals that the gap had a different
cause (RM12 → RM13).

## Running the scripts

All scripts take arguments after `--` and run either way:

```
blender -b <unit.blend> --python <skill>/scripts/gap_check.py -- <out_dir> <tag> [options]        # Windows / desktop
python <skill>/scripts/bl.py <unit.blend> <skill>/scripts/gap_check.py -- <out_dir> <tag> [options]  # cloud: bpy module, see lessons
```

- `gap_check.py <out> <tag> --drop Sniper --clip Common_Run:6 --clip Sniper_AttackRange:30` - always `--drop` the weapon (it rests at the
  feet in T-pose and rays still hit hidden objects). Clips come from the unit project's `05_fbx_export/anim/` (found automatically; else
  `--anim-dir`). Pick a run frame mid-stride and an attack frame at full extension: those open the most seams. 8 views, ~10-15 min per
  unit on a CPU; run it in the background.
- `gap_compare.py <dir> <tagA> <dir> <tagB> <out.png>` - plain Python + Pillow. Use the same views and clips for both runs.
- `turnaround.py <out.png> --title "..." --drop Sniper --pose Sniper_FightIdle:1 [--cull]` - `--cull` shows what the game shows.
- `diff_blends.py` (run in the before blend) `-- <after.blend>` - per object: verts moved, weights changed, faces added; matched by position.
- `loops_near.py <obj> x,y,z ...` - nearest open edge loops to a reported rest position; flags loops on the x = 0 mirror seam.
- `island_map.py <out_prefix> <fbx> <ids>` - flat-coloured islands with ids written on: pick graft pieces, read what a donor part is.
- `fit_ops.py` - the fixing ops; as a module (`fit_ops.run([(op, kwargs), ...])`) or `blender -b in.blend --python fit_ops.py -- fixes.json out.blend`.

Write fixes into the unit's **generator** (a recipe's edit list, like `thorvald_ranged/08_scripts/redesign/rd_build.py`), not
only into an output blend: the repo rule is that output-only edits are lost on the next rebuild. The JSON form is for units
whose generator cannot take edits yet; keep the JSON next to the blend and say so in the project's SPEC.md.

## Triage in one paragraph (details: `references/triage.md`)

The finder reports every transparent area enclosed by the silhouette, so natural negative space shows up too. Read each
candidate's **"at" list** (objects whose faces surround it, with rest positions):
- one object, both sides of x = 0, between legs / under an arm / inside a handle loop / between fingers → **natural**, leave it;
- one object, on a surface (e.g. `Gurney x24 rest [-0.13, 0.13, 1.62]`) → **a real hole or a seam opening in motion**: check `loops_near.py`;
- two objects, one a cloth/prop edge → **standoff**: light passes between a graft and the body under it;
- the weapon → ignore those hits (drop the weapon with `--drop`; it is a separate model in game, and rays hit hidden objects).
Then confirm by eye on `<tag>_gap_sheet.png`. Say which candidates you ruled natural and why: the user saw gaps in the images
and needs to know what was left on purpose.

## Fixes (details and parameters: `references/fixes.md`)

| Cause | Op |
|-------|----|
| Unwelded mirror seam at x = 0, or a small closed hole | `cap` (welds, then fills; 0 faces filled can still be success: the weld closed it) |
| Panels that meet at rest but part in motion (different bones) | `weld_weights` on the edge verts in a box |
| Cloth edge floating above the body (slit of light from the side) | `snap_to` (boundary verts onto the surface) |
| Graft sunk into the body | `push_out` - use `axis=True` for cloth, a single centre slides it down the chest |
| Prop with straps/loops bending away from what it hangs on | `rigid_weights` (one weight set per island) - check it is not rigid already |
| Rigid prop separating from a bending surface (pouch off a belt) | per-vertex weights at the contact face, rest of the island follows (fixes.md) |
| Cloth that should follow the body under it | `transfer_weights` (or the builder's `weights_from_base`) |
| A part poking through another | `clip_in` (pull under the cover) |
| Need a straight cut on a grafted part | `cut` (world space; builder `bisect_*` helpers are object space) |
| Jagged / sawtooth colour edge | not geometry: the recolour region is chosen per face from a 3D box; choose it by face direction or panel edge (fixes.md, "Colour edges") |

## Rules learned the hard way (all of `references/lessons.md` is worth a skim)

- Scan in **poses**, not only rest: on the Ranger most real gaps only appeared in Run / AttackRange.
- **Cull back faces** in every QA render; a Blender render that looks closed can be see-through in game.
- Make one change per pass, `diff_blends.py` it, then compare with `gap_compare.py`; a fix can make another spot worse (RM12's pouch strap)
  or do nothing at all (RM13's rigid weights equalled what the builder had already set). Identical pixel counts = no effect.
- Weights decide most motion gaps: per-vertex transfer can tear a prop apart, a uniform set can leave it floating off a bending surface.
- Report honestly: what was fixed (with before/after crops), what remains and why it is natural, what was not checked (clips not scanned).
