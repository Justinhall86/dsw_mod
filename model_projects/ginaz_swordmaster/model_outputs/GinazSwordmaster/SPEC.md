# Ginaz Swordmaster: unit model spec and status

Custom Dune: Spice Wars unit model built on the **Male01 rig** (same skeleton as the Landsraad
Guard), so it plays the game's existing animations. Built 2026-10-18 from
`model_inputs/ginaz_swordmaster.fbx`.

**Status: built and packed, NOT yet verified in the game.** Everything below "What is verified"
was checked in Blender only.

---

## 1. At a glance

| | |
|---|---|
| In-game unit | **Ginaz Swordmaster** (`A_GinazSwordmaster`), **Atreides**, free and near-instant to build (test unit), built as a full copy of `A_Trooper` (see 5A). It also **starts every Atreides game next to the HQ (Arrakeen)**. A diagnostic **Trooper (control)** (`A_Control_Trooper`) is added the same way |
| Model entry | `N_Ginaz_Swordmaster` (clone of `C_Elite` -> inherits `MilitarySardaukar` = sword animations) |
| Rig | Male01, 46 joints (`rigName` 0) |
| Mesh | 6,814 triangles, 6,405 vertices after export (vanilla Landsraad Guard: ~6.2k tris, 4.1k verts) |
| Textures | 1024x1024 Albedo / Normal / MetallicGlossAO (guard uses 512x512) |
| Weapon | Sardaukar sword, attached through the prefab to `B_rWristJ.B_Weapon` |
| Pak | `C:\dsw_mod\D4XEditor\res\res.compressed1.pak` (rebuilt 2026-10-18 13:41, 11.9 MB) |
| **Deployed?** | **Yes** (2026-10-18 13:41) to `C:\Users\justi\OneDrive\steamapps\common\D4X\res.compressed1.pak`, byte-verified; the previous pak was archived beside it. `C:\Program Files (x86)\Steam\steamapps\common\D4X` is the **same folder** (linked), not a second copy |

---

## 2. Folder contents

| Folder | What's in it |
|---|---|
| `screenshots/` | 31 progress images, numbered in build order (see section 3) |
| `textures/` | The three baked source textures (`Ginaz_*.png`) |
| `fbx/` | `Male01_GinazSwordmaster.fbx`: the Blender export that went into the toolkit |
| `game_ready/` | Toolkit output, exactly what goes into `D4XEditor/res/res/CharMOD/Male01_GinazSwordmaster/`: `.hmd`, 3 renamed PNGs, the toolkit's body-only prefab, and `Prefab_GinazSwordmaster.prefab` (body + sword; **this is the one the game uses**) |
| `blender/` | `.blend` files saved after each stage (`stage1` = fitted + painted + decimated, `stage2` = UV + baked textures, `stage3` = skinned, `final` = exported state) |
| `scripts/` | `ginaz_stage1/2/3.py` (the main pipeline) and `bridge_commands/` (the numbered one-off fixes, see section 7) |
| `data/` | The two `data.cdb` entries added for this unit, as JSON |

The original input stays at `model_inputs/ginaz_swordmaster.fbx`. Working copies also remain in
`model_work/`; **this folder is the complete, canonical set.**

---

## 3. Screenshot index

| # | File | Shows |
|---|---|---|
| 01 | `01_source_turnaround_sheet` | The input: a 3-view sheet (front/side/back) + slabs |
| 02 | `02_scaled_to_rig_before_arm_fix` | Front figure scaled onto the Male01 skeleton; arms hang lower than the rig's |
| 03 | `03_arms_bent_to_rig_pose` | After bending the arms to the rig's 45 deg rest pose |
| 04-05 | `04_painted_front/back` | Regional colors painted on the high-poly (source had none) |
| 06 | `06_lowpoly_7000tris` | Decimated game mesh |
| 07-09 | `07_textured_front`, `08_textured_back`, `09_textured_head` | Baked textures applied |
| 10 | `10_skinned_with_rig` | Skinned, with the rig visible |
| 11-13 | `11_pose_test_a`, `12_..._back`, `13_pose_test_b` | Manual bone-posing stress test (**before** the fixes: shows streaks from the hands and shearing) |
| 14-15 | `14_run_*`, `15_attack_*` | Guard's real Run/Attack animations, **before** the cape/leg fix (stretched sheets visible) |
| 16-17 | `16_attack_fixed_*`, `17_run_fixed_*` | Same frames **after** the fix |
| 20-23 | `20_final_rest_with_sword`, `21_sword_attack_*`, `22_sword_run_*`, `23_sword_idle_*` | Final model with the Sardaukar sword and the Sardaukar's sword animations |

