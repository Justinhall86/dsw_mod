#!/usr/bin/env bash
# Full chain for the finished Trooper: rebuild T4 -> recolour -> merge duplicate materials -> x2 painted upscale -> game-style previews -> audit + compare.
#   bash 08_scripts/run_final.sh [T5_Trooper]        (run from model_projects/thorvald_trooper; default T4_Trooper)
set -e
V="${1:-T4_Trooper}"
S="${V%_Trooper}"
B="/c/Program Files/Blender Foundation/Blender 5.2/blender.exe"
P="$PWD"
bash 08_scripts/run_variant.sh $V final >/dev/null
cp 03_blender/${V}_thorvald.blend 10_upscale/Trooper_${S}_input.blend
"$B" -b 10_upscale/Trooper_${S}_input.blend --python "$P/08_scripts/merge_materials.py" -- "$P/10_upscale/Trooper_${S}_merged.blend" 2>&1 | grep -E "MERGED|Error|Traceback"
"$B" -b 10_upscale/Trooper_${S}_merged.blend --python "$P/08_scripts/upscale_textures.py" -- "$P/10_upscale/tex" up2 --hook "$P/08_scripts/thorvald_hook.py" --skip-mat Mat_Thorvald_Trim --save-blend "$P/10_upscale/Trooper_${S}_up2.blend" 2>&1 | grep -E "UPSCALED|MATERIALS|Error|Traceback"
for pair in "Trooper_${S}_merged before" "Trooper_${S}_up2 after"; do set -- $pair; "$B" -b 10_upscale/$1.blend --python "$P/08_scripts/shot_game.py" -- "$P/10_upscale/renders" $2 700 2>&1 | grep -E "Error|Traceback" || true; done
"$B" -b 10_upscale/Trooper_${S}_merged.blend --python "$P/08_scripts/audit_unit.py" -- "$P/10_upscale/audit_before.json" --label before 2>&1 | grep -E "^AUDIT" || true
"$B" -b 10_upscale/Trooper_${S}_up2.blend --python "$P/08_scripts/audit_unit.py" -- "$P/10_upscale/audit_after.json" --label after 2>&1 | grep -E "^AUDIT" || true
python 08_scripts/compare_audits.py 10_upscale/audit_before.json 10_upscale/audit_after.json | tail -3
