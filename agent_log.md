# Agent log

Changes made by Claude in this repo, newest first. Each entry says what changed, where, and how to undo it.

## Working on (claims)

One line per active session: date, what you are changing (unit / files), session name. Check this before touching
anything listed; remove your line when you finish. Rules: CLAUDE.md "Several sessions share this repo".

- (none)

## 2026-11-26 (night): Thorvald Ranger RM7 approved -> RM9/RM11 armed and animation-tested (no game files changed)

- Owner: "RM7!!!", colours approved, push forward. RM8-RM10 tried shape fixes (crown rounding, mask chin trim, short snood); the short snood (RM10) read jagged and
  RM7's drape matches the reference, so it was kept. Edit stage gained `cut` (world space; the builder's bisect works in object space) and `push_out(axis=True)`.
- RM9 = RM7 + rounder crown + mask chin trimmed. RM11 = RM9 with the snood skinned from the body (`weights_from_base`); same look, sounder in motion. **Current: RM11.**
- Sniper mounted (`weapons/scripts/mount_weapon.py`): `03_blender/redesign/Thorvald_Ranger_RM9.blend`, `..._RM11.blend`. Sniper clips tested (Run every frame; AttackRange,
  Idle, FightIdle, AttackMelee sampled): hood and mask hold. Inherited from v2: orange sawtooth at the chest-plate/sleeve edge near the armpit; empty hands in one
  AttackMelee frame. GIFs and sheets in `02_progress_photos/05_redesign/anim/`. Not exported, no cdb change.

## 2026-11-26 (evening): Thorvald Ranger fitted ninja hood + rigid mask, RM1-RM7 (no game files changed)

- Owner: RH5 closest but the shawl reads "Arrakis"; push toward the reference; try a rigid mask; edit the parts to fit.
- New edit stage `thorvald_ranged/08_scripts/redesign/rd_edit.py` (xform with soft falloff, radial, cut, delete box, clip_in / push_out by rays from a centre);
  recipes carry `edits=[...]`, run by `rd_build.py` after the builder assembles the parts. Island id maps of six donors: `gallery/helmets_and_heads/hood_survey/islands/`.
- **RM7** = RD1 + Assassin hood shell/lining (13, 16; shawl 3 and collar ring 31 dropped), tightened and pulled down to the brows; head above z 1.868 deleted
  (hood lining reads as the black cap); Harkonnen Trooper half mask (28, 29, 43, 44, 82, 84) compressed onto the face; Commando's own neck wrap (islands 2/3 below
  z 1.725) as a snood, Gurney collar pressed under it. Mask has its own colour region in `rd_recolour.py`. Sheet `05_redesign/sheet_rm7_vs_reference.png`.
- RM4 tried the Scout face plate as the mask (reads as a flat visor). Not animation-tested; not exported.

## 2026-11-26 (later): Thorvald Ranger hood pass, RH1-RH5 (no game files changed)

- Owner: RD1 is closest; sent a ninja-hood reference (black cowl, rigid half mask, eyes showing), asked for non-turban head wraps in the game.
- Hood survey of every vanilla unit: `gallery/helmets_and_heads/hood_survey/` (README has the island ids). Real hoods: Ravager, Assassin (= Infiltrator mesh,
  black texture), Infiltrator, Smuggler Mercenary, Scout. Converted Infiltrator, Scout, Harkonnen Trooper HMDs into `thorvald_ranged/05_fbx_export/`.
- Built on RD1 (Commando eyes + black face wrap kept): RH2 = Ravager hood + cowl (skull mask left out), RH5 = Assassin hood + cowl (goggle face left out);
  RH1/RH3/RH4 were fitting tries. Recipes in `08_scripts/redesign/rd_build.py`; sheet `02_progress_photos/05_redesign/sheet_hood_vs_reference.png`.
- Known faults: RH2 has a dark jagged line where the hood rim cuts the brow; RH5 shows a fleck of the chest plate through the cowl's lower-left edge.
- Found: the dsw-new-unit skill's own `units.py` also has a stale `MI` (`.claude/model_inputs`); texture lookups by name silently fail. My scripts set it at run time; the skill file is unchanged.

## 2026-11-26: Thorvald Ranger redesign, four options RD1-RD4 (no game files changed)

- Owner asked for a Ranger that reads apart from the melee Trooper, as the Atreides Ranger does. Built R5 minus kasa hat and apron (sash cut to the belt band),
  four heads: RD1 Commando, RD2 oxblood Raider wrap, RD3 copper-visor HeavyWeapon helmet, RD4 Feydakin breather. Details and rebuild steps in `thorvald_ranged/SPEC.md` "Redesign".
