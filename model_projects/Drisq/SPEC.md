# Drisq - project notes

## What this project is

A self-contained .blend of the Smuggler Drisq character (Female01_SmugglersDrisq) with her sniper rifle weapon, ready for viewing in Blender. The model is the vanilla Smuggler Drisq unit with her DrisqSniper weapon attached to the B_Gun bone.

| Variant | Model | Look |
|---|---|---|
| Drisq | `CharMOD/Female01_SmugglersDrisq` | Vanilla Smuggler Drisq with sniper rifle |

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

1. **Converted HMD to FBX** - The source `Female01_SmugglersDrisq.fbx` was actually an HMD file (magic `HMD\x03`). Converted using `hmd2fbx.py` to `Drisq.fbx` (6318 verts, 9687 tris, 49 bones, 41 skin clusters).

2. **Analyzed mesh components** - Ran `01_analyse_mesh.py` which identified 89 connected components, each rendered alone for identification.

3. **Converted weapon HMDs to FBX** - The DrisqSniper.fbx and DrisqDrone.fbx were also HMD files. Converted using `hmd2fbx.py`:
   - DrisqSniper.fbx: 737 verts, 806 tris (sniper rifle)
   - DrisqDrone.fbx: 3 models (R_DrisqDrone, A_DrisqDrone, DrisqDrone) - multi-model HMD, only the DrisqDrone geometry (354 verts, 366 tris) was extracted

4. **Built the .blend** - Ran `07_build_blend.py` with:
   - Body: `Drisq.fbx` (6318 verts, 9687 tris, 49 bones, 41 skin clusters)
   - Textures: Drisq_Albedo.png, Drisq_MetallicGlossAO.png, Drisq_Normal.png
   - Weapon: DrisqSniper.fbx (737 verts, 806 tris) with textures DrisqSniper_Albedo.png, DrisqSniper_MetallicGlossAO.png, DrisqSniper_Normal.png (renamed to MaulaRifle_* for the script)
   - Weapon bone: B_Gun (from prefab constraint target for DrisqSniper)
   - Grip bone: B_rWristJ
   - Weapon rotation: -90, 0, 0 (from prefab: rotationX: -90)
   - Grip point derived from B_rWristJ weighted vertices: (-0.652, -0.018, 1.107)
   - Weapon parented to B_Gun bone using `parent_set(type='BONE')`

4. **Verified the .blend** - Ran `08_verify_blend.py` which reported **PROBLEMS: none**. Checks passed:
   - Body: 6318 verts, 9687 tris, 41 vertex groups, armature modifier present
   - Weapon: 737 verts, 806 tris, parented to B_Gun bone (not skinned)
   - Materials: Mat_Drisq (body) and DrisqSniper_MAT (weapon) both wired correctly
   - All 10 images packed into the .blend
   - Rig has 49 bones, B_Gun present

5. **Generated showcase renders** - Ran `09_showcase.py` producing 5 angles:
   - front, three_quarter, side, back, back_closeup

## Unfinished / to check in game

- [ ] Verify weapon placement in-game (the sniper rifle grip should align with B_Gun bone)
- [ ] Check if the sniper textures (DrisqSniper_*) are correct for the weapon model
- [ ] Test animation playback in-game
- [ ] The DrisqDrone was not included in the .blend - it's a separate animated model with its own animation file
