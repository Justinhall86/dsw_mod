# Model Projects

Working files and references for custom or modified Dune: Spice Wars models. See
[modeling.md](../modeling.md) for the model conversion and in-game workflow.

## Projects

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
