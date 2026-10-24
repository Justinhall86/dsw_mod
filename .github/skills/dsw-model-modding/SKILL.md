---
name: dsw-model-modding
description: Get a custom or edited 3D character model into Dune Spice Wars (D4X) as a playable unit - Blender edit/export on the Male01/Female01 rig, HMD Toolkit conversion, data.cdb unit+model entries (clone a vanilla unit, free/instant, spawn at the HQ, squad size, hero stance/weapon), pak build, and install into the REAL Steam game folder so the user can test it. Use this whenever the user mentions Dune Spice Wars / D4X / DSW modding, data.cdb, HMD, res.compressed1.pak, the HIDE/CastleDB editor, adding or reskinning a unit, a model showing black, a unit not appearing, or wants a modded build installed and the game opened - even if they don't say "skill".
---

# Dune: Spice Wars model modding

The user wants things DONE, not instructions: run the steps yourself, show progress (Blender GUI,
not headless, with screenshots), and finish by installing the pak and (if asked) launching the game.

## The four things that cost a whole afternoon - check these first

1. **Install to the folder Steam actually runs.** Always `C:\Program Files (x86)\Steam\steamapps\common\D4X`.
   Its `steamapps` is a junction to `C:\Users\raide\OneDrive\steamapps` - a *different physical copy*
   from `C:\Users\justi\OneDrive\steamapps\common\D4X`, which OneDrive syncs minutes later. Installing
   to the justi path and launching right away tests stale or vanilla data, so results flip-flop.
2. **Only two paks in the game folder:** `res.compressed.pak` (vanilla, never touch) and
   `res.compressed1.pak` (ours). Archive old builds to `C:\Users\justi\OneDrive\Python\dsw_mod\pak_archive`,
   never next to the game.
3. **Prove the game loaded our data.** After a test, `game.log` (in the game folder) must contain
   `[DataCache] Modified data.cdb`. The game logs it only when the loaded data.cdb differs from vanilla
   (vanilla SHA-1 `90a70ea9d75ca4a9cdd4b62e7f6d7d63ac92e00b` is embedded in hlboot.dat). No line ->
   the game ran vanilla data: fix the install before touching anything else.
4. **Black model = broken vertex normals**, not textures/materials. `check_hmd.py` detects it and
   `fix_normals.py` repairs it in place. (Seen after clearing custom normals in Blender before export:
   84% zero-length normals.) Textures should also be RGBA with alpha 255.
   **Dark (but visible) model = missing `materials.props`** beside the HMD. Vanilla model folders ship
   one keyed by HMD material name with PBR settings incl. `emissive` (Duncan: `"emissive": 1`);
   rendering without it is visibly darker than vanilla. `convert_model.py` copies it from the
   `--prefab-template` folder automatically; otherwise copy it by hand.

When a test fails, change ONE thing per build and keep a control (e.g. an untouched clone of a vanilla
unit spawned next to the test unit) so each result tells you which layer is broken.

## Paths (overridable via env vars, see scripts/dsw_common.py)

| What | Where |
|---|---|
| Working data.cdb (source of truth) | `C:\Users\justi\OneDrive\Python\dsw_mod\mod_files\data.cdb` |
| Editor (HIDE) + pak staging | `C:\dsw_mod\D4XEditor\res` (files to pack go in the nested `res\res`) |
| Build + install + launch | `C:\dsw_mod\D4XEditor\res\repackage.py` |
| Extracted vanilla assets | `C:\dsw_mod\extr` |
| HMD Toolkit | `C:\Users\justi\OneDrive\Python\dsw_mod\HMD_toolkit\HMD_toolkit` |
| Blender 5.2 | `C:\Program Files\Blender Foundation\Blender 5.2\blender.exe` |
| Per-unit project folder | `C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\<unit_name>\` - ONE folder per unit with numbered subfolders `01_input` `02_progress_photos\<stage>` `03_blender` `04_textures` `05_fbx_export` `06_game_ready\<variant>` `07_data_cdb` `08_scripts`, plus `SPEC.md`. Create it with `scripts/new_project.py <unit_name>` (the user wants this instead of `model_outputs/`) |
| Knowledge base | `C:\Users\justi\OneDrive\Python\dsw_mod\modeling.md` |

`repackage.py` packs mod_files\data.cdb, copies it over the editor's res\data.cdb, and refuses to run
if the editor copy was edited more recently (so editor changes are never silently lost - copy that
file to mod_files first if the user edited in the editor).

## Workflow

Scripts are in `scripts/` next to this file. Run them with the system Python.

### 1. Model (Blender, GUI)
- Start from a vanilla model on the same rig: `hmd2fbx.py` the HMD from `C:\dsw_mod\extr`, then
  `fbxfix.py`. Never edit the armature; animations drive bones by name (Male01 = 46 joints).
- **Before "adding" textures to an existing FBX, check what it already has:** import it and dump the
  material links - a TRUE_FBX usually already wires Albedo/MetallicGlossAO/Normal and resolves the
  PNGs sitting next to it (see `references/lessons.md`, 2026-10-21). Drop the vanilla PNGs beside
  the FBX if they are missing; that is often the whole job.
- Max 3 bone influences per vertex. Models appear mirrored in Blender - that's normal.
- Material wiring the toolkit understands: Albedo -> Base Color, MetallicGlossAO -> **Specular IOR
  Level**, Normal -> Normal Map node. MetallicGlossAO = R metallic, G gloss, B AO.
- Export with `scripts/blender_export_fbx.py` (Forward Y, Up Z, no leaf bones, no animation, Copy +
  Embed textures, FBX units scale, bone axes Y/X). Name the file `<Rig>_<Name>.fbx`.
- Save a .blend and a screenshot per stage into model_outputs/<Unit>/ so the user can follow along.

### 2. Convert
```
python scripts/convert_model.py <Male01_Name.fbx> --prefab-template <vanilla prefab> --copy-to <model_projects>\<unit>\06_game_ready\<variant>
```
Produces `CharMOD/<Male01_Name>/` in the editor's nested res: HMD, RGBA textures, prefab (template's
weapons kept on their bones, hidden dyn-objects kept), the template's `props.json` (animation search
paths) and `materials.props` (PBR + emissive settings - without it the model renders darker than
vanilla), repaired normals if needed, then runs `check_hmd.py`. Pick the template whose **weapon and
stance** you want - e.g. `Character/Atreide/Unit/Duncan/Prefab_AtreidesDuncan.prefab` (two swords +
pistol) or `Character/Imperial/Sardaukar/Prefab_ImperialSardaukar.prefab`.

### 3. data.cdb (always through cdb_tools.py - backs up, refuses non-exact round trips)
```
python scripts/cdb_tools.py add-model --id N_<Name> --clone-from <template's model id> \
    --mesh CharMOD/<Male01_Name>/Prefab_<Name>.prefab --inherit <anim set, e.g. Duncan>
