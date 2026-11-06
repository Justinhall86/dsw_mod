#!/bin/bash
# build + texture + render every variant listed in ${LIST:-01_input/variants/list.txt}
cd "$(dirname "$0")/.."
B="C:/Program Files/Blender Foundation/Blender 5.2/blender.exe"
while IFS= read -r line; do
  name=$(echo "$line" | cut -d' ' -f1); pal=$(echo "$line" | cut -d' ' -f2); cu=$(echo "$line" | cut -d' ' -f3 | cut -d'|' -f1)
  echo "== $name ($pal/$cu)"
  "$B" -b --factory-startup --python 08_scripts/20_build_variant.py -- 01_input/variants/$name.json 2>&1 | grep -E "FINAL|Traceback|Error"
  "$B" -b 03_blender/$name.blend --python 08_scripts/40_dump_geo.py -- 04_textures/_geo.npz 2>&1 | grep -E "Traceback|Error"
  THV_PAL=$pal THV_CU=$cu python 08_scripts/41_make_atlas.py 2>&1 | grep -E "Traceback|Error"
  "$B" -b 03_blender/$name.blend --python 08_scripts/42_apply_atlas.py -- 03_blender/${name}_tex.blend 02_progress_photos/variants/$name 2>&1 | grep -E "JOINED|Traceback|Error"
done < ${LIST:-01_input/variants/list.txt}
echo ALL_DONE
