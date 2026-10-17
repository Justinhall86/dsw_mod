# Spec: Duncan Head Swap

**Status:** Blocked. The source models aren't in the repo yet (see [Inputs needed](#inputs-needed)).
**Owner:** Justin
**Last updated:** 2026-10-17

---

## 1. What you asked for

Take the head from a second character model and put it on Duncan Idaho's body. Any colour on
the new head (for example a helmet, hood or headband) gets recoloured green to match Duncan's
outfit. In game, the unit should read as Duncan's body and outfit with someone else's head.

The donor ("other") model is **not** the Landsraad model. If the repo ends up holding exactly
one model besides Duncan and the Landsraad one, use that model and don't ask. If there are two
or more candidates, stop and ask which one to use.

---

## 2. Where things stand

I checked on 2026-10-17. At `f94d6ae` there are **no model files in the repo**:

- `main` and the working branch both stop at `f94d6ae`. Nothing has been pushed since.
- No `.fbx`, `.glb`, `.gltf`, `.obj`, `.hmd` or `.prefab` files are tracked anywhere.
- `res/res.compressed1.pak` contains a single file, `data.cdb`.
- Every "Duncan" in `res/data.cdb` is a vanilla entry pointing at the game's own asset path.
  That's a path into the installed game. The mesh itself isn't in the repo.

Nothing can start until the models are pushed.

---

## 3. Why this is a 3D job, not a data job

As `docs/howto_visual_kitbashing.md` explains, Spice Wars bakes heads, helmets and weapons into
one skinned mesh per unit. `data.cdb` has no head slot, attachment point or "head prefab"
field. So the swap has to happen in the model file itself:

1. Cut the head geometry off the donor mesh.
2. Remove Duncan's head geometry.
3. Join the donor head onto Duncan's neck and skin it to Duncan's skeleton.
4. Recolour the head's coloured parts green.
5. Export a new model and point the game at it.

`data.cdb` only changes in the last step, where Duncan's model entry gets a new path.

---

## 4. Current Duncan setup (from `res/data.cdb`)

| What | Value |
|---|---|
| Unit row (`unit` sheet) | `A_Hero_1`, faction `Atreides`, `props.character: "Duncan"` |
| Model row (`model` sheet) | `A_Hero_1` |
| Mesh path | `Character/Atreide/Unit/Duncan/Prefab_AtreidesDuncan.prefab` |
| Animation set | `inherit: "Duncan"` (anims `Duncan_Run`, `Duncan_AttackMelee`, `Duncan_AttackRange`, `Duncan_Skill`, …) |
| Rig | `rigName: 0` (standard humanoid) |
| Scale | `1.4` |
| Dynamic objects | `Gun` |
| Atreides faction colour | `2519884` = **`#26734C`** (a dark green) |

The Atreides faction colour is the most likely match for "Duncan's green". The final value
should still be sampled from Duncan's actual outfit texture, because the shader can shift it
(see §6.4).

---

## 5. Inputs needed

| # | Input | Required? | Notes |
|---|---|---|---|
| 1 | **Duncan model** pushed to the repo | Yes | FBX preferred, glTF/GLB fine. Must include the armature/skeleton and skin weights. |
| 2 | **Donor model** pushed to the repo | Yes | Same format rules. A skeleton helps but isn't required, since only the head is used. |
| 3 | **Textures for both models** | Yes | Diffuse/albedo at minimum, plus any colour-mask or normal maps that come with them. Without Duncan's texture the green can't be matched exactly. |
| 4 | Which donor, if there's more than one candidate | Only if ambiguous | The Landsraad model is never the donor. |
| 5 | Exact green hex, if you have one | Optional | Otherwise it's sampled from Duncan's outfit texture. |
| 6 | Where the files sit in the game's asset tree | Optional | Helps decide the output path. Otherwise the default in §7 applies. |

Put the models under `res/` so the pak builder packs them, e.g. `res/Character/Atreide/Unit/Duncan/`
for Duncan and a matching folder for the donor. Keep them in Git LFS if they're large.

---

## 6. What has to happen

### 6.1 Intake and check
- Confirm both models import cleanly (no missing textures, sensible scale, one armature on Duncan).
- Find the donor: every model in the repo that isn't Duncan and isn't the Landsraad model.
  Exactly one means use it. Two or more means stop and ask.
- Record polycount, bone list, material slots and texture files for both models in this doc.

### 6.2 Separate the heads
- On Duncan: find the head/neck boundary, usually just above the collar, and delete the head
  geometry. Keep the collar and any outfit pieces that cover the neck so the seam stays hidden.
- On the donor: select the head (face, hair, plus helmet/hood/headgear if it has any) down to
  the same neck line. Duplicate it into its own object.

### 6.3 Fit the donor head to Duncan
- Move, rotate and scale the donor head so it sits on Duncan's neck at Duncan's proportions.
  Head size should look right next to his shoulders at the in-game scale of `1.4`.
- Weld or blend the neck seam so there's no visible gap or overlap from the RTS camera angle.
- **Skinning:** bind the head to Duncan's armature. Weight it fully to Duncan's head bone, with
  a short gradient into the neck bone at the seam so turns don't tear the mesh. Leave Duncan's
  skeleton exactly as it is (same bone names, hierarchy and rest pose), otherwise the existing
  `Duncan_*` animations break.
- If the donor head has its own face/jaw bones, drop them and rigid-bind those verts to the head bone.

