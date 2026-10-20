#!/usr/bin/env python3
"""Create the standard project folder for a new unit: <project>/model_projects/<unit_name>/ with numbered subfolders.

  python new_project.py landsraad_elite [--root <model_projects dir>]

Layout (the user asked for every unit to live in its own folder like this):
  01_input/            supplied model + reference pictures
  02_progress_photos/  numbered screenshots, one subfolder per stage (01_source_cleanup, 02_fit_to_rig, ...)
  03_blender/          .blend per stage (+ _backups/ for .blend1)
  04_textures/         baked / painted source textures
  05_fbx_export/       FBXs exported from Blender (input of convert_model.py)
  06_game_ready/       one subfolder per variant (HMD, prefab, props.json, textures) as packed into the pak
  07_data_cdb/         cdb_changes.json + data.cdb snapshot at the last build
  08_scripts/          Blender bridge commands, bake scripts, intermediate data
  SPEC.md              what was done / unfinished
Pass --copy-to <unit>/06_game_ready/<variant> to convert_model.py, and save progress renders to 02_progress_photos/<stage>/.
"""
import argparse
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_common import cfg  # noqa: E402

DIRS = ["01_input", "02_progress_photos", "03_blender/_backups", "04_textures", "05_fbx_export",
        "06_game_ready", "07_data_cdb", "08_scripts/blender_bridge_commands", "08_scripts/intermediate_data"]

ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
ap.add_argument("unit_name")
ap.add_argument("--root", default=os.path.join(cfg("project_dir"), "model_projects"))
a = ap.parse_args()
base = os.path.join(a.root, a.unit_name)
for d in DIRS:
    os.makedirs(os.path.join(base, d), exist_ok=True)
spec = os.path.join(base, "SPEC.md")
if not os.path.exists(spec):
    open(spec, "w", encoding="utf-8").write(f"# {a.unit_name} - project notes\n\n## What was done\n\n## Unfinished / to check in game\n")
print("project folder ready:", base)
