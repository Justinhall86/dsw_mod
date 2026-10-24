# Bannerjee - project notes

## What this project is

A self-contained .blend of the Smuggler Bannerjee character (male01_SmugglerBannerjee) with its spear weapon, ready for viewing in Blender. The model is the vanilla Smuggler Bannerjee unit with its Bannerjee_Weapon (spear) attached to the B_Weapon bone.

| Variant | Model | Look |
|---|---|---|
| Bannerjee | `CharMOD/male01_SmugglerBannerjee` | Vanilla Smuggler Bannerjee with spear |

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

1. **Converted HMD to FBX** - The source `male01_SmugglerBannerjee.fbx` was actually an HMD file (magic `HMD\x03`). Converted using `hmd2fbx.py` to `Bannerjee.fbx` (4750 verts, 7403 tris, 53 bones, 36 skin clusters).

2. **Analyzed mesh components** - Ran `01_analyse_mesh.py` which identified 71 connected components, each rendered alone for identification.

3. **Converted weapon HMD to FBX** - The Bannerjee_Weapon.fbx was also an HMD file. Converted using `hmd2fbx.py` to `Bannerjee_Weapon.fbx` (241 verts, 306 tris).

3. **Built the .blend** - Ran `07_build_blend.py` with:
   - Body: `Bannerjee.fbx` (4750 verts, 7403 tris, 53 bones, 36 skin clusters)
   - Textures: Bannerjee_Albedo.png, Bannerjee_MetallicGlossAO.png, Bannerjee_Normal.png
   - Weapon: Bannerjee_Weapon.fbx (241 verts, 306 tris) with textures BannerjeeSpear_Albedo.png, BannerjeeSpear_MetallicGlossAO.png, BannerjeeSpear_Normal.png (renamed to MaulaRifle_* for the script)
   - Weapon bone: B_Weapon (from prefab constraint target)
   - Grip bone: B_rWristJ
   - Weapon rotation: -90, 180, 0 (from prefab: rotationX: -90, rotationY: 180)
   - Grip point derived from B_rWristJ weighted vertices: (-0.709, -0.037, 1.11)
   - Weapon parented to B_Weapon bone using `parent_set(type='BONE')`

4. **Verified the .blend** - Ran `08_verify_blend.py` which reported **PROBLEMS: none**. Checks passed:
   - Body: 4750 verts, 7403 tris, 36 vertex groups, armature modifier present
   - Weapon: 241 verts, 306 tris, parented to B_Weapon bone (not skinned)
   - Materials: Mat_Bannerjee (body) and Mat_Spear (weapon) both wired correctly
   - All 10 images packed into the .blend
   - Rig has 53 bones, B_Gun present

5. **Generated showcase renders** - Ran `09_showcase.py` producing 5 angles:
   - front, three_quarter, side, back, back_closeup

## Unfinished / to check in game

- [ ] Verify weapon placement in-game (the spear grip should align with B_Weapon bone)
- [ ] Check if the spear textures (BannerjeeSpear_*) are correct for the weapon model
- [ ] Test animation playback in-game