- New: `thorvald_ranged/08_scripts/redesign/` (`rd_build.py`, `rd_colour.sh`, `rd_recolour.py`, `rd_final.sh`, `lineup.py`, `bl.py`), pictures in `02_progress_photos/05_redesign/`.
- Changed: `03_variants_trooper.py` gains an optional fill key `zmin` (bottom cut). Existing recipes are unaffected.
- Found: the project's `units.py` and the builder's kitbash path still point one folder too high (from the move under `model_projects/thorvald/`); `rd_build.py` patches them at run time, the files themselves are untouched.
- Made in a cloud session (Linux, `bpy` 5.2.4 + Mesa for EEVEE). Generated blends/textures not committed (rebuildable).
- Undo: delete those new folders and the `zmin` lines in `03_variants_trooper.py`.

## 2026-11-15: Heavy Vanguard helmet, samurai pass (no game files changed)

- Owner: W5c reads insect; make it samurai, longer antennae; sent reference pictures (now in `gallery/helmets_and_heads/warden_study/samurai/reference/`).
- Round 1 Warden S01-S12 (eye slit, painted lames, Trooper kasa cut into a shikoro, horn styles); round 2-3 Sworn Sword 2.1 dome (plume off) + black kuwagata
  + spike halo + kasa shikoro + Sworn head/half-mask (D01-D10, E01-E06, F01-F04). Recommended F01_big_kabuto. Sheets + README in `gallery/.../warden_study/samurai/`.
- Scripts in `thorvald_elite/08_scripts/helmet_study/`: `wd_build.py` extended (new env options only; old W/H builds unchanged by default; pre-edit copy in the session scratchpad),
  `wd_lineup.py` (LPAD option), new `wd_posmap.py`, `sm_recolour.py`, `sm_variants.py`, `sm_sheet.py`, `sm_lineup.py`, `sm_closeup.py`. Data `04_textures/helmet_study/warden/{posmap.npz,SM_*.png}`,
  scenes `03_blender/helmet_study/wd_{S,D,E,F}*.blend`. Elite SPEC "Helmet work" updated. Test renders moved to the session scratchpad.
- Undo: delete those new files/folders; `v2_final.blend` and the Sworn Sword 2.1 blend were only read.

## 2026-11-14 (night): Heavy Vanguard Warden helmet study (no game files changed)

- Warden helmet on the Elite body (v2_final.blend, kasa hat removed, ground_v6 palette): crest projected onto a fitted shell ellipsoid (smooth crown),
  face guard replaced by Karlin's breather, neck liner removed, antennae on the crown; paints W1-W5c. House Guard version also put on the body for comparison.
- New: `thorvald_elite/08_scripts/helmet_study/wd_*.py`, `04_textures/helmet_study/warden/`, `03_blender/helmet_study/wd_*.blend`,
  `gallery/helmets_and_heads/warden_study/` (README). SPEC "Helmet work" table updated. Throw-away test renders moved to the session scratchpad.
- Undo: delete those folders. `v2_final.blend` was only read (scenes saved under new names).

## 2026-11-14: Heavy Vanguard helmet study, House Guard (no game files changed)

- House Guard helmet: 12-angle study, six recolours (H1-H6), then H5 + face-plate dimples filled + Karlin H2f4 antennae on the crown + Karlin breather
  (`gallery/helmets_and_heads/house_guard_study/`). Owner liked it; but `H_Elite` (Harkonnen Elite) uses this exact model, so a Warden version is next.
- Scripts now in `thorvald_elite/08_scripts/helmet_study/` (paths in `paths.py`; verified: textures and a render reproduce byte-identical); data in
  `thorvald_elite/04_textures/helmet_study/house_guard/`. Documented in `thorvald_elite/SPEC.md` ("Helmet work").
- Undo: delete those two folders and the gallery study folders; nothing else depends on them.

## 2026-11-14: new `gallery/` folder (reference sheets centralised; no game files changed)

- New `gallery/` (README = index): helmet sheets (vanilla 18 + Thorvald 8), 48 head close-ups, vanilla per-unit part sheets, vehicle and building surveys, current ground-unit sheets.
- `git mv` from unit projects: sworn_sword `02_head_survey`, trooper `00_reference`, hero_1 `30_helmet`, kitbash_explore `00_reference`, frigate `donor_survey`/`hull_survey`/`wreck_survey`,
  sentinal `00_reference`, buildings `01_survey`, starport `10_kitbash_donors`, hq `01_survey`. Landsraad and Ginaz folders left in place.
- Writer scripts re-pointed to gallery (head_survey x4, hero_1 60/61/62, buildings 10, hq 11, starport 20, sentinal 21); SPEC docs path-updated. CLAUDE.md Paths table has a Gallery row.
- Undo: `git mv` the folders back (see list above), revert the script edits.

