# Master of Ginaz (2026-10-24 night)

Concept: `house_ginaz/images/art_master_filigree_school_banner.png` and the "Master of Ginaz" panel of `units_concept_roster.jpg`:
fully embroidered wine coat with gold filigree, tall gold-rimmed collar, cape, grey-streaked beard, long rapier/sabre, banners.
A big upgrade of the Ginaz Captain (swordmaster) as the user suggested.

## Recipe (`08_scripts/03_variants.py` variant `M1_Master`, textures `30_master_textures.py`)
| Part | Source | Treatment |
|---|---|---|
| body, mantle, belt, boots | Ginaz Captain recipe (Mercenary, metal stripped; Raider tunic; Gurney coat tails; Bannerjee head; hand-modelled collar) | as for the Captain |
| cape | the Mercenary's own cape islands 13, 16 (bones `B_Cape01-03`, animated by the clips) | kept (the Captain removes them), tagged region `cape`, recoloured wine with a gold yoke |
| recolour | `08_uvdump.py` (adds a `cape` region) -> `09_ginaz_recolour.py` (cape rule, hair band 0.06-0.52) -> `10_apply_textures.py` | same Ginaz palette |
| embroidery | `30_master_textures.py`: gold painted BY 3D POSITION | chest: gold frogging bars + end loops + front piping + a vine down the centre; coat: filigree on the opening edge and hem band + gold hem line; cape: filigree band and hem lines |
| hair | silver bands (streak back from the forehead, temples, chin tuft and two beard streaks) | clean bands: speckle noise aliased on the small textures |
| weapon | Ecaz TallSword baked to B_Weapon (11_sword_anim / 12b) | as for the Captain |
Not modelled: the two banners on poles (props; would need their own attachment), a sabre instead of the rapier.

## Files
- Blends: `03_blender/M1_Master.blend` (geometry), `M1_Master_plum.blend` (Ginaz recolour), `M1_Master_m3.blend` (+ embroidery), `Ginaz_Master.blend` (+ sword).
- Textures: `04_textures/m3/`. Renders: `04_textures/m3/renders/`, concept comparison `02_progress_photos/master_vs_concept.png`.
- Animations (Common_FightIdle, Run, AttackMelee01/02, FightHitFront): `02_progress_photos/05_frames/`, GIFs `02_progress_photos/gifs/`, sheet `master_clips_sheet.png`.
  Cape trails behind him in the run; sword stays in the hand; no tearing seen.
- Game package (NOT installed): `06_game_ready/Male01_GinazMaster/` (HMD, prefab, materials.props, 15 textures; check_hmd RESULT OK; also in the editor res tree `CharMOD/Male01_GinazMaster`).
  Built with `12b_assemble_export.py` + `14_make_game_package.py`.
- Data: `15_new_units_cdb.py` adds it (and the Neophyte) as NEW Atreides units cloned from A_Trooper; dry run tested on a temp copy; run with `--apply` to write.

## Open
Hero slot / wheel position decision; whether to keep the Warden takeover as the Captain; banners; sabre.
