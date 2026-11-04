# thorvald_buildings - project notes

Seven House Thorvald unique buildings (the list in `house_thorvald/buildings.md`), modelled from scratch in Blender as full 3D models.
Stage reached: **models + materials + previews. Not UV-unwrapped, not converted to HMD, no `data.cdb` row, nothing installed.**

## Why from scratch (the unused-asset search)
Checked 2026-11-04 against `mod_files/data.cdb` and `docs/true_orphans_catalog.txt`.

- The catalog's "true orphans" are judged by file name only, and a prefab loads its FBX indirectly, so almost every building FBX counts as an "orphan" while its
  prefab is in use. Judged by building **folder** instead (is `Structure/Buildings/<Folder>/` named anywhere in the cdb?), only these are really unused:

| Unused folder | What it is | Best fit for a Thorvald building |
|---|---|---|
| `Structure/Buildings/IndoctrinationCenter/` (`IndoctrinationCenter.fbx` + `Prefab_IndoctrinationCenter.prefab`) | an indoctrination building, never given a building row | **Contract Hall** (conditioning the Iron Guard) or **Asylum Quarter** |
| `Structure/Point_Of_Interest/TrafficHub/` | a transport hub for a map point of interest | **Sub-Contract Depot** |
| `Structure/Point_Of_Interest/Stash_Smuggler/` | a smuggler stash prop | a yard prop only |
| `Structure/Buildings/*/Prefab_*_Construction.prefab` (24+) | under-construction states for every building | build animations for any of the above |

- **None of those files is in this repo.** They sit in the game's pak (`C:\dsw_mod\extr` on your machine), so they could not be opened, recoloured or kitbashed here.
  Copy the folders into `model_inputs/Structure/` and the Contract Hall, Sub-Contract Depot and Asylum Quarter can be rebuilt as a kitbash on the real meshes.
- Everything else the cdb uses is shared by several rows already (for example `MilitaryFactory` and `MilitaryFactory_Fremen` both use the WaterPlant prefab).

## The seven models
Triangle counts are of the joined mesh. Footprints are in metres and are **assumed**: no vanilla building was available to measure, so they must be scaled against a
vanilla prefab (`building.props.scale`) before they go in the game.

| Building | File | Footprint x depth x height | Triangles | Reads as |
|---|---|---|---|---|
| Consignment Terminal | `Thorvald_ConsignmentTerminal` | 18.0 x 13.0 x 9.3 | 3,134 | three silos, a gantry crane over a loading dock, containers, a control cabin |
| Contract Hall | `Thorvald_ContractHall` | 17.0 x 17.0 x 12.1 | 3,074 | a columned hall under a wide kasa-hat roof (the infantry's hat), banners, braziers |
| Syndicate Exchange | `Thorvald_SyndicateExchange` | 17.1 x 13.0 x 15.4 | 1,862 | a trading house: six-column portico, ticker band, the emblem over the door, a dish |
| Ledger Office | `Thorvald_LedgerOffice` | 13.0 x 13.0 x 12.1 | 1,656 | a vault tower with a round vault door and slit windows, an archive annex |
| Sub-Contract Depot | `Thorvald_SubContractDepot` | 22.3 x 18.0 x 12.2 | 2,090 | landing pad, barrel-roof hangar, fuel tanks, control tower, windsock |
| Deep Mine Works | `Thorvald_DeepMineWorks` | 19.0 x 16.0 x 11.8 | 2,490 | mine portal and rails, A-frame headframe, winch house, crusher, ore bin |
| Asylum Quarter | `Thorvald_AsylumQuarter` | 23.0 x 20.2 x 7.2 | 2,718 | a walled compound: gate towers, barracks rows, a canopy and well |

For scale: the vanilla Atreides Trooper is about 8.9k triangles. Vanilla building counts could not be measured here, so whether these are too light is unknown.

## Look
Palette from `house_thorvald/art_direction.md`: gunmetal and plate, rust-brown cloth, copper trim, burnt orange (`#CC5500`, the faction colour) edges, emissive
lamps. The gear-and-star emblem (`house_thorvald/images/emblem_gear_star.png`) is on banners and door faces as an alpha-cut image plane. Front faces -Y, ground at z = 0.
Gunmetal was lifted slightly from the art-direction value so the silhouettes read on sand: the "almost entirely near-black" contrast risk in `art_direction.md` applies to buildings too.

## Files
- `03_blender/Thorvald_<Name>.blend`: the model, materials kept, emblem packed.
- `05_fbx_export/Thorvald_<Name>.fbx`: same mesh with the texture embedded.
- `02_progress_photos/<Name>_{three_quarter,front,back,side}.png` and `<Name>_turntable.gif`: Cycles CPU previews on a sand ground (the ground is not in the model files).
- `08_scripts/`: `kit.py` (materials and primitives), `buildings.py` (the seven builders), `build.py <Name> [--gif|--fast]`, `assemble_gifs.py`.
  Needs the `bpy` pip package (`pip install bpy==5.2.3`); no GPU needed.

## Not done / next
- **UV unwrap and a texture.** The models use flat palette materials; only the emblem planes have UVs. The game path (HMD) needs UVs and the three texture maps
  (Albedo, MetallicGlossAO, Normal), so the next step is a Smart UV project plus a baked atlas per building.
- **Scale and footprint** against vanilla (`building.props.scale`, `buildingRadius`).
- **Triangle budget** against vanilla buildings once one can be measured.
- **cdb rows** (`building`, texts, thumbnail 592 x 168) and the pak, per `dsw-model-modding`.
- If the real unused meshes are supplied, redo the Contract Hall / Depot / Asylum Quarter as kitbashes and keep these as the fallback.