## 2026-11-13 08:45 EST: lost-edit protection (tools + rules; no game files changed)

- New `mod_files/snapshot.py`: working-tree snapshots to hidden refs `refs/snapshots/<time>` (never touches HEAD, the
  index or files; not pushed). First snapshot `20261113-083412` (338 files). Recover: `--log <file>`, `--get <snap> <file>`.
  To run automatically it needs Stop/SessionEnd hooks in `.claude/settings.json` (to be added by the user; Claude may not edit that file).
- New `mod_files/safe_write.py` + registry `mod_files/generated_files.json`: generators refuse to overwrite a hand-edited output
  (backups in `mod_files/backups/generated/`). Fitted to `thorvald_frigate/08_scripts/80`, `81`, `83`; baseline recorded for the
  frigate's current game-ready files. Other generators are not fitted yet.
- `CLAUDE.md`: new section "Several sessions share this repo". This log: "Working on (claims)" section above.
- Undo: delete the two scripts and the registry, the CLAUDE.md section, this claims section; `git for-each-ref refs/snapshots`
  + `git update-ref -d` removes snapshots.

## 2026-11-13 08:20 EST: INSTALLED frigate repaint (pak rebuilt on top of the 08:11 install)

Status: **installed into `D:\Steam\steamapps\common\D4X` on the D: PC; game launched. Not yet seen in a game.** Nothing committed.

| File | sha256 (first 16) | Previous (archived) |
|---|---|---|
| `res.compressed1.pak` (168.5 MB) | `eb7d401f6a60aacf` | `2d9147dc9f38ee9c` (the 08:11 install) -> `pak_archive/20261113_082016_res.compressed1.pak` |
| `hlboot.dat` | **not touched** (still `787c92e2aa979d49`) | |

- Built with `py -3.14 mod_files/stage_and_pack.py --install --launch` from the current repo, so the 08:11 data (`mod_files/data.cdb` 07:14, scripts 63/64) and `VehMOD/Renegade_DropShip` are all still in it. Only the frigate's files changed.
- **Frigate (`TH_Frigate`, model rows `Th_Frigate`/`A_Frigate`) repaint:** darker gunmetal (grey scheme `c` in `thorvald_frigate/08_scripts/76_paint_variants.py`) and darker matte copper (0.55,0.31,0.18, gloss 0.14); paint code `ADRTcd`. Previous textures in `thorvald_frigate/04_textures/_archive/ADRTac2_2026-11-13/`.
- Same pak build also carries the 2026-11-12 frigate work (already in the 08:11 pak): V6 hull shape at Chronos height, holes sealed, polished lathed barrels, new muzzles and reactor positions. Chain: `88_lock_v6 -> 90_fix_gaps_barrels -> 91_fix_normals -> 93_seethrough_fix -> 80 -> 81 -> 82 -> 83`; `84` (cdb) was already applied, so no cdb change.
- `mod_files/stage_and_pack.py` (2026-11-12): `Fx/Vehicle/Ships/Thorvald` now merges the frigate folder AND `thorvald_ship/06_game_ready/Fx/...`, so the fighter's `FX_Thorvald_Ship_Reactors.fx` / `_Muzzle.fx` are in the pak (they were missing from earlier paks); `*.bak*` files are no longer packed. Backup of the old script: `%TEMP%/stage_and_pack.before_ship_fx.py`.
- **Overwritten (2026-11-12):** `thorvald_frigate/06_game_ready/Fx/Vehicle/Ships/Thorvald/FX_Thorvald_Reactor.fx` was regenerated by `83_reactor_fx.py` for the taller V6 engines. A hand edit made on 2026-11-11 (backup `FX_Thorvald_Reactor.fx.bak_nose` = the committed version) was lost; its content was not recorded anywhere.
- Checks: engine_preflight 0 fail / 9 warn; pack resolved all 1002 asset paths.
- Undo: copy `pak_archive/20261113_082016_res.compressed1.pak` back as `res.compressed1.pak` (the 08:11 build). For the old paint only: copy the archived textures back into `04_textures/` and rerun 80 -> 81 -> `build_final_folders.py` -> `stage_and_pack.py --install`.

## 2026-11-13 08:11 EST: INSTALLED playtest round 3 + timed Renegade drops (game files changed)

Status: **installed into `D:\Steam\steamapps\common\D4X` on the D: PC. Not yet run in a game.** Nothing committed.

