#!/usr/bin/env bash
# Rebuild a Trooper recipe end to end: build -> UV regions -> recolour -> apply textures -> preview blend + renders.
#   bash 08_scripts/run_variant.sh <Variant> <tag>      e.g.  bash 08_scripts/run_variant.sh T4_Trooper t4r1   (run from model_projects/thorvald_trooper)
# Writes 03_blender/<Variant>.blend (uncoloured), 03_blender/<Variant>_thorvald.blend (coloured), 04_textures/thorvald_<variant>/ and renders.
set -e
V="${1:-T4_Trooper}"
TAG="${2:-run}"
LOW="$(echo "$V" | tr 'A-Z' 'a-z' | sed 's/_trooper//')"
B="/c/Program Files/Blender Foundation/Blender 5.2/blender.exe"
P="$PWD"
"$B" -b --python "$P/08_scripts/03_variants_trooper.py" -- "$V" 2>&1 | grep -E "stripped|fill |yoke|cuff|waist|slivers|slots|slimmed|head scaled|shoulder cap|hat \(|emblem|Error|Traceback|line " || true
"$B" -b "03_blender/$V.blend" --python "$P/08_scripts/08_uvdump_trooper.py" -- "$P/04_textures/${LOW}_uv_regions.json" 2>&1 | grep UVDUMP || true
python 08_scripts/09_thorvald_recolour.py "04_textures/${LOW}_uv_regions.json" "04_textures/thorvald_${LOW}" 2>&1 | grep -E "RECOLOUR|Error|Trace" | cut -c1-200
"$B" -b "03_blender/$V.blend" --python "$P/08_scripts/10_apply_textures.py" -- "$P/04_textures/thorvald_${LOW}/thorvald_texture_map.json" "$P/03_blender/${V}_thorvald.blend" "$P/02_progress_photos/04_recolour/$TAG" "$TAG" 2>&1 | grep -E "SWAPPED|Error|Traceback" || true
