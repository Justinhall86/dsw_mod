# Triage: is it a real gap?

`gap_check.py` flags every transparent region enclosed by the unit's silhouette in a back-face-culled render. That includes
gaps you must fix and negative space that belongs to the pose. Each candidate in `<tag>_gaps.json` has `at`: the objects
whose faces surround it (ray hits through a ring of pixels around the hole) and the mean **rest-pose** position of those faces.

## Signatures (from the Thorvald Ranger scans)

| What the "at" list and crop show | Verdict | Example |
|---|---|---|
| Legs object only, x near 0, z 0.15-0.75 (between thighs/knees/feet) | natural (the space between the legs) | `AtreidesSoldierFill_legs x24 rest [0.007, 0.007, 0.64]` |
| Torso + arm object, large (100-3000 px), between arm and body | natural (pose) | `Gurney x12 rest [0.477, 0.105, 1.295]` |
| A prop only, small closed loop above it | natural (handle / strap loop) | pouch handle `MercenaryFill_pouches rest [0.04, 0.20, 1.27]` |
| Hand only, thin slivers | natural (between fingers) | glove at the rifle grip |
| Weapon among the hits | ignore the weapon hits (drop it with `--drop`; rays hit hidden objects) | `Thorvald_Sniper x19` |
| **One body object, on its surface, near x = 0** | **real: unwelded mirror seam** | `Gurney x24 rest [-0.004, 0.165, 1.359]` (mid back) |
| **One body object, at a panel edge, only in clip poses** | **real: panels on different bones part in motion** | `Gurney x24 rest [-0.129, 0.131, 1.615]` (nape, Run only) |
| **Body + a cloth/graft edge, thin slit, seen from the side** | **real: standoff between graft and body** | `Gurney x17 + CommandoFill_snood x5 rest [0.048, -0.066, 1.598]` |
| **Prop + what it hangs on, slits in a line** | **real: prop drifts off in motion** | pouches vs sash in AttackRange (three slits) |
| Body only, at a spot a removed part used to cover (pauldron, backpack) | **real: uncovered hole** | open shoulder top after the pauldrons were removed |

## Checks that settle unclear cases

1. **Same spot at rest?** If it only exists in poses it is a motion seam (weights), not missing geometry.
2. **`loops_near.py <obj> x,y,z`** on the rest position: a loop on the x = 0 seam (the script flags it) → weld; a small closed loop → cap;
   a long loop that is a panel border → weights; no loop near (> 3 cm) → standoff between two objects or a pose gap.
3. **Look at the crop** in `<tag>_gap_sheet.png` and the full PNG: background seen *through a surface* is a hole; background seen
   *between* two limbs is space.
4. Compare with the vanilla donor in the same pose if unsure: vanilla units have natural openings too.

Count only real gaps as the result. Tell the user which candidates were ruled natural (a line each), so "38 candidates" does not
read as 38 defects.
