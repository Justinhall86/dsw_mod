# Model Projects

Working files and references for custom or modified Dune: Spice Wars models. See
[modeling.md](../modeling.md) for the model conversion and in-game workflow.

## Shared weapons library

### [Weapons](weapons/)

Every custom weapon, shared by all model projects: mesh source, textures, `weapon.json` (mount + who uses it), preview, and
`scripts/mount_weapon.py` to put any of them on any unit. Currently the Thorvald Katana (House Thorvald Trooper), the Thorvald Sniper (House Thorvald Ranged), the Thorvald Bazooka (House Thorvald Demolition) and the Ginaz TallSword
(House Ginaz Swordmaster / Master, Captain).

## Projects

### [Atreides Test Roster](atreides_test_roster/)

**All eight custom units in one playable faction**, for side-by-side testing. Four take over vanilla
Atreides slots (`A_Trooper`→Thorvald Trooper, `A_Soldier`→Thorvald Ranged on the Smuggler sniper
profile, `A_Demo`→Thorvald Demolition, `A_Elite`→Thorvald Elite); four are new Atreides rows
(Ginaz Captain / Neophyte / Master, Landsraad Elite) on the Common wheel. All free, instant, with no
prerequisites, and one of each spawns at Arrakeen. See its [SPEC](atreides_test_roster/SPEC.md) —
it also documents two traps worth knowing (the `props.json` animPaths inheritance and the missing
weapon normal maps).

### [House Thorvald Trooper](thorvald_trooper/)

Kitbash (Gurney upper body, Duncan legs and sash, Commando head and face wrap, kasa hat) in the House Thorvald colours, with the library
katana. Current: `03_blender/Thorvald_Trooper_v13.blend`. See its [project notes](thorvald_trooper/SPEC.md).

### [House Thorvald Demolition](thorvald_demolition/)

The Trooper with black sleeves, a rust wrap on the right bicep, box pouches on the front and back of the belt, rocket canisters,
copper-rimmed pauldrons, armoured shins and the library bazooka, tested in the game's Landsraad bazooka animation set. Current: `03_blender/Thorvald_Demolition_v2.blend`. See its [project notes](thorvald_demolition/SPEC.md).

### [House Thorvald Elite](thorvald_elite/)

The Demolition body with tiered, copper-rimmed pauldrons (three lames per shoulder), armoured shins, back pouches, the library tower shield
(hand-modelled, no energy) and glaive, tested in Gurney's javelin-and-shield animation set. Current: `03_blender/Thorvald_Elite_v1.blend`. See its [project notes](thorvald_elite/SPEC.md).

### [House Thorvald Ranged](thorvald_ranged/)

The Trooper without pauldrons or elbow plates: black sleeves, rust-ochre chest plate, a rust wrap on the right bicep and the library sniper
rifle, slim legs and light boots, pouches on the back of the belt; tested in the game's Sniper animation set. Current: `03_blender/Thorvald_Ranged_v2.blend`. See its [project notes](thorvald_ranged/SPEC.md).

### [Commando — No Backpack](commando_no_backpack/)

The Commando with its backpack (pack body, shoulder straps and buckles) removed,
in the original colours and in the House Ginaz palette. The pack is three sets of
separate connected components, so removing it leaves no hole in the torso.

**Open the finished product:**
- [commando_nopack_house.blend](commando_no_backpack/03_blender/commando_nopack_house.blend)
  — House Ginaz colours, backpack gone, Maula rifle in the right hand
- [commando_nopack_plain.blend](commando_no_backpack/03_blender/commando_nopack_plain.blend)
  — the same, in the original colours

Showcase renders of both: [10_showcase/](commando_no_backpack/02_progress_photos/10_showcase/).
See its [project notes](commando_no_backpack/SPEC.md).

### [Commando — House Ginaz](commando_house/)

The Commando body (the vanilla House Legionary) repainted in the House Ginaz colour
design: deep plum coat with gold trim. The recolour replaces hue and saturation and
keeps the base texture's value, so all the painted shading survives. See its
[project notes](commando_house/SPEC.md) for the palette, the method and the scripts.

