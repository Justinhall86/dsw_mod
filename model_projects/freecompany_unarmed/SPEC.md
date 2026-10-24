# FreeCompany Unarmed

## What this project is

A portable Blender preview of the vanilla Female01 FreeCompany body, with all
four supplied texture maps wired and packed. It intentionally excludes the
separate swords and guns defined by the source prefab. The mesh, rig, and
original color palette are otherwise unchanged.

| Variant | Model | Look |
|---|---|---|
| `unarmed` | `Female01_FreeCompany` | Original Smuggler textures; no weapon objects |

Source assets and the converted FBX are in `01_input/`.

## What was done

- Confirmed the source file named `Female01_FreeCompany.fbx` is an HMD v3 model,
  then converted it with the HMD Toolkit to `Female01_FreeCompany_converted.fbx`.
- Imported the converted body in Blender GUI without importing the prefab's
  separate weapon models.
- Preserved the armature and skinning: 4,450 vertices, 6,508 triangles, and
  51 bones.
- Wired Albedo to Base Color, MetallicGlossAO to Specular IOR Level, Normal to
  the Normal Map, and Emissive to Emission Color. The texture images are packed
  in the `.blend` for portability.
- Saved `03_blender/FreeCompany_Unarmed.blend` with a framed textured viewport,
  camera, lighting, and render settings. The scene has one character mesh and
  no weapon objects.
- Verified the saved file with `08_verify_blend.py`: `PROBLEMS: none`.
- Captured Blender GUI and rendered front, three-quarter, side, back, and back
  close-up views in `02_progress_photos/04_showcase/`.

## Unfinished / to check in game

- [ ] This is a Blender preview deliverable only; no game prefab, data.cdb, or
  pak was changed or tested.
