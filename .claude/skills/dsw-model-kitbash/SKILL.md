---
name: dsw-model-kitbash
description: Combine multiple DSW character models into one textured .blend scene, sharing a single Male01/Female01 armature. Each body keeps its own material and texture set. Use when the user wants to kitbash, combine, or merge models (e.g. Ravager + Gurney) into a single Blender preview.
argument-hint: "primary model folder, then secondary model folder(s) (e.g. 'Ravager Melee then Gurney')"
---

# DSW Model Kitbash

Combine multiple DSW character models into one self-contained, textured `.blend` scene. All models share one armature (Male01/Female01 rig), and each body keeps its own material and texture set. All images are packed into the `.blend` so it is portable.

For editing a single model (part removal, recolour, weapon placement) use `dsw-model-workshop`. For getting a model into the game (data.cdb, prefabs, paks) use `dsw-model-modding`. This skill is strictly for combining finished models into a reviewable `.blend`.

## When to Use

- You have two or more finished character FBXs on the same rig and want them in one scene
- You want to compare variants side by side (e.g. Ravager Melee vs Demo)
- You want to kitbash parts from different models into one preview

## Pipeline

Scripts live in `scripts/`. They are numbered in the order they run.

| # | Script | Runs in | What it does |
|---|---|---|---|
| 00 | `00_new_project.py` | python | Creates the numbered project folder and a SPEC.md skeleton. |
| 01 | `01_kitbash_blend.py` | Blender | Imports each FBX, tracks new objects per import, shares one armature, wires each body's own textures, packs images, saves `.blend`. |
| 02 | `02_verify_kitbash.py` | Blender | Opens a saved `.blend`, reports objects/materials/images, flags problems, optional render. |

Shared code: `scripts/dsw_core.py` (paths) and `scripts/blender_scene.py` (scene setup, material wiring, lighting, camera) from `dsw-model-workshop`.

## Step by step

### 0. Start a project folder

```powershell
python scripts/00_new_project.py -- ravager_gurney_kitbash --title "Ravager + Gurney Kitbash"
```

Creates `model_projects/<name>/` with the numbered subfolders and a SPEC.md skeleton.

### 1. Build the kitbash .blend

```powershell
& "C:\Program Files\Blender Foundation\Blender 5.2\blender.exe" -b `
  --python scripts/01_kitbash_blend.py -- `
  <primary.fbx> <secondary.fbx> [more.fbx ...] <out.blend>
```

Each input FBX should sit beside its textures (`*_Albedo.png`, `*_MetallicGlossAO.png`, `*_Normal.png`, optional `*_Emissive.png`).

### 2. Verify

```powershell
& "C:\Program Files\Blender Foundation\Blender 5.2\blender.exe" -b `
  --python scripts/02_verify_kitbash.py -- <out.blend> [render.png]
```

## Key Lessons (from building Ravager + Gurney)

- **Track new objects per import.** After importing the second FBX, `max(all_meshes, key=tris)` returns the largest mesh in the entire scene, which may belong to the first model. Capture the set of objects before each import and diff to find only the newly imported ones.
- **One armature per scene.** DSW character FBXs each carry their own armature. Keep the first, remove the rest, and re-parent subsequent meshes to the kept armature. All models use the same Male01/Female01 rig, so bindings transfer cleanly.
- **Wire textures by socket, not name.** Blender appends `.001`, `.002` to duplicate image names. Verify each material points at the correct texture set with `02_verify_kitbash.py`.
- **Emissive maps.** Some models ship an `*_Emissive.png` that others don't. Wire it to the Emissive socket only on materials that have one.
- **Don't set a custom viewport camera in the saved blend.** Setting `region_3d.view_perspective` to a custom camera angle caused a Blender GUI crash on open. Use the built-in showcase camera from `frame_camera_on()` instead.

## Output

- A single `.blend` file with:
  - Multiple skinned meshes, all parented to one shared armature
  - Each mesh with its own material and texture set wired and packed
  - Camera, sun light, fill light, world environment
  - No weapons, no extra objects

## Example

```powershell
& "C:\Program Files\Blender Foundation\Blender 5.2\blender.exe" -b `
  --python scripts/01_kitbash_blend.py -- `
  "C:\path\to\Ravager_Melee_TRUE_FBX.fbx" `
  "C:\path\to\Male01_AtreidesGurney.fbx" `
  "C:\path\to\output\Ravager_Gurney_Kitbash.blend"
```

Result: one `.blend` with Ravager Melee and Gurney sharing one armature, each textured correctly, all images packed, ready to render and inspect in Blender GUI.