The sword is magenta in 20-23 only because its texture wasn't loaded in the preview.

---

## 4. What is verified (in Blender)

- Rest pose matches the Male01 skeleton: legs and head aligned, arms corrected to 45 deg.
- `fbxfix` check: **"skeleton_restored: 46 bones, 46 clusters ... no warnings"**.
- Toolkit conversion succeeded: HMD parses (v4, 46 joints), textures extracted/renamed/wired.
- Pak extracted again after building: contains the HMD, textures, both prefabs and the updated
  `data.cdb`; byte-identical to the sources.
- Guard animations (Run, AttackMelee01, Idle) and the Sardaukar's (AttackMelee01, Run, Idle)
  replayed on the skinned model: no distortion, head/arms/hands clean, cape flows in Run.
- Max 3 bone influences per vertex; every vertex weighted; no prop-bone weights.

## 5. NOT verified / not done (read this first)

**A. Only partly seen in the game.** Highest priority.

**First in-game test (2026-10-18, user report): the first Atreides version did NOT spawn at the start and did NOT appear in the recruit list.** That version inherited from `Landsraad_Soldier` with many fields replaced. It was rebuilt as an **exact copy of `A_Trooper`** (parent `Trooper`, trait `A_Trooper_Trait`, the 4 equipment refs, voices/events, images, gfx), changing only: id, texts, model ref, wheel slot (7), costs (free, 0 CP upkeep) and stats (900/20/10, training 0.1). A second unit, **`A_Control_Trooper`** (an unmodified `A_Trooper` copy with the *vanilla* model, free, slot 8), was added to the recruit list and to Arrakeen's start units as a **diagnostic**:
- control **appears**, swordmaster **doesn't** -> the problem is in the swordmaster's *model entry / prefab / assets*;
- **neither** appears -> the recruit/start-unit mechanism or pak loading is the issue (your earlier Model Zoo experiment used `LandsraadHQ.startUnits` and stripped `preload` blocks: compare);
- **both** appear -> fixed. Remove the control unit afterwards.

Specifically unconfirmed:
1. **The unit appears in the Atreides recruit list and can be built.** Based on how Atreides'
   own units are defined (faction set, no `NotBuyable` flag, build-wheel slot 7), but no one has
   confirmed even the earlier guard test units work.
   **The unit spawns next to Arrakeen at game start.** This uses the `structure.startUnits` list
   (the same mechanism that gives each faction its starting ornithopter) but is unconfirmed:
   check that it appears, that you control it, and how many appear. If another faction's HQ is
   used in some game mode, only `Arrakeen` was edited (`TESTBase`, an unrelated test base,
   was not).
2. **Textures render right.** A magenta model means a texture path didn't resolve. Unconfirmed:
   - *Normal-map Y direction* (Blender bakes Y+; the game's convention hasn't been checked).
   - *Handedness:* the game mirrors X on import. The toolkit compensates for the skeleton,
     but the baked normal map on a mirrored mesh is unconfirmed.
   - *MetallicGlossAO channels:* R = metallic, G = gloss, B = AO is inferred from comparing the
     guard's gold trim vs gunmetal, not from documentation.
3. **The sword's grip and orientation.** The prefab copies the Sardaukar's offsets
   (`y -0.1107, rotationX -90, scale 0.95`), and the Sardaukar sword is large (2.4 m long). The
   preview used the same numbers, but the Blender view isn't the game's.
4. **Sardaukar animation compatibility.** Those animations have 10 extra tracks (`B_Bolas*`,
   `B_Whip*`) that our 46-bone skeleton lacks. The toolkit drops them in Blender; the game is
   *assumed* to ignore them.
