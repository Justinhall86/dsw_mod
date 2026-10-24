"""Step 00 - create a model project folder for a new job.

    python 00_new_project.py -- <name> [--title "Display Name"]

Creates the numbered folder tree under model_projects/ and a SPEC.md skeleton:

    model_projects/<name>/
      01_input/            the source model and its textures
      02_progress_photos/  renders from every step
      03_blender/          the finished .blend files
      04_textures/         the recoloured textures and the region map
      05_fbx_export/       the edited FBX
      06_game_ready/       the shipped assets (HMD, prefab, materials.props)
      07_data_cdb/         the data.cdb entries, if any
      08_scripts/          a copy of this skill's scripts, for the record
      SPEC.md

The user wants a dedicated folder per model rather than a shared model_outputs/
directory, so that the work of one model never mixes with another's.
"""
import os
import shutil
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_core import cfg, script_args

argv = script_args()
name = argv[0] if argv else ""
title = argv[argv.index("--title") + 1] if "--title" in argv else name.replace("_", " ").title()
if not name:
    raise SystemExit("usage: 00_new_project.py -- <name> [--title \"Display Name\"]")

base = os.path.join(cfg("model_projects"), name)
if os.path.exists(base) and os.listdir(base):
    print("EXISTS already, not overwriting:", base)
    for d in sorted(os.listdir(base)):
        print("   ", d)
    raise SystemExit(0)

FOLDERS = [
    "01_input",
    os.path.join("02_progress_photos", "01_components"),
    os.path.join("02_progress_photos", "02_removed"),
    os.path.join("02_progress_photos", "03_recolour"),
    os.path.join("02_progress_photos", "04_showcase"),
    "03_blender",
    "04_textures",
    "05_fbx_export",
    "06_game_ready",
    "07_data_cdb",
    "08_scripts",
]

os.makedirs(base, exist_ok=True)
for f in FOLDERS:
    os.makedirs(os.path.join(base, f), exist_ok=True)

# keep a copy of the scripts that produced this project
src_scripts = os.path.dirname(os.path.abspath(__file__))
dst_scripts = os.path.join(base, "08_scripts")
for f in sorted(os.listdir(src_scripts)):
    if f.endswith(".py"):
        shutil.copy2(os.path.join(src_scripts, f), os.path.join(dst_scripts, f))

spec = os.path.join(base, "SPEC.md")
with open(spec, "w", encoding="utf-8") as f:
    f.write("""# {title} - project notes

## What this project is

_TODO: one paragraph - what is being changed about which model, and why._

| Variant | Model | Look |
|---|---|---|
| _todo_ | `CharMOD/<Name>` | _todo_ |

Source: `01_input/`

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | the source model and its textures |
| `02_progress_photos/01_components/` | every component rendered alone |
| `02_progress_photos/02_removed/` | the result of the removal, and the closure proof |
| `02_progress_photos/03_recolour/` | the recolour iterations |
| `02_progress_photos/04_showcase/` | the final showcase angles |
| `03_blender/` | the finished .blend files |
| `04_textures/` | the recoloured textures and the region map |
| `05_fbx_export/` | the edited FBX |
| `06_game_ready/` | the shipped assets (HMD, prefab, materials.props) |
| `07_data_cdb/` | the data.cdb entries, if any |
| `08_scripts/` | the scripts used, for the record |

## What was done

_TODO: the steps, with the numbers they produced._

## Unfinished / to check in game

- [ ] _TODO_
""".format(title=title))

print("CREATED", base)
for f in FOLDERS:
    print("   ", f)
print("   SPEC.md")
print()
print("Next: copy the source model into 01_input/, then run")
print("  01_analyse_mesh.py <model.fbx> --shots 02_progress_photos/01_components")