python scripts/cdb_tools.py add-unit --id A_<Name> --faction Atreides --model N_<Name> \
    --name "<Display name>" --free --squad-size 1
python scripts/cdb_tools.py start-unit --faction Atreides --unit A_<Name>
```
- **Clone a working vanilla unit of the target faction** (default: its basic infantry, wheel pos 4,
  e.g. A_Trooper) and change only id, texts, model, cost, stats, squad. Hand-built units with fewer
  fields were never recruitable.
- Model look = `unit.effects.models[].ref` -> model sheet `mesh` (prefab). Stance/animations = the
  model entry's `inherit` (e.g. `Duncan`, `MilitarySardaukar`); `props.dynObjects` lists hidden prefab
  children shown by an animation (Duncan's `Gun`).
- Squad size lives in `unit.props.squadSize` (Trooper parent 5, Hero 1).
- `startUnits` on the faction HQ structure (`faction.landmarks.city`, e.g. Arrakeen) spawns the unit
  beside the HQ at game start - fastest way to test.
- Recruit wheel: `props.wheelPosition` (12 sectors). Inherited slots are taken (Ornithopter 0,
  Harvester 1, Hero 2, Elite 3, Drone 7, Ship 8, Frigate 9) - for Atreides use 10/11.
- Remove test-only edits (controls, vanilla units pointed at the test model) once confirmed.

### 4. Build, install, launch
```
python C:\dsw_mod\D4XEditor\res\repackage.py --quiet            # + launches the game
python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch
```
It refuses while D4X.exe runs, archives the old pak + strays outside the game folder, installs via
the Steam path, byte-verifies, prints the resolved folder and the pak list (must be exactly the two).
For proof of pak contents use `scripts/deploy_pak.py --dry-run` (builds, extracts, compares every
file). To inspect an installed pak, extract it with Heaps' builder (see deploy_pak.verify).

### 5. Confirm and record
- Ask the user to start a NEW game, then check game.log for `Modified data.cdb`.
- Update `model_projects/<unit>/SPEC.md` (what was done, what's unfinished) and `modeling.md`; keep photos and assets in the project's numbered subfolders.

### Giving a unit a vanilla weapon/part (e.g. the Atreides Trooper's sword)
Vanilla soldiers often carry the weapon IN the body mesh, skinned to `B_Weapon` / `B_Scabbard` (if the prefab has no separate
weapon model, it is baked in). Extract those triangles (vertices weighted >0.5 to those bones) from the true-FBX of the vanilla
HMD, join them to your mesh as a SECOND material with placeholder images named like the vanilla textures, then run
`convert_model.py ... --vanilla-material Mat_X=Character/.../Name01 [--share-textures CharMOD/<first model>/<name>]`
(rewrites each material's paths via `retexture_materials.py`; a second model variant can reuse the first one's textures).
Give the weapon-carrying body its OWN model/prefab/HMD so other units sharing the first model don't get a second weapon, and take
the animation set from the donor unit's model entry (`inherit`, e.g. MilitaryCommon for the Trooper's sword).
Armory upgrades are just `unit.equipment` (+ `traits`): copy them from the donor unit (A_Trooper: FrontLineTactics,
OffensiveMindset, ParryingArmguards, PranaBindu + trait A_Trooper_Trait).

## Reference
- `references/lessons.md` - failed hypotheses and evidence, so they aren't retried.