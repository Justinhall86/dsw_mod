# commando_no_backpack - project notes

The **Commando** with its **backpack removed**, in two colour variants:

| Variant | Model | Look |
|---|---|---|
| `no_backpack` | `CharMOD/Male01_CommandoNoPack` | the original Commando colours, no pack |
| `no_backpack_house` | `CharMOD/Male01_CommandoNoPackHouse` | the same, in the **House Ginaz** palette (plum + gold) |

The House palette comes from the sibling project
[`commando_house`](../commando_house/SPEC.md); only the mesh changed here.

Source: `model_inputs/Commando/Male01_Commando_TRUE_FBX.fbx` (the Commando is the
body of the vanilla **House Legionary**, `unit` sheet `House_Soldier`, faction
`MinorHouses`).

## How the backpack was found

The Commando mesh is a hard-surface model split into **45 separate connected
components** (torso, hood, head halves, arms, gloves, thigh armour, boots...).
The backpack is a set of those components:

| Component | Verts | Extent (world) | What it is |
|---|---|---|---|
| 4, 5 | 107 each | y 0.14..0.46, z 1.11..1.63 | the **pack body**, left and right half |
| 6, 7 | 103 each | y 0.20..0.46, z 1.62..1.82 | the **shoulder straps**, left and right |
| 41-44 | 8, 8, 4, 4 | y 0.44..0.46, z 1.61..1.66 | the tiny **buckle/clip** pieces at the rearmost point of the straps |

Everything else is the body and stays. Finding them took isolating each
component and rendering it on its own (`09_isolate_only.py`) - a render that
only *hides* a component is not enough, because the rest of the model still
occludes the view.

## Removing it leaves no hole

This is the part that needed real checking:

- The **torso component has 94 boundary edges both before and after** the
  removal. The pack is a separate shell that sits ON the back, it is not cut
  out of the torso, so removing it cannot open the torso.
- A **ray test from behind** over the area the pack occupied (x -0.18..0.18,
  z 1.15..1.55) finds only **outward-facing** surfaces - no inside-facing hits,
  so we are not seeing the inside of the body through a gap.
- The **cream panel that becomes visible is the Commando's own back** (it
  belongs to the torso component, coloured green in
  `05_colour_after/commando_nopack_components_back.png`), not a leftover of
  the pack. The pack was covering it.

Result: **3,299 -> 2,855 verts, 5,284 -> 4,574 tris**, 710 faces removed.
The rig, the skin weights and the UVs are untouched, so the model keeps
playing every existing animation.

## Folder layout

| Folder | Contents |
|---|---|
| `02_progress_photos/01_components/` | every component in a different colour |
| `02_progress_photos/02_hide_test/` | back view with candidate components hidden |
| `02_progress_photos/03_isolated/` | each candidate component rendered alone |
| `02_progress_photos/04_no_backpack/` | the result, plus a close-up of the right shoulder gap |
| `02_progress_photos/05_colour_after/` | the remaining components coloured, to identify the exposed back |
| `02_progress_photos/06_final/` | final renders of both variants + the .blend check renders |
| `02_progress_photos/07_rifle/` | the Maula rifle alone, from four angles |
| `02_progress_photos/08_rifle_placement/` | rifle placement candidates A-D |
| `02_progress_photos/09_rifle_orient/` | rifle orientation candidates A-H (close-ups) |
| `02_progress_photos/10_showcase/` | showcase angles of both variants, rendered from the .blend files |
| `03_blender/` | **`commando_nopack_house.blend`** and **`commando_nopack_plain.blend`** - the finished product, see below |
| `05_fbx_export/` | `Male01_CommandoNoPack.fbx`, `Male01_CommandoNoPackHouse.fbx` |
| `06_game_ready/no_backpack/` | HMD, prefab, materials.props, 3 textures |
| `06_game_ready/no_backpack_house/` | the same for the House-coloured variant |
| `08_scripts/` | the pipeline (see below) |

## The .blend files (open these to see the finished product)

`03_blender/commando_nopack_house.blend` and `03_blender/commando_nopack_plain.blend`
(~1.1 MB each) are ready to open in Blender. Each one contains:

- the Commando body with the backpack removed (4,574 tris), still skinned to the
  Male01 rig
- the albedo / MetallicGlossAO / Normal wired to the Base Color /
  Specular IOR Level / Normal Map sockets, and **packed into the .blend**, so
  the file opens correctly on any machine
- the **Atreide Maula rifle**, held in the right hand and **parented to the
  `B_Gun` bone**, so it follows the hand when the rig is posed
- a camera, a sun, a fill light and a world - press **F12** to render straight
  away

### Showcase renders

`02_progress_photos/10_showcase/` holds the five angles (front,
three-quarter, side, back, back close-up) for both variants, rendered straight
out of the .blend files by `21_showcase.py`:

| File | What it shows |
|---|---|
| `house_front.png` / `plain_front.png` | the front, rifle across the body |
| `house_three_quarter.png` / `plain_three_quarter.png` | the best angle to judge the paintwork |
| `house_side.png` / `plain_side.png` | the profile, rifle held forward |
| `house_back.png` / `plain_back.png` | **the removed pack** - the back is clean |
| `house_back_closeup.png` / `plain_back_closeup.png` | the exposed back panel up close |

