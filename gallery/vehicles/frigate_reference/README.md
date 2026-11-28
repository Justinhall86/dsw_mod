# Frigate reference renders (2026-11-28)

The seven vanilla faction frigates plus the current Thorvald frigate, all rendered the same way, as the reference
for the Thorvald frigate redesign. Read-only: no game, cdb, pak or model files were changed.

## Start here

| File | What it is |
|---|---|
| `00_LINEUP_top.png` | All eight top-down in **one scene with one camera**: true relative size in game, 10 m scale bar |
| `00_LINEUP_tq.png` | All eight from the same 3/4 front angle, each tile 20 m across (same scale) |
| `00_TABLE.png` | The table below as a picture |
| `01_Kraken_sheet.png` ... `08_Thorvald_sheet.png` | Per ship: 3/4 front, 3/4 rear, top (nose down), RTS-distance thumbnail at native 420 × 300, facts |
| `views/` | The single renders (`<Ship>_tq`, `_tq_rear`, `_top`, `_rts`), plus the unlabelled lineup |
| `stats.json`, `measure.json` | The numbers behind the table |
| `scripts/` | How it was made (see "Rebuild") |

## The frigates

Found through the unit sheet: every row that `inherits: Frigate` (one per faction, recruited with Guild Favor,
10 Fuel Cell upkeep; the Fremen one costs Scraps instead and has no Fuel Cell upkeep).
Vanilla rows are from `mod_files/data_vanilla_2026-11-09.cdb` (the newest vanilla extract in the repo); the Thorvald row
is from the working `mod_files/data.cdb`.

| Ship (display name) | Unit / model row | Mesh path | Mesh bbox L×W×H | cdb scale | In-game L×W×H (m) | Tris | Mats | Textures | Tint mask |
|---|---|---|---|---|---|---|---|---|---|
| Kraken (Atreides) | A_Frigate | `Vehicle/Atreide/Kraken/Prefab_Kraken.prefab` | 7.99 × 5.97 × 1.86 | 1.6 | 12.8 × 9.6 × 3.0 | 520 | 1 | 3 @ 512 | no |
| Overlord (Harkonnen) | H_Frigate | `Vehicle/Harkonnen/Overlord/Overlord.fbx` (no prefab) | 13.61 × 3.84 × 5.21 | 1.2 | 16.3 × 4.6 × 6.3 | 5,800 | 1 | 3 @ 512 | no |
| Cronos (Corrino; files say "Chronos") | C_Frigate | `Vehicle/Imperial/Chronos/Prefab_Chronos.prefab` | 9.29 × 6.10 × 2.77 | 1.7 | 15.8 × 10.4 × 4.7 | 4,510 | 2 | 6 (3 @ 1024 + 3 @ 2048) | no |
| Wraith (Smugglers) | S_Frigate | `Vehicle/Smuggler/Wraith/Prefab_Wraith.prefab` | 8.53 × 8.46 × 6.07 | 1.2 | 10.2 × 10.2 × 7.3 | 8,416 | 1 | 3 @ 512 | no |
| Altar (Fremen) | F_Frigate | `Vehicle/Fremen/Altar/Prefab_Altar.prefab` (hull + `Altar_AllFabric`) | 9.87 × 5.49 × 3.83 | 1.5 | 14.8 × 8.2 × 5.7 | 2,810 | 1 | 3 @ 512 | no |
| Monument of Eternal Grace (Ecaz) | E_Frigate | `Vehicle/Ecaz/Monument/Prefab_Monument.prefab` | 6.18 × 8.09 × 9.15 | 1.2 | 7.4 × 9.7 × 11.0 | 4,048 | 1 | 3 @ 1024 | no |
| Folder Relay (Vernius) | V_Frigate | `Vehicle/Vernius/FolderRelay/Prefab_FolderRelay.prefab` | 6.27 × 6.26 × 10.76 | 1.0 | 6.3 × 6.3 × 10.8 | 3,936 | 1 | 4 @ 1024 (incl. emissive) | no |
| Thorvald cruiser (mod, current) | TH_Frigate / model `Th_Frigate` (also `A_Frigate` in the mod cdb) | `VehMOD/Thorvald_Frigate/Prefab_Thorvald_Frigate.prefab` | 13.17 × 7.67 × 3.79 | 1.2 | 15.8 × 9.2 × 4.5 | 4,763 | 1 | 3 @ 1024 (PNG, not DDS) | no |

- L = nose to tail. The bounding box is measured after the rig (armature evaluated) and the prefab rotation; mesh units are
  treated as metres. "In-game" = mesh × the cdb model `scale`. Triangle counts come from the HMD index buffers.
- Textures: albedo, MetallicGlossAO(Emiss) and normal per material, all DXT5 DDS in the vanilla files.
  The Cronos's second material (`_Mat_ImperiumDrone2`, 3,390 of its 4,510 triangles) uses the Imperial drone textures
  (`Vehicle/Imperial/DroneI/ImperiumDrone_*`, 2048 px).
- The Kraken really is 520 triangles: its HMD has a single model named `Kraken_low` and no other LOD.

## Faction colour (no team-colour mask)

None of these frigates has a team-colour mask, and their materials carry no tint parameter:

