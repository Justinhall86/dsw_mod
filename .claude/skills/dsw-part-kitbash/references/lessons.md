# Lessons learned (Landsraad Elite, 2026-10-23)

## Design / taste (what the user accepted and rejected)
- **Keep the target faction's silhouette.** The Sardaukar pauldron is huge and stands up by design; scaled and
  tucked it still "stuck out awkwardly" and read as Imperial, not Landsraad. Rejected despite good colours.
- **Modest pads win over showy ones.** Gurney's low pads (with green -> gold) were the favourite; HouseGuard pads
  were fine but the studs looked "silly" (they are separate components - easy to drop).
- **The collar was the keeper.** A stand-up collar/gorget around the helmet base hides the neck junction and adds
  bulk without touching the helmet. The Sardaukar collar (its comps 18/19, x1.12) fit the Landsraad helmet.
- **Hand-built must look modelled.** Enlarging/tilting/stacking copies of the unit's own pads looked "derpy, like the
  shoulder armour added over and over". One newly modelled shell with a gold rim and ridge read as real armour.
- **Elite = bulk + better armour.** Thicker armour shells (inflate 1.2-2 cm), bigger shoulders, a collar. Heroes,
  Warden and Free Company look heavier mainly through shoulders and chest mass.

## Geometry / anatomy
- **Look before you cut.** On the Landsraad Guard the flared "neck piece" (comps 17/18) is the lower back shell of
  the helmet: clipping it alone left the helmet floating over a hollow neck. Clip it ONLY together with a
  replacement collar (cut below z 1.70 + collar).
- **How other units do it:** the HouseGuard's pauldrons ride high against a stand-up collar, so no neck-to-shoulder
  junction is visible. Study a donor's full shoulder close-up (front/3-4/side/back) when a junction looks wrong.
- **One-sided parts:** mirror = x flip + reverse faces + swap B_l*/B_r* vertex groups. Works because the skeleton is
  symmetric.
- **Nudge in rest pose, before mirroring.** Scale about a pivot near the part's inner edge so it grows outward.
- **Inflate the centre seam carefully:** chest halves split along x=0 (white line) unless seam vertices only move in
  y/z (`dsw_parts.inflate` does this).

## Weights / animation
- **The T-pose lies.** Full-size Sardaukar pads looked fine in rest pose and stood up like ears in the idle pose.
  Always render `--mode posed` and run `anim_stress.py`.
- **Shoulder-weighted pads wing out** on raised arms (rifle/bazooka idles). Parts weighted to the clavicle
  (grafted pauldrons, `build_shell` top = 100% clavicle, rim 60/40) stay put.
- Any Male01 clip's action drives any Male01 variant (bone names match); toolkit warns about missing whip bones -
  harmless.

## Texture / colour
- Recolour only the part's UV islands (`recolour_parts.py`); target hue/sat from the reference unit's islands, keep
  each pixel's value; add `--lift` ~0.06-0.09 (recoloured parts read darker than the reference once lit).
- Classify accents by hue band at ANY brightness (green 0.20-0.55); a brightness threshold left dark speckles.
- Measure the reference on matching material only (hood/armour islands), not on a mix with dark chest parts.
- Modelled parts: map UVs onto flat, uniform spots of the unit's own texture (`pick_uv_patches.py`) - exact colour
  match, but plain; add painted detail if wanted.

## Blender / tooling gotchas
- Relative render paths are resolved against the DRIVE ROOT (renders landed in `C:\model_projects\...`). The
  scripts make output paths absolute - keep doing that in any new script.
- `bpy.data.objects.remove` while iterating `bpy.data.objects` -> ReferenceError; collect first.
- bmesh: after `bmesh.ops.duplicate` the index table is stale - grab all vertex lists before duplicating.
- FBX importer leaves 0-user unpacked image stubs; `dsw_parts.purge_orphans()` before saving.
- Rest pose faces world -Y; an animated import (hmdanim2fbx) faces world -X - pick cameras per mode.
- `bpy.data.libraries.load(link=False)` appends a donor object with its materials and packed images; the donor's
  armature is not needed (re-point the modifier).
- Bash heredocs strip backslashes from Windows paths; write scripts with the Write tool.

## Weapon placement in previews (for the base .blend)
- Bone-parented child sits on the bone TAIL: use `matrix_parent_inverse = T(0, -bone_length, 0)`.
- The imported weapon object carries its HMD model-node transform; apply the prefab transform on top:
  `basis = prefab @ imported_basis`. No handedness conjugation.

## Lessons from Mercenary V5e (removal kitbash, 2026-10-23)
- **anim_stress.py was silently testing the REST POSE in Blender 5**: layered actions need
  `rig.animation_data.action_slot = action.slots[0]` (now fixed in the script). Any stress sheet where every frame
  looks identical is this bug.
- Removing a chest plate can remove the torso surface itself - always render a flat-colour-per-object pass and a
  back-face-culled pass; the game culls back faces, Blender's render does not.
- Fill poke-through: push fill verts under the base surface along rays from the spine axis (BVH), then give the
  fill the UNCUT base's weights (Data Transfer) - geometry that matches at rest still tears if it is weighted differently.
- Do not strip arm weights from a torso fill: it then stops following the mantle and pokes through it.
- Donor heads: a "neck ring" island can be the nape cover and a flare at once - pick neck islands by measured bbox,
  never by guess; plane-bisect collars instead of deleting faces (no sawtooth/slivers).