### How the rifle placement was worked out

It took several steps because the obvious approach is wrong:

1. The rifle FBX in the extracted game assets is an **HMD with an `.fbx`
   extension** - Blender cannot open it. It was converted with the toolkit's
   `hmd2fbx` (its HMD has **two** models, `Maula_RiffleG` and `MaulaRifle`, and
   the converter only handles one, so the geometry-less model was dropped).
2. The rifle FBX also carries a helper mesh called **`Cube`** (2x2x2 m, 6 tris)
   that the toolkit uses as a bounds reference. It must be **deleted** or it
   renders as a giant slab over the character - this is what the first
   attempt looked like.
3. The rig's `B_Gun` bone sits at the armature origin in the rest pose, so its
   rest transform is **not** a usable placement hint. The grip point was found
   from the mesh instead: the centroid of the body vertices whose strongest
   weight is `B_rWristJ` -> **(-0.687, -0.022, 1.125)**.
4. The rifle's long axis is its local **+Z**. The character faces **-Y**, so
   **rotationX = +90** points the barrel forward. (-90, the value the game's
   prefab uses, points it *backwards* - confirmed by rendering both.)
5. To parent to the bone, use the **operator**, not `matrix_parent_inverse`:
   `bpy.ops.object.parent_set(type='BONE', keep_transform=True)` with
   `rig.data.bones.active = rig.data.bones['B_Gun']` set first. Blender's bone
   parenting uses the bone's **tail** as the origin, so hand-setting
   `matrix_parent_inverse` puts the rifle 0.67 m too high.

## The pipeline (08_scripts/)

| Script | What it does |
|---|---|
| `01_analyse_mesh.py` | components, bounding boxes, dominant bone per vertex |
| `02_component_colour.py` | colours every component differently and renders it |
| `03_hide_test.py` | renders with chosen components hidden (`-- <tag> <ids...>`) |
| `04_isolate_components.py` | spatial report of the candidate components |
| `05_closure_test.py` | removes the pack, checks for a hole, renders |
| `06_closure_normals.py` | ray test that also checks the surface normal orientation |
| `07_diagnose_misses.py` | compares the probe grid before/after, close-up render |
| `08_manifold_test.py` | per-component boundary-edge (manifold) check, before vs after |
| `09_isolate_only.py` | renders ONE component at a time, with the rest really removed |
| `10_colour_after_removal.py` | colours the remaining components after the removal |
| `11_remove_backpack_export.py` | **the removal + export** (final FBX) |
| `12_bake_house_textures.py` | bakes the House Ginaz textures onto the no-pack FBX |
| `13_render_final.py` | final renders of any FBX + texture set |
| `14_make_blend.py` | first attempt at the .blend (rifle placement still wrong) |
| `15_verify_blend.py` | opens a saved .blend, reports its contents and renders it |
| `16_rifle_placement.py` | measures B_Gun and the prefab's placement convention |
| `17_rifle_orient.py` | renders the rifle alone to find its barrel axis |
| `18_place_rifle.py` | finds the hand grip point, tests placement candidates |
| `19_rifle_orientations.py` | tests orientations to find the forward-pointing one |
| `20_make_final_blend.py` | **builds the final .blend files** (packed textures, rifle parented) |
| `21_showcase.py` | renders showcase angles straight from a saved .blend |

Run order: `11` -> `convert_model.py` -> (optional) `12` -> `convert_model.py`.

## Game-ready output

`check_hmd.py` result for both variants: **OK**, 0 zero-length normals,
**99.9%** of normals agree with triangle facing.

- `Male01_CommandoNoPack.hmd` - 2,855 verts / 4,574 tris, 53 joints
- `Male01_CommandoNoPackHouse.hmd` - same geometry, House textures
- Both prefabs are the vanilla Commando prefab with the body swapped, so the
  `Atreide_MaulaRifle` stays constrained to `...B_rWristJ.B_Gun`
- `materials.props` copied from the vanilla Commando folder (PBR,
  `emissive: 0.1`, keyed on `Mat_Commando`)

> The House texture set reuses the **same 512x512 atlas** as the full Commando.
> That is correct: the atlas is laid out for the whole model, and removing the
> pack only removes the geometry that sampled part of it - the remaining body's
> UVs are unchanged, so the textures need no re-baking.

## Unfinished / to check in game

- **No data.cdb entry yet.** Nothing points at these models. They need
  `cdb_tools.py add-model --clone-from House_Soldier --mesh
  CharMOD/Male01_CommandoNoPack/Prefab_CommandoNoPack.prefab` plus a unit.
- Not built into a pak, not tested in game.
- The Commando's own back is a **cream/white panel** which reads a bit plain now
  that the pack no longer covers it. In the House variant it becomes plum, but
  a plain vanilla build shows the cream. Worth a repaint if it stays.
- The right shoulder/armpit area has a small gap where the pack used to clip
  the arm. It is present in the vanilla model too (it is the natural
  arm-torso separation), not something the removal created, but the removal
  makes it more visible.
- The **hood** is a separate pair of components and was deliberately kept.
