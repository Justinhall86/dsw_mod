#!/usr/bin/env bash
# Rebuild the Trooper end to end: build T3 -> UV regions -> recolour -> apply textures -> save the preview blend.
#   bash 08_scripts/run_t3.sh <tag>        (run from model_projects/thorvald_trooper)
set -e
TAG="${1:-t3}"
B="/c/Program Files/Blender Foundation/Blender 5.2/blender.exe"
P="$PWD"
"$B" -b --python "$P/08_scripts/03_variants_trooper.py" -- T3_Trooper 2>&1 | grep -E "stripped|fill |yoke|cuff|waist|slivers|head scaled|hat|emblem|Error|Traceback|line " || true
"$B" -b 03_blender/T3_Trooper.blend --python "$P/08_scripts/08_uvdump_trooper.py" -- "$P/04_textures/t3_uv_regions.json" 2>&1 | grep -c UVDUMP >/dev/null
python 08_scripts/09_thorvald_recolour.py 04_textures/t3_uv_regions.json 04_textures/thorvald_t3 2>&1 | grep -c RECOLOUR >/dev/null
"$B" -b 03_blender/T3_Trooper.blend --python "$P/08_scripts/10_apply_textures.py" -- "$P/04_textures/thorvald_t3/thorvald_texture_map.json" "$P/03_blender/T3_Trooper_thorvald.blend" "$P/02_progress_photos/04_recolour/$TAG" "$TAG" 2>&1 | grep -E "SWAPPED|Error|Traceback" || true