### Installed game files
| File | sha256 (first 16) | Previous (archived) |
|---|---|---|
| `hlboot.dat` | `787c92e2aa979d49` (registered in `mod_files/hlboot_builds.json`) | `ef6e024456bddeaf` -> `pak_archive/hlboot_game_ef6e024456bddeaf.dat` |
| `res.compressed1.pak` (168.5 MB) | `2d9147dc9f38ee9c` | `53f7957ea985d686` (dated 2026-11-12 19:43) -> `pak_archive/20261113_081120_res.compressed1.pak` |
Game folder paks after install: `res.compressed.pak`, `res.compressed1.pak` only.

### For another session installing its own game files
- Both files are whole-file builds: **a later install of either file replaces everything below.** To keep these changes, build from this repo state:
  `py -3.14 mod_files/hlboot_build.py --install` (ticks from `tool/thorvald_ticks/thorvald_sworn/changes.py`, which now includes `thsw_drops`) and
  `py -3.14 mod_files/stage_and_pack.py --install` (stages `mod_files/data.cdb` plus the asset folders, now including `VehMOD/Renegade_DropShip`).
- The data in the pak is `mod_files/data.cdb` as of 2026-11-13 08:0x (after scripts 63 and 64). Edit on top of it; don't overwrite it with an older copy.
- `thsw_terminal` (Consignment Terminal trade window) is **no longer** in the hlboot build (dropped from `changes.py`; module file kept).

### Changes in this install (data: `model_projects/thorvald/thorvald_faction/08_scripts/63_playtest3.py`, `64_timed_drops.py`)
- **Operations removed:** Renegade Strike A (mission), Strike B, Takeover B, Iron Landfall B, their lander structures `Th_RenegadeLander`/`Th_LandfallLander` and walk-out raids. Kept: Renegade Strike (`Th_RenegadeStrikeC`), Renegade Takeover, Iron Landfall A and C, Extraction A/B/C, Hammerfall.
- **Renegade drop ship:** unit/model `ThR_DropShip` (SpaceShuttle hull, charcoal + oxblood livery, `VehMOD/Renegade_DropShip`, built by `thorvald_renegades/08_scripts/50_dropship_assets.py`); raid field `thShip` on `Renegade_Drop` and `Th_RenegadeStrike` (hlboot `thsw_ops._drop_ship`).
- **Timed drops (new hlboot tick `tool/thorvald_ticks/thorvald_sworn/thsw_drops.py`):** raid troops stay aboard until their ship lands; the band marches after the last touchdown (fixes "ship and troops at the same time"; cause in `.claude/skills/dsw-hlboot-reverse/references/engine_findings.md`). Unit field `thArrive` = descent seconds, raid field `thStagger` = seconds between ships. Affects every shuttle raid, including vanilla Renegade drops.
- **Test variants:** Renegade Strike: Slow Descent (`ThR_DropShipSlow`, 7 s), Wave (1.5 s apart), Slow Wave (7 s, 2.5 s apart): rows `Th_RenegadeStrikeSlow/Wave/SlowWave` in raid, ability, mission (`Th_MRenegadeStrike*`).
- **Consignment Terminal:** trade removed; plain building, +30 Solari and +2 Influence, 10 Water upkeep; `TRes_Block` Scraps back on trait `Thorvald`.
- **Heroes:** `ThorvaldCitadel.startUnits` += 2x `TH_Hero_1`, 2x `TH_Hero_2` (no vanilla precedent; watch game start).
- Checks: engine_preflight 0 fail / 9 warn; cdb_validate 162 "missing file" lines only (no vanilla extract on this PC); pack resolved all 1002 asset paths.

### Undo
- Data: `64_timed_drops.py --revert`, then `63_playtest3.py --revert` (backups in `thorvald_faction/07_data_cdb/data_BEFORE_timed_drops.cdb`, `data_BEFORE_playtest3.cdb`).
- Game files: copy the two archived files above back into the game folder (rename the pak to `res.compressed1.pak`).

## 2026-11-12: Thorvald design docs review (docs only; no data, engine or script changes)

Status: **only Markdown files in `house_thorvald/` and notes in two spec files changed.** Nothing in `mod_files/`, `data.cdb`, `hlboot.dat` or any script was touched, nothing was packed or installed. Done in an online chat session, written to the D: ("Workhorse") copy of the repo; the main-PC copy may be ahead.

