#!/usr/bin/env bash
# Polish chain for a coloured redesign variant (same steps as ../run_final.sh: merge duplicate materials -> x2 painted upscale with the Thorvald hook).
#   bash 08_scripts/redesign/rd_final.sh RD2        (run from model_projects/thorvald/thorvald_ranged)
set -e
V="$1"; PY="${BLPY:-/home/user/blender_venv/bin/python}"; BL="$PY 08_scripts/redesign/bl.py"; P="$PWD"; O="10_upscale/redesign"
mkdir -p $O
$BL 03_blender/redesign/${V}_thorvald.blend "$P/08_scripts/merge_materials.py" -- "$P/$O/${V}_merged.blend" 2>&1 | grep -E "MERGED|Error|Traceback"
$BL $O/${V}_merged.blend "$P/08_scripts/upscale_textures.py" -- "$P/$O/tex_${V}" up2 --hook "$P/08_scripts/thorvald_hook.py" --skip-mat Mat_Thorvald_Trim --save-blend "$P/$O/${V}_up2.blend" 2>&1 | grep -E "UPSCALED|MATERIALS|Error|Traceback"
