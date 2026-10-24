# Idualis Trooper - All 3 Variants - project notes

## What this project is

A **preview .blend only** - no model editing. All three Idualis Trooper
variants were imported from their `*_TRUE_FBX.fbx` files, wired to their
game textures, armed with the weapons their prefabs specify, lined up side by
side in one scene, and packed into a single portable `.blend` so the user can
open it and press F12.

Source: `01_input/` (copied from `model_inputs/Idualis_Trooper/`)

| Variant | Model | Look | Weapon (per prefab) | Tris |
|---|---|---|---|---|
| 01 | `Male01_IdualisTrooper01_TRUE_FBX.fbx` | bald, crouched pose, red sash | DoubleKnife x2 (right + left wrist) | 7,071 |
| 02 | `Male01_IdualisTrooper02_TRUE_FBX.fbx` | masked, rope belt, pale shin wrap | LongKnife (right wrist) | 7,723 |
| 03 | `Male01_IdualisTrooper03_TRUE_FBX.fbx` | braided hair, orange scarf | MetalBar (right wrist) | 7,495 |

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | source FBXs, 9 body textures, 3 weapon textures, prefabs |
| `02_progress_photos/04_showcase/` | lineup front/3q/back renders + verify render |
| `03_blender/` | **`IdualisTrooper_all_variants.blend`** - the deliverable |
| `05_fbx_export/` | DoubleKnife / LongKnife / MetalBar converted to real FBX |
| `08_scripts/` | the scripts used, for the record |

## What was done

1. `00_new_project.py` - project folder.
2. `06_convert_weapon.py` x3 - the game stores weapons as HMD files with an
   `.fbx` extension; converted DoubleKnife (120 tris), LongKnife (79),
   MetalBar (198). Each came out as a single model, no `Cube` helper.
3. `07b_build_lineup.py` (new script in the skill's `scripts/` folder) -
   imports all three bodies, wires textures **per variant stem**, converts
   prefab weapon list into bone-parented placements, adds world/lights/
   camera, packs 15 images, saves the .blend, renders the lineup shots.
4. `08_verify_blend.py` - **`PROBLEMS: none`**.
5. Looked at every showcase render (front / three-quarter / back / verify).

### Numbers

| Step | Result |
|---|---|
| Bodies | 4,260 + 4,645 + 4,466 verts; 22,289 tris total |
| Weapons | 517 tris (120+120+79+198) |
| **Total** | **22,806 tris** |
| Images packed | 15 (9 body + 3 weapon duplicates from FBX alpha slots + 3 shared weapon) |
| Bones per rig | 56, `B_Gun` present on all three |

## Two bugs found by looking at the renders (and fixed)

1. **Blades pointed straight up.** The skill's Maula rifle has its barrel on
   local **+Z** (rotationX +90), but these Idualis weapons have their blade
   on local **−Y**. `Rx(-90)` lifted them vertical. Identity rotation points
   them forward (the character faces −Y).
2. **Variant 01's knives floated outside the crouched body.** Its armature is
   *posed* (crouch) while raw vertices are the rest pose, so a rest-pose grip
   landed ~1.5 m away. Grips are now read from the **evaluated/deformed**
   mesh (weights from original vertices, positions from the evaluated ones -
   the armature modifier keeps vertex order/count).

## Unfinished / to check in game

- [ ] Not a game mod - no `data.cdb`, HMD or pak changes were made, nothing
      installed into the game. Use `dsw-model-modding` if that is wanted.
- [ ] Weapon placement is mesh-derived (wrist centroid, blade forward),
      not the prefab's exact per-weapon offsets/rotations - good for a
      showcase, not bit-identical to in-game hold poses.
- [ ] No animation is loaded (`props.json` names `/Anim/Male01` and
      `/Anim/Male01/DoubleKnife` in the game tree if an idle pose is wanted).
