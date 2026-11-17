# Thorvald leader: Earl Memnon Thorvald as a 3D talk-screen model

Written for: a Claude Code session that will do the work, with the user's reference image attached. Read `CLAUDE.md` first; its rules apply (do the work yourself, show progress images, never delete user files, install only when asked, never use Sardaukar parts).

Status 2026-11-12: **spec only. Nothing here has been built or tested.** No Thorvald game has been run yet.

## Goal

Replace the borrowed Emperor model that Memnon currently uses with his own animated leader model, built by modifying **Duke Leto's** leader model (the user's Memnon has similar clothing), shown in the diplomacy/talk screen and the new-game faction screen. Then render the 2D portraits (`short_portrait`, HUD, leader banner) from that model, the way the game's makers did.

## What is already established (checked 2026-11-12, from `mod_files/data.cdb` and `model_inputs`)

- Leaders are **3D scenes**, not just meshes. `model` row `Leto` has `mesh[0].path = Character/Atreide/Leader/Leto/Leader_Leto.l3d`. A `.l3d` is a small JSON **level3d** file (about 7 KB) with: renderProps (PBR, bloom, **colour grading LUT**), an HDR environment (`museum_of_ethnography_1k.hdr`), the model with **one material block per part** (Hair, Body, Cornea, ...), anisotropy and SSS settings, and light setup. Read `Leader_Leto.l3d` end to end before editing.
- The new-game screen uses a second scene: `faction.props.newGameMesh` = `..._NewGame.l3d`. It differs from the talk scene by position and scale (x 0.0135, y 0.026, scale 0.96) and one extra reference `Fx/UI/FX_UI_Mockup_LetoScene.fx`. Vanilla has the pair for every faction (Leto, Shaddam, Armanda, Liet Kynes, Baron, Esmar, Rhombur).
- **Thorvald today reuses Corrino's Shaddam**: `character.Memnon.model = "Shaddam"` and `faction.Thorvald.props.newGameMesh = Character/Imperial/Leader/Leader_Shaddam_NewGame.l3d`. So the Thorvald leader on both screens is currently the Emperor *(inference that the screens show the model; confirm in game)*.
- **Ginaz also uses Leto's model and `Leader_Leto_NewGame.l3d`** (a clone of Atreides). Do not edit Leto's files or the `Leto` model row; create new files and a new row.
- Source assets are in `model_inputs/Character/Atreide/Leader/Leto/`:
  `Leto.fbx` (an **HMD in disguise**, magic `HMD\x03`), `Leader_Leto.l3d`, `Leader_Leto_NewGame.l3d`, `Leto.props` (animation events), `materials.props`, `props.json` (`hmd.animPaths: /Character/Atreide/Leader/Leto/Animations`), `LetoLUT_raw.png`, and PBR texture sets:
  `Leto_Body_{Albedo 4096², Normal 4096², MetallicGlossAO 4096², SSSScater 2048², SSSThickness 2048², SpecColor 1024², AnisoAngle 1024², AnisoIntensity 1024²}`, `Leto_Hair_{Albedo 2048², Normal, MetallicGlossAO, AnisoAngle, AnisoIntensity}`, `Leto_Cornea_*` (tiny).
  Animations: root `Anim_Leto_Agreeing.fbx`, `Anim_Leto_IdleNeutral01.fbx`, and `Animations/` with `Neutral_{Idle, IdleBreak, Welcome, Agree, Disagree}` and `Angry_{Idle, Welcome, Agree, Disagree}`. `Leto.props` fires event `Play` at frame 60 of `Neutral_Welcome`.
- Shaddam's folder (`model_inputs/Character/Imperial/Leader/`) is the same layout, with extra `*_TRUE_FBX.fbx` animation copies (real FBX versions). Textures there are single `Shaddam_*` maps.
- Vanilla still portraits for reference: `model_inputs/UI/menu/Atreides/short_portrait.png` (700x1100) is a render of the leader model; the HUD cell `UI/HUD/leaderBanner.png` (64x103, 4k version 128x206), `UI/console/wheel_leaders.png` (358 square cells) and `UI/HUD/portrait_atreides.png` (76x119) are the 2D derivatives. Thorvald's cells in `leaderBanner*.png` and `wheel_leaders.png` are still Corrino's art.
- Existing Thorvald painted portraits are separate work: see `house_thorvald/portrait_image_requests/REQUESTS.md` (L1 there is Memnon concept art; this model replaces it as the source for the stills).

