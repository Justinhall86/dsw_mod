# House Guard helmet study (2026-11-14)

Source: `model_inputs/Character/Imperial/HouseGuard/Male01_HouseGuard_TRUE_FBX.fbx` (head + collar only, 708 triangles). Vanilla albedo is the 512 px whole-body atlas.
- `vanilla_all_angles.png`: 12 views (front, both 3/4, both sides, back, both back 3/4, top, below, high, low).
- `recolour_compare.png`: vanilla + H1-H6, four views each. `H5_all_angles.png`, `H2_all_angles.png`: all 12 views of two of them.
- `renders/<variant>/<view>.png`: every single render. `textures/H*.png`: the recoloured 512 px albedos (drop-in for `HouseGuard_Albedo.png`).
- Scripts (moved 2026-11-14): `model_projects/thorvald/thorvald_elite/08_scripts/helmet_study/` (`hg_study.py` renders all views and, with TAG=orig, writes the
  panel masks `cats.json`; `hg_recolour.py` makes H1-H6; `hg_fill.py` fills the face-plate dimples; `hg_build.py` adds antennae + breather; `hg_sheet.py`).
  Their inputs and outputs (masks, recoloured textures) are in `thorvald_elite/04_textures/helmet_study/house_guard/`. Paths come from `paths.py` there.

Structure found: five natural panels (split where the surface bends more than 32 degrees): **dome** (top plate), **face plate** (front, three dimples), **chin vent**, **collar** (big flared gorget with a round stud each side), **shell** (sides and back). The back of the shell is a flat dark-painted surface with no detail.
The collar is large (as wide as the shoulders) and would sit over the Vanguard's pauldrons, so it probably needs trimming or scaling on that unit.

## antenna_breather/ (2026-11-14, from the owner's mock-up)
H5 with: face-plate dimples filled (albedo, normal and metal/AO inpainted inside the plate panel, `hg_fill.py`), Karlin's H2f4 antennae
moved from the forehead onto the copper crown (bases at x = +/-4.5 cm, 3.5 cm forward of the crown top, leaning back 8 deg),
and the House Guard chin vent replaced by Karlin's breather (Kit_face grey faces, scaled 1.15, 2 cm forward) - it fits inside the collar,
so the collar did not need filling. `HG_ant60_all_angles.png` (antennae at 60 % of Karlin's length), `HG_ant45_all_angles.png` (45 %).
The .blend files are scene-only (no rig binding yet). Rebuild: `thorvald_elite/08_scripts/helmet_study/hg_build.py` (env: TAG, ANT_SCALE, ANT_X, ANT_Y, ANT_TILT, MASK_SCALE, MASK_DY, ORTHO).

**Status (2026-11-14):** owner liked HG_ant60 ("This looks good"), but it may read as Harkonnen: the Harkonnen Elite (`H_Elite` model row) **is** the House Guard model
(`Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.prefab`). So the Warden helmet is being tried next (`../warden_study/`). Nothing here is on the unit or in the game.
