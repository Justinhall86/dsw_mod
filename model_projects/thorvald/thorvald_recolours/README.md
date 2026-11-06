# Thorvald recolours

Six vanilla assets recoloured into the House Thorvald palette (see `house_thorvald/art_direction.md`): clean gunmetal body, rust where
the faction colour was, copper trim, ember lights. Only the removals the user asked for were made; nothing else changed.
Nothing here is exported to the game yet.

| Asset | Source | Changes | Result |
|---|---|---|---|
| Artillery drone | `Vehicle/Imperial/DroneI` (Corrino) | gun removed: islands on `B_Canon*`, `B_GearCanon*`, `B_GearPlate*` (the hex lid `B_Head` stays) | `03_blender/artillery_drone_final.blend` |
| HQ | `extr/Structure/Base/ConquestOutpost` (Atreides albedo) | both banners removed: geometry islands 271, 272, 284, 285, 1244-1247, 1415-1418, **and** the pennant painted into the wall texture (all four maps, `hq_clean_banner.py`) | `03_blender/hq_outpost_final.blend` |
| Ravager ship | `Vehicle/Common/Ravager` | wingtip jet pods (islands beyond \|y\| 1.03), the chin gun (`B_Canon`) and its housing under the body removed | `03_blender/ravager_ship_final.blend` |
| Corrino harvester | `Vehicle/Imperial/Harvester` | recolour only, body + tracks (cloud session) | `04_textures/Harvester_Albedo.png`, `Harvester_Track_Albedo.png` |
| Ornithopter | `Vehicle/Atreide/Ornithopter` | recolour only (cloud session) | `04_textures/Ornithopter_Albedo.png` |
| Indoctrination Center | `extr/Structure/Buildings/IndoctrinationCenter` (Atreides albedo) | recolour only | `03_blender/indoctrination_center_final.blend` |

Every removal deletes whole islands, so nothing that stays is cut open; `render_asset.py` prints the open-edge check (`KEPT_OPEN_EDGES ... OK`).

## Scripts (`08_scripts/`)
Drone, HQ, Ravager, Indoctrination Center (local session):
- `01_prep.py` converts each asset's HMD to FBX and its textures to PNG into `01_input/<asset>/` (`assets.py` lists the sources).
- `02_recolour.py` writes `04_textures/<asset>/`. Value is kept as a ratio to the class's bright anchor, so panel detail stays and dirt is not amplified.
- `hq_banner_uv.py` + `hq_clean_banner.py` find and paint out the banner in the HQ wall texture (`04_textures/hq_outpost/clean/`).
- `run.py <asset> <stage> [--tex thorvald] [--delete '<rules>'] [--zoom n] [--blend]` renders through `render_asset.py`; the exact delete rules are in
  each `02_progress_photos/<asset>/final/_config.json`.

Harvester and Ornithopter (cloud session): `recolour.py`, `drive.py harvester|ornithopter [--gif]`, `render.py` (per-material-slot texturing,
needed for the harvester tracks). Its paths point at the cloud checkout (`/home/user/dsw_mod`).

## Before packing
The game ships DDS behind a `.png` name: convert the recoloured PNGs before packing (dsw-model-modding skill). Removals need the mesh
re-exported through the HMD toolkit, and vehicle exports need `thorvald_ship/08_scripts/53_fix_bind.py`.
