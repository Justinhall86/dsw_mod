# Ginaz polish pass (2026-10-25): Captain, Neophyte, Master of Ginaz

Goal (user): bring the three units we built much closer to the quality of the vanilla game models.  Nothing was deleted; earlier versions are kept.

## What was wrong (the gap to vanilla)
Kitbashed donor textures at 256-512 px, patterns painted into them by script with hard edges, gold that was only yellow paint, no relief, a flat
collar top, no real buttons, and (Master) aliased filigree.

## What changed
| Area | Before | After |
|---|---|---|
| Gold hardware | painted yellow | REAL geometry in its own material `Mat_GinazGold` (metallic 0.91, gloss 0.75, domed-highlight gradient): domed buttons (Captain 6), olive toggles (Master 8, Neophyte 10), rolled collar rim tube on all three (~600-800 tris) |
| Texture resolution | Mercenary 512, Base 256, Gurney 512, Bannerjee/Idualis 512 | x2: 1024 / 512 / 1024 / 1024 / 1024 (Raider stays 2048); mild unsharp mask |
| Decoration | hard-edged boolean masks | ANTI-ALIASED cords, piping, wraps and an interlaced-chain filigree (Master) measured in texels of the real texel footprint |
| Relief | none | height map -> detail normal combined with the original normal map; emboss shading + contact darkening; subtle twill weave on coat/cape/tunic |
| Metal / gloss | MetallicGlossAO copied from donors | gold-hued paint and painted gold get R (metallic) and G (gloss) raised; cuffs reset to leather on the Neophyte |
| Clean-up | blotchy gold scribbles on the Raider tunic, ragged gold cape yoke | recoloured to wine; replaced by proper cords/piping |
| Collar | flat painted band | 56 segments, wine body, gold metal rim tube |
| Neophyte extras | 8-segment bun, 6-segment sash | 12x22 bun, 12-segment sash tail with sway |

Triangles: Captain 8,182 (was ~7.3k), Master 8,619, Neophyte 7,345 (vanilla units are 5-9k, the FlameThrower 12k). Materials: 7 / 7 / 5.  Texture folder size 16-19 MB each.

## Verification
- Turnaround + close-ups in a GAME-STYLE preview (`render_views.py --gamelike`: R metallic, G gloss, B AO as the game reads MetallicGlossAO).
- Real clips FightIdle, Run, AttackMelee01/02, FightHitFront for all three (`02_progress_photos/clips_*`, GIFs and sheets in `showcase/`): sword in hand, cape flows, sash tail follows the legs, no tearing.
- `check_hmd.py`: RESULT OK for all three packages.
- NOT seen in the real game by the assistant.

## State of the game (important)
- The live game is UNCHANGED: `res.compressed1.pak` and `mod_files/data.cdb` were not touched.
- STAGED in the editor resource tree (what the next `repackage.py` will pack): `CharMOD/Male01_GinazCaptain` (the polished Captain: it OVERWROTE the folder that is in the live pak),
  `CharMOD/Male01_GinazMaster`, `CharMOD/Male01_GinazNeophyte`.  Copies of everything in `06_game_ready/<Model>/`.
- The previous Captain files are backed up in `06_game_ready/_previous_installed/Male01_GinazCaptain_editor_copy/` (and the old pak is archived in `pak_archive/` on every repackage).
- To install: `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch` (pak grows by roughly 50 MB because the Master and Neophyte folders are packed too, unreferenced until
  `15_new_units_cdb.py --apply`).  To roll back: restore the old folder from `_previous_installed`, repackage.

## Risks / unverified
- Normal-map convention: detail normals are OpenGL style (green up), which Blender and the FBX importer use; if the game's shader expects the other convention the relief would look inverted
  (subtle: strength is low).  Check in game; flip the green channel in `polish_lib.Canvas.finalize` (`ny` sign) if so.
- A 7th material = one more draw call per unit (accepted: real metal).
- Twill weave strength 0.035 may shimmer at distance in game: set `weave=0` in 41_polish_textures.py if so.

## Files
`08_scripts/`: `hardware.py` (gold hardware), `polish_lib.py` (engine), `41_polish_textures.py` (Captain/Master), `43_polish_neophyte.py`, `03_variants.py` (recipes C2_Captain, M2_Master, N4_Neophyte),
`render_views.py` + `preview_wiring.py` (game-style preview), `11_sword_anim.py`/`22_anim_clips.py` (clips), `clip_sheets.py`, `12b_assemble_export.py`, `14_make_game_package.py`, `15_new_units_cdb.py`.
Pipeline for a unit: `03_variants -- <Recipe>` -> `08_uvdump` -> `09_ginaz_recolour` (GINAZ_HAIR_BAND env) -> `10_apply_textures` -> `41/43 polish` -> `11/22 clips` -> `12b export` -> `14 package`.
