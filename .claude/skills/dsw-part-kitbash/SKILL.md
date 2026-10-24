---
name: dsw-part-kitbash
description: >-
  Make a new or "elite" look for a Dune Spice Wars (DSW / D4X) unit by working at the PART level on a vanilla body:
  find parts (pauldrons, collars, gorgets, plates) on other units, graft them on with their own skin weights (no
  re-rigging), mirror one-sided parts, nudge/scale them, recolour just their texture islands to the target unit's
  palette, delete or clip the base unit's own parts, thicken armour, or MODEL new parts (e.g. pauldron shells) textured
  from the unit's own texture - then check everything in the real game animations. Use this whenever the user wants to
  swap shoulder pads, add armour, make a unit bulkier / more elite / more heroic, borrow a piece from another unit or
  hero, kitbash parts, hand-build or "hand-roll" an upgrade in Blender, or compare several part options side by side,
  even if they don't say "kitbash". Not for merging whole bodies into one scene (dsw-model-kitbash), plain
  removal/recolour of one unit (dsw-model-workshop) or the game export (dsw-model-modding).
---

# DSW part-level kitbash

Turn a vanilla unit into a variant (e.g. "Landsraad Elite") by adding, swapping and modelling parts, while keeping
the vanilla body's rig, weights, textures and pixel quality. Built and proven on the Landsraad Guard in
`model_projects/landsraad_elite` (paths there are good worked examples; `SPEC.md` has the full story).

Read [references/lessons.md](references/lessons.md) before the first build - it holds the gotchas and the
design feedback that decided what looked good.

## Why this approach works

Every Male01 unit uses one skeleton, so a part cut from ANY donor body already carries correct skin weights for any
other Male01 body: point its armature modifier at the new rig and it animates. Re-rigging a custom sculpt (what the
earlier Elite attempts did) is what produced soft textures, bad shadows and colour drift; parts that ship in the game
keep native texture quality. A donor part keeps its own material, so the result is one extra material, not a bake.

## Setup

- Base: a preview .blend of the target unit with its weapon and an idle animation (make it with the
  `dsw-preview-blend` skill, one per weapon variant). Donors: any unit/hero .blend in `model_projects/*/03_blender/`.
- Blender 5.2 for the `.py` scripts with `bpy` (`blender -b --python <script> -- <args>`), system Python + Pillow +
  numpy for `recolour_parts.py`, `pick_uv_patches.py`, `contact_sheet.py`.
- Scripts live in `scripts/` next to this file; `dsw_parts.py` is the shared library (components, mirror, nudge,
  inflate, donor import, albedo swap, modelled shell, renders). Write throwaway scripts with the Write tool, not bash
  heredocs (heredocs eat Windows backslashes).

## Workflow

### 1. Survey - what parts exist?
Render each candidate body's upper-body components alone, then look at the sheet:
```
blender -b --python scripts/part_gallery.py -- --blend <donor.blend> --object <body> --out <dir>/gallery_<donor> --skip-hands
python scripts/contact_sheet.py <dir>/gallery_<donor>
```
Do the base unit too, so you know which of its parts you'd delete (its own pads) or must keep (helmet).
Component ids = rank by vertex count; `components.json` lists bbox and dominant bones per id.
Keep `--min-verts` low: real pauldrons are often several small components (HouseGuard's = frame + 2 plates + 10 studs).
Send the sheets to the user (SendUserFile) - they pick by eye faster than any heuristic.

### 2. Recolour donor parts to the target palette
```
blender -b --python scripts/dump_uvs.py -- --blend <donor.blend> --object <body> --components 14 18 19 --key sardaukar --json uv_tris.json
blender -b --python scripts/dump_uvs.py -- --blend <base.blend> --object <body> --components 17 18 --key guard --json uv_tris.json
python scripts/recolour_parts.py --tex <donor albedo> --uv-json uv_tris.json --keys sardaukar_14 sardaukar_18 sardaukar_19 \
       --ref-tex <base albedo> --ref-keys guard_17 guard_18 --out <...>_recoloured_Albedo.png
```
Only the part's islands change (gold stays gold, coloured accents become gold trim, the rest takes the reference
armour colour with its own shading). Game textures are DDS named `.png`; Pillow reads them, Blender can't - use the
real-PNG copies in a project's `04_textures/` as `--ref-tex` when you have them.

### 3. Build variants from a spec
Write one JSON spec per idea (see `examples/landsraad_elite_G1.json` - collar + Gurney pads, and
`examples/landsraad_elite_R2C.json` - collar + modelled shells + thicker armour; the docstring of
`build_variant.py` lists every key: `parts`, `mirror`, `scale/pivot/offset/rot_y`, `albedo`, `drop`, `cut`,
`inflate`, `shells`). Then:
```
blender -b --python scripts/build_variant.py -- --spec v.json --mode close     # shoulders, rest pose
blender -b --python scripts/build_variant.py -- --spec v.json --mode posed     # game pose + weapon - ALWAYS look at this
blender -b --python scripts/build_variant.py -- --spec v.json --mode posed --base <gun preview.blend> --save <out.blend>
```
Build 2-4 variants per round and show one comparison sheet (`contact_sheet.py --grid out.png --cols 4 <files...>`).
The user's taste decides; give a recommendation with the reason, then let them choose.

### 4. Hand-built parts (when no donor part fits)
Model new geometry instead of scaling/stacking copies of existing pads (copies read as fake - the user called it
"derpy"). `dsw_parts.build_shell` models a pauldron: a thick ellipsoid shell over the shoulder, gold rim band, centre
ridge, weighted to the clavicle. Texture it from flat spots of the unit's OWN texture:
```
python scripts/pick_uv_patches.py --albedo <base albedo> --normal <base normal> --uv-json uv_tris.json --keys guard_17 guard_18 guard_11 guard_12 --out uv_patches.json
```
Then put `"shells": {"patches": "uv_patches.json", "params": {...}}` in the spec. Pair it with `inflate` (thicker
chest/back/forearm shells, 1.2-2 cm) for bulk. The shell is plain; painted detail is the natural next step.

### 5. Stress test in real clips
```
cd HMD_toolkit/HMD_toolkit/Animations && python hmdanim2fbx.py <body.hmd> <extr/Anim/Male01/<Set>/Anim_Male01_<Set>_Run.fbx> <clips>/Run.fbx
blender -b --python scripts/anim_stress.py -- --blend <variant.blend> --rig <rig> --clips <clips>/Run.fbx <clips>/AttackMelee01.fbx --out <dir> --tag G1_
```
Check Run, two attacks, and the raised-arm weapon idles (rifle, bazooka). Look for tearing, parts winging up with the
arm, collar/pauldron/helmet intersections.

### 6. Hand-off
Save one preview .blend per weapon variant (`--save`), record the spec + renders in the project's `SPEC.md`, and
stop before the game export: that path (merge into one HMD with an extra material, prefab, pak, data.cdb, Steam
install) belongs to `dsw-model-modding` and changes the live game, so confirm with the user first.

## Checklist per variant
- [ ] Helmet/head untouched (or deliberately replaced together with a collar - see lessons)
- [ ] No gap between pauldron and neck/collar from front, 3/4 and back
- [ ] Parts recoloured to the target palette; nothing in a donor faction's colours
- [ ] Silhouette still reads as the target faction (not Sardaukar/Imperial)
- [ ] Holds in idle, Run, attacks and raised-arm weapon poses
- [ ] Every image the user should judge was sent with SendUserFile