## What is NOT known (verify first, in this order, and write the answer into `modeling.md`)

1. Whether `HMD_toolkit` converts `Leto.fbx` to a Blender FBX and back (skinned leader rig, PBR materials). Units so far used the Male01/Female01 rigs and vehicles; **leaders have never been converted here.**
2. Which rig and bone names the leader uses (it is not Male01) and whether the nine animations are bound to those bones by name. A new mesh must keep the same skeleton and bone names so `animPaths` keep working.
3. Whether the `.l3d` JSON can be loaded from a **new** path in the pak without code changes (it should: `Leader_Shaddam` and `Leader_Leto` are plain pak paths in cdb rows), and whether the engine needs the `.l3d` `source` path to point at the new `.fbx` (yes by the file's own contents; confirm by testing).
4. Which screen uses which scene (talk vs new game) and whether anything else reads the leader mesh (council screen, victory screens). Use `dsw-hlboot-reverse` on `newGameMesh` and the leader `model` row if the test game is unclear.

## Phases

Make a project folder `model_projects/thorvald/thorvald_leader/` with the standard `01_input .. 08_scripts` subfolders. Save a progress PNG under `02_progress_photos/<stage>/` and open it (`Start-Process`) after every stage. Copy donors into `01_input` rather than editing `model_inputs`.

### Phase 0: setup and paths
- Confirm which machine this is. The D: PC has no editor res tree; it packs with `mod_files/stage_and_pack.py` (defaults `D:\D4XEditor\res`, `D:\Steam\steamapps\common\D4X`; check the env vars). The other machine uses `C:\dsw_mod\D4XEditor` and `repackage.py`. Blender: `C:\Program Files\Blender Foundation\Blender 5.2\blender.exe` (check the actual path on this machine).
- Read: `dsw-new-unit`, `dsw-model-modding`, `dsw-model-workshop`, `dsw-unit-upscale` (matte preview), `dsw-vehicle-preview` (HMD round-trip render), and `mod_files/README.md`.

### Phase 1: Leto round trip (this is the go/no-go test)
1. Copy the Leto folder to `01_input/leto/`.
2. Convert `Leto.fbx` with the toolkit (`Models/hmd2fbx.py`, "fix mislabeled game exports" first if needed) to a real FBX with textures embedded. Record bone count, bone names, vertex and triangle counts, material names, UV layout.
3. Load into Blender, apply the textures (Albedo, Normal, hair alpha, cornea), render the front, 3/4 and bust shots with a simple neutral light. Save to `02_progress_photos/01_leto_import/`. Compare against `short_portrait.png` for sanity.
4. Round trip with no edits: export from Blender, `convert_fbx.py` back to an HMD, and render the converted HMD with the vehicle-preview skill's reader, next to the original. They must match (same pose, scale, orientation, no flipped normals, no lost materials).
5. **Stop and report** if the toolkit fails or the rig does not survive. The fallback is to keep the original `Leto.fbx` mesh untouched and change **textures only** (new albedo for cloth and hair, same geometry), which needs no mesh conversion.

### Phase 2: confirm the animations drive the model
- Load the converted model with `Animations/Neutral_Idle`, `Neutral_Welcome`, `Neutral_Agree`, `Neutral_Disagree`, `Angry_*` in Blender (or the HMD reader) and render a short GIF per clip into `02_progress_photos/02_leto_anims/`. Note which bones move, how big the head and hands motion is (it decides how much a new coat or a tall collar can clip).
- Check the animation files bind by bone name to the converted skeleton. If bone names changed in conversion, fix them in the export step, not in the animations.

### Phase 3: design Memnon from the user's reference image
- The user will attach a reference image. Read it, then write `DESIGN.md` here listing, for each Leto part, **keep / remove / replace / recolour** (see CLAUDE.md: kitbashes should remove parts too, and use existing game parts; hand-built cloth was rejected as unlike vanilla). Leto's coat and shoulder plates are the base; the user says the character has similar clothing.
- House look (`house_thorvald/art_direction.md`, `house_thorvald/heroes.md`): polished charcoal or gunmetal, **bold copper trim** that reads at small sizes, oxblood accents, a small copper gear-and-star on the chest and arm patch, long black high-collared coat, black wrap and sash. No rust, no bone, no gold, no green. No Atreides hawk, no Corrino lion.
- Character: Earl Memnon, late 50s, black hair with grey streaks swept back, trimmed grey-streaked beard, grieving and patient. A cane is in the old concept art; decide with the user whether the leader model holds one (the vanilla leaders do not hold props in the talk scene; check first).
- Show **3 to 4 variants** side by side with your favourites and why, judged in a matte preview at the size of `short_portrait` and again at 64x103. Wait for the user to pick.

### Phase 4: build the model
Parts allowed from vanilla leaders and units (not Sardaukar): Leto, Shaddam, Baron and other leaders in `model_inputs/Character/*/Leader`; Atreides and Corrino units for armour parts (`dsw-part-kitbash`).
- Head: Leto's head with edited hair and beard geometry **or** textures-only change (grey streaks, beard) depending on Phase 1. Do not use a new head mesh unless the skin weights can be copied; the face uses SSS and normal maps unique to the head UVs.
- Coat, collar, shoulders: edit Leto's geometry (extend the collar, change the shoulder plate shape, add the sash) with skin weights copied from the nearest Leto verts so the animations still work.
- Weighting check: render each animation clip's extreme frames and confirm no stretched or detached verts.
- Save each stage as a `.blend` in `03_blender/` with textures **packed**.

### Phase 5: textures (PBR set)
Produce a full set named `ThMemnon_*` (never overwrite Leto's):
`Body_Albedo`, `Body_Normal`, `Body_MetallicGlossAO`, `Body_SSSScater`, `Body_SSSThickness`, `Body_SpecColor`, `Body_AnisoAngle`, `Body_AnisoIntensity`, `Hair_*`, `Cornea_*`.
- Start from Leto's maps. Recolour cloth regions of Albedo (the same hue-replacement and region-classification approach as `dsw-model-workshop`), keep the skin region untouched except for ageing details if wanted, edit **MetallicGlossAO** so the copper trim is metal (high metallic, low roughness) and the cloth is not, and keep Normal for cloth weave.
- Keep resolutions equal to Leto's (4096 body, 2048 hair) so the engine's memory and the `.l3d` material settings stay valid. Mind texture size on disk (the body maps are 16 MB each as PNG).
- Reuse `LetoLUT_raw.png` for colour grading at first; copy it as `ThMemnonLUT_raw.png` only if the grade must change (the scene's `colorGrading.intensity` is 0.6).

### Phase 6: export and convert
- Export FBX from Blender (same axis and scale settings that Phase 1's round trip proved), run `HMD_toolkit/Repackager/convert_fbx.py` to produce `ThMemnon.fbx` (HMD) plus textures, then **check the HMD** with `.claude/skills/dsw-model-modding/scripts/check_hmd.py`, and render it with the vehicle-preview round-trip tool next to the vanilla Leto.
- If the vehicle-style bind fix is needed (as with `53_fix_bind.py` for ships: the toolkit may write a wrong root bind), find out in this phase and write the fix as a script in `08_scripts/`.

### Phase 7: the scene files
Under a new res folder `Character/Thorvald/Leader/Memnon/`:
1. `Leader_Memnon.l3d` = copy of `Leader_Leto.l3d` with every `Character/Atreide/Leader/Leto/...` path replaced by the new folder, `source` set to the new FBX, material blocks kept (Hair alphaKill, Cornea Add blend, anisotropy), and light and LUT unchanged at first. The model node `name` should be `Memnon`.
2. `Leader_Memnon_NewGame.l3d` = copy of `Leader_Leto_NewGame.l3d`, same replacements; keep the `FX_UI_Mockup_LetoScene.fx` reference only if it is a generic UI mock-up effect (open it first; if it names Leto, find out what it draws).
3. Copy `Animations/` and `props.json` (`hmd.animPaths` to the new folder) and `ThMemnon.props` (from `Leto.props`; events keep the same frames) and `materials.props`.
4. Open both `.l3d` files with a JSON parser and check there is no remaining `Leto` string.

### Phase 8: data.cdb (minimal edits; backup first; keep a dry run and `--revert`)
Write `08_scripts/52_leader_cdb.py`:
1. New `model` row `Th_Memnon`, **inserted next to the vanilla `Shaddam` sibling, not at the end**. Clone `Shaddam`'s row: `inherit CharactersCommon`, `radius 0`, `height 0`, `audio.select` (Leto's `Select_Leto` is what Shaddam uses; leave it), `props.preload.factions` = `[Thorvald]`, `mesh[0].path = Character/Thorvald/Leader/Memnon/Leader_Memnon.l3d`.
2. `character.Memnon.model = "Th_Memnon"`.
3. `faction.Thorvald.props.newGameMesh = Character/Thorvald/Leader/Memnon/Leader_Memnon_NewGame.l3d`.
4. Leave Shaddam, Leto, Corrino, Atreides, Ginaz rows alone. Remove `Thorvald` from nothing: Shaddam's preload list still lists Thorvald; take it out so the Emperor is not preloaded for Thorvald (a one-line change, include it in the dry-run diff).
5. Save `07_data_cdb/data_BEFORE_leader.cdb`. Run `cdb_validate.py --vanilla mod_files/data_vanilla_2026-11-09.cdb` (the newest vanilla; the CLAUDE.md example cites 2026-10-28) and `engine_preflight.py`; expect 0 NEW problems and 0 FAIL. The "missing file" lines must list only the files you ship.

### Phase 9: stage and pack (only when asked to install)
- Add a line to `SOURCES` in `mod_files/stage_and_pack.py`: `"Character/Thorvald/Leader/Memnon": <project>/06_game_ready/Character/Thorvald/Leader/Memnon` (the destination must be a pak path under `CharMOD`-style or `Character` the same way vanilla leaders are; check how existing `Character/...` entries resolve in the pak before choosing; the unit prefabs use `CharMOD/`).
- Stage and pack as in `CLAUDE.md` ("Put it in the game" = export, cdb edit, validate, repackage). Do **not** install without being asked.
- After a test game: `game.log` must contain `[DataCache] Modified data.cdb`. Check the talk screen (start a game with another faction and meet Thorvald, or open diplomacy with an AI Thorvald), the new-game faction screen, and the top-bar leader button. Report what you see.

### Phase 10: stills derived from the model
Render from the Blender scene with the same camera and light as the `.l3d` scene (HDR `museum_of_ethnography_1k.hdr` if available as a stand-in) and cut out onto transparent PNGs:
- `UI/menu/Thorvald/short_portrait.png` **700x1100**, head and chest, 3/4 view, shoulders touching the edges (compare with the Atreides file).
- `UI/menu/Thorvald/box_portrait.png` **700x1700** (the current one is concept art; redo from the model if the user wants).
- HUD: Thorvald cell in `UI/HUD/leaderBanner.png` (64x103, 4k 128x206) and `leaderBanner4k.png`, and the `wheel_leaders.png` cell (358). These are shared atlases: **never overwrite the vanilla atlas files**; copy to new `*_thorvald` files and point the Memnon `character.images` rows at them (the same method the councillors use, see `thorvald_councillors/08_scripts/10_make_portraits.py`). Atlas cell coordinates for Memnon are currently `leaderBanner.png` x 320, `leaderBanner4k.png` x 640, `wheel_leaders.png` x 4.
- `UI/HUD/portrait_atreides.png` equivalent (76x119): find which CSS selects it and whether Thorvald can have a new CSS block (`thorvald_councillors/04_textures/Styles/factions/Thorvald.css` shows the pattern).

## Deliverables
`model_projects/thorvald/thorvald_leader/` with: converted HMD and textures, `.blend` with packed textures, both `.l3d` files, `06_game_ready/` res-tree files, `07_data_cdb/data_BEFORE_leader.cdb`, `08_scripts/`, progress photos and GIFs of every stage, `Final/` per `build_final_folders.py` once agreed, and a short `HANDOFF.md`. Add the findings (toolkit with leader models, the `.l3d` format, rig facts) to `modeling.md`.

## Risks and fallbacks
- **Toolkit cannot handle the leader rig or materials:** change textures only and keep Leto's geometry (a recoloured Leto in Thorvald colours) until the toolkit is extended.
- **Skin weights break on a new coat:** keep the coat close to Leto's geometry; avoid long skirts that cross the legs, which are out of frame in the talk scene anyway (it shows the upper body).
- **SSS and aniso maps misbehave when recoloured:** edit Albedo only and leave the SSS, Aniso and SpecColor maps as they are.
- **The l3d load fails in game:** compare against the working vanilla `Leader_Leto.l3d` key by key; the only intended differences are paths. Read the game log.
- **Leader also appears elsewhere** (victory screen, council window): check after the first game and report.
- Ginaz shares Leto; never change shared files.
