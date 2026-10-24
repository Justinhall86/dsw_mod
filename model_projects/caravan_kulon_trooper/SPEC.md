# Fremen Kulon Trooper - project notes

## What this project is

A viewable Blender scene of the vanilla **Fremen Kulon Trooper**
(`Character/Fremen/Unit/CaravanKulon/Female01_FremenKulonTrooper.fbx`), built
from the extracted-game FBX conversion. No mesh edits, no repaint: this is the
stock model with its stock albedo / MetallicGlossAO / Normal maps, wired and
packed. The prefab's `Smuggler_Gun` was intentionally **not** included, as
requested.

| Variant | Model | Look |
|---|---|---|
| stock | `Female01_FremenKulonTrooper` | vanilla Fremen trooper, ochre scarf |

Source: `01_input/Female01_FremenKulonTrooper_TRUE_FBX.fbx`
(the shipped `.fbx` is an HMD in disguise; this is the real-FBX conversion).

Textures: `04_textures/Fremen_KulonTrooper_{Albedo,MetallicGlossAO,Normal}.png`

## Deliverable

`03_blender/CaravanKulonTrooper.blend`

- body mesh `Female01_FremenKulonTrooper` (3,646 verts / 5,853 tris), still
  skinned to its 49-bone `Armature`
- albedo -> Base Color, MetallicGlossAO -> Specular IOR Level, Normal ->
  Normal Map
- all three textures **packed** into the .blend (portable)
- camera, sun, fill light and world set up, so F12 renders immediately

Showcase renders: `02_progress_photos/04_showcase/kulon_trooper_*.png`.

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | the true-FBX source, prefab, materials.props, props.json |
| `02_progress_photos/04_showcase/` | front / three-quarter / side / back / back close-up + verify render |
| `03_blender/` | `CaravanKulonTrooper.blend` (the deliverable) |
| `04_textures/` | the three stock textures (copies of the originals) |
| `08_scripts/` | the workshop scripts used, for the record |

## Verification

`08_verify_blend.py` -> `PROBLEMS: none`

- objects: `Armature` (ARMATURE), `Female01_FremenKulonTrooper` (MESH,
  parent=Armature, ARMATURE modifier)
- triangles: 5,853 (matches the source)
- images: 3/3 packed
- renders checked: textures resolve, no missing/magenta surfaces

## Unfinished / to check in game

- [ ] Nothing shipped to the game from this project yet - the `.blend` is a
      preview deliverable only.
- [ ] The `Kulon/Kulon01.fbx`, `Kulon02.fbx` pack-beast models also live in
      the source folder (used by the WaterSellerCaravan POI, not by this
      unit's prefab); they are not part of this .blend.