5. **Attack timing/effects.** Hit events and attack FX come from the Sardaukar's data and
   haven't been checked on this unit.

**B. Deployment was not done by me.** Copying the pak into the Steam folder is a manual step
(an automated copy was blocked). See section 8.

**C. Placeholder game data** (test values, not balanced):
- Faction **Atreides**. Stats: health 900, power 20, armor 10 (better than the Atreides
  Trooper's 750/14/6), `maxSupply` 5555 (like Atreides units; the Landsraad value of 100 could
  have starved it in the field), training time **0.1** (near-instant; the game's own units use 0).
- **Free:** recruit 0 Manpower; upkeep 0 Solari and **0 Command Points** (so it doesn't use
  population cap at all).
- Trait `Warrior_Trait` only. The earlier `NoHealthRegen` and `LandGuard_Trait` (halved damage
  in own territory) were removed.
- Portraits are the Atreides Trooper's (placeholder icon); voices are `Voice_A_Trooper_*`.
- Build-wheel slot: group 1, **pos 7** (Atreides use 4, 5, 6). Whether pos 7 is displayed
  correctly is unconfirmed.
- No AI weight, no unlock requirement, no localization entry, no tooltip text beyond a one-liner.
- The earlier Corrino test units (`C_LandsraadGuard`, `C_LandsraadGuard_Regular`) are still in
  `data.cdb`. The Corrino `C_GinazSwordmaster` was **replaced** by the Atreides unit (renamed).

**D. Provenance / licensing of the source mesh is unknown.** The turnaround-sheet format and
sculpt look generated or scanned. **Confirm you have the rights before shipping a mod
that includes it.**

---

## 6. Known visual/technical issues

1. **Right hip stretch** in deep lunges: about 37 triangles (0.37 m2) still stretch more than
   4x in the attack animation (it was 166 triangles before the cape fix).
2. **Cape** is a thin shell with ragged edges; it clips through the legs in some frames. In the
   attack and idle animations the cape bones are static, so it moves rigidly with the spine.
3. **Hands are rigid.** Everything past the wrist is bound to the palm bone, so fingers don't
   articulate or grip. (Automatic weights on the claw-like fingers made long streaks.)
4. **Low detail face/hands.** The head has ~480 vertices and the hands ~630 in total; the
   source sculpt is soft and blobby, and normal-map detail only goes so far.
5. **Colors are approximate.** The source had no colors; they were painted by region (position
   and height masks), so boundaries (for example armor vs cloth) are heuristic and the skin tone
   and sash are guesses. Albedo has baked AO shading.
6. **UV layout is wasteful.** Smart UV Project made hundreds of small islands (many seams, ~6.4k
   export vertices vs 3.5k mesh vertices, low texel usage).
7. **Texture files are large.** 0.8-1.4 MB each at 1024x1024 (the guard's are ~0.2 MB at 512).
8. **Weight asymmetry unexplained.** After auto-weighting, `B_rWristJ` has ~483 vertices vs ~305
   for `B_lWristJ`; the source figure isn't symmetric, but this should be inspected.
9. **Head bone weights.** `B_HeadJ` has ~409 vertices and `B_Neck01J` ~312, while `B_SpineTopJ` only
   ~62. Possible bleed of the shoulder pads into the neck/head bones hasn't been inspected.
10. **Sword is huge** next to the body (2.4 m blade), because it's the Sardaukar's weapon scale.

---

## 7. Future work (suggested order)

1. **Test in game** and report what's wrong (section 5A). Fix handedness / normal-map flips first
   if needed (flip the green channel or re-bake with the opposite convention).
2. **Tune the unit**: remove `NoHealthRegen`, set real stats/cost/unlock, give it its own
   portraits and name/description, fix `wheelPosition`.
3. **Remove the test units** (`C_LandsraadGuard*`) and the temporary 0.1 training time before any
   release.
4. **Re-unwrap with fewer islands** (marked seams, or unwrap per body part), then re-bake. Aim for
   ~5k export vertices and consider **512x512** textures like the vanilla units.
5. **Hand/finger weighting**: hand-paint finger weights so the fingers grip the sword.
6. **Cape pass**: either simplify to a single skirt shell tied to the cape bones or bake the cape
   to follow the body more rigidly; check clipping in Run/Attack.
7. **Hip/crotch weights**: hand-tune the right hip region to remove the remaining stretch.
8. **Retopologize** the face/hands (or hire an artist to "dress up" the base body instead, which
   keeps the rig and animations; the point of Peter Quin's workflow).
9. **Real art pass** on the albedo (the colors are placeholder), plus optional emissive map.
10. **Consolidate the pipeline** into a single reproducible script (see below).
11. **Re-check on Blender 4.5**, the toolkit's validated version; this was built on 5.2.2.

### About the scripts
`scripts/ginaz_stage1.py`, `ginaz_stage2.py` and `ginaz_stage3.py` are the main pipeline, but several
fixes were applied afterwards as one-off commands (numbered files in `scripts/bridge_commands/`,
run through a live bridge into an open Blender window):

| Command | Purpose |
|---|---|
| `59_props.py`, `60_redo.py` | Prop bones set to non-deforming; auto weights redone; cape weights |
| `62_hands.py` | Hands bound to the palm; animation replay helper |
| `63_stretch.py`, `65_retest.py` | Measure triangle stretch against real animations |
| `64_detach.py` | Delete cape-to-leg bridge faces |
| `66_matlinks.py` | Read how the toolkit's own material is wired |
| `68_split.py`, `69_rebake_normal.py` | Find the custom-normal vertex splitting; clear it; re-bake normals |
| `67_export.py`, `70_export2.py` | FBX export |
| `72_final_preview.py` | Sword attach + final animation renders |

The stage scripts do **not** contain those later fixes, so re-running them alone gives an
earlier, worse result. A future cleanup should fold everything into one ordered script. Also
note the AO floor (`B = 0.4 + 0.6*B` on the MetallicGlossAO PNG) was applied with a separate
Pillow snippet, not in any script.

---

## 8. Deploy and undo

**Deploy** (game closed; the editor must not overwrite `data.cdb` with old data: reload it, or
close without saving):

```powershell
Copy-Item "C:\dsw_mod\D4XEditor\res\res.compressed1.pak" "C:\Program Files (x86)\Steam\steamapps\common\D4X\res.compressed1.pak" -Force
```

Then start a **new** game as **Atreides**. You should see a Ginaz Swordmaster beside Arrakeen at
the start, and **Ginaz Swordmaster** should be in the recruit list (free, near-instant).

**Undo**
- Restore the previous pak: `res.compressed1_archived_2026-10-16_112912_pre_helmet.pak` in the game
  folder is your pak as it was **before any of the helmet/guard/swordmaster work** (so it still
  has your own earlier data mods). Copy it over `res.compressed1.pak` to go back.
- `data.cdb` backups (in `D4XEditor/res/backups/`):
  - `data_pre_atreides_ginaz_20261018_131901.cdb`: just before the Atreides/start-unit change
    (unit was Corrino then).
  - `data_pre_ginaz_20261018_125653.cdb`: just before the swordmaster was first added.
- To remove only the start-of-game spawn: delete `{"unit": "A_GinazSwordmaster"}` from
  `Arrakeen.startUnits` in the `structure` sheet.

## 9. How it was built (summary)

1. Extract the front figure from the sheet and cut the slabs.
2. Scale to 1.88 m, center on the rig, bend arms to 45 deg.
3. Paint regional vertex colors; decimate to 7,000 tris in two passes.
4. Smart-UV unwrap; bake albedo, metal/gloss, AO and a tangent normal map (Cycles).
5. Import the Male01 rig (from the Landsraad Guard export), auto-weight with prop bones
   non-deforming, then fix hands, cape and bridge faces.
6. Export FBX (Forward Y, Up Z, no leaf bones, no animation, embedded textures, material wired
   like the toolkit's own imports).
7. `convert_fbx.py model` -> HMD + textures + prefab -> `D4XEditor/res/CharMOD/`.
8. Build `Prefab_GinazSwordmaster.prefab` (Sardaukar prefab, our body); add the `data.cdb` model
   and unit; build the pak (`hl Build.hl -diff`) and verify by extraction.

Full detail and the reasoning behind each fix: `modeling.md` section "Worked example 2".
