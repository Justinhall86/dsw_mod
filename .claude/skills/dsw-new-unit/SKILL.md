---
name: dsw-new-unit
description: End-to-end recipe for creating a brand-new Dune Spice Wars (D4X) unit from existing game models - kitbash several vanilla units together (swap heads, remove backpacks/scarves/belts/metal plates, graft torso/coat parts), hand-model missing pieces in Blender (collar, neck fixes), recolour to a faction/house look from a reference image, give it a weapon, test it in the real game animation clips, then install it in the live game (takeover of an existing unit slot, squad size, start-of-game spawn). Use this whenever the user wants a NEW unit/character/hero for the game, a "kitbash", a unit that looks like a reference picture, a re-faction/House recolour, a unit with a particular sword/weapon, "put it in the game", "spawn N of them at the start", or asks to repeat the Ginaz Captain process for another unit - even if they never say "pipeline". Do NOT use it for a plain recolour of one unit (dsw-model-workshop) or for only the cdb/pak mechanics (dsw-model-modding); this skill orchestrates those.
---

# DSW new unit: kitbash -> hand-model -> recolour -> weapon -> animate -> install

This is the process that produced the **House Ginaz Captain** (Mercenary body + Raider tunic + Gurney coat tails + Bannerjee
head + hand-modelled stand-up collar + Ecaz rapier, wine/gold House Ginaz colours), installed over the Atreides Warden slot
with 5 spawned at game start. It worked first time in-game. Everything here was learned by doing it; the scripts in
`scripts/` are the real ones used. Read `examples/ginaz_captain/README.md` once - it is the full worked example with the
exact numbers.

## Why this approach (so you can adapt it)

- Every Male01 unit shares one 46-joint skeleton, so a part cut from ANY body already has valid skin weights for any other
  Male01 body. That means kitbashing = deleting/adding mesh islands and pointing them at one armature. No re-rigging, no
  new animations, native game texture quality.
- The game only needs: one HMD (one skinned mesh, several materials is fine), textures per material, a prefab, a
  `materials.props`, and edits in `data.cdb`. Existing tooling (`dsw-model-modding`) handles all of that once you give it a
  clean FBX.
- A reference picture decides the *design*; the game's own parts supply the *geometry*; Blender scripts hand-fix only what
  no donor provides (a tall collar, a neck, fills). Reaching for a hand-modelled piece early is fine, it is just
  geometry with UVs pointed at texels of the unit's own texture.

## The stages (do them in order; show the user an image at every stage)

The user wants to SEE progress and judges by eye: render, look at the render yourself (Read the PNG), then send the sheet
with SendUserFile. Never describe geometry you have not looked at. Each iteration below was "render -> look -> fix one
thing -> render", expect 10-30 loops on the neck/collar-type work.

| # | Stage | Scripts / how | Details |
|---|-------|---------------|---------|
| 0 | Set up the project folder | `python .claude/skills/dsw-model-modding/scripts/new_project.py <unit>`; copy `scripts/*` into `model_projects/<unit>/08_scripts/`; run `python convert_hmd_inputs.py` there | scripts find the repo by their own location, so they must live in `<project>/08_scripts/`; the game's HMD-named-.fbx donors (Mercenary, Ranger, Warden, HeavyWeapon, all weapons) must be converted into the project's `05_fbx_export/` |
| 1 | Understand the reference + survey donors | Read the reference image; `01_survey.py` (front/back of every unit in `units.py`), `02_gallery.py <Unit>` + `sheet_parts.py` (every mesh island alone, with id/verts/bone) | `references/catalog.md` has the ids already worked out |
| 2 | Choose the recipe | base body, donor head, parts to remove, fills, weapon | `references/kitbash-techniques.md` |
| 3 | Build the variant | add a dict to `VARIANTS` in `03_variants.py`; `blender -b --python 03_variants.py -- <Name>` | removal, metal strip, head swap, torso fill, neck repair, collar |
| 4 | Look hard at the seams | `05_diag.py` (6 views, textured + flat colour per object), `view_nape.py`, `view_culled.py` | the problems you cannot see in a normal render are the ones that show in game |
| 5 | Recolour to the design | `08_uvdump.py` -> `09_ginaz_recolour.py` (edit its RULES/PAL for a new house) -> `10_apply_textures.py` | `references/recolour-and-textures.md` |
| 6 | Weapon + animation test | `11_sword_anim.py` (renders real clips), GIFs | `references/animation-testing.md` |
| 7 | Game export | `12_assemble_export.py` -> `build_game_textures.py` -> `convert_model.py` | `references/game-integration.md` |
| 8 | data.cdb + install | `13_patch_cdb.py` (dry run first, then `--apply`) -> `repackage.py --quiet --no-launch` | takeover vs new unit, squad size, start units, sounds |
| 9 | Prove it | read the installed pak back, launch, check `game.log` for `[DataCache] Modified data.cdb` | the user starts a NEW game |
| 10 | Record | SPEC.md in the project, a memory note, revert points | so the next session does not re-derive it |

