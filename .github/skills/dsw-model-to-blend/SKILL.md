# DSW Model to Blend

Create a fully textured `.blend` file from a folder of model inputs (FBX + textures), **without weapons**, and open it in Blender.

## Usage

```bash
# From the repo root
python .github/skills/dsw-model-to-blend/scripts/create_blend.py --input-dir "C:\path\to\model_inputs\MyModel" --output "C:\path\to\output.blend"
```

Or invoke as a skill with the input folder path.

## Input Folder Structure

The input folder must contain:
- **One FBX file** — the character model (e.g., `Male01_MyModel.fbx` or `MyModel.fbx`)
- **Three texture files** (any naming, but must be detectable):
  - Albedo: `*_Albedo.png` or `*_BaseColor.png` or `*_Color.png`
  - Metallic/Gloss/AO: `*_MetallicGlossAO.png` or `*_Metallic.png` or `*_ORM.png`
  - Normal: `*_Normal.png` or `*_NormalMap.png`

Example:
```
model_inputs/MyModel/
  Male01_MyModel.fbx
  MyModel_Albedo.png
  MyModel_MetallicGlossAO.png
  MyModel_Normal.png
```

## What the Skill Does

1. **Finds the FBX and textures** in the input folder
2. **Creates a project folder** under `model_projects/<model_name>/`
3. **Imports the FBX** into Blender
4. **Wires the three textures** to the material (Base Color, Specular IOR Level, Normal)
5. **Packs all textures** into the .blend (portable)
6. **Adds camera, sun, fill light, world** — ready to render (F12)
7. **Saves the .blend** to the specified output path
8. **Opens the .blend in Blender GUI**

## Output

- A single `.blend` file with:
  - Skinned mesh parented to armature
  - Material with all 3 texture slots wired and packed
  - Camera, sun light, fill light, world environment
  - No weapons, no extra objects

## Requirements

- Blender 4.0+ (tested on 5.2)
- Python 3.10+
- The `dsw_core` and `blender_scene` modules from the model workshop skill

## Scripts

- `scripts/create_blend.py` — main entry point
- `scripts/blender_build.py` — Blender-side build script