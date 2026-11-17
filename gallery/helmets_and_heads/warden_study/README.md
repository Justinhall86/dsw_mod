# Warden (Atreides Elite) helmet study for the Heavy Vanguard (2026-11-14)

Owner request: Warden helmet, recoloured to the Thorvald palette, no collar, the raised piece along the top removed and the crown smoothed,
Karlin's breather in place of the white face guard (as on the House Guard study), Karlin's antennae on the crown, 3-5 versions.
Built on the real Elite body (`thorvald_elite/03_blender/v2_final.blend`, kasa hat removed) wearing the 2026-11-13 palette (ground_v6 textures).

**2026-11-15 samurai pass (newer, supersedes W5c): see `samurai/README.md`.**

**Start with:** `warden_variants.png` (W1-W5c: helmet front, 3/4, back, on the unit, RTS), `lineup/faction_lineup.png` (all Thorvald ground units, same
pose/camera/light as the palette sheet, with the Vanguard as v3b, House Guard, W5 and W5c), `hg_vs_warden_on_body.png`, `W5c_all_angles.png`.

| Version | Paint | Folder |
|---|---|---|
| W1 | Warden's hex cheek/side plates in copper | `W1_copper_plates/` |
| W2 | Plates light gunmetal with copper edging | `W2_copper_trim/` |
| W3 | Copper crown (where the removed top piece was) | `W3_copper_crown/` |
| W4 | Gunmetal only | `W4_gunmetal_only/` |
| W5 | Copper crown + copper frame round the visor | `W5_copper_visor_frame/` |
| W5c | W5 + flat matte-copper antennae at 85 % of Karlin's length (W1-W5: dark, 60 %) | `W5_copper_antennae/` |

All versions: visor smoked gunmetal (#1B2023), shell two-tone gunmetal, helmet scaled 1.25 (the Warden is a Female01 head), Commando hood/goggle
faces inside the helmet culled, cheek-guard tips kept (removing them showed the shell's inner lining). `W5_long_antennae/` = W5 with 85 % dark antennae
(lineup only). `HG_on_body/` = the House Guard antenna + breather helmet on the same body, for comparison. `renders/orig`, `renders/ids` = vanilla Warden
helmet and its panel breakdown.

Scripts: `model_projects/thorvald/thorvald_elite/08_scripts/helmet_study/` (`wd_panels.py`, `wd_recolour.py`, `wd_build.py` [HELMET=warden|hg],
`wd_lineup.py`; every path in `paths.py`). Textures and masks: `thorvald_elite/04_textures/helmet_study/warden/`. Scene files (skinned to B_HeadJ,
ready for a 90/91 export): `thorvald_elite/03_blender/helmet_study/wd_<version>.blend`.
Rebuild W5c: `TAG=W5_copper_antennae TEX=<warden>/W5_copper_visor_frame.png FIT_SCALE=1.25 ANT_SCALE=0.85 ANT_COLOR=B87333 blender -b ../../03_blender/v2_final.blend --python wd_build.py`.

Findings: the Harkonnen Elite (`H_Elite`) is the House Guard model; the Atreides Elite (`A_Elite` vanilla) is the Warden. The Warden's recognisable parts
(green visor, white hex plates, top crest, face guard) are all changed here; the House Guard's (flared collar, face plate) mostly stay. The House Guard's
collar also cuts into the Vanguard's chest and pauldrons; the Warden fits without trimming. Nothing is installed.
