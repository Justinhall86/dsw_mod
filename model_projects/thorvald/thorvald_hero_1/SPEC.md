# Karlin Thorvald (Thorvald hero 1): project notes

Working name was Karlin Mallenor (`house_thorvald/heroes.md`). Now called **Karlin Thorvald**. The cdb hero entry (`TH_Hero_1`, uppercase per the unit-id rule)
still carries the old name "Karlin Mallenor" until this project gets its own build. The name in `53_add_thorvald_faction.py` (`Th_Hero_1`) needs the same change.

**Role (from heroes.md):** buff/support commander, a leadership aura hero (War Academy commandant). Armour and power, attack speed.

## Donor set (01_input/donors/)

All male vanilla heroes, one folder each. Each folder has the `.blend` (Male01 rig, shipped textures packed, `Run` clip)
and the run GIF(s) from `model_inputs/Character/...`.

| Folder | Hero (unit id) | Mesh | Notes |
|---|---|---|---|
| Duncan | Duncan (A_Hero_1) | Atreides Duncan | Swordmaster, green scarf, back pack |
| Gurney | Gurney Halleck (A_Hero_2) | Atreides Gurney | Shoulder plate, green sash; two GIFs (armed run, plain run) |
| Rabban | Glossu Rabban (H_Hero_1) | Harkonnen Rabban | Heavy armour; carries a long pole in the run clip |
| Iakin | Iakin Nefud (H_Hero_2) | Harkonnen Nefud | Red cape, bald head |
| Otheym | Otheym (F_Hero_2) | Fremen Otheym | Bulky chest armour, bare head |
| Bannerjee | Bannerjee (S_Hero_2) | Smuggler Bannerjee | Blue cloak, grey hair, spear |
| Whitmore | Whitmore Bludd (E_Hero_1) | Ecaz WhitmoreBludd | Gold collar, red sash |
| Ctair | C'Tair Pilru (V_Hero_2) | Vernius Ctair | Purple cloak; looks translucent in the front render (not yet checked against vanilla) |

**Excluded:** Captain Aramsham (`C_Hero_2`), male, but a Sardaukar officer. CLAUDE.md bars Sardaukar parts as donors or bases.
**Not male (gender 1 in the cdb, skipped):** Chani, Ilesa, Drisq, Wensicia, Nuwa.

Existing project blends were not reused: `model_projects/gurney` and `model_projects/Bannerjee` are project files that may carry edits,
and Duncan's only `.blend` is `duncan_modified`. All donor `.blend` files here are built fresh from the vanilla meshes.

## How the donor blends were built

- Script: `08_scripts/10_build_donor_blends.py`
- Step 1 (system Python): `--prep` runs the HMD toolkit (`hmdanim2fbx.py` with `Anim_Male01_Run`) and converts the DDS textures named `.png` to real PNG.
- Step 2 (Blender 5.2, background): `blender -b --factory-startup --python 10_build_donor_blends.py`. Writes one `.blend` per hero.
- Front-view check: `02_progress_photos/01_donors/donor_sheet_front.png`. Textures and rigs all come through.

## Unfinished

- Karlin's own design: not started. The donors are references only.
- Rabban and Iakin renders are clipped at the frame edge (weapon and cape extend the bounding box). Preview only, no effect on the donors.

## Look POCs (2026-11-01)

