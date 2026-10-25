# Recolour and textures

## Method (same as commando_house / dsw-model-workshop)
Replace **hue + saturation**, keep **value** (the painted shading), and compress each class's value range (3rd..97th
percentile) onto a band around the target brightness. Every crease and highlight survives. A plain hue shift is not enough
when two parts share a colour but not a role (the Mercenary's terracotta mantle and its brown boots), so classify by
**body region**, not only by hue.

## Region classification: `08_uvdump.py` -> `09_ginaz_recolour.py`
`08_uvdump.py` walks every face of a variant blend and emits `{texture: {region: [UV polygons]}}`. Region comes from WHERE the
face is (object name + rest-pose height + dominant bone):
`head`, `head_eyes` (eye whites - never recolour, they are as pale as white hair), `tunic`, `coat`, `hands`
(wrist/finger/thumb bone), `upper` (z > 1.28), `belt` (0.98..1.28), `legs`. Change the thresholds/object-name tests for a new
unit. `09_ginaz_recolour.py` rasterises those polygons (dilated 2 px for seam bleed) into masks and applies the first matching
rule of `RULES[region]`: `(hue range | None, sat range, val range, palette key, value band)`.

House Ginaz palette used (sampled from `model_inputs/house_ginaz_roster.jpg`, deepened toward the purple swordmaster image):
plum (104,54,66), plum_plate (72,42,52), plum_dark (42,26,33), gold (196,154,78), leather (70,40,34), hair (34,27,25),
**wine (92,32,52)** and wine_dark (52,20,32) for the coat. For another house: change `PAL`, then the value bands.

Rules that mattered:
- Measure first: print percentiles of H/S/V inside the region mask. Our assumed hue ranges were wrong twice (mantle hue is
  0-40 deg, not "terracotta 20-35"; the bright green stripe is V > 0.82, the coat green is lower).
- Gold accents use narrow high-value hue bands (yellow studs: V > 0.75, mint stripe: V > 0.82) or the whole coat turns gold.
- White hair -> near-black: `(sat <= 0.38, val >= 0.42) -> hair band 0.07-0.22`, plus a second rule for greyer hair at the nape.
- Preview wiring: keep the FBX importer's wiring (MetallicGlossAO -> Specular IOR Level). Re-wiring MG as R/G/B channels turned the
  Mercenary's coat metallic grey - channel layouts differ per unit. (`10_apply_textures.py` has the experiment commented out.)

## UV patches for hand-modelled parts
A modelled part gets UVs pointing at an even texel patch of the unit's OWN texture, so after the recolour it automatically has
the right colour (wine collar body, gold rim). `find_uv_patch.py <albedo> --hue a b [--regions json --region name]` returns
the (u0,u1,v0,v1) box with the lowest colour variance. Pick the patch from the ORIGINAL texture region that will be recoloured to
the colour you want (blue scarf -> gold, mantle -> wine). Parts must live in an existing material's UV space.

## Game texture format (per material)
- Real PNG, RGBA, **alpha 255** (game textures on disk are DDS named .png; Pillow reads them, Blender 5.2 loads them with a warning).
- Albedo = recoloured; MetallicGlossAO + Normal = the originals from the unit that material came from.
- 3 files per material: `<Prefix><Name>_{Albedo,MetallicGlossAO,Normal}.png` (`build_game_textures.py`), downscale > 1024.
- A material named like the donor's (`Mat_Raider`) keeps the donor's UVs - never re-unwrap a donor part.
- A weapon needs no new texture if the game ships one: point its material at the vanilla texture path
  (`Character/Ecaz/Weapon/FencerDoubleKnife/WeaponFencer`).
- `materials.props`: every material `{"mode":"PBR","blend":"None","shadows":true,"culling":"Back","depthTest":"Less",
  "colorMask":15,"enableStencil":false,"emissive":0.1}`. A vanilla `emissive: 1` belongs to materials that ship an emissive map -
  without one use 0.1. Without any materials.props the model renders visibly darker.
