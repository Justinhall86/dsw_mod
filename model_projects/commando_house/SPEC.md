# commando_house - project notes

The **Commando** (`model_inputs/Commando/Male01_Commando_TRUE_FBX.fbx`) repainted in the
**House Ginaz** colour design: deep plum coat with warm gold trim.

The Commando is the body of the vanilla **House Legionary** (`unit` sheet: `House_Soldier`,
faction `MinorHouses`, model entry `House_Soldier` -> prefab
`Character/Common/Commando/Male01_Prefab_Commando.prefab`). Nothing in the vanilla game
is modified: the recolour is a **new** model (`CharMOD/Male01_CommandoHouse`) that has to be
pointed at by a model entry.

## Colour design source

`model_inputs/house_ginaz_roster.jpg` - the "HOUSE GINAZ UNITS" sheet. The **COMMANDER**
figure (far right) is the design: a plum coat, plum armour, gold trim, dark under-suit.
Palette sampled from the art and recorded in `04_textures/house_palette.json`:

| Role | RGB | Where it goes |
|---|---|---|
| plum | 104, 54, 66 | chest plate + badge (the game's own faction-tint region) |
| plum plate | 72, 42, 52 | the big armour plates: bracers, knee pads, thigh pouch |
| plum dark | 42, 26, 33 | scarf, hood, bodysuit |
| gold | 196, 154, 78 | small trim: fan vents, buckles, wrist bands, knee trim |
| leather | 92, 48, 38 | the brown vest / belt, deepened to burgundy |
| skin | 150, 104, 84 | face and hands, untouched |

## Method

The base texture already carries the painted shading, so the recolour **replaces hue and
saturation and keeps value** - the same trick the game uses for its own faction tints
(`Commando_Atreides_Albedo.png` etc. are hue replacements of `Commando_Albedo.png`).
Every crease, shadow and highlight therefore survives for free.

Two extra passes were needed to make it look right:

1. **Value compression.** The base regions span a far wider value range than the target
   colour allows (a cream plate at 250 would turn the plum into pink), so each region's
   robust value range (3rd..97th percentile) is compressed onto a band around the target
   brightness.
2. **Residual hue snap.** The base texture has mottled camo-ish green patches (chest
   straps, shoulder). Any pixel whose hue is more than 18 degrees from its region's target
   is snapped onto the target hue, so no old colour leaks through.

**Trim vs armour.** The big cream/steel plates and the small trim are the *same* colour in
the base texture, so they are separated by **connected-component size**: a metal blob over
420 px is an armour plate (region 5), a smaller one is trim (region 6). Without this split
the whole model turns into a gold statue (first attempt, `02_progress_photos/02_recolour/
commando_house_v1_front.png`).

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | (empty - the source FBX and textures stay in `model_inputs/Commando/`) |
| `02_progress_photos/01_base_inspect/` | the untouched Commando rendered from 4 angles |
| `02_progress_photos/02_recolour/` | `house_v1`..`v5` iterations + `final` (game-ready texture) |
| `03_blender/` | (empty - the work is scripted, no .blend was needed) |
| `04_textures/` | `Commando_House_Albedo/_MetallicGlossAO/_Normal.png`, `house_palette.json`, and the intermediate `uv_position.npy` / `uv_normal.npy` / `uv_covered.npy` / `region_ids.npy` |
| `05_fbx_export/` | `Male01_CommandoHouse.fbx` (the toolkit input) |
| `06_game_ready/house_variant/` | the HMD, prefab, materials.props and 3 textures as packed into the pak |
| `07_data_cdb/` | (empty - no data.cdb entry was created yet) |
| `08_scripts/` | the numbered pipeline (see below) |

## The pipeline (08_scripts/)

| Script | What it does |
|---|---|
| `01_render_base.py` | renders the untouched Commando from 4 angles (Blender) |
| `02_uv_position_map.py` | rasterises a UV-space world-position + normal map (Blender) |
| `03_classify_regions.py` | classifies every albedo pixel into a material region (numpy) |
| `04_recolour.py` | paints the House palette onto the albedo (numpy) |
| `05_render_preview.py` | renders any texture set on the model for review (Blender) |
| `06_bake_fbx.py` | points the material at the new textures and exports the FBX (Blender) |

Run order: `02` (Blender) -> `03` -> `04` -> `06` (Blender) -> `convert_model.py`.

## Game-ready output

`06_game_ready/house_variant/` = `CharMOD/Male01_CommandoHouse/`:

- `Male01_CommandoHouse.hmd` - 3,299 verts / 5,284 tris, 53 joints, 0 zero-length normals,
  99.8% agree with triangle facing
- `Male01_CommandoHouse.prefab` - the vanilla Commando prefab with the body swapped; the
  `Atreide_MaulaRifle` stays constrained to `...B_rWristJ.B_Gun`
- `materials.props` - copied from the vanilla Commando folder (PBR, `emissive: 0.1`), keyed
  on `Mat_Commando`. Without it the model renders darker than vanilla.
- 3 textures, RGBA, alpha 255, 512x512

`check_hmd.py` result: **OK**.

## Unfinished / to check in game

- **No data.cdb entry yet.** The model exists but nothing points at it. To use it:
  `cdb_tools.py add-model --id N_CommandoHouse --clone-from House_Soldier --mesh
  CharMOD/Male01_CommandoHouse/Prefab_CommandoHouse.prefab`, then a unit that uses that
  model. `House_Soldier` is the entry to clone (it is the Commando's model entry).
- Not built into a pak yet, and not tested in game.
- The recolour keeps the base texture's 512x512 resolution; the game's own faction tints are
  the same size, so this matches vanilla.
- The dark under-suit (region 2) is 58% of the texture; it went from near-black to very dark
  plum. It reads well in the renders but may look flat in game lighting.
- The House Ginaz design has a long coat; the Commando body has none. Only the colours were
  applied - the silhouette is still the vanilla Commando.