Three looks for Karlin, built as preview-only kitbashes. Nothing is exported, installed or added to the cdb. H_Hero_1 (Rabban) is not used as a donor.
Sources: `house_thorvald/heroes.md` (commander, War Academy, aura), `counsellors.md` (Ein's officer look), `art_direction.md` (mercenary uniform,
copper emblem, gunmetal and rust palette), `lore.md` (Heighforge, the Earl's line).

| Variant | Concept | Base donor | Palette | Edits |
|---|---|---|---|---|
| **A** `A_academy_commandant` | War Academy commandant: a dark frock coat with orange trim, officer's bearing, face visible | Whitmore | coat gunmetal and near-black, rust, ember trim | Leather region remapped to coat tone (`recipe 3`). Maroon shoulder pieces kept |
| **B** `B_foundry_warlord` | Mercenary warlord in Heighforge plate, the infantry's uniform elevated, Warlord's Shout | Iakin (H_Hero_2) | iron plate, oxblood accent, copper trim | Red cape (`B_Cape02/03`, comps 14 and 15) dropped |
| **C** `C_kinsman_of_the_earl` | Kinsman of Memnon: a long black high-collared coat, oxblood sash, copper arm patch | Duncan | black coat, blackened steel, oxblood, copper | None (Duncan's own coat already fits) |

Files:
- Palettes: `08_scripts/palettes/*.json`. Specs: `08_scripts/specs/*_pass2.json`. Texture sources: `04_textures/<variant>/`.
- Saved blends: `03_blender/pass2/<variant>.blend`. Renders: `02_progress_photos/02_pass2_*`, comparison `04_comparison/POC_three_variants.png`.
- Animation check: `02_progress_photos/03_anim_stress_{A,B,C}_sheet.png` (Run and AttackMelee01).
- Tooling: `list_components.py` (lists every component of a donor body with no height filter; the survey gallery stops at z 1.3). `build_variant.py` in
  `dsw-part-kitbash` gained a `body_maps` option (recoloured body textures) so specs can carry a recolour.

Method notes and fixes:
- The skin region must keep the donor's own colour: the first pass mapped it to the palette's brown, which turned faces orange. Each palette's
  `skin` now holds the donor's measured skin mean.
- Whitmore's pink-maroon coat lining classed as leather, so the first A pass came out rust-brown. The leather remap fixed it.

## Commentary (honest)

- **C is the strongest** and the closest to the docs: a black coat with copper and oxblood reads as the Earl's kin, and it holds through Run and attack.
- **B reads as a warlord** once the cape is gone; the heavy plate silhouette is right for "Warlord's Shout". Its head is the vanilla Iakin face, which is warm orange,
  so the face does not match the grey palette. A helmet or hat would fix that, but no donor hat exists.
- **A is the weakest concept.** The frock coat reads, but the Whitmore base brings maroon shoulder pieces and a beard, and at RTS scale the orange trim is
  the only read. In the attack frames a grey shoulder piece lifts away from the back, so the shoulder junction needs a check.
- **The conical kasa hat and the mask from the infantry sheet are not in the donor set.** Variant B is the nearest to the mercenary idea and still has no hat.
- **Masks and hats are the biggest gap** for the house identity; the art direction treats them as the house's signature.
- The copper gear emblem is not on any of the three yet. It is the one shape the docs insist on for the chest.

Recommendation: take **C** as the base for Karlin, then add B's plate shoulders and a copper emblem to C's coat. Before that, decide the hat question
(build a kasa from a helmet donor or drop the hat for the house). Not yet tested in game.

## Structure pass (2026-11-01): house kit on the POCs

Colour was the first pass. This pass adds the installed House Thorvald kit from `thorvald_elite` v2 (`03_blender/v2_final.blend`):
the kasa hat (`TrooperHat`), the stand collar (`TrooperNeck`), the copper gear emblem (`TrooperEmblem`), the faceless mask head (`CommandoHead`)
and the rust apron (`DuncanFill_sash`). Script: `08_scripts/20_structure_pass.py --variant A|B|C` (reads `03_blender/pass2/`, writes `03_blender/structure/`).

| Variant | Kit added | Why |
|---|---|---|
| **A** Academy Commandant | collar, emblem, rust apron | Ein's officer look: face visible, no kasa or mask |
| **B** Foundry Warlord | kasa, mask head, collar, emblem, apron | the infantry uniform, elevated |
| **C** Kinsman of the Earl | collar, emblem, rust apron | family line: no kasa or mask, rust apron gives house identity |

- The kit is fitted to each POC's own head top (hat and head shifted by the difference from the elite's head top, 2.0 m). The emblem is placed by a ray
  cast onto the chest surface at the emblem's spot, not by a height band (the first attempt hit stray cloth and floated the emblem).
- Renders: `02_progress_photos/05_structure_pass/` (front, three-quarter, back per variant), summary `POC_structure_pass.png`.
- Clips: `02_progress_photos/06_structure_anim/` (B and C in Run and AttackMelee01). Hat follows the head, apron follows the legs; no tearing seen.
- Not done: copper rims on the shoulders, shin armour, boot straps, and the Academy pin for A. See round 2 below for the shoulder fix.

## Structure pass round 2 (2026-11-01): no hat, A's shoulder armour fixed

User direction: the kasa hat is not required (drop it), and "the Ecaz hero has shoulder armour that is wrong" (Variant A, donor Whitmore =
`E_Hero_1`, the Ecaz hero Whitmore Bludd).

**Hat removed.** `KIT_OBJECTS` no longer has a `"hat"` entry; no variant builds it. B keeps its masked head (`CommandoHead`, no hat baked in) -
the pointed silhouette visible in the small thumbnail is the new shoulder plate, not a hat (checked by zooming the render).

**A's shoulder armour, diagnosed properly this time.** The earlier round left Whitmore's original pads in place (noted as "swing off, not fixed").
Re-examined the gallery (`02_progress_photos/00_survey/gallery_Whitmore/sheet.png`): Whitmore actually carries two different shoulder pieces,
both wrong for different reasons:
- **Comps 5, 6** ("202v/191v rShoulder/lShoulder"): a maroon arm-wrap sleeve, weighted part to `B_rElbowJ`/`B_lElbowJ` (not a rigid plate), so it
  swings with the arm in Run/attack - confirmed by a drop-only test render (`02_progress_photos/05_structure_pass/drop_test/`), which showed a
  clean bare shoulder once these two were removed, with no damage to the arm or torso.
- **Comps 13, 14** ("118v/112v lShoulder/rClavicle"): an ornate gold scalloped "crown" pauldron cap. Ecaz-decorative, wrong palette family and
  wrong shape for Thorvald's gunmetal/copper industrial look, independent of any rigging problem.

All four are now dropped and replaced with **Iakin's rigid clavicle plate** (`01_input/donors/Iakin/Iakin_H_Hero_2.blend`, comps 16 and 17),
recoloured with A's own palette (`04_textures/A_shoulder_from_iakin/`, from `A_academy_commandant.json`) rather than B's iron/copper palette.

**Fit gotcha:** Iakin's donor blend turned out to have a different forward-axis convention from Whitmore's - Iakin's left-right spread is along
X, Whitmore's is along Y (confirmed by comparing bbox dumps of equivalent shoulder comps across the two files; cause not fully run down, flagged
for `modeling.md`). A naive graft at zero offset produced a floating, badly-placed blob (`02_progress_photos/05_structure_pass/A_v3_sheet.png`).
Fix: each side's plate is imported separately (not as one object - `dsw_parts.mirror_object` flips across x=0 and does not apply to a part whose
own left/right split is along Y), rotated +90° about Z around its own centre, scaled to 0.60, then translated onto Whitmore's own former
shoulder-plate position (comp 14's measured bbox centre for the right side, mirrored in Y for the left). Iteration in
`02_progress_photos/05_structure_pass/shoulder_fit/` (`fit_test` → `fit2` → `fit3`, the working version).

**Verified:** `02_progress_photos/07_structure_v4_anim/A_sheet.png` - the plate stays rigid and planted on the shoulder through every frame of
Run and AttackMelee01, no flapping, no detaching. Final renders: `02_progress_photos/05_structure_pass/structure_v4_sheet.png` (all three,
front/tq/back). Script: `08_scripts/20_structure_pass.py` (updated in place; `VARIANTS["A"]["shoulder_graft"]` now carries per-comp `targets`
and a `scale` instead of the old single-offset dict).

Still open: the shoulder plate's inner edge (nearest the collar) could sit a touch tighter - good enough for a POC, not pixel-fit. No copper rim
on the new plate yet (it currently just takes A's palette's gunmetal/ember regions as-is). Not yet tested in game.

## Structure pass round 3 (2026-11-02): nudge toward the heavy-infantry reference sheet

Reference saved to `house_thorvald/images/ref_heavy_infantry_model_sheet.jpg` ("Thorvald Heavy Infantry | Model Sheet for 3D (Blender)" -
olive/burnt-orange plate armour, black headwrap with piping, full visible face, no weapon, crossed-hammers chest emblem). Per direction:
**keep our own established per-variant palettes** (do not adopt the reference's own olive/burnt-orange colours), **no goggles**, and nudge
structure toward the sheet. Added to `house_thorvald/image_index.md`.

**Headwrap, all three.** No donor in the hero set had a plain cloth headwrap (most "masked" heads pair cloth with a metal jaw-guard). Found one
in an earlier exploration file, `model_projects/kitbash_explore/03_blender/history/V1_DuncanTurban.blend`: `MarauderHead` (the Common Marauder
unit's head, grafted onto Duncan there) has its cloth turban as its own connected component (comp 2, 139 verts, isolated from the metal
lower-face mask on comps 3/4 - confirmed by rendering every component separately, `02_progress_photos/08_headwrap/turban_gallery/sheet.png`).
Converted the Marauder textures (DDS-as-`.png` → real PNG), classified regions, and recoloured comp 2 once per variant with that variant's own
palette JSON (`04_textures/<variant>_headwrap/`), same pattern as the shoulder plate. Grafted with the same dz head-top fit used for the old hat
(`TURBAN_REF_TOP = 1.967`, the piece's own top z in the donor file).

**No goggles / full face (B).** Round 2 gave B the elite's masked, goggled `CommandoHead`. The reference shows a fully exposed face, and the
explicit instruction was "no goggles," so B now keeps its own (Iakin) head untouched, same as A and C always did - this also removes the mask,
which matches the reference more closely than a goggles-only fix would have.

**Result:** `02_progress_photos/05_structure_pass/structure_v5_sheet.png` (front/tq) and `structure_v5_back.png`. Each headwrap reads in its
own variant's palette (A: gunmetal/ember, B: iron/copper - warm, C: oxblood/copper), sits centred on the head from front and back, no visible
gaps against the collar.

**Verified:** `02_progress_photos/09_headwrap_anim/A_sheet.png` (A, Run + AttackMelee01) - the headwrap stays planted through every frame, no
slipping. B not independently stress-tested this round (same graft code, same bone weighting as A; lower risk).

**Not attempted this round:** bulking up the overall silhouette (forearm guards / gauntlet plates, a second pauldron tier) to match the
reference's heavier plate read - C (Duncan) in particular reads leaner than the reference's bulky infantry. The reference's crossed-hammers
chest emblem was not adopted (kept the house's own gear-and-star, which is canon per `art_direction.md`; the reference is one new, unvetted
source, and swapping the emblem is a bigger call than a "nudge"). No weapon added (reference shows none; none of the three POCs carries one
yet regardless). Not yet tested in game.

## GIFs (2026-11-02)

One Run-cycle GIF per POC: `02_progress_photos/10_poc_gifs/<variant>.gif` (480x640, 30 frames, 15 fps, loops). Reuses the donor's own
baked Run action already present in `03_blender/structure/<variant>.blend` (carried through every build stage from `10_build_donor_blends.py`
onward) - no new animation work needed. Script: `08_scripts/30_make_poc_gif.py --variant A|B|C`, then `--assemble` (system Python: Blender's
bundled Python has no Pillow, same split as the donor-build script). None existed before this round (only the raw donor reference gifs did,
under `01_input/donors/`).

## A different face: the unused-asset investigation (2026-11-02)

**Why:** all three POCs used a donor's own face (Whitmore, Iakin, Duncan), and each of those is already a live hero elsewhere in the game
(`E_Hero_1`, `H_Hero_2`, `A_Hero_1`). Asked to find a face that's genuinely unused in the shipped game, if possible, rather than an AI-generated
or hand-edited one.

**Method:** cross-referenced every mesh path actually wired into a `model` row in `mod_files/data_vanilla_2026-10-28.cdb` (187 distinct paths
across 283 rows) against every `Prefab_*.prefab` that physically exists under `extr/Character` (82 found). 9 were present on disk but referenced
by **no** model row at all - i.e. not even dead/unreachable data, literally never pointed to by anything the game loads:

| Asset | What it is | Verdict |
|---|---|---|
| `Common/Landsraad/Prefab_Sardaukar.prefab` | a Sardaukar variant | excluded - CLAUDE.md bars Sardaukar as donor or base |
| `Fremen/Unit/Feydakin/Prefab_Feydakin.prefab` | a full Fremen character, its own textures and HMD (`Male01_Feydakin.fbx`) | **used - see below** |
| `Vernius/Prefab_AllChara.prefab` | looks like a dev/test scene bundling several characters | not investigated further |
| remaining 6 | weapon-only prefabs (Vernius engineer/suboid/Nuwa weapons, Ravager Leader sniper, Ctair's sword) | not faces |

**Confirmed unused, not just uncommon:** `F_Elite` (the live Fremen Fedaykin elite unit) actually points to `Prefab_FeydakinR.prefab` - the
**"Rework"** - a different, larger mesh (5583 verts / 56 joints vs the original's 4299 verts / 46 joints) with its own texture set
(`Feydakin_rework_*.png` vs `Fremen_Feydakin_*.png`). The original `Male01_Feydakin.fbx` is a complete, cut, never-shipped design: distinct
hair/eye colouring from anything in our donor set, converted and rendered to confirm (`02_progress_photos/11_face_graft/`,
side-by-side `02_progress_photos/11_face_graft/feydakin_orig_vs_rework.png`, component breakdown
`02_progress_photos/11_face_graft/feydakin_head_components_sheet.png`).

**What's actually usable on it:** the half-mask (2 comps) and a neck scarf (1 comp) are separate geometry from the face/hair, confirmed by
dropping each and re-rendering. Dropping the scarf alone gives a clean, well-finished half-masked face (polished art, matches shipped quality).
Dropping the mask too exposes a bare chin that was **never painted for exposure** - the shipped design always hid it under the mask, so it
reads as a crude flat orange wedge once shown (`B_face_v9_closeup.png`). **Chose the half-mask version** (mask kept, scarf dropped) for
presentation quality; this is a step back from the previous round's "no goggles, full face" direction for B specifically, made because the
fully-exposed alternative looked unfinished, not broken - flagging this rather than silently reverting it. If a fully bare face is a hard
requirement, the chin would need an actual texture paint-over (sample the surrounding skin tone onto that one UV island) - not attempted.

**Build:** `01_input/donors/Feydakin/Feydakin_unused.blend` holds the pre-isolated head only (930 verts, mask kept, scarf and the rest of the
body dropped - a first attempt accidentally saved the **whole body** under this name, which silently doubled Whitmore's arms/torso under
variant A's rig when grafted; `02_progress_photos/05_structure_pass/structure_v6_sheet.png` has that failure's render, kept as a record of why
the donor file is head-only now). `20_structure_pass.py`
gained `face_graft` (drops the POC's own head entirely via a fresh, low-threshold `B_HeadJ` weight query - the original 0.5 threshold left a
sliver of the old jaw's neck-seam vertices attached, showing through as a dark fringe) and grafts Feydakin's head in, fitted by the same
dz-to-head-top method as the headwrap. The stand collar's own fit also had to change: it was positioned relative to the *old* head's chin, and
on the new, differently-proportioned face it rode up and covered half the mouth (`B_face_v8_closeup.png`); it's now positioned relative to
Feydakin's own chin z plus a small gap (`COLLAR_RAW_TOP`, `FEYDAKIN_CHIN_Z`, `COLLAR_CHIN_GAP` constants).

**Result:** all three POCs now share the one unused face (not three distinct ones - finding multiple good candidates would need more digging
than this pass covered). Verified in motion: `02_progress_photos/11_face_graft/B_anim/sheet.png` (Run + AttackMelee01, holds with no tearing).
Updated renders: `02_progress_photos/05_structure_pass/structure_v8_final_sheet.png`. GIFs rebuilt with the new face.

**If more, or different, faces are wanted later:**
1. **More unused assets** - the same cross-reference method would need to look wider than `Prefab_*.prefab` (e.g. `Prefab_AllChara.prefab`'s
   contents weren't opened; there may be other per-faction variant heads never wired to a `character` or `model` row) and could be rerun against
   a current, post-launch vanilla cdb if one exists, in case anything shipped since 2026-10-28 was cut later.
2. **AI-generated face**: workable, but needs a same-style, game-matching paintover (flat-shaded, low-poly-friendly albedo/normal/gloss triplet
   at this game's resolution) applied to the *existing* head topology (Male01's head UVs) rather than a new mesh - a generated image alone isn't
   a usable asset without that retexturing step, and would need the user to actually supply or commission it.
3. **Modify a donor's own face**: eye colour and skin-tone recolour are easy (the palette/recipe tooling already does hue-preserving recolours);
   nose/jaw RESHAPING needs sculpting the mesh itself (not just texture work) and has not been attempted on any donor head in this repo.

## Round 5 (2026-11-02): work narrows to B only, no headwrap, forearm plates, extended the unused-face search

User chose **B (Foundry Warlord)** as the direction to carry forward; A and C are left as they stood at the end of round 4, not
actively developed further. "Don't worry about the headwrap... no headwrap though" - dropped from B.

**Extended unused-face search.** Before committing to Feydakin again, re-ran the asset cross-reference more broadly:
- `Fremen/Unit/Proto_Canon.prefab` - a dev reference scene placing a `FremenSoldier` next to two copies of `Male01_Feydakin.fbx`
  (the original, not the Rework) - confirms the original was real, deliberate dev content, not a stray leftover, but it's the
  *same* asset already in use, not a new one.
- **The first search's `Prefab_*` filter had a real gap**: `Character/Harkonnen/Unit/Cerberus/Male01_Claws.prefab` (and
  `Male01_ClawsDamage.prefab`) don't start with "Prefab_", so they were invisible to the original query. Re-ran the full
  cross-reference matching every `*.prefab` regardless of name (93 found vs. 82 before). Cerberus turned out to be used anyway
  (`H_Elite`, `H_Elite_2`) - a false negative caught and closed, not a new face, but worth recording since the same gap could
  hide a real one elsewhere later.
- `Imperial/HouseGuard/Male01_HouseGuard.prefab` - unreferenced, but byte-identical mesh size to the live
  `Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx` (318688 bytes both), just a smaller/different-sized texture file alongside
  it - reads as a duplicated/placeholder copy, not a distinct face, so not pursued further.
- `Vernius/Prefab_AllChara.prefab`, `Harkonnens_LineUp.prefab`, `LineUp_Atreides.prefab` - dev line-up scenes that only
  `reference` other (already-used) prefabs, not standalone content.
- `Fremen/Unit/Infiltrator`, `Fremen/Unit/Watcher` - Female01 bodies (not usable for a male hero) and both already live
  (`F_Sneak`/`F_Assassin`, `F_Demo`).
- **Verdict: Feydakin remains the best find.** Kept it rather than falling back to Gurney (the user's documented fallback),
  since Gurney's face is already a live hero (`A_Hero_2`) and Feydakin is still the only confirmed, cleanly-isolable,
  genuinely-unused option.

**Forearm/gauntlet plates.** The reference sheet's own material callouts name "forearms" and "gauntlet plates" explicitly as a
burnt-orange element; B had nothing there before (plain grey sleeve/glove). No donor in this project has a distinct forearm
bracer shape worth grafting, and the last two cross-file donor grafts (A's shoulder plate, the face) each needed real debugging
(an axis-convention mismatch, a whole-body-instead-of-head mistake) - so this time the plate is a **hand-built, flat-coloured
cuff** (`build_band` in `20_structure_pass.py`), built directly in the target's own coordinate frame to avoid that whole class
of cross-file bug entirely. It needed one iteration of its own: `B_lElbowJ`/`B_lForearmJ`/`B_lWristJ`'s bone rest chain
(`head_local`/`tail_local`) does NOT trace a continuous limb in this rig (elbow's tail and forearm's head sit about 0.4 m apart -
printed and confirmed, not assumed), so the band's placement comes from the actual **mesh** vertices weighted to those bones
instead (elbow- and wrist-weighted centroids give the axis, forearm-weighted vertices give the radius) - this is the same
"trust the mesh, not the rig's bone-naming assumptions" lesson as the earlier axis-convention bug. Iteration renders:
`02_progress_photos/12_forearm_bands/` (`forearm_band_test` → `test2` → `test3`, the working version, matching this project's
own copper, not the reference's burnt orange).

**Result:** `02_progress_photos/05_structure_pass/B_foundry_warlord/` (front/tq/back, no headwrap, forearm plates visible, face
fully exposed from the hairline down). Verified in motion: `02_progress_photos/12_forearm_bands/B_anim/sheet.png` (Run +
AttackMelee01, the bands stay planted on the forearm through every frame). GIF rebuilt: `02_progress_photos/10_poc_gifs/B_foundry_warlord.gif`.

**Not attempted:** a wrapped waist sash (the reference shows a cummerbund-style wound sash; B still has the flat hanging apron
panel from round 3) and a copper pauldron rim trim (also named in the reference's callouts). Both are smaller, lower-priority
gaps than the forearm plates and were left for a later pass given the amount of this round already spent on the face search
and the band-placement fix. Not yet tested in game.

## Round 6 (2026-11-02): hands/gloves matched to the installed Thorvald Elite

User asked for B's hands/gloves to match `thorvald_elite` (the one unit already installed and built in the game). The Elite's
v2 body object is literally named `Gurney` in its own blend (`thorvald_elite/03_blender/v2_final.blend`) - its build chain is
Gurney-derived - and already carries the Thorvald-recoloured `Mat_Gurney`/`Mat_Thorvald_Trim` materials, matching the Elite
SPEC's note that it has "bulkier arms and gloves (hands x1.12)".

**Method:** rendered every component of both Iakin's own hand (B's current donor) and Elite's `Gurney` hand to identify the
full glove on each side (main glove body, thumb, four 16-vert fingertip segments, two small wrist-to-forearm cuff-overlap
pieces) - `HAND_GRAFT` in `20_structure_pass.py` lists the exact comp ids for both. **Checked for an axis mismatch first this
time** (the lesson from the A shoulder graft): Iakin's hand bbox (`lo[0.59,-0.18,0.93] hi[0.88,0.07,1.18]`) and Elite/Gurney's
(`lo[0.57,-0.19,0.93] hi[0.87,0.07,1.22]`) line up closely with no rotation needed - a genuinely straight swap, unlike the
earlier shoulder plate.

**Result:** Iakin's own hand/finger/wrist comps dropped, Elite's hand comps grafted in directly (already correctly textured,
no recolour needed). Renders: `02_progress_photos/05_structure_pass/B_foundry_warlord/` (front/tq/back - visibly bulkier,
better-detailed gauntlets with finger articulation, matching the Elite's look). Verified in motion:
`02_progress_photos/13_hand_graft/B_anim/sheet.png` (Run + AttackMelee01, holds with no detaching or stretching). GIF
rebuilt. Not yet tested in game.

## Round 7 (2026-11-02): face recolour - hair and eyes black, mask gunmetal grey (B only)

**Hair and mask were an easy UV-island recolour** (`08_scripts/21_recolour_face.py`, system Python + Pillow + numpy, same
dump-UV-triangles-then-rasterize-a-mask technique as `recolour_parts.py` in `dsw-part-kitbash`): hair = comps 0, 3, 4, 6, 7 of
`Feydakin` in the production donor file (the big hair mass plus four small strand/wisp pieces, all sitting at the top of the
head - comps 3/4/6/7 were left out of hair in earlier rounds and would have shown as a brown fringe if skipped here), half-mask
= comps 1, 2. Filled flat: hair to the house's established near-black `(20,19,18)` (B's own palette), mask to a new
`gunmetal grey (58,61,66)` - deliberately cooler/bluer than B's existing warm `iron (48,46,46)`, so "gunmetal" reads as
its own distinct tone rather than reusing an existing one.

**Eyes turned out not to be separate geometry at all** - they're painted detail sitting on the MASK's own UV island (the mask
geometry wraps the eye-socket rim). Found them by colour instead of component id: searched for blue-dominant pixels
(`b > r+10 and b > g+5`) within the union of every head component's UV footprint (so a stray blue pixel anywhere else in the
shared body texture atlas is never touched), found 28 pixels, confirmed by highlighting them in magenta on the original
texture and rendering (`02_progress_photos/14_face_recolour/eye_detection_debug.png`) - the mark lands exactly on the iris,
right under the eyebrow. Since the mesh evidently mirrors its UVs for symmetry, one texture-space location served both eyes.
Filled to `(12,12,12)`, applied last so it isn't overwritten by the mask's own grey fill where the two overlap.

**One real bug caught and fixed along the way:** the first pass left a thin dotted seam down the centre of the forehead and
nose - bilinear filtering at render time was sampling a one-pixel-wide unpainted strip right at the UV triangle boundary,
bleeding in the old colour. Fixed by dilating each fill mask 3 px past the exact UV edge (`ImageFilter.MaxFilter`) before
painting, a standard texture-atlas technique - confirmed gone by re-rendering
(before/after: `head_only_before.png` vs `head_only_check_final.png`).

**A separate, pre-existing issue, NOT introduced by this edit:** a thin orange spike below the chin, present in the
unedited original render too (`head_only_before.png`) - some sliver triangle on this cut, never-finished asset maps to a
stray bit of UV space. Left alone; out of scope for this request and not new.

**Scoped to B only.** A and C share the same Feydakin face via `FACE_GRAFT`; this recolour is `FACE_GRAFT_B`, a separate
dict carrying the new albedo, assigned only to B's entry in `VARIANTS` - A and C keep the original Feydakin colouring unless
asked. Verified in motion: `02_progress_photos/14_face_recolour/B_anim/sheet.png` (Run + AttackMelee01, texture-only change,
holds as expected). GIF rebuilt. Not yet tested in game.

## Round 8 (2026-11-02): two swords

**Yes, possible.** B now carries two Thorvald Katanas (the existing library weapon, `model_projects/weapons/thorvald_katana/`,
already used by the Trooper): one drawn in the right hand (`B_Weapon`, the standard mount), one worn at the hip
(`B_Scabbard`). Script: `08_scripts/22_mount_two_swords.py --variant B`, reading `03_blender/structure/B_foundry_warlord.blend`
and writing `03_blender/weapons/B_foundry_warlord_two_swords.blend` - a separate file layered on top of the structure build,
the same pattern `thorvald_elite` uses for its shield and glaive (mounted after the body).

**The dead ends, in order (worth recording - this took several wrong turns):**
1. **`B_Shield` doesn't track the hand.** The Elite's shield and glaive both mount via `bone_local` on `B_Shield`/`B_Weapon`
   successfully, so that looked like the obvious second-sword bone. Measured its pose position against the actual glove mesh
   at a mid-Run frame and found it over half a metre off - `B_Shield` is a real prop bone, but it isn't driven by the Run clip
   this project converts with (a shield resting broadly on the forearm tolerates that; a sword gripped in a fist does not).
2. **Bone-parenting to `B_lWristJ` directly** (the actual wrist joint) looked like the fix, but a skeletal joint bone isn't a
   dedicated prop-attachment point the way `B_Weapon`/`B_Shield`/`B_Scabbard` are, and the measured glove-centroid-to-bone-head
   gap was if anything larger. Dropped.
3. **Found `B_Scabbard`** by just listing every bone on the rig - a dedicated prop bone, parented to `B_ROOTJ`, confirmed
   moving sensibly frame-to-frame through the Run clip (unlike `B_Shield`). The right attachment point, but with no vanilla
   prefab reference to copy (real swords never go on a second bone in the vanilla game), its placement had no known-good
   starting transform the way the shield/glaive did.
4. **First rotation guesses looked plausible in isolation** (`02_progress_photos/15_two_swords/iteration/rotation_attempts_1.png`)
   but, combined with sword 1 in the full render, produced what looked like a single blade - confirmed by hiding sword 1 and
   rendering sword 2 alone (`iteration/dead_end_overlap_check.png`): both swords were real and distinctly positioned
   (different bboxes), just angled close enough to parallel that they visually merged from the test camera's angle, at every
   rotation tried.
5. **Fix: solved for the offset with vector math instead of guessing further.** Measured sword 1's actual world-space
   position at the test frame, chose a target point clearly away from it (left, back, down), and inverted the bone's own
   pose matrix to find the bone-local offset that lands the grip exactly there - confirmed first via a clean isolated render
   with every other mesh hidden (`iteration/isolated_final_check.png`), then in the full combined scene: the two blades now
   cross visibly in an X in front of the body.

**Verified in motion:** `02_progress_photos/15_two_swords/anim/sheet.png` (Run + AttackMelee01) - both swords stay correctly
attached and crossed through every frame, no detaching, no clipping through the body. Occluded from some single angles
(e.g. mostly hidden behind the raised forearm in the straight-on front view at this particular Run frame), same as any
single weapon can be at certain pose frames - not a defect specific to the second sword.

**Not done:** the katana's own black blade / pale hilt wrap already reads reasonably against B's gunmetal/copper palette
without any recolour, so none was applied; could be touched up (hilt wrap to B's copper) if wanted. The scabbard sword's
angle is "clearly a second sword, crossing the first" rather than a polished sheathed-at-the-hip presentation - good enough
to answer "is it possible", not a final pose. GIF: `02_progress_photos/10_poc_gifs/B_foundry_warlord_two_swords.gif`
(a separate file from the single-sword `B_foundry_warlord.gif`, which is untouched). Not yet tested in game.

## Round 9 (2026-11-02): does vanilla dual-wield, and should we copy it - answer: yes, and yes

Asked whether any vanilla unit uses two blades, and whether we need to copy its rigging/animation. Checked both ways:

**Cerberus (Harkonnen, model id `H_Soldier`/`H_Claws`) has baked-in claw blades, not two weapon props.** Converted and rendered
it (`vanilla_reference/cerberus_baked_claws.png`): the blades are sculpted directly into the hand mesh, one connected object,
skinned to the ordinary finger/wrist bones - no separate weapon, no extra bone, no special animation. Not directly useful for
"two swords" (the blades are part of the body), but confirms the engine has no issue with blade-shaped hands on the standard rig.

**Found the real answer by searching every prefab in the extracted game for ones mounting 2+ separate weapon props.**
Several vanilla units genuinely dual-wield real weapon objects - `Atreide_Sword_01`/`02` on **Duncan** (one of our own donors),
`SwordWhitmoreL`/`R` on **Whitmore** (our other donor), `Knive_L`/`R` on the Raider Elite, `DoubleKnife_01`/`02` on an Idualis
Trooper, `Atreide_Sword_01`/`02` + a shield on the Harkonnen House Guard, and `SardaukarSword`/`02` on the Sardaukar (not usable
as a donor per CLAUDE.md, but confirms the pattern again). Full prefab text saved:
`vanilla_reference/Duncan_prefab_reference.json`, `vanilla_reference/Whitmore_prefab_reference.json`.

**The short answer: no special rigging or animation is needed - but the BONE TARGET matters, and it is NOT what round 8 used.**
Both reference prefabs constrain the second weapon to a real skeletal bone in the LEFT arm chain, not a dedicated prop bone:
- Duncan: second sword constrained directly to `...B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ` (no further bone).
- Whitmore: second sword constrained one level deeper, to `...B_lWristJ.B_Shield`.

Two different vanilla patterns exist. Round 8 tried `B_Shield` first (by analogy with the Elite's own shield mount) and found
it didn't track the hand in our converted Run clip - at the time this looked like a dead end specific to our pipeline. With
these two real references in hand, that reads differently: `B_Shield` is probably fine on characters whose OWN clips carry
its keyframes (Whitmore's vanilla animation set would), but our donor-build pipeline puts every hero on the single generic
`Anim_Male01_Run.fbx` clip (`10_build_donor_blends.py`), which apparently doesn't carry `B_Shield` motion - while `B_lWristJ`
is a real joint every clip must animate to move the arm at all, confirmed by printing its pose position across five Run
frames (clear, consistent per-frame movement, unlike `B_Shield`'s near-static ~0.1 m drift).

**Rebuilt sword 2 on `B_lWristJ` directly (Duncan's pattern), genuinely dual-wielded - one sword per fist**, which is also a
better result on its own terms than round 8's hip-scabbard placement. Could not reuse Duncan's own offset numbers directly
(they're tuned to `Atreide_Sword_01`'s geometry, not our katana's), so solved for the grip position the same way as round 8:
measured sword 1's actual grip in world space at the test frame and mirrored it across the body's centreline for a natural
two-handed stance, then inverted the bone's pose matrix to get the `B_lWristJ`-local offset.

**Verified in motion:** `02_progress_photos/15_two_swords/anim2/sheet.png` (Run + AttackMelee01) - both blades now visible
in most frames (including a clean crossed-blades moment in the attack clip), hold correctly with no detaching. `22_mount_two_swords.py`
updated in place (`B_Scabbard` → `B_lWristJ` in `MOUNTS["B"]`); GIF rebuilt at the same path. Not yet tested in game.

## Round 10 (2026-11-02): legs - less Harkonnen, more Thorvald

Iakin's own legs (bulky, rounded armour plates) read as generic Harkonnen heavy infantry, not the house's sleeker look.
Replaced with `thorvald_elite`'s own leg/foot pieces - `MercenaryFill_legs` (sleek trousers, angular knee plates) and
`DuncanFill_feet` (slim boots) - two dedicated "Fill" objects already built and Thorvald-styled in the Elite's blend, the
same reuse-the-Elite's-own-parts pattern as round 6's hand graft. No axis mismatch (checked first, bboxes lined up closely
with Iakin's own hip/knee/ankle comps - same X-sideways convention). No recolour needed; the pieces are already dark enough
to match B's palette as-is.

**Hit the same stale-component-index bug as round 6's first attempt, caught before it broke anything this time.** Listed
Iakin's leg/foot component ids from the raw, untouched donor file, same as always - but `leg_graft` runs AFTER `hand_graft`
in the script, which has already deleted vertices and renumbered every component by the time `leg_graft` starts (confirmed
by an `IndexError` on the first run, not guessed). Fixed properly: `LEG_GRAFT` now selects what to drop by **live bone
weight** (`B_lHipJ`/`B_rHipJ`/`B_lKneeJ`/`B_rKneeJ`/`B_lAnkleJ`/`B_rAnkleJ`/`B_lBallJ`/`B_rBallJ`, `min_w=0.3`) instead of
hardcoded component ids - immune to this class of bug regardless of what ran earlier, since it queries the mesh's current
state directly rather than trusting a number from a different mesh state.

**Result:** `02_progress_photos/05_structure_pass/B_foundry_warlord/` (front/tq/back) - sleek trousers and boots, clean seam
at the waist under the apron (checked close-up, `B_leg_seam_check.png`), no gaps. Verified in motion:
`02_progress_photos/16_leg_graft/B_anim/sheet.png` (Run + AttackMelee01, holds with no detaching). Both GIFs rebuilt
(single-sword `B_foundry_warlord.gif` and `B_foundry_warlord_two_swords.gif`, since the two-swords build layers on top of
this same structure blend). Not yet tested in game.

## Round 11 (2026-11-03): the real dual-wield animation, found by comparing against S_Elite

User sent a vanilla marketing render of "Smugglers / Free Company - Attack Melee" (`house_thorvald/images/ref_smugglers_dualsword_attack.jpg`)
and asked whether we need to copy S_Elite's rigging/animation. Checked properly rather than assuming:

**S_Elite (Free Company) uses a dedicated animation set, not the generic one.** Its model row (`data.cdb`) has
`inherit: "MilitaryDualSwords"`, `rigName: 1` - a NAMED clip set separate from the generic `MilitaryCommon`/Duncan/Gurney
sets every other unit in this project has used so far. The `MilitaryDualSwords` row defines its own `Idle`, `Run`,
`AttackMelee`, `FightIdle`, `FightRun`, `FightHit` etc., each pointing at clips named `DualSwords_*`. Checked who else uses
it: **every genuine dual-wielder found in round 9's prefab search** - `S_Elite`, `F_Sneak` (Infiltrator), `N_Militia_Elite`,
`N_Raider_Elite`, `N_Raider_Leader`. Confirms this is THE vanilla pattern for dual blades, not a one-off.

**The clips are real files, same skeleton family, not a different rig despite "rigName: 1".** Found
`extr/Anim/Male01/DualSwords/Anim_Male01_DualSwords_{Idle,Run,AttackMelee01,AttackMelee02,FightIdle,FightRun,FightHit,IdleStance}.fbx`
(and a parallel `Female01/DualSwords/` set). Converted `DualSwords_Run` against Iakin (B's base body) with the same
`hmdanim2fbx.py` tool used throughout this project: **46 of 49 bone tracks matched.** The 3 that didn't - `B_Weapon_L`
(a dedicated off-hand prop bone our base Male01 skeleton doesn't carry) and both thumb-tip bones - are extras, not core
skeleton differences; the shoulder/elbow/wrist choreography that actually makes two blades read as a fight is on bones
our rig already has.

**Round 9's mount (B_lWristJ, static) was structurally correct but animated wrong.** It worked (both swords tracked, held
firmly, no detaching) but moved through the generic single-sword Run cycle, where only ONE hand's motion was ever designed
around holding a weapon - the second sword just rode along wherever that clip happened to put the off-hand. Tested the
real `DualSwords_Run`/`DualSwords_AttackMelee01`/`DualSwords_FightIdle` clips directly on B's already-built two-sword blend
(`anim_stress.py`, reused as-is - it already supports swapping in any clip): `02_progress_photos/17_dualswords_anim/test/sheet.png`.
Night and day difference - a proper crossed-blade guard stance and a real two-handed slash, matching the vanilla reference
image's own crossed-blade poses, instead of one sword looking incidental.

**Adopted it as B's standard two-sword animation.** Converted clip saved to
`05_fbx_export/anim/Iakin_DualSwords_{Run,AttackMelee01,FightIdle}.fbx` (Elite's own project already established this
`05_fbx_export/anim/` convention for storing converted clips). `22_mount_two_swords.py` now imports `DualSwords_Run`'s
action and assigns it to the rig as the LAST step (after both swords are mounted), replacing the generic single-sword Run
action the structure blend came with - the action data-block itself is simply swapped, no change to the sword mounts
(`B_Weapon`/`B_lWristJ` placements from round 9 stand). GIF rebuilt: `02_progress_photos/10_poc_gifs/B_foundry_warlord_two_swords.gif`
now loops the real `DualSwords_Run` cycle. The base single-sword `B_foundry_warlord.gif` is untouched (it doesn't need
this clip - one sword, one hand, the generic Run clip is already correct for it).

**Not done:** `DualSwords_AttackMelee01`/`FightIdle` were converted and tested but not wired into any build step or GIF -
only `Run` was adopted as the default. The sword 2 placement (`B_lWristJ` offset, round 9) was tuned against the OLD
generic Run clip's arm pose; under the new DualSwords clip it still holds correctly (confirmed in the stress render) but
hasn't been re-tuned specifically for it, so there may be a small amount of play left on the table. `B_Weapon_L` (the
bone our skeleton lacks) is presumably used by vanilla for a secondary offset refinement on the off-hand weapon; not
investigated further since the direct `B_lWristJ` mount already works. Not yet tested in game.

## Round 12 (2026-11-03): dual swords done the Free Company way, and a nudge toward the Oni Sentinel sheet

**What was still wrong after round 11.** The DualSwords clip was right, but sword 2 still hung off `B_lWristJ` with an
offset solved for one frame of the OLD generic Run clip - 0.72 m from the wrist - so on the new clips it floated loose
(behind the head, sideways out of an empty hand).

**How Free Company does it** (`Character/Smuggler/Unit/FreeCompany/Prefab_FreeCompany.prefab`): the same sword model twice,
`Atreide_Sword_01` on `...B_rWristJ.B_Weapon` and `Atreide_Sword_02` on `...B_lWristJ.B_Weapon_L`, with the identical local
offset (y -0.15, rotX -90; z 0.02 vs 0.05). `B_Weapon_L` is a dedicated off-hand prop bone, and every Male01 DualSwords clip
carries a track for it - constant per clip in Run/FightIdle/Idle, moving in the attacks (read straight from the clip HMDs with
`hmd_anim.py`). So the CLIP decides where the off-hand blade points, not a hand-tuned offset. The male dual-wielders
(Raider Elite) use `B_lPalmJ` instead, because **no Male01 body in the game has `B_Weapon_L`** (checked every HMD in `extr`:
only Female01 bodies carry it).

**Fix (`22_mount_two_swords.py`, rewritten):** adds `B_Weapon_L` to B's rig as a child of `B_lWristJ` and keys it every frame
from each clip's own `B_Weapon_L` track; sword 2 gets sword 1's exact bone-local placement on it, as in the prefab. The game's
local transforms map onto Blender pose space with just the x-mirror D = diag(-1,1,1) - verified, not assumed: the same mapping
reproduces the clip's own `B_Weapon` to 0.00000 (`32_dualswords_sheet.py` prints the check). The blend now carries three
actions: `DualSwords_Run` (active), `DualSwords_AttackMelee01`, `DualSwords_FightIdle`.

**Cross-check against vanilla's own sword:** mounted `Atreide_Sword_01` exactly per the prefab (`T(0,-0.15,0.02)·RotX(-90)`,
plus the sword HMD node's own +90 X rotation, which a first attempt forgot and got floating blades) next to our katanas: identical
angles, same hands (`02_progress_photos/18_dualswords_fix/vanilla_sword_test2/sheet.png`). Our katana mount from
`weapon.json` works out to `T(0,-0.164,0)` on `B_Weapon` - the same convention as vanilla's, 2 cm apart.

**Design nudge toward `house_thorvald/images/ref_oni_sentinel_sheet.jpg` (`23_arm_graft.py`).** Game parts only; the attached
Meshy "Bronze Oni Sentinel" mesh is one fused, unrigged, untextured 110k-vert object, kept as reference only
(`01_input/reference/`). The Elite's own `Gurney` body already has the sheet's layered copper-edged pauldrons and dark armoured
forearms, so:
- B's round Iakin pauldron shells are dropped and the Elite's pauldron plates + rivet rows grafted in (`--mode pauldrons`, N1);
- `--mode arms` (N2) also swaps Iakin's sleeves/elbow pads for the Elite's sleeves and forearm armour, and **removes the
  hand-built beige forearm bands from round 5** (they rendered pale beige, and they were primitives) - the Elite forearms join
  straight onto the Elite gloves B already has;
- `--pauldron-scale` flares the plates outward about each shoulder's inner top edge. Compared x1.0/1.2/1.35
  (`02_progress_photos/19_oni_nudge/compare_r2.png`, reference on top): **x1.2 (N3) picked** - closest to the sheet's flare
  without x1.35's blockiness.
Selection is by live dominant bone + side, never stale comp ids. Verified in motion with both swords:
`19_oni_nudge/two_swords_anim/sheet.png`. GIF: `10_poc_gifs/B_foundry_warlord_arms_x1.2_two_swords.gif`
(`22_mount_two_swords.py --nudge arms_x1.2`, then `TWO_SWORDS_STEM=B_foundry_warlord_arms_x1.2_two_swords` for scripts 31/32).
The old `B_foundry_warlord_two_swords.gif` is the un-nudged body with the fixed swords.

**Not done / open:**
- **In game:** our male HMD has no `B_Weapon_L`. Either add that bone to the exported skeleton (unskinned; toolkit support
  untested), or fall back to a static `B_lWristJ` mount using the Run clip's constant `B_Weapon_L` transform (exact for
  Run/FightIdle/Idle, slightly off in the attacks). The unit would also need `inherit: "MilitaryDualSwords"` on its model row.
- Not taken from the sheet yet: the horned visor helmet with respirator (no vanilla horn part found yet; it would also hide
  the Feydakin face chosen in round 4), copper trim on the knee/shin guards (Bannerjee's shins are the closest vanilla match),
  crossed scabbards on the back.
- The single-sword `B_foundry_warlord.gif` still shows the un-nudged body.

## Round 13 (2026-11-03): Karlin's own shoulders, made heroic; colour passes (brown eyes)

**Direction (user):** the shoulders must be DISTINCT - heroes don't share armour with their faction's soldiers, and round 12's
grafted Elite pauldrons made Karlin look like a Heavy Vanguard. Keep and mod Iakin's own shoulder; read "elite and unique",
drawn from the hero's personality. Round 12's `23_arm_graft.py` builds are left in place but superseded.

**`24_hero_shoulders.py` (on the structure blend; `--tag`, `--lames N`, `--emblem`, `--rim-frac`):**
- Iakin's round shell kept (dominant bone clavicle, |x| >= 0.2, live query).
- `--lames 2`: two stacked lames under each shell - copies of Iakin's OWN shell, each 8% smaller, 3 cm out and 6 cm down
  about the shell's inner top edge. Same UVs and weights as the shell, so they follow it (checked in Run/Attack/FightIdle:
  `02_progress_photos/20_shoulder_colour/S2/two_swords_anim/sheet.png`).
- `--emblem`: the chest's own gear-and-star (`Kit_emblem`, TrooperEmblem) laid on each shell (ray-cast, aligned to the
  surface, x1.6, weights copied from the nearest shell vertex). Karlin is the aura commander (`house_thorvald/heroes.md`:
  Rallying Presence, Warlord's Shout), so the shoulders carry rank insignia no rank-and-file unit has.
- Copper rim: the shell's lowest 25% height band painted copper (lames inherit it -> stepped copper edges, like the Oni sheet's
  layered lames). Two wrong tries, recorded in the script: open boundary edges (only the neck seam - broken strokes) and
  "far from the dome apex" (picked the neck/collar side).
- Bracers: the round-5 hand-built beige bands and Iakin's forearm replaced by the Elite's forearm armour only (centre |x| >= 0.5);
  upper arm and elbow ring stay Iakin's.
Variants: S1 rim + insignia, **S2 rim + insignia + 2 lames (picked)**, S3 lames without insignia
(`20_shoulder_colour/compare_variants.png`). Swords: `22_mount_two_swords.py --nudge hero_S2`;
GIF `10_poc_gifs/B_foundry_warlord_hero_S2_two_swords.gif`.

**Colour passes:**
- **Face was charcoal: a round-7 bug.** `21_recolour_face.py` listed comps 3 and 4 as hair wisps; overlaying every component's UVs
  on the source texture (`face_uv.json`) shows they are the face skin (mirrored halves, eye painted on). Hair is 0, 6, 7 only.
- **Eyes brown** (96,60,34), keeping the painted iris shading. Hair and mask fills also keep their source shading now
  (round 7's flat fills wiped the strands and mask panel lines).
- Skin: two passes - Feydakin's skin read glowing orange on B; now x(0.92,0.86,0.84) and 35% toward grey (weathered tan).
- Body (`24b_paint_body.py`): palette region 6 (Iakin's gold wear marks -> copper flecks that read as rust) cleared to iron with
  shading kept; copper only as the deliberate rim. Rim copper (178,104,52) with a tight shading range - brighter (196,122,62)
  and a taller band (0.4) rendered peach.
- Katana (B only, `25_recolour_katana.py`): the gold guard/pommel rendered pale beige; now copper. Library katana untouched.

**Open:** the skin may still want a touch darker for a veteran; the horned helmet, shin copper and back scabbards from the Oni
sheet are still not taken; in-game `B_Weapon_L` question from round 12 still stands. Not tested in game.

## Round 14 (2026-11-03): darker skin, matte black waist cloth, dark orange segments; motion de-janked

**Ask (user):** skin a shade darker; waist clothes and apron matte black with dark orange trim; some armour segments dark
orange; "a few passes to really smooth out the motion and make all parts of the animations not janky at all".

Build chain: `24_hero_shoulders.py --tag S2` -> **`27_motion_pass.py --src hero_S2 --tag M4`** -> **`26_colour_pass.py --src
hero_M4 --tag C1 --orange knees,chest`** -> `22_mount_two_swords.py --nudge hero_C1 --sword1-tilt=-6` -> `31_make_two_swords_gif.py`
(env `TWO_SWORDS_STEM`, `TWO_SWORDS_ACTION`, `GIF_FPS`). Final: `03_blender/weapons/B_foundry_warlord_hero_C1_two_swords.blend`.

**What the jank was (measured, not guessed):**
- The clip motion itself is vanilla: our imported keys equal `Anim_Male01_DualSwords_*` frame for frame and the loops close
  (Run root wraps by 0.9 cm). The attack's 4-frame lunge, 11-frame hold and snap back are authored that way.
- Our parts were the problem. New tools: `34_plate_rigidity.py` (per piece, per frame, RMS left after the best rigid fit = how
  much a plate bends like rubber), `33_sword_clearance.py` (blade samples inside the body, per clip; sweeps blade length and
  mount tilts), `inspect_motion_sheet.py` (every frame, each mesh in a flat colour, camera follows the root).
  Findings: shoulder shell pieces bent up to 9.9 cm and the lames 6 cm in the attack; chest/back plates 5-8 cm; the gorget
  7 cm (it followed the head); Iakin's own hands were still under the gauntlets (110 coincident verts - flicker); boot tops,
  bracers/gauntlet cuffs, lame tops/shell and the insignia sat within 6 mm of the next layer (z-fighting in motion); the right
  blade tip grazed the back shell in 13/30 Run frames. Rounds 9-13 GIFs also played the 30 fps clips at 15 fps (half speed).
- Wrong turn first: `33` initially sampled the katana's hilt (the blade runs along local -Y); fixed before any decision.

**`27_motion_pass.py` (weights + layers; four passes):**
- M1: shell + lames + insignia share one weight set per side; lames fan toward the upper arm. Shell still sheared 6 cm,
  lames worse (8.6): linear blend skinning of a clavicle+arm mix is not rigid when the arm swings 90+ degrees.
- M2: shared set = shell's two strongest non-arm bones (ClavicleJ 0.72 / SpineTopJ 0.28), no fan; gorget to SpineTop/Neck01.
  Shoulders and gorget left the worst list (sum 297 -> 203 cm), but chest plates pulled to their own means split their seams
  (dark cracks across the chest).
- M3: chest stiffening off (`--chest 0`); every seam (verts coinciding at rest across pieces, 431 groups) welded to one weight
  set, the rigid pauldron winning. Cracks gone.
- M4 (final): declutter - Iakin's hidden hands/wrists removed (392 verts), and `separate()` gives near layers a real gap:
  boot tops 5 mm behind the shin guards, bracers 5 mm over the gauntlet cuffs, lame tops 4 mm under the shell and each other,
  insignia 4 mm proud, apron 10 mm clear of the thighs. Remaining bend is cloth (trousers, apron) and fingers - by design.
- Sword 1 tilted -6 deg about its grip X (`--sword1-tilt`): 0 blade-in-body frames in Run, Attack and FightIdle, both swords.
  Constant, so it ships as the prefab offset. Blade length kept (shortening was tested; not needed once the axis bug was fixed).

**`26_colour_pass.py` (+ `26b_paint.py`):**
- Waist cloth = `Kit_apron` (sash + front/back panels): black (22,21,20) at half shading contrast, MetallicGlossAO metal 0 /
  gloss 25 (R metal, G gloss), preview roughness 0.9. Trim: dark orange band drawn along every open hem edge in UV, width from
  the measured texel density (2.5 cm on the cloth, 37 px on the 2048 sash texture).
- Dark orange (132,52,16) - (150,62,20) rendered too bright. Copper rim texels are kept, so the rims still read.
- Variants (`21_colour_motion/compare_variants.png`): **C1 knee cops + hex chest plate (picked: the two segments that read at RTS
  zoom from the front, framing the black apron)**, C2 middle lame + bracers (lame hides behind the copper rims; bracers go salmon
  on the pale Gurney texture), C3 knees + middle lame.
- Skin: `21_recolour_face.py` SKIN_TONE (0.80,0.74,0.71), a shade darker than round 13.

**Outputs:** GIFs at 30 fps `10_poc_gifs/B_foundry_warlord_hero_C1_two_swords_{Run,AttackMelee01,FightIdle}.gif`;
`21_colour_motion/motion_before_after.png` (flat-colour frames before/after); `21_colour_motion/C1/` stills.

**Open:** small boot-top traces remain behind the knees in the run; the material-per-part textures (apron, knees, body copy)
must be carried into the export; in-game `B_Weapon_L` question still stands. Not tested in game.

## data.cdb (2026-11-03): Karlin's hero entry, ready for packaging after the export

`08_scripts/40_cdb_karlin.py` (`--dry-run`, `--revert`; before-copy `07_data_cdb/data_BEFORE_karlin_hero.cdb`). User's choices:
melee, Iakin's voice, text rewritten.
- `character.Karlin`: lastname Mallenor -> Thorvald, new desc. `unit.TH_Hero_1`: name Karlin Thorvald + description;
  combo Generic_Ranged -> Generic_Flanker_Melee (Free Company's), pistol `stats.range` 35 dropped; voices and
  move/melee/ability sounds -> Iakin's (H_Hero_2). Health/power/armor and the ability FX untouched.
- `model.Th_Hero_2` (the row TH_Hero_1 uses): mesh -> `CharMOD/Male01_ThorvaldKarlin/Prefab_ThorvaldKarlin.prefab`, rigName 1 -> 0
  (Male01), inherit -> new anim-set row `ThorvaldKarlin` (after MilitaryDualSwords): the DualSwords clips (IdleVariant ->
  DualSwords_IdleStance, Male01 has no DualSwords_IdleVariant) + Skill = Nefud_Skill.
- Validate: 1 NEW problem, the expected missing prefab. Preflight: 0 fail (7 old warnings).
**Before the pak:** export B_foundry_warlord_hero_C1 to that prefab (HMD with a `B_Weapon_L` bone or the B_lWristJ fallback;
prefab mounts the katana on B_Weapon with the -6 deg tilt and on B_Weapon_L untilted; per-part textures carried over).

## Game package (2026-11-03): Male01_ThorvaldKarlin staged in the editor res tree (not packed, not installed)

1. `08_scripts/50_assemble_export.py` (Blender) on `03_blender/weapons/B_foundry_warlord_hero_C1_two_swords.blend`: katanas baked
   into the mesh (right 100 % B_Weapon with the -6 deg tilt, left 100 % B_Weapon_L), materials deduped by texture content to
   8 (`Mat_Body, Trim, Duncan, Gurney, Apron, Face, Mercenary, Katana`), unused slots dropped, <= 3 weights, one mesh
   (7,228 verts / 10,429 faces), FBX `06_game_ready/Male01_ThorvaldKarlin.fbx`, textures `06_game_ready/src/` + `materials.json`.
   Katana MetallicGlossAO (metal 0.45, gloss 0.65) and flat normal generated (it only had an albedo).
2. `08_scripts/51_make_game_package.py` (the Elite's 14_ script + `--materials-json`, `--anim-paths`), run with
   `MSYS_NO_PATHCONV=1`: 1024 px RGBA textures `ThKar*`, HMD, `Prefab_ThorvaldKarlin.prefab` (Mercenary template: body +
   shadow decal), materials.props, props.json animPaths `/Anim/Male01`, `/Anim/Male01/DualSwords`, `/Anim/Male01/Nefud`.
   -> `C:\dsw_mod\D4XEditor\res\res\CharMOD\Male01_ThorvaldKarlin` (copy in `06_game_ready/Male01_ThorvaldKarlin`). check_hmd: OK,
   54 joints (Male01 46 + B_Weapon_L + Iakin's 7 whip bones).
3. Proof: `52_roundtrip_render.py` - the converted HMD played with the game's Male01 DualSwords Run / AttackMelee01 / FightIdle
   clips: both swords stay in hand (B_Weapon_L takes the clip track), textures right
   (`02_progress_photos/22_game_package/roundtrip_sheet.png`). Found and fixed a toolkit reader bug on the way (modeling.md 18).
4. `cdb_validate`: 0 NEW problems; engine preflight 0 fail.

**To ship:** `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch` (packs every staged change, including this).
Then in game: Karlin's look, the second sword, Nefud_Skill on the ability, and that `game.log` has `Modified data.cdb`.

## Round 15 (2026-11-05): helmet with antennae (user reference: closed gunmetal helmet, copper seams, face window, mask, two antennae)

- `08_scripts/60_helmet_survey.py` (`--prep`, render, `--assemble`): every headgear unit, no Sardaukar (22), head-bone parts only,
  front/side/back -> `02_progress_photos/30_helmet/survey/helmet_survey_sheet.png`. `61_helmet_parts.py`: per-part galleries
  (`30_helmet/parts/`), ids used by `--drop`.
- `08_scripts/62_helmet_build.py --donor X --drop ids --tag T` on `B_hero_C1.blend`: Karlin's hair removed (face skin and breathing
  mask kept); donor helmet moved head bone to head bone, fitted by a scale/offset search, 100 % B_HeadJ; painted gunmetal with
  copper lines on every panel edge (26b_paint.py), donor MGA/normal; antennae = the library katana blade cut at the guard,
  sliced into 18 stations, swept along a Bezier per side (forehead centre -> crown width -> +0.38 m, 1.5x helmet half-width
  splay), broad face to the front, width tapered 3.4 cm -> point, katana material (merges with the swords at export).
  Wrong turns on the antennae, fixed in the script: deleting hilt verts took the blade's long faces (0.19 m left); blade width
  axis is local z, not x (edge showed to the front); the katana's 3.5 cm curve was read as width (wide square "rabbit ears").
- Variants (`30_helmet/compare_helmets.png`): **H1 Warden minus face plate and chin (picked: rounded shell, face window with
  the eyes, closest to the reference)**, H2 Imperial Trooper (covers the whole face), H3 FlameThrower minus visor/mask (too open).
- H1 + swords: `22_mount_two_swords.py --nudge hero_H1 --sword1-tilt=-6`; 33_sword_clearance: 0 blade-in-body frames in all clips;
  GIFs `10_poc_gifs/B_foundry_warlord_hero_H1_two_swords_{Run,AttackMelee01}.gif`, sheet `30_helmet/H1_attack_sheet.png`.
- Fit note: Warden's search ended at its 1.33 cap with 20 skull verts within 4 mm / outside (renders show no poke-through;
  check in polish). Not exported: 50_assemble_export.py still defaults to C1 (`--src B_foundry_warlord_hero_H1_two_swords` to switch).
**Polish candidates:** a copper groove along each antenna; a small forehead crest/socket where they meet; antenna splay/height;
helmet copper line weight; RTS-zoom check.
- **H2 version (2026-11-05, user asked to try it):** `22_mount_two_swords.py --nudge hero_H2 --sword1-tilt=-6` ->
  `03_blender/weapons/B_foundry_warlord_hero_H2_two_swords.blend`; 33_sword_clearance 0 frames in all clips. Showcase
  `showcase/Karlin_H2_{Run,Attack,FightIdle}.gif` (`70_showcase_gifs.py -- --stem ..._H2_two_swords --name Karlin_H2`);
  H1 showcase stays as `showcase/Karlin_*.gif`. Close-ups `30_helmet/H1_vs_H2_close.png`. The H2 shell closes over the
  eyes (only the mask shows below it).
- **H2 front flattened (2026-11-05; user: the front coned out and with the antennae read as a bug).** `62_helmet_build.py`
  options: `--flatten F` (anything ahead of a plane 2 cm in front of Karlin's face pulled back with d' = F tanh(d/F); the
  cone stood 6.1 cm ahead), `--flat-front W` (front-facing surface within half-width W pulled forward onto that plane,
  weight 1 - (|x|/W)^4 for round corners - the front was a wedge, centre 4.7 cm ahead of the surface 4 cm to the side, so
  clamping the tip alone kept a prow), `--no-front-seam` (no copper line down the front centre). Variants in
  `30_helmet/H2_flatten_compare.png`: H2f1 tip only, H2f3 W 7 cm, **H2f4 W 9 cm (picked)**.
  Build: `--donor ImpTrooper --drop 2,3 --tag H2f4 --flatten 0.01 --flat-front 0.09 --no-front-seam`; swords
  `--nudge hero_H2f4 --sword1-tilt=-6`, 0 blade-in-body frames; showcase `showcase/Karlin_H2flat_{Run,Attack,FightIdle}.gif`.