- **Owner decisions recorded:** the Plascrete trade (Consignment Terminal Convert line and the v2 window) did not work in a game test and is abandoned; the Iron Guard rule (0 Manpower, Solari only) is dropped; the Terminal stays as a plain building; the four councillor leads (Consignment Factor, Paid-Off Contracts, Double Ledger, Renegade Handler) are the designed targets. Replacement bonuses for the trade are **on hold until a test game**.
- **Rewritten:** `faction_design.md` (new "Decisions to make and gaps to fill" list, D1 to D15 and G1 to G10), `counsellors.md`, `councillor_ideas.md` (reviewed pool). New: `name_candidates.md`. Updated: `buildings.md`, `operations.md`, `units.md`, `todo.md`, `CLAUDE.md` (Thorvald section), `thorvald_faction/SPEC.md` (abandonment note), `thorvald_sworn_sword/IMPLEMENTATION_SPEC_REPORT.md` ("UPDATE 4").
- **Archived copies** (undo by copying back): `house_thorvald/_archive/faction_design_2026-11-03.md`, `counsellors_2026-11-03.md`, `councillor_ideas_2026-11-03.md`, `councillor_ideas_2026-11-12.md`.
- **Not logged here:** the entries for 2026-11-04 to 2026-11-10 (Terminal v1 and v2, Sworn Sword stages 1 to 4, the hlboot rebuild on Steam build 26405381, the 2.0e model). They are in the repo reports (`IMPLEMENTATION_SPEC_REPORT.md`, `thorvald_faction/SPEC.md`), not in this log.
- **Still to do (not done):** remove the Convert line and window rows from the Terminal, and the trade patch and `thsw_terminal` from the next hlboot rebuild; keep `thsw_share` and `thsw_oath`; do not `--revert` script 41 wholesale. The failure detail of the Terminal test has not been given.
- Nothing committed.

## 2026-11-03 (18:00 to 20:38 EST): Karlin Thorvald hero, round 13-14 looks, cdb edit, game package

Status: Karlin's model is **staged in the editor res tree and the cdb row is edited. Nothing is packed (no `repackage.py` run), nothing is installed, not seen in game.** Times from file modification times, local EST.

### Round 13: Karlin's shoulders (18:02 to 18:03)
- `08_scripts/24_hero_shoulders.py` (new): Iakin's own shell kept, two lames made from copies of it, gear-and-star insignia, copper rim, Elite forearm bracers only. Output `03_blender/nudge/B_hero_S2.blend`, renders `02_progress_photos/20_shoulder_colour/S2/` (18:03).
- `08_scripts/24b_paint_body.py` (new, system Python): gold wear marks cleared to iron, copper rim texels.
- `08_scripts/25_recolour_katana.py` (new): B-only copper guard and pommel, `04_textures/B_katana/Katana_Albedo_B.png`.
- `08_scripts/22_mount_two_swords.py` (edited): B_Weapon_L added under B_lWristJ, keyed from the DualSwords clip tracks; `--nudge` option.
- `08_scripts/21_recolour_face.py` (edited): skin, brown eyes, hair/mask shading kept (18:02 to 19:24 final).

### Round 14: skin, waist cloth, orange segments, motion (18:30 to 19:52)
- **Skin** one shade darker: `SKIN_TONE` 0.92,0.86,0.84 -> 0.80,0.74,0.71 in `21_recolour_face.py`; `04_textures/B_face_recolour/Feydakin_Albedo_eyes_hair_mask.png` regenerated (19:24).
- **Motion measurement tools (new):** `33_sword_clearance.py` (blade-inside-body frames per clip; found and fixed a blade-axis bug in my own sweep first), `34_plate_rigidity.py` (rubber-plate measure per component, Kabsch residual), `inspect_motion_sheet.py` (flat-colour frame sheets, camera follows root).
- **Motion pass (new):** `27_motion_pass.py`. Four versions (M1 to M4). M4 is final: shared rigid pauldron weights, seams welded, gorget off the head, hidden hands removed, layer gaps (`separate()`). Blender output `03_blender/nudge/B_hero_M4.blend`.
- **Colour pass (new):** `26_colour_pass.py` (19:27) + `26b_paint.py` (19:25). Apron black with dark orange hem trim; orange knee cops and hex chest plate (variant C1, picked). Textures in `04_textures/B_hero_colour/C1/`.
- **Sword tilt:** `22_mount_two_swords.py --sword1-tilt=-6` (new flag). Right blade clear of the back shell in all clips.
- **GIFs:** `31_make_two_swords_gif.py` now takes `TWO_SWORDS_ACTION` and `GIF_FPS` (default 30; earlier GIFs ran at 15 fps). Outputs `02_progress_photos/10_poc_gifs/B_foundry_warlord_hero_C1_two_swords_{Run,AttackMelee01,FightIdle}.gif` (19:32).
- Sent to user: variant sheet `02_progress_photos/21_colour_motion/compare_variants.png` (19:28), before/after `motion_before_after.png`.
- `SPEC.md` "Round 14" section appended.

