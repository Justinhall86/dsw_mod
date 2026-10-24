# Commando No Backpack Scarf - project notes

## What this project is

A self-contained .blend of the Commando character with both the backpack AND the scarf removed. The model is the vanilla Commando (House Legionary) with the green scarf/cape at the neck removed.

| Variant | Model | Look |
|---|---|---|
| Commando No Backpack Scarf | `CharMOD/Male01_CommandoNoPackScarf` | Vanilla Commando, no backpack, no scarf |

Source: `01_input/`

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | the source model and its textures |
| `02_progress_photos/01_components/` | every component rendered alone |
| `02_progress_photos/02_removed/` | the result of the removal, and the closure proof |
| `02_progress_photos/03_recolour/` | the recolour iterations |
| `02_progress_photos/04_showcase/` | the final showcase angles |
| `03_blender/` | the finished .blend files |
| `04_textures/` | the recoloured textures and the region map |
| `05_fbx_export/` | the edited FBX |
| `06_game_ready/` | the shipped assets (HMD, prefab, materials.props) |
| `07_data_cdb/` | the data.cdb entries, if any |
| `08_scripts/` | the scripts used, for the record |

## What was done

1. **Source model** - The vanilla Commando `Male01_Commando_TRUE_FBX.fbx` (3299 verts, 5284 tris, 53 bones, 36 skin clusters) with 45 connected components.

2. **Component analysis** - Ran `01_analyse_mesh.py` which identified 45 connected components, each rendered alone for identification. The scarf/cape was identified as components 4, 5, 6, 7 (two pairs of symmetric pieces at the neck/chest area, z ≈ 1.11..1.82, green albedo color).

3. **Removed scarf geometry** - Ran `02_remove_parts.py --components 4,5,6,7` with probe box `-0.3,0.3,0.1,0.5,1.1,1.8`. All three closure proofs passed:
   - **Proof 1**: Boundary-edge parity - all 41 surviving components have unchanged boundary-edge counts (total 1240 → 1094)
   - **Proof 2**: Ray normal orientation - 62 rays cast from behind, 0 inside-facing hits
   - **Proof 3**: Component membership - newly exposed panel belongs to body component 0 (torso), confirming the scarf was a separate shell covering the body
   
   Result: 3299 → 2879 verts, 5284 → 4590 tris (694 faces removed, 420 loose verts dropped)

4. **Removed scarf from texture** - The mesh was clean but the albedo texture still had the green scarf painted on the body's UV islands (neck/chest). Ran the recolor pipeline:
   - `04_classify_regions.py` with `humanoid` preset → 6 regions identified (skin, dark_fabric, leather, armour_plate, small_trim)
   - Created palette mapping all regions to their original colors (dark_fabric for the uniform, etc.)
   - `05_recolour.py` with custom palette → `Commando_NoScarf_Albedo.png` (green scarf color replaced with dark_fabric color on the neck/chest UV islands)
   
   The recolor uses hue/saturation replacement with value compression and residual hue snap, so the green scarf color on the neck/chest UV islands was replaced with the dark uniform color while preserving all shading.

5. **Built the .blend** - Ran `07_build_blend.py` with:
   - Body: `Commando_NoBackpack_Scarf.fbx` (2879 verts, 4590 tris, 53 bones, 36 skin clusters)
   - Textures: `Commando_NoScarf_Albedo.png`, `Commando_NoScarf_MetallicGlossAO.png`, `Commando_NoScarf_Normal.png`
   - No weapon (just the body)

6. **Verified the .blend** - Ran `08_verify_blend.py` which reported **PROBLEMS: none**. Checks passed:
   - Body: 2879 verts, 4590 tris, 36 vertex groups, armature modifier present
   - Material: Mat_Commando wired correctly (Albedo, MGAO, Normal)
   - All 4 images packed into the .blend
   - Rig has 53 bones, B_Gun present

7. **Generated showcase renders** - Ran `09_showcase.py` producing 5 angles:
   - front, three_quarter, side, back, back_closeup

## Unfinished / to check in game

- [ ] Verify in-game that the scarf is fully gone and no hole remains
- [ ] Test animation playback in-game
- [ ] If this is for a mod, create the HMD and prefab entries
