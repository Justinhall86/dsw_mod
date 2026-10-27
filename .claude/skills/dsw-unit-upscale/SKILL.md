---
name: dsw-unit-upscale
description: Upscale an existing Dune Spice Wars (D4X) unit toward vanilla AAA quality - audit it, raise texture resolution and sharpness (x2 with unsharp mask), add relief/normal detail and real metal flags, add real triangles (hand-modelled gold buttons, collar rims, buns, tails, subdivided coats), judge it in a matte game-style preview (no "film"), verify before/after with numbers, then repackage. Use this whenever the user says upscale, polish, "make it look better / closer to vanilla / higher quality", sharper or blurry textures, more detail, low-poly or blocky silhouette, "increase the triangle count", washed out / film / hazy look in the previews, or wants a unit we already built (Ginaz Captain, Master, Neophyte, any kitbash or reskin) improved without redesigning it. Not for building a new unit (dsw-new-unit), a plain recolour (dsw-model-workshop) or the cdb/pak mechanics (dsw-model-modding).
---

# DSW unit upscale: audit -> textures -> geometry -> matte preview -> verify -> package

This is the "polish pass" that took the Ginaz Captain, Neophyte and Master of Ginaz from kitbash-quality to something near vanilla.
Nothing here redesigns the unit: the silhouette, colours and rig stay, the surface quality goes up. Read
`references/lessons.md` first if you have 2 minutes, it is the list of things that cost hours.

## Why a unit looks worse than vanilla (so you know what to fix)

Kitbashed units inherit donor textures at 256-512 px, painted-on decoration with hard edges, gold that is yellow paint not metal, no
relief (flat normal maps) and faceted silhouettes (6-sided collars, plain tubes). Vanilla units ship 5-9k triangles, 1024-2048 maps
with painted-in wear, a real metallic map and a normal map with stitching/edge detail. The gap is surface detail, not polygon count
alone: a 9k unit with crisp 1024 maps beats a 14k unit with soft 512 maps. Spend effort where the camera looks: chest, collar, hem, face.

## The loop (show the user an image at every step; look at renders yourself with Read before you claim anything)

1. **Project + inputs.** Work in `model_projects/<unit>_polish/` (`scripts/new_project.py` of dsw-model-modding) or the unit's own folder; copy
   the source blend, never edit it in place (scripts refuse to overwrite their input). The input blend must be a *textured* variant
   (importer wiring: Albedo -> Base Color, MetallicGlossAO -> Specular IOR Level, Normal -> Normal Map).
2. **Audit** (`scripts/audit_unit.py`). Tris per mesh, texture sizes, texels/metre, map health (all-zero / flat / alpha<1 / bad normals),
   verdict against vanilla targets (`references/quality-targets.md`). Save the JSON: it is the "before".
3. **Plan the budget.** Pick from: x2 textures (almost always), a painting hook for decoration, real hardware, subdivision of 1-2 faceted
   parts. Target 7-9.5k total, hard ceiling 12k. Textures: 1024 for body/coat/head, keep 2048 maps at 2048, never exceed 2048.
4. **Textures** (`scripts/upscale_textures.py`). Generic x2 + unsharp + gold-to-metal flags + twill, or add `--hook` for unit-specific
   painting (`examples/hook_example.py`: clean donor blotches, anti-aliased piping/hems in metres, relief). See `references/texture-pass.md`.
5. **Geometry** (`scripts/add_geometry.py` for subdivision; `scripts/hardware.py` for domed buttons / rolled collar rim / toggles in their own
   `Mat_GinazGold` material). See `references/geometry-pass.md`. Subdivision multiplies triangles x4-6 per level: use it on small parts only.
6. **Judge in the matte preview** (`render_views.py --gamelike`, or `make_preview_blend.py` then open the PREVIEW blend). NEVER judge from the
   FBX-importer wiring under the bright world: it paints a milky "film" over everything (`references/preview-and-film.md`).
   Check animations too: `22_anim_clips.py` + `clip_sheets.py` (Run, FightIdle, AttackMelee, FightHitFront): no tearing at the
   subdivided parts, hardware follows the body.
7. **Verify with numbers.** Audit the result and run `compare_audits.py before.json after.json`: it fails on washed-out colour drift,
   new all-zero/flat maps, alpha < 1, fewer triangles than before or > 12k. Then look at the renders once more.
8. **Export + package.** Export blends keep importer wiring; `12b_assemble_export.py` -> `14_make_game_package.py --max 2048` ->
   `check_hmd.py` must say RESULT: OK. Back up the previous model folder first (`06_game_ready/_previous_installed/`): packing the editor res
   tree is what installs, so overwriting a live folder changes the next repackage.
9. **Install only on the user's go-ahead** (`repackage.py --quiet --no-launch`, warn about pak size) and say plainly what you did not see in
   the real game (normal-map direction, twill shimmer, extra draw call for the metal material).

## Commands (Blender 5.2: `C:\Program Files\Blender Foundation\Blender 5.2\blender.exe`, run with `-b`)

```
blender -b unit.blend --python scripts/audit_unit.py -- out/audit_before.json --label before
blender -b unit.blend --python scripts/upscale_textures.py -- out/tex up2 --scale 2 --scale-mat Raider=1 [--weave 0.035 --weave-mat Gurney] [--hook my_hook.py]
blender -b unit_up2.blend --python scripts/add_geometry.py -- unit_up2_geo.blend --subsurf GurneyFill_coat:1 --max-tris 9500
blender -b unit_up2_geo.blend --python scripts/audit_unit.py -- out/audit_after.json --label after
python scripts/compare_audits.py out/audit_before.json out/audit_after.json
blender -b unit_up2_geo.blend --python scripts/render_views.py -- out/renders up2 --gamelike
blender -b unit_up2_geo.blend --python scripts/make_preview_blend.py -- 03_blender/Unit_PREVIEW.blend     # needs 05_fbx_export/anim/Common_FightIdle.fbx
```
`film_test.py` diagnoses a hazy look (modes importer / matte / diffuse / nospec / nometal / noao).
`hardware.py`, `polish_lib.py` (rasterise mesh into texture, anti-aliased coverage, Canvas) are the library; `examples/ginaz_polish/` has the
real before/after sheets; the full Ginaz scripts live in `../dsw-new-unit/scripts/` (`41_polish_textures.py`, `43_polish_neophyte.py`, `03_variants_v3.py`).

## Things to keep true

- **Look, then claim.** Render, Read the PNG, send it with SendUserFile. Compare before/after crops at the same camera.
- **Albedo must not drift.** The upscale sharpens and adds relief; it must not change the colours the user approved (`compare_audits` prints drift).
- **Preview lighting is not the model.** If something looks washed out, run `film_test.py` before touching textures.
- **Non-Color first.** In bpy set `colorspace_settings.name = "Non-Color"` BEFORE writing pixels or the buffer is cleared (maps come out all zero; the audit catches it).
- **Don't change the live game without asking** and never delete files (archive/back up). Not Sardaukar, ever, for any added part.
- Memory of the user's taste: wants the work done, not instructed; wants to SEE progress images in chat.
