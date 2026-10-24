# Ravager Variants

## What this project is

Self-contained, textured Blender previews of both Ravager body variants from the supplied
TRUE_FBX files. The original armatures and mesh bindings are retained. Separately prefabbed
weapons are not included.

| Variant | Source mesh | Materials |
|---|---|---|
| Melee | `Ravager_Melee_TRUE_FBX.fbx` | `Mat_Ravager` |
| Demo | `Ravager_Demo_TRUE_FBX.fbx` | `Mat_Ravager`, `Mat_Watcher1` |

The Demo variant's `Mat_Watcher1` uses the Fremen Watcher texture maps. All used images are packed
into each `.blend`; the project copies are in `04_textures/`.

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | source FBXs, prefabs, and `materials.props` |
| `02_progress_photos/04_showcase/` | verified renders of both variants |
| `03_blender/` | finished, textured `.blend` files |
| `04_textures/` | Ravager maps and the Demo variant's Watcher maps |
| `08_scripts/` | script used to relink, pack, and configure the saved Blender previews |

Other numbered folders are reserved for later editing or game-integration work.

## What was done

- Built `Ravager_Melee.blend` and `Ravager_Demo.blend` separately from their corresponding
  TRUE_FBX sources.
- Removed the FBX helper mesh and importer camera/light objects; kept the body mesh and its
  53-bone armature.
- Relinked the original material maps from the project texture copies. Set albedo maps to sRGB and
  metallic/gloss/AO and normal maps to Non-Color.
- Packed all used maps into each `.blend` and configured the saved 3D viewport for Material Preview.
- Ran the saved-file verifier on both files; each retained its armature modifier and reported
  `PROBLEMS: none`. Rendered and visually inspected both verification images.

## Scope

These are Blender previews, not game-ready exports. The prefab-separated weapons were intentionally
left out; no HMD conversion, `data.cdb` edits, or game installation were requested.

## Kitbash: Ravager Melee + Gurney

Built `Ravager_Gurney_Kitbash.blend` combining Ravager Melee and Gurney into one scene:

- Both bodies share one Male01 armature (53 bones); Gurney's separate rig was removed and its
  mesh re-parented to the shared armature.
- Each body keeps its own material and texture set: Ravager Melee uses `Mat_Ravager` (Ravager
  Albedo / MetallicGlossAO / Normal); Gurney uses `Mat_Gurney` (Gurney Albedo / MetallicGlossAO /
  Normal / Emissive).
- All 14 images packed into the `.blend`; verified with `08_verify_blend.py` → `PROBLEMS: none`.
- Opened in Blender GUI with Material Preview shading; both bodies visible at the shared armature
  origin (select either body in the Outliner to isolate it).

Files:
- `03_blender/Ravager_Gurney_Kitbash.blend` — the kitbash scene
- `08_scripts/kitbash_ravager_gurney.py` — the build script
- `02_progress_photos/04_showcase/Ravager_Gurney_Kitbash_verified.png` — headless render

## Kitbash v2: Gurney body + Ravager helmet, black (`Gurney_Ravager_Helm_Black.blend`)

v1 stacked two complete bodies at the same origin, so Gurney's face poked through the Ravager hood
and the green armour z-fought with the Ravager. v2 is one character:

- Body: Gurney with every `B_HeadJ`-dominant face removed (1,622 faces; 5,434 tris left).
- Helmet: the Ravager's `B_HeadJ` / `B_Neck01J` faces only (hood, mask, neck; 1,465 tris), split into
  its own object with `Mat_Ravager`. Both objects use the one shared 53-bone armature.
- Colour: Gurney's green cloth, plates and mint stripe recoloured to black with the painted shading kept
  (`08_scripts/10_recolour_gurney_black.py` -> `04_textures/Gurney_Black_Albedo.png`). Skin, belt,
  silver plate and gold gems are untouched.
- Build: `08_scripts/11_kitbash_gurney_ravager_helm.py -- --shots`; verified with `08_verify_blend.py`
  (`PROBLEMS: none`). Renders in `02_progress_photos/04_showcase/GurneyRavagerHelm_*.png`, head close-ups
  in `02_progress_photos/02_removed/`.
- Not game-ready: no HMD conversion or `data.cdb` work.