### data.cdb edit: Karlin hero (19:52)
- `08_scripts/40_cdb_karlin.py` (new; `--dry-run`, `--revert`). Edits `mod_files/data.cdb`:
  - `character.Karlin`: lastname Mallenor -> Thorvald, description rewritten.
  - `unit.TH_Hero_1`: name "Karlin Thorvald", description, combo Generic_Ranged -> Generic_Flanker_Melee, pistol range dropped, voices and move/melee/ability sounds -> Iakin's (H_Hero_2).
  - `model.Th_Hero_2`: mesh -> `CharMOD/Male01_ThorvaldKarlin/Prefab_ThorvaldKarlin.prefab`, rigName 1 -> 0, inherit -> `ThorvaldKarlin`.
  - New model row `ThorvaldKarlin` after `MilitaryDualSwords` (DualSwords clips, IdleVariant -> IdleStance, Skill = Nefud_Skill).
- Backups: `07_data_cdb/data_BEFORE_karlin_hero.cdb` (before any edit), `mod_files/backups/data_karlin_hero_20261103_195206.cdb` (first apply, before the character fix), `data_before_karlin_revert_20261103_195243.cdb`, `data_karlin_hero_20261103_195244.cdb` (final apply).
- Validation: `cdb_validate.py` 0 NEW problems; `engine_preflight.py` 0 fail (7 old warnings). `cdb_tools.py verify`: byte-exact.
- Undo: `python model_projects/thorvald/thorvald_hero_1/08_scripts/40_cdb_karlin.py --revert`.
- Note: `mod_files/data.cdb` was last modified at 21:45 by another session's edits (councillors). Not mine; Karlin's rows are still present.
- `thorvald_faction/08_scripts/53_add_thorvald_faction.py`: comment added on the old name line (renamed in cdb by 40_). No logic change.