### [Landsraad Guard (vanilla)](landsraad_guard/)

The vanilla Landsraad Guard in its three weapon variants, each as a self-contained, animated preview .blend with
the unit holding its weapon: [halberd](landsraad_guard/03_blender/landsraad_guard_halberd_preview.blend),
[rifle](landsraad_guard/03_blender/landsraad_guard_gun_preview.blend),
[bazooka](landsraad_guard/03_blender/landsraad_guard_bazooka_preview.blend). See its
[notes](landsraad_guard/index.md) and [renders](landsraad_guard/02_progress_photos/03_final/).

### [Landsraad Elite](landsraad_elite/)

**v5 kitbash (current direction):** vanilla guard + recoloured Sardaukar pauldrons, helmet untouched. Animated previews with weapon: [halberd](landsraad_elite/03_blender/landsraad_elite_v5_halberd_preview.blend), [rifle](landsraad_elite/03_blender/landsraad_elite_v5_gun_preview.blend), [bazooka](landsraad_elite/03_blender/landsraad_elite_v5_bazooka_preview.blend); renders in [13_graft_variants](landsraad_elite/02_progress_photos/13_graft_variants/).

Structured model project for the Landsraad Elite and related guard variants. Its
[project notes](landsraad_elite/SPEC.md) describe the asset layout, model variants,
implementation details, and remaining in-game checks.

### [Ginaz Swordmaster — Purple](ginaz_swordmaster_purple/)

Reference image for the purple Ginaz Swordmaster concept:
[ginaz_swordmaster_purple.jpg](ginaz_swordmaster_purple/ginaz_swordmaster_purple.jpg).

### [Duncan Modified](duncan_modified/)

Duncan Idaho with the scarf and cape removed (mesh edit on the original skeleton).
Deliverable: [duncan_modified.fbx](duncan_modified/duncan_modified.fbx); see its
[project notes](duncan_modified/index.md) for what was deleted and the validation.

### [Gabarit test meshes](gabarit_test01/)

Static placeholder meshes extracted from the root of the game assets. Each has a textured
Blender project, FBX export, and render; Test 03 preserves all three mesh components.
See the notes for [Test 01](gabarit_test01/SPEC.md),
[Test 02](gabarit_test02/SPEC.md), and [Test 03](gabarit_test03/SPEC.md).

### [Thorvald Fighter (Renegade kitbash)](thorvald_fighter/)

The vanilla Renegade frigate rebuilt for House Thorvald: copper accents (hue replacement that keeps the
painted value) and the ventral keel fin removed. Added elements must be grafted from other existing game
models (a hand-modelled set of top components was tried and rejected on those grounds).
Current: `03_blender/Thorvald_Renegade_v3.blend`.
See its [project notes](thorvald_fighter/SPEC.md) and the [renders](thorvald_fighter/02_progress_photos/).

> Naming note: this folder is the **Renegade Frigate** project, not the fighter described
> below. Renaming it to `thorvald_renegade_frigate/` is an outstanding cleanup.

### [Thorvald Interceptor](thorvald_interceptor/)

A **new** fighter-class vehicle kitbashed from vanilla donors to match a Shiro concept
sheet: long charcoal slab hull with two copper **banded turbine drums** on outriggers.
The drums are cut from the **Smuggler frigate** (Wraith) corner thruster.

Four variants build and render (`interceptor_A_reference`, `B_kraken`, `C_quad`,
`D_frigate`). Not yet exported or in the game.

- **Start here: [HANDOFF.md](thorvald_interceptor/HANDOFF.md)** — full technical notes,
  the nine traps that each cost a failed build, donor measurements, next steps.
- Build spec: [variants.json](thorvald_interceptor/01_input/variants.json)
- Builder: [10_build_variant.py](thorvald_interceptor/08_scripts/10_build_variant.py)
- Renders: [02_progress_photos/](thorvald_interceptor/02_progress_photos/)
