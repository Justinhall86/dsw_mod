# Landsraad Guard (vanilla) - preview blends

The vanilla Landsraad Guard from `model_inputs/Common/Landsraad`: one body
(`Male01_LandsraadGuard.hmd`, 4,112 verts / 6,172 tris, 46 bones, 35 skin clusters) in three
weapon variants. Each has its own prefab, hand bone and animation set.

| Variant | Prefab | Weapon (prefab transform) | Bone | Idle clip used | .blend |
|---|---|---|---|---|---|
| Halberd | `Prefab_LandsraadGuard.prefab` | `Landsraad_Halberd` y -0.2, rotX -90 | `B_Weapon` | `LandsraadGuard/..._FightIdle` (40 f) | [landsraad_guard_halberd_preview.blend](03_blender/landsraad_guard_halberd_preview.blend) |
| Rifle | `Prefab_LandsraadGuard_Gun.prefab` | `Gun_Landsraad` rotX -90 | `B_Gun` | `LandsraadGuard_Gun/..._FightIdle` (61 f) | [landsraad_guard_gun_preview.blend](03_blender/landsraad_guard_gun_preview.blend) |
| Bazooka | `Prefab_LandsraadGuard_Bazooka.prefab` | `Bazooka` (Fremen) rotX -90 | `B_Gun` | `LandsraadGuard_Bazooka/..._FightIdle` (70 f) | [landsraad_guard_bazooka_preview.blend](03_blender/landsraad_guard_bazooka_preview.blend) |

Each .blend is self-contained (all maps packed): shipped albedo / metallic-gloss-AO / normal on the body and
weapon, the weapon parented to the hand bone so it follows the animation, a sun + two area lights, and four
orthographic cameras (front / three-quarter / side / back; the rig faces world -X). Renders:
[02_progress_photos/03_final/](02_progress_photos/03_final/), overview
[contact_sheet_all_variants.png](02_progress_photos/03_final/contact_sheet_all_variants.png).

## Rebuild
```
python 08_scripts/01_prep_preview_assets.py                       # DDS-as-.png -> real PNG (04_textures), HMD -> FBX (05_fbx_export/preview)
blender -b --python 08_scripts/02_make_preview_blends.py          # builds + renders all three  (append "-- gun" for one)
blender -b --python 08_scripts/03_verify_preview_blends.py        # packed maps, weapon-follows-hand check
```

## Findings
- **Weapon placement:** the imported weapon object already carries its HMD model-node transform (rotX +90 on the
  gun/bazooka, a rotation plus an offset on the halberd). The prefab transform goes on top, in the bone's frame:
  `basis = prefab @ imported_basis`, with `matrix_parent_inverse = T(0, -bone_length, 0)` (bone parenting lands on the
  tail). Inverting the whole bone matrix instead freezes the weapon at its start position; replacing the imported
  rotation drops the weapon at the feet. No handedness (D) conjugation was needed. Verified: hand-to-weapon distance is
  constant over every frame of every clip, and the three poses read correctly in the renders.
- The vanilla body has a small dark patch on the robe hem (back, right); it is in the source mesh/texture, not the build.
- The Gun's MGAO map is `Landsraad_gun_MetallicGlossAOEmiss` (emissive packed into it); it is wired to Specular only, as
  for the body, so the gun's cyan glow shows from albedo only. The body has no emissive map.
- Bazooka textures come from `Character/Fremen/Weapon/Bazooka` (copied to `01_input/Weapon_Bazooka`), the halberd from
  `Character/Common/Weapon/Landsraad_halberd` (`01_input/Weapon_Halberd`).
- Related: the Landsraad Elite project (`../landsraad_elite`) reuses this body with a custom helmet and pauldrons.