## Rules that save hours (each one cost time the first run)

1. **Render, then look, then claim.** Every "fixed" was wrong at least once until viewed from 6 angles. Use the flat-colour
   pass (which object owns which polygon) and the back-face-culled pass (the game culls back faces; Blender's render does
   not, so inward-wound faces look fine in Blender and vanish in game).
2. **Test in real animation clips, and make sure they actually play.** In Blender 5 a layered action needs
   `rig.animation_data.action_slot = action.slots[0]` or the rig silently stays in rest pose and every "passed" test
   is a lie (fixed in the bundled `anim_stress.py` and `11_sword_anim.py`).
3. **Never trust island ids across units; trust measured bounding boxes.** Ids are rank-by-vertex-count per unit, stable per
   unit but meaningless across units. Dump bbox/bones (`comp_info`) before cutting.
4. **Removing a metal plate can remove the surface of the body** (the Mercenary's chest plate WAS the torso). Check from the
   back and from inside; fill from a donor torso (`fill` in the recipe) rather than leaving a hollow.
5. **Geometry that matches at rest tears in motion unless it is weighted like the thing it replaces.** Transfer skin weights
   from the uncut base to the fill (`weights_from_base`). Stripping arm weights instead made it worse.
6. **One change per iteration, keep a comparison.** Side-by-side before/after sheets are what the user reacts to.
7. **Do not touch the user's other custom units.** Read the cdb diff vs vanilla before editing (what is custom already?), dry-run
   the patch, print the exact diff, back up, then apply. `model_inputs/` is reorganised by the user - find files by name
   (`units.py` does), never "restore" moved files, never use Sardaukar parts (user's standing rule).
8. **Install only to the Steam path, exactly two paks, prove the load** (see dsw-model-modding's four rules) and do not launch
   unless asked; when asked, launch via `steam://rungameid/1605220` (what repackage.py does) - no rebuild needed.
9. **Heavy runs go in the background** (`run_in_background`): a build + 6 renders can exceed the 2-minute tool timeout.
10. **Say honestly what you did not verify** (not seen in game, not stress-tested, one known fold in a pose) - the user
    decides whether to polish.

## Where things are

- `scripts/` - the working scripts (see the table in `references/pipeline-commands.md`).
- `references/pipeline-commands.md` - exact command lines per stage with the Ginaz Captain values.
- `references/kitbash-techniques.md` - removal, metal strip, head swap, fill, neck/collar construction, weights.
- `references/recolour-and-textures.md` - per-region recolour, UV patches, texture formats.
- `references/animation-testing.md` - converting clips, mounting a weapon, GIFs.
- `references/game-integration.md` - HMD conversion with many materials, cdb patch, anim sets, spawn, sounds, install, revert.
- `references/catalog.md` - unit registry, island ids, donor heads, slots, ideas not yet built (`docs/kitbash_ideas.md` too).
- `references/lessons.md` - every dead end and its cause, so they are not retried.
- `examples/ginaz_captain/` - reference image, final renders, the exact recipe and decisions.

Sibling skills this one calls: `dsw-model-modding` (convert/cdb/pak/install), `dsw-part-kitbash` (part grafting library
`dsw_parts.py`, `anim_stress.py`), `dsw-model-workshop` (recolour method), `dsw-preview-blend` (preview with weapon).


## Updates (2026-10-24 night): more units made with this process
Two more units were built with the same pipeline, with new reusable pieces (see `references/lessons.md`, `references/catalog.md`, `examples/ginaz_neophyte`, `examples/ginaz_master`):
- position-based texture painting (`23_neophyte_v2_textures.py`, `30_master_textures.py`), hand-modelled top-knot, sash tail, short collar, head lowering;
- generalised export `12b_assemble_export.py` and one-command game package `14_make_game_package.py` (does not touch data.cdb or paks);
- additive new units: `15_new_units_cdb.py` (dry run on a temp copy, `--apply` to write). `scripts/03_variants_v2.py` holds the newest builder (regions tagging, sash tail, bun,
  head shift) with the Neophyte and Master recipes; `03_variants.py` keeps the original Captain recipes.


## Polish pass (2026-10-25): quality upgrade stage
After a unit works, run the polish stage (see `references/lessons.md` "Polish pass" and `examples/polish_pass`): `hardware.py` (real gold hardware in `Mat_GinazGold`), `polish_lib.py`
(x2 textures, anti-aliased painting, relief/normal, metal flags), `41_polish_textures.py` / `43_polish_neophyte.py`, preview with `render_views.py --gamelike`, then export/package as before.
`scripts/03_variants_v3.py` has the polished recipes (`C2_Captain`, `M2_Master`, `N4_Neophyte`) and the `hardware` recipe key.

For upscaling an existing unit (sharper textures, more triangles, the "film" preview problem), use the dedicated skill `dsw-unit-upscale` (audit, upscale_textures, add_geometry, compare_audits).
