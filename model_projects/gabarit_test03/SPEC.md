# Gabarit Test 03 - project notes

## What was done

- Source: `C:\dsw_mod\extr\Character\Gabarit_Test03.fbx` (HMD v3 data with an `.fbx` extension).
- Converted and imported all three mesh models (`Unit01`, `Unit02`, `Unit03_Mesh`) into one
  Blender scene; none of the source mesh components were omitted.
- Wired each mesh's UV map to `ColorChart_Albedo.png` and packed the texture in the blend.
- Saved the Blender scene at `03_blender/gabarit_test03.blend`, the exported FBX at
  `05_fbx_export/gabarit_test03.fbx`, and the rendered preview at
  `02_progress_photos/01_import_review/gabarit_test03.png`.
- Meshes: 17,834 vertices and 8,674 triangles total; each has one UV map; no armature.

## Unfinished / to check in game

- This is a static placeholder/test mesh set, not a rigged character unit. It has no metallic,
  normal, or emissive maps and is not ready for the character HMD/prefab workflow.
- No game data, prefab, pak, or installation was changed.