- Each HMD material has exactly three textures (albedo, MetallicGlossAO[Emiss], normal). The albedo alpha is 255 everywhere,
  and the MGAO alpha is the emissive mask (lights), not a tint mask.
- `materials.props` holds only render state. Its `"colorMask": 15` is the RGBA *write mask* (all four channels), not a team-colour map.
- Faction colour is **painted into the albedo**: Atreides green, Harkonnen red, Corrino cream and gold, Ecaz magenta, Vernius violet.
- Where the game shares a model between factions, it swaps in a separately painted albedo instead
  (`*_Atreides_Albedo.png`, `*_Harkonnen_Albedo.png`, ...), as the `Character/LineUp_*.prefab` files do with a `diffuseMap` override
  (e.g. `CarryAll_Atreides_Albedo.png`, `Airfield_Atreides_Albedo.png`). Frigates are faction-unique, so they have one albedo each.
- Not checked: whether the engine adds any player-colour effect at runtime (selection ring, minimap). `hlboot.dat` is not in this
  container. So there is no with/without-mask pair to render.

## How it was rendered

- **Same source for every ship:** each ship is loaded from the HMD the game ships, converted to FBX with the repo's toolkit
  (`hmd2fbx`; the vanilla ones are the existing `preview_textures/<Name>_real.fbx`; the Thorvald HMD from
  `thorvald_frigate/06_game_ready` and `Altar_AllFabric` were converted by `scripts/00_prepare.py`). The armature pose was baked,
  and the prefab rotation applied (Altar 90°). Textures come from the paths recorded in each HMD material, with the DDS converted to PNG unchanged.
- **Material:** MetallicGlossAO read the game's way (R metallic, G gloss → roughness = 1 − G, floored at 0.3; B AO multiplied
  into the albedo); normal map; emission = albedo × MGAO alpha (FolderRelay: its own emissive map), strength 1.
- **Scale and camera:** every ship × its cdb scale, sitting on z = 0. Orthographic camera, **20 m across every 1000 px view**
  (top views 1000 × 1000 = 20 × 20 m); thumbnail 420 × 300 at 41 m across, from the same high RTS angle as
  `thorvald_frigate/08_scripts/73_render_blend.py`'s `rts` view. View directions are the same as that script: tq (−0.7, −0.7, 0.55),
  tq_rear (0.7, 0.7, 0.55), top, rts (−0.35, −0.6, 1.0).
- **Light:** neutral grey world (0.62, 0.62, 0.64, strength 1), sun 3.0 at (55°, 0, 35°), fill sun 0.8 from the other side.
  Cycles CPU, 64 samples, denoised, Standard view transform.

## Workarounds and guesses (read these)

- **Renderer:** this cloud container has no Blender install or GPU. Blender 5.3 was installed as the `bpy` Python module, and
  EEVEE cannot start without a GPU, so this uses **Cycles**. The look is close to the earlier EEVEE sheets
  (`thorvald_frigate/Final/ANGLES.png`) but not identical. The fill light is a second sun, not that script's small area light
  (which sits inside a ship this size).
- **Nose direction is judged by eye.** The ships do not share a forward axis in the converted frame. Each was turned so its nose points
  down in the top view: the Kraken, Overlord (the "many eyes" pod), Cronos and Monument already faced that way. The Altar was turned
  so its spike leads, with the open nozzle at the rear (less sure); the Thorvald cruiser so its prow leads. The Wraith and
  Folder Relay are round, so their "front" is arbitrary. No in-game forward axis was checked.
- **Which files:** the vanilla meshes and textures are the repo's extracted copies in `model_inputs/Vehicle`, not read from the game
  install, which is on the Windows PC. The cdb rows are from the 2026-11-09 vanilla extract.
- **Left out:** the Altar's `Altar_Balloon.fbx` and `Altar_FabricStrips.fbx` (in the folder, but not in the prefab, so probably
  upgrade variants), `Select.fbx` (selection helper on the Overlord and Chronos), the Overlord's Sting drones (their own unit), and
  the Renegade frigate (a neutral raider, not a faction frigate).
- The per-ship top views were rendered with the camera's up vector flipped and then turned 180° in the image (for a straight-down
  orthographic view the two are identical). The script is fixed (`'top': (0, 0, 1)`).

## Rebuild

```
uv venv --python 3.13 <scratch>/bvenv && uv pip install --python <scratch>/bvenv/bin/python bpy numpy pillow
export FRIG_WORK=<scratch>
<scratch>/bvenv/bin/python scripts/00_prepare.py                       # convert Thorvald HMD + Altar fabric
<scratch>/bvenv/bin/python scripts/06_measure.py <scratch>/measure.json
python scripts/05_stats.py <scratch>/measure.json <scratch>/stats.json
<scratch>/bvenv/bin/python scripts/10_render.py <scratch>/full          # ~6 min on 4 CPU cores
<scratch>/bvenv/bin/python scripts/20_sheets.py <scratch>/full <scratch>/stats.json .
```

On the Windows PC, run the bpy scripts with Blender 5.2's own Python, or switch `10_render.py` to EEVEE for speed. The paths at the top
of `ships.py` (`R = /home/user/dsw_mod`) need changing there.
