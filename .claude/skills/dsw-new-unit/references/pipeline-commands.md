# Exact commands per stage (Ginaz Captain values)

Paths: Blender = `"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe"`; run scripts from
`model_projects/<unit>/` after copying `scripts/*` into `08_scripts/`. Use forward slashes in bash. Heavy runs: background.

## Scripts bundled in `scripts/`

| Script | Runs in | Does |
|---|---|---|
| `convert_hmd_inputs.py` | python | converts the HMD-named donors (and any weapon) into `<project>/05_fbx_export/` |
| `units.py` | python | registry of donor units (FBX + texture stem). Finds files BY NAME under `model_inputs/` (user reorganises folders). Add new units here. `EXTRA` maps a unit's 2nd material to another texture set. Game HMD files named `.fbx` must be converted first (see below) and listed with `EX + "<name>_TRUE_FBX.fbx"` |
| `01_survey.py` | Blender | front+back render of every registered unit (`-- Key Key ...` for a subset) |
| `02_gallery.py <Unit> [--min-verts 40]` | Blender | every mesh island alone, front/back by position, writes `components.json` |
| `sheet_parts.py <dir> [cols]`, `sheet.py <out> <cols> <imgs..>` | python | labelled contact sheets (id, verts, heaviest bone, F/B, z/x) |
| `03_variants.py -- <Name>...` | Blender | builds a variant from the `VARIANTS` dict (see kitbash-techniques.md for every key) and saves `03_blender/<Name>.blend` + 4 renders |
| `04_metal_map.py <Unit>` | Blender | paints faces whose MetallicGlossAO R > 0.5 red (debug), prints per-island metal share. `metal=True` in a recipe removes islands >= 60 % metal automatically |
| `05_diag.py <out> <tag>` | Blender | 6 views textured + 6 flat-colour (grey base / blue head / orange fills) of a variant blend |
| `06_neck_parts.py <object> <out>` | Blender | every island touching the neck box, alone |
| `view_nape.py`, `view_culled.py` | Blender | nape close-ups; head with back-face culling ON (the game's view) |
| `08_uvdump.py -- <out.json>` | Blender | every face -> (texture, body region, UV polygon) for per-region recolour |
| `09_ginaz_recolour.py <regions.json> <out_dir>` | python | recolour per region (edit `PAL` and `RULES` for a new look) |
| `10_apply_textures.py -- <map.json> <out.blend> <shots> <tag>` | Blender | swap albedos for the recoloured ones, pack, render turnaround + close-up |
| `find_uv_patch.py <albedo> --hue a b` | python | find an even-coloured texture patch for a hand-modelled part |
| `11_sword_anim.py -- <out> [--clips ..] [--step N] [--save f.blend]` | Blender | mount a weapon on `B_Weapon`, render real clips frame by frame |
| `12_assemble_export.py -- <out.fbx>` | Blender | join parts to ONE skinned mesh (6 material slots), bake the sword to B_Weapon, limit to 3 weights, export FBX |
| `build_game_textures.py <out> Name=alb,mg,nrm ...` | python | RGBA/alpha-255/downscaled per-material game textures |
| `13_patch_cdb.py [--apply]` | python | the data.cdb takeover + start-unit patch with a printed diff (template: edit ids/text) |
| `blender_scene.py`, `dsw_core.py` | lib | scene setup, texture wiring by socket, camera/light/render helpers; `script_args()`, paths |

Also used from other skills: `dsw-part-kitbash/scripts/dsw_parts.py` (components, comp_info, delete_verts, import, ...),
`dsw-part-kitbash/scripts/anim_stress.py`, `dsw-model-modding/scripts/{convert_model,cdb_tools,check_hmd,fix_normals,pak_extract_one}.py`,
`HMD_toolkit/HMD_toolkit/{Models/hmd2fbx.py, Animations/hmdanim2fbx.py}`, `C:\dsw_mod\D4XEditor\res\repackage.py`.

## 0. HMD-named-.fbx inputs

`model_inputs/Atreide/Unit/*`, `Smuggler/Unit/*` (Ranger, Warden, HeavyWeaponSquad, Mercenary...) are HMD files with an
`.fbx` extension (first bytes `HMD`). Blender: "Invalid header". Convert:
```
cd HMD_toolkit/HMD_toolkit/Models
python -c "import hmd2fbx; hmd2fbx.convert(r'<in>.fbx', r'<proj>/05_fbx_export/<Name>_TRUE_FBX.fbx', verbose=False)"
```
Files already named `*_TRUE_FBX.fbx` import directly.

## 1-4. Survey, gallery, build, inspect
```
blender -b --python 08_scripts/01_survey.py -- Mercenary Gurney Raider Bannerjee
blender -b --python 08_scripts/02_gallery.py -- Mercenary            # then: python 08_scripts/sheet_parts.py 02_progress_photos/02_components/Mercenary 8
blender -b --python 08_scripts/03_variants.py -- V6b_GinazCollar     # ~60-90 s
blender -b 03_blender/V6b_GinazCollar.blend --python 08_scripts/05_diag.py -- 02_progress_photos/x it1
python 08_scripts/sheet.py 02_progress_photos/x_sheet.png 6 it1_tex_front.png ...
```
Open the sheet with Read; send with SendUserFile.

## 5. Recolour
```
blender -b 03_blender/V6b_GinazCollar.blend --python 08_scripts/08_uvdump.py -- 04_textures/v6b_uv_regions.json
python 08_scripts/09_ginaz_recolour.py 04_textures/v6b_uv_regions.json 04_textures/ginaz_v6b
blender -b 03_blender/V6b_GinazCollar.blend --python 08_scripts/10_apply_textures.py -- 04_textures/ginaz_v6b/ginaz_texture_map.json 03_blender/V6b_GinazCollar_plum.blend 02_progress_photos/06_ginaz/round1 r1
```

## 6. Weapon + animations
```
# clips: convert the game's anim HMDs onto the body HMD (one call per clip), in HMD_toolkit/HMD_toolkit/Animations:
python hmdanim2fbx.py <body Male01_*.fbx (HMD)> /c/dsw_mod/extr/Anim/Male01/Anim_Male01_AttackMelee01.fbx <proj>/05_fbx_export/anim/Common_AttackMelee01.fbx
blender -b 03_blender/V6b_GinazCollar_plum.blend --python 08_scripts/11_sword_anim.py -- 02_progress_photos/07_sword/frames --step 2 --save 03_blender/V6c_TallSword.blend
```
Then build GIFs with PIL (`save_all=True, duration=66`) and SendUserFile them. Weapon mesh: `hmd2fbx.convert` the weapon HMD
(`extr/Character/<Faction>/Weapon/...`) into `05_fbx_export/<Weapon>_TRUE_FBX.fbx`, textures to real PNG into `04_textures/sword/`.

## 7. Game export
```
blender -b 03_blender/V6c_TallSword.blend --python 08_scripts/12_assemble_export.py -- 06_game_ready/Male01_GinazCaptain.fbx
python 08_scripts/build_game_textures.py 06_game_ready/textures Mercenary=<alb>,<mg>,<nrm> Base=... Raider=... Gurney=... Bannerjee=... --max 1024
python .claude/skills/dsw-model-modding/scripts/convert_model.py 06_game_ready/Male01_GinazCaptain.fbx \
  --prefab-template Character/Smuggler/Unit/Mercenary/Prefab_SmugglerMercenary.prefab --prefab-name Prefab_GinazCaptain \
  --vanilla-material Mat_Mercenary=CharMOD/Male01_GinazCaptain/GinazMercenary  (... one per material ...) \
  --vanilla-material MAT_WeaponEcazFencer=Character/Ecaz/Weapon/FencerDoubleKnife/WeaponFencer
cp 06_game_ready/textures/*.png /c/dsw_mod/D4XEditor/res/res/CharMOD/Male01_GinazCaptain/
# write materials.props (all materials PBR, emissive 0.1, culling Back), delete the converter's unreferenced Male01_*_*.png and per-material stray PNGs
python .claude/skills/dsw-model-modding/scripts/check_hmd.py <...>/Male01_GinazCaptain.hmd     # must say RESULT OK
```
(convert_model prints "RESULT: FAIL" the first time - the textures are not in the folder yet. Copy them, then re-check.)

## 8-9. cdb, install, prove
```
python 08_scripts/13_patch_cdb.py            # dry run, read the diff
python 08_scripts/13_patch_cdb.py --apply    # backs up mod_files/data.cdb first
python /c/dsw_mod/D4XEditor/res/repackage.py --quiet --no-launch
python .claude/skills/dsw-model-modding/scripts/pak_extract_one.py "C:\Program Files (x86)\Steam\steamapps\common\D4X\res.compressed1.pak" --list CharMOD/<Model>
python .claude/skills/dsw-model-modding/scripts/pak_extract_one.py <pak> data.cdb <out>      # then json-load and print the entries you changed
# launch (only if asked): Start-Process "steam://rungameid/1605220"; then Select-String game.log for 'Modified data.cdb' and errors
```
