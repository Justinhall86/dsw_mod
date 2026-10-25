# Getting the finished unit into the game

Mechanics (paths, the four install rules, cdb_tools usage) live in `dsw-model-modding`; this file is what was specific to a
multi-material kitbash and to taking over an existing slot.

## 1. One FBX for the converter (`12_assemble_export.py`)
- Join all parts into ONE mesh (body, tunic fill, coat fill, head, weapon): one skinned mesh with several material slots is
  fine. Materials keep their donor names (`Mat_Mercenary`, `Mat_Base`, `Mat_Raider`, `Mat_Gurney`, `Mat_Bannerjee`, weapon `MAT_...`).
- Bake the weapon at its rest placement, 100 % `B_Weapon`. Cap at 3 influences, normalise, remove colour attributes, rig in rest pose,
  `export_scene.fbx(forward Y, up Z, no leaf bones, no animation, path_mode COPY, embed textures, FBX_SCALE_UNITS, bone axes Y/X,
  mesh_smooth_type OFF)`. Do not clear custom normals (that produced the all-black Ginaz model once).
- File name `Male01_<Name>.fbx`: the base name becomes the folder/HMD name.
- The FBX is large (embedded textures, 25 MB); irrelevant, the converter extracts.

## 2. Convert with MANY materials
The converter wires every material to the same canonical texture file names, so the last embedded image would win. Fix by
rewriting each material's texture paths in the HMD afterwards - `convert_model.py --vanilla-material MAT=BASE` does exactly that
for any BASE resource path:
`Mat_Raider=CharMOD/Male01_GinazCaptain/GinazRaider` -> `..._Albedo/_MetallicGlossAO/_Normal.png`. Weapon:
`MAT_WeaponEcazFencer=Character/Ecaz/Weapon/FencerDoubleKnife/WeaponFencer` (the game's own files, nothing to ship).
Then: copy your texture PNGs into `C:\dsw_mod\D4XEditor\res\res\CharMOD\<Model>\`, write your own `materials.props`, delete the
converter's unreferenced `Male01_<Name>_*.png` and any per-material strays (the converter also drops `Raider_Albedo.png`
etc. - 3.5 MB), run `check_hmd.py` -> `RESULT: OK` (it says FAIL during the first convert because the textures are not there yet).
Expected: 1 geometry, N materials, 7-9k tris (vanilla 5-9k), "53 joints (rig Male01: 46)" note about the Mercenary's 7 whip joints
is informational - the vanilla Mercenary has the same.

Prefab: `--prefab-template` with a vanilla prefab that has NO weapon you do not want (Mercenary's has a hidden `Gun` on `B_Gun` +
a ground shadow `tdecal`). Strip the Gun and its two constraints from the generated prefab if the unit has no ranged attack.
Template's `props.json` (anim search paths) is copied automatically.

## 3. data.cdb: takeover vs new unit
**Takeover (what we did)**: pick the slot (`A_Elite` = the Atreides Warden: unit id, model id, faction Atreides, squad 4, model `rigName 1`
Female01). Faster and fully proven; every Warden recruit becomes the new unit. Reversible via backups. Edit via `13_patch_cdb.py`:
- `model.<id>`: `mesh[0].path` -> `CharMOD/<Model>/Prefab_<Name>.prefab`; `inherit` -> anim set (`MilitaryCommon` for a Male01 swordsman);
  `rigName` 0 for Male01 (1 = Female01 rig - the Warden had it); `scale` (Trooper 1.0, Warden was 1.2, we used 1.1; Mercenary body is ~1.97 m);
  leave `radius`/`height` unless the selection circle looks wrong.
- `unit.<id>`: `texts.name`, `texts.plural.name`, `texts.desc`; `props.squadSize` (Elite parent = 5); sounds in `effects.events`
  (`kind 1` = move sound `Play_Common_Move`/`Play_Shield_Move`, `kind 24` = death `Common_Death`/`Common_Female_Death`) and
  `effects.sound.voices` (`Voice_A_Trooper_*` male trooper voices). Do NOT touch `stats`, `costs`, `equipment`, `traits`, `inherits`
  unless the user asks - the unit then keeps its game balance.
- Spawn: `structure.<HQ>.startUnits += {"unit": "<id>"}`. One entry = one SQUAD (squadSize bodies). HQ per faction (from
  `faction.landmarks.city`): Atreides Arrakeen (`A_`), Harkonnen Carthag (`H_`), Smugglers Tuek (`S_`), Fremen Tabr (`F_`),
  Corrino ImpBase (`C_`), Ecaz Foliage (`E_`), Vernius IxianCore (`V_`). Keep existing entries (Arrakeen already had
  `A_Ornithopter` and the user's `A_LandsraadGuard`).
**New unit instead of takeover**: `cdb_tools.py add-model --id N_X --clone-from <model> --mesh ... --inherit <set>` +
`add-unit --id A_X --faction Atreides --model N_X --name ... --free --squad-size N` + `start-unit` (details in dsw-model-modding;
clone a working unit of the same faction; wheel positions 10/11 for Atreides are free; hand-built units with fewer fields were never recruitable).

`mod_files/data.cdb` currently differs from the tool's round trip only by a trailing newline (the editor adds it) - so
`cdb_tools` refuses; use `--allow-inexact` or `C.save(..., allow_inexact=True)` as `13_patch_cdb.py` does. Always dry-run, print the
diff, make sure only intended entries changed, and confirm with `cdb_validate.py` that only your units differ from vanilla.

## 4. Build, install, prove
`python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch` (refuses while D4X.exe runs; archives the old pak to
`pak_archive/`; byte-verifies; the game folder must list exactly `res.compressed.pak` + `res.compressed1.pak`).
Prove the install, do not assume it: `pak_extract_one.py <installed pak> --list CharMOD/<Model>` and extract `data.cdb`, json-load it and
print the entries you changed. Launch only when asked: `Start-Process "steam://rungameid/1605220"`, wait for `game.log`
(in the game folder): `[DataCache] Modified data.cdb` = our data loaded; no `rror` lines about CharMOD; the only error that appeared was an
unrelated multiplayer X509 handshake. `GameplayStarted` shows a match started. You cannot see the screen: ask the user to look at
squad size, scale, textures, sword in hand, and report.

## 5. Record + revert
SPEC.md in the project (what changed, ids, revert), copies in `06_game_ready/<Model>/` and `07_data_cdb/data_BEFORE_<unit>.cdb`, a memory note
(`ginaz-captain-warden-slot.md` is the pattern). Revert = restore that cdb into `mod_files/data.cdb` and `repackage.py`, or restore the archived pak.

## 6. Likely in-game issues (not hit yet, check if the user reports)
black/grey/washed model -> textures or materials.props (check each material path resolves, alpha 255, culling Back); sword floating ->
mount offset (re-check against the Common clips); wrong size next to Troopers -> `scale`; unit not animating -> `inherit`/`rigName` mismatch with the
rig; very large pak -> downscale textures; female voice/death on a male unit -> sounds above.
