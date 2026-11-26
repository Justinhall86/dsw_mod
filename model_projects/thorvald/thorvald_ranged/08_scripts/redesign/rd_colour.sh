#!/usr/bin/env bash
# Recolour one redesign variant: UV regions -> Thorvald recolour (+ per-head rules) -> apply. Run from model_projects/thorvald/thorvald_ranged.
#   bash 08_scripts/redesign/rd_colour.sh RD2
set -e
V="$1"; LOW="$(echo "$V" | tr 'A-Z' 'a-z')"
PY="${BLPY:-/home/user/blender_venv/bin/python}"; BL="$PY 08_scripts/redesign/bl.py"
P="$PWD"
$BL "03_blender/redesign/$V.blend" "$P/08_scripts/redesign/rd_uvdump.py" -- "$P/04_textures/redesign/${LOW}_uv_regions.json" 2>&1 | grep UVDUMP || true
$PY 08_scripts/redesign/rd_recolour.py "$V" "04_textures/redesign/${LOW}_uv_regions.json" "04_textures/redesign/thorvald_${LOW}" 2>&1 | grep -E "RECOLOUR|Error|Trace" | cut -c1-160
$BL "03_blender/redesign/$V.blend" "$P/08_scripts/10_apply_textures.py" -- "$P/04_textures/redesign/thorvald_${LOW}/thorvald_texture_map.json" "$P/03_blender/redesign/${V}_thorvald.blend" "$P/02_progress_photos/05_redesign/colour/$V" "$V" 2>&1 | grep -E "SWAPPED|Error|Traceback" || true
