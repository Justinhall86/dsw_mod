# Duncan Modified

Duncan Idaho (`model_inputs/Duncan`) with the **scarf and cape removed**. Everything else —
mesh, 53-bone Male01(+whip) skeleton, weights, UVs, textures — is untouched, so all
original Duncan animations still apply.

- `duncan_modified.fbx` - the finished model (also in `05_fbx_export/`).
- `05_fbx_export/duncan_modified_fixed.fbx` - fbxfix output (skeleton restored from the
  original Duncan HMD; "no warnings -- ready for the repackager"). Use this one for
  HMD conversion.
- `01_input/` - copy of the source assets (the `.fbx` here is HMD content with a fake
  extension, as shipped).
- `03_blender/` - `Male01_AtreidesDuncan_src.fbx` (hmd2fbx conversion of the source) and
  `duncan_modified.blend` (working file after the deletion).
- `02_progress_photos/` - before/after renders, island maps and texture checks used to
  identify the scarf/cape shells.
- `08_scripts/` - the headless-Blender pipeline (inspect -> island analysis -> texture
  check -> delete+export -> verify).

## What was removed

The scarf/cape was not on cape bones (none are weighted in the source); it was two
islands of the single skinned mesh, identified by the green albedo colour and confirmed
with renders:

| Island | Verts | What it was |
|---|---|---|
| 0 | 333 | neck cowl + chest drape + shoulder capelet (the green cloth) |
| 26 | 40 | inner scarf shell around the neck |

**373 verts / 641 faces deleted: 4863 verts, 7774 tris -> 4490 verts, 7133 tris.**

Deliberately kept: the black ponytail (hair, not cloth), the green front tabard
(garment panel, not scarf/cape), all armor, belts and pouches.

## Export / validation

- Blender 5.2 export with the toolkit settings (Forward Y, Up Z, Add Leaf Bones OFF,
  Animation OFF, FBX Units Scale, Path Mode Copy + Embed Textures, triangulated).
- Weights unchanged: 36 weighted bone groups, max 3 influences per vertex.
- `fbxfix` against the original Duncan HMD (53-bone reference incl. the 7 whip bones
  that `Rigs/Male01.hmd` lacks): **no warnings -- ready for the repackager**.

## Next steps (not done here)

Convert to HMD with the HMD Toolkit (FBX -> Model, Rig Male, original Duncan textures
beside the input), preview in the HIDE editor, then wire a prefab/model entry in
`data.cdb` as in the other projects.