### Game package staging (20:31 to 20:38)
- `08_scripts/50_assemble_export.py` (new): both katanas baked (right B_Weapon with tilt, left B_Weapon_L), materials deduped by texture content to 8, unused `Mat_Base` slot dropped, <= 3 weights, FBX `06_game_ready/Male01_ThorvaldKarlin.fbx` (20:35). Textures `06_game_ready/src/`, `materials.json`. Katana MG/normal maps generated (64 px).
- `08_scripts/51_make_game_package.py` (new; copy of Elite's `14_make_game_package.py` with `--materials-json`, `--anim-paths`, corrected REPO depth). Output `C:\dsw_mod\D4XEditor\res\res\CharMOD\Male01_ThorvaldKarlin\` (32 files, 16 MB). check_hmd: RESULT OK. Superseded base textures moved to `06_game_ready/_superseded/`.
- `08_scripts/52_roundtrip_render.py` (new): converted HMD played with the game's Male01 DualSwords clips, rendered. Sheet `02_progress_photos/22_game_package/roundtrip_sheet.png` (20:37), sent to user.
- **Toolkit fix:** `HMD_toolkit/HMD_toolkit/Models/hmd2fbx.py` and `Animations/hmd2fbx.py` (20:36). The material index now comes from `skin.split[gi].materialIndex` instead of the group number. Before this, multi-material round trips showed shuffled textures (also the Ginaz Captain preview, not the game). Originals in `HMD_toolkit/HMD_toolkit/Backup_2026-11-03/`.
- Clips re-exported to `05_fbx_export/roundtrip/Karlin_HMD_{Run,AttackMelee01,FightIdle}.fbx`.
- `SPEC.md` "Game package" section and `modeling.md` section 18 added (20:38).

### Memory and docs
- `C:\Users\justi\.claude\projects\...\memory\thorvald-hero-karlin-status.md` (new) and a pointer line in `MEMORY.md`.

### Open
- Not packed, not installed, not seen in game. Next steps when you ask: `repackage.py`, then check `game.log` for `Modified data.cdb`, the second sword on `B_Weapon_L`, the hero ability animation, and the overall look.
- Skin may still want darker.
- Helmet, shin copper and back scabbards from the Oni sheet not taken.
- Boot-top traces behind the knees in the run.
- Nothing committed.

## 2026-11-03 to 2026-11-04: Thorvald buildings, Citadel HQ, ship animation

Status: all models, animation and prefab are **drafts in the repo. Nothing is installed, no cdb rows, no pak, not seen in game.**
Times are local (EST), taken from file modification times, so they show when each file was last written.

### Five unique buildings (`model_projects/thorvald_buildings/`), finished by 17:27
- Donors chosen from unused Skirmish models: TrafficHub (Consignment Terminal), SpiceCollector (Alloy Smelter), WaterExtractor + addon (Ore Drill), IndoctrinationCenter (War Academy Annex), ConquestOutpost (Contract Hall).
- `08_scripts/10`-`50`: survey, recolour (gunmetal / copper / oxblood), render, parts survey, Ore Drill cleanup, save.
- Ore Drill: 48 ice parts and 7 discharge elbows cut (`41_clean_oredrill.py`), per the user's request to remove the piles.
- Outputs: `03_blender/*.blend`, `05_fbx_export/*.fbx`, `02_progress_photos/02_recolour/final_sheet.png` (17:27), `SPEC.md` (17:26).
- Added 19:19: a `ThorvaldCitadel` recolour in `20_recolour.py` (copper faction zones on the outpost), output `04_textures/ThorvaldCitadel/albedo.png`.

### Docs
- `house_thorvald/buildings.md` (new, untracked): five buildings plus a Headquarters section (19:33).
- `.claude/skills/dsw-hlboot-reverse/references/engine_findings.md` (19:33): section 8f. The engine builds `District_<group>_<slot>` names from `props.districtSlots` and shows matching prefab nodes as slots are built (`ent/StructureModel.hx:68-89`).
- Earlier, 2026-11-01 to 11-03 (times not recorded): Jool renamed to Ein (`62_rename_jool_to_ein.py`, backup `mod_files/backups/data_before_jool_to_ein_20261101_104453.cdb`); `house_thorvald/councillor_ideas.md` (new, ideas only); `counsellors.md`, `faction_design.md`, `lore.md` and `docs/attribute_*` changed to "Consignment Terminal" (not a mint); Master of Operations runs Heighforge.

### Thorvald Citadel HQ (`model_projects/thorvald/thorvald_hq/`, new project, 19:13 to 19:33)
- `01_input/h1.json`, `h2.json`, `h3.json`: kitbash specs. H3 is current.
- `08_scripts/10_convert_donors.py`: donor HMD -> FBX, bounds.
- `08_scripts/11_lineup.py` (+ `11_lineup_blender.py`): true-scale lineup of Arrakeen, Corrino and the Outpost.
- `08_scripts/12_parts_survey.py`: loose-part survey of the Outpost (`02_progress_photos/01_survey/outpost_parts.txt`).
- `08_scripts/hq_scene.py`: shared Blender helpers (material, place, ground, camera, shoot).
- `08_scripts/20_build_hq.py`: box-cut kitbash from a spec; renders `02_kitbash/` (3/4, top, start, `--growth` stages); `--save` writes `03_blender/H3.blend`; `--export` writes `05_fbx_export/H3/*.fbx` (one per district group).
- `08_scripts/30_ships_anim.py`: writes `06_game_ready/Anim_ThorvaldCitadel_Ships.fbx`. It copies the vanilla Arrakeen ship animation and overwrites only its frame block. RIG_SCALE changed 2.0 -> 3.5 after the first preview was too small to see.
- `08_scripts/31_ships_preview.py`: toolkit round trip (`hmdanim2fbx`), GIF in `02_progress_photos/03_animation/H3_ships.gif` (19:33).
- `08_scripts/40_make_prefab.py`: writes `06_game_ready/Prefab_ThorvaldCitadel.prefab` (draft). Every referenced FX and prop was checked to exist in `C:\dsw_mod\extr`.
- `SPEC.md` (19:30): design, scripts, install steps for when you ask.
- Visual checks: `02_kitbash/H3_growth.gif` and `H3_growth_sheet.png` (19:29), ships GIF opened.

### Open / known issues
- **Contract Hall and HQ share one donor.** The HQ was cut from the Conquest Outpost, which is also the Contract Hall's donor. The Contract Hall's model is still in `thorvald_buildings`, so the outpost is not free yet. The HQ uses copper faction zones; the Contract Hall uses oxblood.
- The HQ's ships still use the Atreides ArrakeenAsset texture. A recolour needs a retextured copy of the rig.
- The HQ prefab's `District_*` names are unverified in game. Corrino's HQ has the same naming, which is the basis for the claim.
- The mockup's "Hammer of Wealth" emblem is not on the HQ yet (open todo).
- Nothing committed. Git status: `thorvald_hq/`, `thorvald_buildings/`, `house_thorvald/buildings.md` are new or untracked; `engine_findings.md` is modified.

## 2026-11-03: House Thorvald councillors, portraits and agents

Status: built in `mod_files/data.cdb` and staged in the editor res tree. **Not packed or installed, not seen in game.**

### data.cdb (`mod_files/data.cdb`)
Edited by `model_projects/thorvald/thorvald_councillors/08_scripts/20_councillors_cdb.py`. Compared with the cdb just before the edit, only these rows changed:

| Sheet | Rows | Change |
|---|---|---|
| `character` | `Nobru`, `ThEin`, `Silva`, `Haruka` | New portraits (`gfx`, `images.menuGfx`, `images.tutoGfx`), new `desc`, `title`. Silva `gender` 1 → 0. AI domain: Nobru Statecraft, Silva Economy (Ein and Haruka unchanged). |
| `trait` | `NobruPassive`, `ThEinPassive`, `SilvaPassive`, `HarukaPassive` | New name, icon and attributes (below). |
| `agent` | `Th1`..`Th7` | **Added** after `C10`: 5 male, 2 female, no trait overlays, `need` = Thorvald only. |
| `agent` | `C1`..`C10` | Thorvald removed from their `need.factions`; they are Corrino-only now. |

Perks (every attribute is one that vanilla traits already use; no hlboot patch needed):

| Councillor | Trait name | Attributes |
|---|---|---|
| Nobru | Market Patronage | `FreeVotes_Resolution_Flat` 20; `CMarket_Share_BuyPrice_MRatio` 0.85 |
| Ein | Academy Doctrine | `Army_TResUpkeep_MRatio` 0.9 (Solari); `Army_SpawnExperienceLevel_Flat` 1; `FactionArmy_InZoneWithOperation_Armor_Flat` 1 |
| Silva | Supply Line Optimization | `Building_Village_TResCost_MRatio` 0.85 (Plascrete); `Building_ConstructionSpeed_ARatio` 0.2; `Building_TRes_Upkeep_MRatio` 0.8 (Solari) |
| Haruka | Corporate Espionage | `TRes_ProdPerInfiltrationLevels_Flat` 1 (Influence) and 1 (Intel); `Mission_PreparationTime_MRatio` 0.75; `Mission_Cost_MRatio` 0.85 |

Not built: the Active perks from the concept screen (Sabotage Network, Market Manipulation, Hammer Brief). No active slot was found.

Checks run: `cdb_validate.py --vanilla mod_files/data_vanilla_2026-10-28.cdb` = 0 NEW problems; `engine_preflight.py` = 0 fail (7 existing warnings); `deploy_pak.py --dry-run` = 312 files in the pak match the staged res folder, nothing installed.

### New files
- `model_projects/thorvald/thorvald_councillors/` (new project folder):
  - `SPEC.md`
  - `08_scripts/10_make_portraits.py` and `portrait_lib.py`: cut the figures out of the concept art (GrabCut + feather)
  - `08_scripts/20_councillors_cdb.py`: the cdb edit (dry run by default; `--apply`, `--revert`)
  - `04_textures/`: the five PNG atlases
  - `02_progress_photos/01_portraits/`: preview sheets (`council_menu_row.png`, `council_tuto_row.png`, `agents_big.png`)
  - `07_data_cdb/`: `data_BEFORE_thorvald_councillors.cdb` and `before_rows.json` (old rows, used by `--revert`)
- Staged in `C:\dsw_mod\D4XEditor\res\res\UI\` (new files only; no vanilla atlas overridden):
  - `Faction/councillors_thorvald.png` (4 x 128 px icons)
  - `Faction/Menu/menuCouncilorsThorvald.png` (4 x 336x624)
  - `Faction/Menu/councillorsThorvald.png` (4 x 180x320)
  - `spying/agents/agents_thorvald.png` (80 px) and `agents_thorvald_big.png` (240 px)
- Backup: `mod_files/backups/data_before_thorvald_councillors_20261103_214518.cdb`
- `C:\dsw_mod\D4XEditor\res\res.compressed1.pak` was rebuilt by the pak dry run. It is a build artifact in the editor folder; the game folder was not touched.

### Portrait sources (`house_thorvald/images/`, not modified)
- Nobru, Silva, Haruka: `councillors_banner_portraits.jpg`
- Ein: `council_male_military_cape.jpg`
- Agents: banner Jool bust, `council_male_robe_gold_pattern.jpg`, `council_male_black_copper_jacket.jpg`, `council_male_dark_coat_gold_chain.png`, `council_male_grey_beard_sword.png`, `council_female_blue_coat.jpg`, `council_female_black_abaya.jpg`

### Docs edited
- `house_thorvald/counsellors.md`: status block with the built perks
- `house_thorvald/image_index.md`: section listing which images became portraits

### Memory
- Added `thorvald-councillors-status.md` and its line in `MEMORY.md` (outside the repo, in the Claude memory folder).

### Open items
- Test in a new game: council screen portraits, perk tooltips (`[Thorvald-adjective]` token, percent placeholders), agent portraits in the spying screen.
- Banner busts are about 210 px wide and upscaled 1.6x; higher-resolution originals would sharpen them.
- Karlin (hero) still uses a Corrino portrait cell.
- Agents have no Mentat/Suk Doctor overlays.
- To package: `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch`.

### Undo
`python model_projects/thorvald/thorvald_councillors/08_scripts/20_councillors_cdb.py --revert` restores the old character, trait and `C1`..`C10` rows and removes `Th1`..`Th7`. The staged PNGs can stay or be deleted from `res\res\UI\`.