### 6.4 Recolour to Duncan's green
- **What gets recoloured:** the coloured, non-skin parts of the donor head, such as a helmet,
  hood, headband or cloth. Skin, eyes, teeth and hair stay as they are unless they're the
  thing carrying the donor's colour.
- **Target colour:** sample Duncan's outfit green from his diffuse texture (main tunic/jacket
  area, avoiding shadows and highlights). Cross-check it against `#26734C`. If they disagree,
  the texture sample wins, since that's what's visibly on the model.
- **Method:** hue/saturation shift the relevant texture region, or re-tint a copy of the
  texture, so shading and detail survive. Don't flat-fill. Value and saturation should land
  close enough to Duncan's outfit that the two read as one costume in game.
- **Faction shader check:** if Duncan's outfit green comes from the faction colour mask rather
  than the texture, the head's coloured parts should go through the same mask channel instead.
  That way they pick up the same green in game and follow the faction colour if it ever changes.
  Find out which one applies during intake (§6.1).
- The head gets its own copy of any texture it uses, so the donor model stays untouched.

### 6.5 Export
- Export the combined mesh plus Duncan's armature as FBX, keeping Duncan's bone names and axis
  conventions so the game's animations still line up.
- Output (default, leaves vanilla untouched):
  - `res/Character/Atreide/Unit/Duncan/Male01_AtreidesDuncan_HeadSwap.fbx`
  - recoloured texture(s) next to it with a `_HeadSwap` suffix
  - `res/Character/Atreide/Unit/Duncan/Prefab_AtreidesDuncan_HeadSwap.prefab`, a copy of the
    vanilla Duncan prefab with its model reference pointed at the new FBX

### 6.6 Hook it up in `data.cdb`
- In the `model` sheet, row `A_Hero_1`: change the mesh path to the new `_HeadSwap.prefab`.
  Leave `inherit`, `rigName`, `scale` and `props` alone.
- No changes to the `unit` sheet. Duncan's stats, abilities, icon and voice stay the same.
- Validate the JSON afterwards (no BOM, no trailing commas), as `.github/copilot-instructions.md` requires.
- Reverting is a one-line change back to the vanilla prefab path.

### 6.7 Build and test
- Run `res/repackage.py` (or `repackage.ps1`) to build `res.compressed1.pak` and deploy it.
- In game, as Atreides, recruit Duncan and check every item in §8.

---

## 7. Defaults and assumptions

| Decision | Default | Change if… |
|---|---|---|
| Replace vanilla Duncan or add a new unit? | Replace Duncan's look by repointing `A_Hero_1`'s model | You want both versions in game. Then add a new `model` + `unit` row instead. |
| Overwrite vanilla files? | No. New `_HeadSwap` files only | — |
| Donor choice | The only non-Duncan, non-Landsraad model | There's more than one, in which case I ask |
| Green source | Sampled from Duncan's outfit texture, checked against `#26734C` | You give an exact hex |
| Tooling | Blender (headless `bpy`, which can be installed in this environment) | You'd rather do the mesh work by hand in Blender and only want the data side from me |

---

## 8. Done when

- [ ] Duncan in game shows the donor's head on Duncan's body, with no gap, floating head or clipping at the neck.
- [ ] The head's coloured parts are green and read as the same green as Duncan's outfit, at the default game zoom and zoomed in.
- [ ] Skin and face colours look natural. Nothing that wasn't meant to change turned green.
- [ ] Idle, run, melee attack, ranged attack and skill animations all play without the head detaching, stretching or T-posing.
- [ ] The unit icon, voice, stats and abilities are unchanged.
- [ ] Vanilla model files are untouched. Reverting means one path change in `data.cdb`.
- [ ] `data.cdb` is valid JSON and the pak builds without errors.

---

## 9. Risks and open questions

1. **Runtime model format.** `docs/orphaned_assets_findings.md` notes that the extracted
   assets are source `.fbx` files and the shipped game may load compiled `.hmd` from its own
   pak. If the game won't load a loose FBX from a mod pak, the new model has to be converted
   with Heaps' FBX→HMD tooling (part of the same Haxe/Heaps toolchain `repackage.py` already
   uses). This needs testing early, with an unmodified copy of Duncan, before the head work
   starts.
2. **Prefab format.** The `.prefab` files are Heaps prefab containers. Copying Duncan's and
   changing its model reference should work, but nobody has done this yet in this repo.
3. **Skeleton mismatch.** If the donor's proportions are very different (e.g. a much bigger
   head), it may need to be scaled down or reshaped at the jaw/neck to look right.
4. **Faction mask vs baked colour** (§6.4). This decides whether the green goes into the
   texture or the mask channel. It's settled during intake.
5. **File size.** Large FBX/texture files should go through Git LFS so the repo stays usable.

---

## 10. Files expected to change

| File | Change |
|---|---|
| `res/Character/Atreide/Unit/Duncan/Male01_AtreidesDuncan_HeadSwap.fbx` | New, combined mesh |
| `res/Character/Atreide/Unit/Duncan/*_HeadSwap.png` (or `.dds`) | New, recoloured head texture(s) |
| `res/Character/Atreide/Unit/Duncan/Prefab_AtreidesDuncan_HeadSwap.prefab` | New, points at the new FBX |
| `res/data.cdb` | `model` → `A_Hero_1` → `mesh[0].path` repointed |
| `res/res.compressed1.pak` | Rebuilt |
| `docs/spec_duncan_head_swap.md` | Intake findings filled in, status updated |
