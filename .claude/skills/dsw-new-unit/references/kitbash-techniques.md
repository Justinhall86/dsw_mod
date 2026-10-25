# Kitbash techniques (what `03_variants.py` does and when to use each key)

Recipe = one dict in `VARIANTS`. Order of operations inside `build()`: remove islands -> cut base head -> collar bisect ->
scrap cleanup -> collar model -> fills -> donor head (+ neck repair) -> pack -> 4 renders + head close-up -> save.

```python
"V6b_GinazCollar": dict(
    base="Mercenary", donor="Bannerjee",            # body unit, head donor unit (keys of units.py)
    metal=True,                                     # also remove every island that is >= 60 % metal (MetallicGlossAO R > 0.5)
    remove=[13, 16, 6, 33, ...],                    # island ids of the BASE (from 02_gallery.py); *Weapon*/*Scabbard* islands auto-removed
    head_neck_comps=[25], flip_neck_back=True,      # donor head: keep head faces + ONLY these neck islands (others flare out)
    stitch_nape=1.766, neck_extend=(1.72, 1.65, 0.02, 1.76, 0.07), neck_backplate=(1.785, 1.62, 0.058, 0.066, 8.0, 172.0),
    collar_z=1.70, collar=COLLAR, min_island=12,    # mantle collar bisect height, hand-modelled collar, delete scraps < 12 verts above z 1.4
    fill=[dict(donor="Raider", tag="tunic", exclude=[0, 11, 19, 20], bones=TORSO, zmax=1.64, clip_inside=True,
               margin=0.008, weights_from_base=True),
          dict(donor="Gurney", tag="coat", keep_comps=[9, 10, 22, 23])],
    title="...")
```

## Choosing parts
- **Heads**: a head = faces whose vertices are all dominated by `B_HeadJ`. Hair, hoods, masks, ears are in it. The base's own
  head faces are deleted; the neck below stays. Good donors: Bannerjee (white hair, beard - recoloured black it became the
  Ginaz officer), Raider (hood wrap + mask), Otheym (hair+beard), Marauder (turban), HeavyWeapon (visor helmet).
- **Removals**: scarves, capes, pouches, belts, straps, baked-in weapons are separate islands - clean deletes. Gallery sheet
  first; small (< 40 vert) leftovers hide knots/straps: `02_gallery.py <Unit> --min-verts 8` or `comp_info` bbox listing.
  Heavy Weapon Squad / Free Company / Ranger / Warden are fragmented into dozens of tiny islands - use a bbox removal.
- **Belts/holsters inside the pants island** need a face/UV-region cut, not an island delete (untried).
- **"Remove all metal"**: `04_metal_map.py` first to see what counts as metal, then `metal=True`.
- Baked-in weapon islands are skinned to `B_Weapon`/`B_Scabbard` and sit under the feet in the rest pose.

## Fills (when a removal opens the body)
A chest plate may be the torso surface. `fill` grafts a donor's torso (faces whose verts are all in `TORSO` bones) or whole
islands (`keep_comps` - the Gurney coat tails). Then:
- `zmax` caps the fill under the collar line.
- `clip_inside=True` pushes every fill vertex that lies outside the base surface back under it (ray from the spine axis vs a
  BVH of the base) so the fill never pokes through the mantle/shoulders.
- `weights_from_base=True` replaces the fill's skin weights with the UNCUT base's (Data Transfer nearest face): it then
  deforms exactly like the surface it replaced. (Known leftover: in a hard cross-chest arm swing the tunic can fold under
  the armpit; the vanilla Mercenary hides the same spot under its scarf. Options: short scarf drape, or re-model.)
- Do NOT strip arm weights from a fill (tried: it stops following the mantle and pokes through).

## Neck and collar (the part that took 27 iterations)
Symptoms and the fix that solved each:
| Symptom | Cause | Fix |
|---|---|---|
| long bare neck "pencil" | donor head's neck tube floats above the torso | `neck_extend` extrudes the tube's open bottom down into the torso (front flared, back straight) |
| flared spikes behind the head | donor "nape ring" island is a collar flare, not neck | keep only the tube island: `head_neck_comps=[tube_id]` chosen by bbox, not by guess |
| open band at the back of the neck | gap between the head's lower edge and the tube's top | `stitch_nape` zipper between the two boundary chains (only angles 20-160 deg; the skull's x=0 seam is unwelded all the way up) |
| holes in the game, fine in Blender | back faces culled in game, tube back wound inward | `flip_neck_back`; verify with `view_culled.py` |
| sawtooth mantle collar | deleting faces leaves slivers | `collar_z`: plane bisect (clean edge), delete above |
| see-through band behind neck | geometry still missing | `neck_backplate`: double-sided curved skin panel, inside the neck surface, own verts per side |
| stray colours on new skin | patches sampled different texels | one plain-skin UV texel for all new patches (`neck_skin_uv`) |
| stand-up collar missing (design wants one) | no donor has it | `build_collar`: double-walled shell around the neck, V opening at the front (`open_deg`), tallest at back, gold rim band; UV = even mantle patch (-> wine) + big blue patch (-> gold). Weights: bottom SpineTop, top 55/45 SpineTop/Neck |
`COLLAR` params: z_bottom/top_front/top_side/top_back (heights), rx/ry/cy (ellipse), flare, open_deg, thick, rim, segs,
wine_uv/gold_uv (`find_uv_patch.py`). Front opening 3 deg = hairline seam matching a closed mandarin collar.

## Weights
Max 3 influences per vertex (the HMD limit; `12_assemble_export.py` enforces). Bone names match across all Male01 variants and
clips. Female01 units share the names plus a few extras (`B_Weapon_L`, toe/thumb J3) - grafts work but proportions differ.
`dsw_parts.py` has mirror/nudge/inflate/build_shell for pauldrons (see `dsw-part-kitbash`).

## Verifying a variant
1. `05_diag.py` six views textured AND flat-colour (who owns each polygon).
2. `view_culled.py` (game's back-face culling).
3. A before/after strip of the exact area the user circled.
4. Real clips (`11_sword_anim.py`, or `anim_stress.py`) - at least Run and two attacks. Compare against the vanilla unit in the
   same pose when something looks wrong (is it ours or inherent?).
