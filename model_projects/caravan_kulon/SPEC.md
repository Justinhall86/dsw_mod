# Caravan Kulon - project notes

## What this project is

A viewable Blender scene of the **Kulon** pack beasts from the Fremen
CaravanKulon unit folder
(`Character/Fremen/Unit/CaravanKulon/Kulon/`). No mesh edits and no repaint:
the stock models with their stock albedo / MetallicGlossAO / Normal maps,
wired and packed. Weapons intentionally omitted (no Smuggler gun, no turret
cannon).

The folder ships two variants on the same 38-bone rig, and the game's model
entry `F_Special_Kulon` lists both:

| Object | Source | Look |
|---|---|---|
| `Kulon01_Caravan` | `Kulon01_TRUE_FBX.fbx` (5,936 tris) | saddle bags + orange blanket |
| `Kulon02_TurretCarrier` | `Kulon02_TRUE_FBX.fbx` (12,086 tris) | ammo crates + missiles |

Both are in the scene side by side; hide or delete the one you do not need.

## Deliverable

`03_blender/CaravanKulon.blend`

- two armatures (`Armature_Kulon01`, `Armature_Kulon02`, 38 bones each) with
  their skinned meshes
- albedo -> Base Color, MetallicGlossAO -> Specular IOR Level, Normal ->
  Normal Map, per variant
- all six textures **packed** into the .blend (portable)
- camera, sun, fill light and world set up, so F12 renders immediately

Showcase renders: `02_progress_photos/04_showcase/caravan_kulon_*.png`.

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | both true-FBX sources, the trooper prefab, materials.props |
| `02_progress_photos/04_showcase/` | front / three-quarter / high / close-ups |
| `03_blender/` | `CaravanKulon.blend` (the deliverable) |
| `04_textures/` | the six stock textures (01 and 02 sets) |
| `08_scripts/` | workshop scripts + `07_build_kulon.py`, `09_showcase_kulon.py` |

## Verification

`08_verify_blend.py` -> `PROBLEMS: none`

- objects: 2 ARMATURE + 2 MESH, both meshes skinned via ARMATURE modifier
- triangles: 5,936 (Kulon01) and 12,086 (Kulon02), matching the sources
- images: 6/6 packed
- renders checked: both variants textured, no missing/magenta surfaces

## Unfinished / to check in game

- [ ] Nothing shipped to the game from this project - the `.blend` is a
      preview deliverable only.
- [ ] The crew model (`Female01_FremenKulonTrooper`) is not in this .blend;
      it was built separately in `model_projects/caravan_kulon_trooper/`.
