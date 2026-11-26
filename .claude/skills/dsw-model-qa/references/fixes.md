# Fixes: which op for which gap

All ops are in `scripts/fit_ops.py`, work in **world space, rest pose**, and pick objects by a name substring. Put them in the unit's
generator (a recipe's edit list) where one exists; otherwise apply a JSON list to the built blend:

```
blender -b unit.blend --python fit_ops.py -- fixes.json unit_fixed.blend
fixes.json: [["cap", {"obj": "Gurney", "box": [[-0.115, -0.05, 1.575], [0.115, 0.15, 1.78]]}],
             ["snap_to", {"obj": "CommandoFill_snood", "solid": "Gurney", "max_dist": 0.03, "margin": 0.002,
                          "box": [[-0.3, -0.3, 1.40], [0.3, 0.3, 1.66]]}]]
```

Run fixes **before** the recolour/upscale/export chain (they change geometry and weights, not UVs), then rescan.

## Unwelded seam / small hole → `cap(obj, box, weld=0.0015)`
Welds coincident boundary verts inside `box` (a mirror seam at x = 0 is the usual case: game meshes are often two halves), then fills
any closed boundary loop left inside the box. No new verts, so skinning stays right; new faces borrow UVs from their verts.
- "0 faces filled" with a seam inside the box usually means the weld alone closed it (the "hole" was the seam). Rescan to confirm.
- Keep the box tight: a loop that runs out of the box is not filled (good - it is probably a panel border, not a hole).

## Panels that part in motion → `weld_weights(obj, box, radius=0.025)`
Two panel edges that meet at rest but belong to different bones (collar on the neck, torso panel on the spine) open a slit when the
bones rotate. Every boundary vert in `box` gets the average weights of the boundary verts within `radius`, so both edges move as one.
Geometry is untouched. Box it to the region (Ranger nape: `((-0.20, 0.0, 1.55), (0.20, 0.26, 1.72))`).

## Cloth edge floating above the body → `snap_to(obj, solid, max_dist, margin, boundary_only=True, box)`
Light passes under the edge of a snood, cape, apron: pull the edge verts that float within `max_dist` *outside* `solid` onto its nearest
surface + `margin`. `boundary_only=False` flattens a whole prop onto a surface (careful: it shears boxes).

## Graft sunk into the body → `push_out(obj, solid, centre, margin, box, axis=False)`
Pushes obj's verts that sit inside `solid` out past its outer surface along rays from `centre`.
- **Use `axis=True` for cloth around a neck or torso** (horizontal rays from the vertical axis through `centre`). A single point centre
  sends rays down and forward for the lower verts and slides cloth down the chest: the Ranger's neck wrap became a bib that way.

## Part poking through a cover → `clip_in(obj, cover, centre, margin, box)`
Pulls obj's verts that are outside `cover` (seen from `centre`) back under it. Used for hair inside a hood, a face inside a mask, a collar
under a snood (box it so armour elsewhere is not touched).

## Props → `rigid_weights(obj, src)`;  cloth → `transfer_weights(obj, src)`
- A pouch, holster, canister: one weight set per island, read from `src` at the island centre. It moves as a block with what it hangs on.
  Per-vertex transfer gave the pouch strap different weights from the pouch body and it bent away (RM12).
- But a rigid prop on a surface that bends (a belt over the hips and spine) separates from it at the contact face: that was the RM11 state
  and RM13 changed nothing. Use per-vertex weights for the verts touching the surface and copy them to the rest of the island by nearest
  touching vert (not yet an op; do it in a recipe and promote it to `fit_ops` once it works).
- Before either: read the current weights (`diff_blends.py` will tell you if your op changed none).
- A snood, apron, tabard that should follow the body under it: per-vertex nearest-surface weights (`transfer_weights`, or the builder's
  `weights_from_base=True` on a fill).

## Shape edits
- `xform(obj, scale, pivot, move, box, falloff=(axis, a, b))`: the falloff ramps the edit from 0 at `a` to 1 at `b` along an axis, so a
  partial move does not tear the mesh (hood front pulled down to the brows, crown rounded).
- `radial(obj, factor, centre, z, ramp)`: tighten or loosen around a vertical axis (a cowl, a sleeve).
- `cut(obj, z, keep)`: straight cut at a **world** height. The unit builders' `bisect_below/above` work in object space; grafted fills
  carry their FBX import transform, so their z is not world z.
- `delete(obj, lo, hi, mode)`: `mode="any"` takes every face touching the box (clean edge across a forehead); `"all"` only faces inside.

## Colour edges (jagged / sawtooth) - fixed in the recolour, not the mesh
A sawtooth colour border is the recolour's region boundary falling *across triangles*: regions are assigned per face from a 3D box
(e.g. "ochre plate = front faces with |x| < 0.22"), so the border follows triangle edges through a panel. Fix the region rule so the
border falls on a real panel edge:
- choose by **face direction** (the Ranger: front plate = faces whose normal points forward, `n.y < -0.5`, plus a wider |x|), so the border
  sits on the bevel where the plate turns to the side;
- or by **UV island**, but check first: torso islands often wrap front to back (Gurney's do), which would colour the back too.
Patch the rule through a wrapper (the Ranger's `rd_uvdump.py` execs the shared `08_uvdump_trooper.py` with one line replaced and asserts
the line exists), so other units using the shared script are unaffected.
Check in motion: the sawtooth showed when the arm came forward (AttackRange), not in the T-pose sheet.
