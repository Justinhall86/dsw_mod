---
name: dsw-model-kitbash
description: Combine multiple DSW character models into one textured .blend scene, sharing a single Male01/Female01 armature. Each body keeps its own material and texture set. Use when the user wants to kitbash, combine, or merge models (e.g. Ravager + Gurney) into a single Blender preview.
argument-hint: "primary model folder, then secondary model folder(s) (e.g. 'Ravager Melee then Gurney')"
---

# DSW Model Kitbash

Combine multiple DSW character models into one self-contained, textured `.blend` scene. All models share one armature (Male01/Female01 rig), and each body keeps its own material and texture set. All images are packed into the `.blend` so it is portable.

## Usage

```bash
# From the repo root
python .github/skills/dsw-model-kitbash/scripts/kitbash_models.py -- \
    <primary.fbx> <secondary.fbx> [tertiary.fbx ...] <out.blend>
```

Or invoke as a skill with the model folder paths.

## Input Folder Structure

Each model folder should contain:
- **One FBX file** — the character model (e.g., `Ravager_Melee_TRUE_FBX.fbx`)
- **Texture files** beside the FBX:
  - Albedo: `*_Albedo.png`
  - Metallic/Gloss/AO: `*_MetallicGlossAO.png`
  - Normal: `*_Normal.png`
  - Optional Emissive: `*_Emissive.png`

Example:
```
model_projects/ravager_variants/01_input/
  Ravager_Melee_TRUE_FBX.fbx
  Ravager_Albedo.png
  Ravager_MetallicGlossAO.png
  Ravager_Normal.png

model_projects/gurney/01_input/
  Male01_AtreidesGurney.fbx
  Gurney_Albedo.png
  Gurney_Emissive.png
  Gurney_MetallicGlossAO.png
  Gurney_Normal.png
```

## What the Skill Does

1. **Imports each FBX** into one Blender scene, tracking newly imported objects per import (critical: do not use `max()` on all meshes after the second import — the largest mesh overall may belong to the first model)
2. **Shares one armature** — the first model's armature becomes the scene armature; subsequent models' rigs are removed and their meshes re-parented to the shared armature
3. **Wires each body's own textures** — Albedo → Base Color, MetallicGlossAO → Specular IOR Level, Normal → Normal Map, Emissive → Emissive (if present)
4. **Removes junk objects** — Cube, Camera, Light, Lamp helper meshes from the FBX importer
5. **Adds camera, sun, fill light, world** — ready to render (F12)
6. **Packs all textures** into the `.blend` (portable)
7. **Saves the .blend** and opens it in Blender GUI

## Output

- A single `.blend` file with:
  - Multiple skinned meshes, all parented to one shared armature
  - Each mesh with its own material and texture set wired and packed
  - Camera, sun light, fill light, world environment
  - No weapons, no extra objects

## Key Lessons (from building Ravager + Gurney)

- **Track new objects per import.** After importing the second FBX, `max(all_meshes, key=tris)` returns the largest mesh in the entire scene, which may be from the first model. Capture the set of objects before each import and diff to find only the newly imported ones.
- **One armature per scene.** DSW character FBXs each carry their own armature. Keep the first, remove the rest, and re-parent subsequent meshes to the kept armature. All models use the same Male01/Female01 rig, so bindings transfer cleanly.
- **Texture naming collisions.** Blender appends `.001`, `.002` to duplicate image names. Wire by socket, not by name, and verify with `08_verify_blend.py` that each material points at the correct texture set.
- **Emissive maps.** Gurney ships an `*_Emissive.png` that Ravager doesn't use. Wire it to the Emissive socket only on materials that have one.
- **Blender GUI crashes with custom viewport camera.** Setting `region_3d.view_perspective` to a custom camera angle caused an access violation on open. Use the built-in showcase camera from `07_build_blend.py` / `frame_camera_on()` instead.

## Scripts

- `scripts/kitbash_models.py` — main entry point (Blender-side)
- `scripts/verify_kitbash.py` — optional verification wrapper (reuses `08_verify_blend.py`)

## Requirements

- Blender 5.2
- Python 3.10+
- The `dsw_core` and `blender_scene` modules from `.claude\skills\dsw-model-workshop\scripts\`

## Example

```bash
python .github/skills/dsw-model-kitbash/scripts/kitbash_models.py -- \
    "C:\path\to\Ravager_Melee_TRUE_FBX.fbx" \
    "C:\path\to\Male01_AtreidesGurney.fbx" \
    "C:\path\to\output\Ravager_Gurney_Kitbash.blend"
```

Result: one `.blend` with Ravager Melee and Gurney sharing one armature, each textured correctly, all images packed, ready to render and inspect in Blender GUI.