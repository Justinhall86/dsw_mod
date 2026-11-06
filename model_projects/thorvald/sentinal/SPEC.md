# Sentinal - Renegade Frigate - modding options & examples

## What this project is

A modding workspace for **House Thorvald's** **Frigate** unit - the
heavy air/gunship slot in `house_thorvald/units.md`. Source asset is
`model_inputs/Vehicle/Common/Renegade_Frigate` (filename only, not a canon
name - working name **Sentinal** until the unit name is locked).

This file is the modding **options read**: what can and can't be done to
this specific mesh, with two working examples delivered and a third
scoped out but not yet executed.

Source: `01_input/` (original FBX + textures, and the real FBX converted
from the HMD-in-disguise `.fbx` the game ships).

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | source model, source textures, the converted real FBX |
| `02_progress_photos/01_components/` | component analysis + the kitbash example gif |
| `02_progress_photos/03_recolour/` | region classification preview + the recolour example gif |
| `02_progress_photos/04_showcase/` | the original (unmodified) preview gif, for comparison |
| `03_blender/` | the finished `.blend` files (original, recolour, kitbash) |
| `04_textures/` | the recoloured textures + the house palette JSON |
| `08_scripts/` | the scripts used, for the record |

## The mesh, and why it changes the playbook

`01_analyse_mesh.py` found **194 disconnected mesh islands**, all under one
bone (`B_Body`), and the *largest* island is only 38 vertices (out of 2109
total). That's the opposite of a character mesh, where a backpack or cape is
one component of a few hundred verts.

What it means: the hull was exported without welding vertices across panel
seams, so every individual panel/plate is its own tiny mesh island - there's
no single component that means "the wingtip nacelle" or "the dorsal spine."
The `dsw-model-workshop` closure-proof tooling (`02_remove_parts.py`) assumes
a continuous, welded skin where a closed shell has zero boundary edges; on
this mesh nearly every island already has boundary edges by construction, so
that proof can't tell a legitimate cut from a pre-existing seam. **Component-
ID removal is not usable here without new tooling.**

## Three options, in order of how well they work on this mesh

### 1. Recolour - works exactly as designed. DONE (example below).

Texture-space work doesn't care about mesh topology, so the normal
`04_classify_regions.py` / `05_recolour.py` pipeline (preset `vehicle`)
applies cleanly.

### 2. Kitbash (graft a donor part on) - works well. DONE (example below).

Grafting is a whole-object add, not a mesh-topology operation: import a
donor ship/prop, scale and place it, parent it to the host root. It doesn't
depend on the host mesh being separable at all, so this ship is just as
kitbashable as a clean one. The only real work is picking a sane mount point
and scale.

### 3. Removal (clip/delete hull detail) - possible, but needs a different
proof than the one `02_remove_parts.py` runs. Scoped out, not yet executed.

Spatial, not component-ID: select everything inside a world-space box and
delete it, the way `--probe` already describes a box for the proof step -
just skip the closed-shell proof (it doesn't mean anything on an unwelded
mesh) and verify **visually**, before/after, from the same camera angle.

**A concrete candidate**, found from the component table: components `0-13`
(14 of them, 7 mirrored per side) sit at the extreme wingtip X range
(`x: -4.68..-3.80` and `3.80..4.68`, `z: 0.51..1.58`) and read as the wingtip
nacelle caps in the front-on render. Deleting them would leave flat wingtip
stubs - a cleaner, more "stripped-down raider" silhouette, or a mount point
for a kitbashed engine pod (see option 2). Coordinates are in
`02_progress_photos/01_components/` render context; re-run
`01_analyse_mesh.py` to regenerate the full table before cutting.

## Examples delivered

### Recolour - `sentinal_recolour_v1`

Palette: `04_textures/sentinal_palette.json` - a renegade/salvager scheme
distinct from the vanilla Smuggler blue-grey:

| Region | Colour | Notes |
|---|---|---|
| hull panel (dark fabric, 79% of texture) | `ironhull` `#32302C` | warm dark gunmetal, metallic 0.75 |
| armour plate (19%) | `rust_plate` `#7A4C34` | weathered rust/bronze |
| trim (1.2%) | `trim_amber` `#D68C3A` | bright metal accent, metallic 1.0 |

Built with the `vehicle` preset (folds skin/leather into armour - this
model has neither). No tint mask was available for this asset, so there's
no isolated "accent" region; the three regions above cover the whole texture.

- `03_blender/sentinal_recolour_v1.blend`
- `02_progress_photos/03_recolour/sentinal_recolour_v1.gif`
- `02_progress_photos/03_recolour/region_preview.png` (classification sanity check)

### Kitbash - `sentinal_kitbash_v1`

Grafted a `DroneA` (Atreides combat drone) onto the recoloured hull's dorsal
spine as a mounted recon/turret pod - scaled to ~22% of the hull's span and
placed at the top-centre of the hull, nudged toward the nose to sit on the
raised sensor ridge visible in the original showcase render.

Technique (see `08_scripts/11_build_kitbash_v1.py`):
1. Import host, recentre its root to world origin, wire the recoloured textures.
2. Import donor, reparent **everything the import created** (mesh + its own
   armature) under a new empty - reparenting only mesh objects missed the
   donor's armature and left the drone unscaled at the world origin, buried
   in the hull (first attempt; visible in the debug history, not in the
   delivered file).
3. Scale the donor empty to the target size, computed from the hull's span.
4. Place the donor empty's world-space mount point **in the host root's
   local space** (subtract the host root's own recentring translation) -
   mixing world-space and parent-local coordinates was the second bug: the
   pod landed inside the hull, scaled correctly but 0.5m below the surface.

- `03_blender/sentinal_kitbash_v1.blend`
- `02_progress_photos/01_components/sentinal_kitbash_v1.gif`

### Kitbash v2 - `sentinal_kitbash_v2_droneS` (the real donor)

v1 used `DroneA` (Atreides) only because it was already converted from an
earlier task. House Thorvald's roster plan (`house_thorvald/units.md`) already earmarks
**`DroneS`** (the Smuggler combat drone) as this house's own Drone unit, so
re-running the graft with the actual donor makes the Frigate and the Drone
share a silhouette family on purpose, not by accident - the pod mounted on
the Frigate now previews the same hull the Drone unit will ship.

Same technique, same mount point and scale logic as v1 (22% of hull span,
dorsal-centre nudged toward the nose), textured with the drone's own
Smuggler-faction albedo variant (`CombatDrone_Smuggler_Albedo.png`, not the
default/unbranded one - the file ships four faction albedos per `props.json`
search paths, picked the one that matches this house's Smuggler-adjacent
donor lineage). Landed correctly on the first render - no repeat of the v1
armature/coordinate bugs, since the fix is now baked into the script
(`08_scripts/13_build_kitbash_v2_droneS.py`).

- `03_blender/sentinal_kitbash_v2_droneS.blend`
- `02_progress_photos/01_components/sentinal_kitbash_v2_droneS.gif`

### Kitbash v3-v5 - more DroneS placements

Same donor (DroneS), three different mount points on the same recoloured
hull, built with a new generalised script
(`08_scripts/14_build_kitbash_multi.py`) that takes a JSON config of one or
more `{fbx, textures, frac, margin, scale_frac, rot_deg}` mounts instead of
hardcoding a single placement - configs are kept in `08_scripts/kb_configs/`.

**Regression hit and fixed again:** generalising the v1/v2 script
re-introduced the exact world-space/parent-local bug from v1 (the new code
set `donor_root`'s location straight from a world-space target without
subtracting `host_root.location`). Every mount landed roughly 1.25 hull-units
too low until this was caught by comparing the rendered position against the
intended one. Fixed in the generalised script and called out again in
`references/traps.md` so a third reimplementation doesn't repeat it.

Also learned: a flat dorsal mount close to hull height often lands **behind
the raised dorsal ridge** and is invisible from common camera angles (hit
this on both v3's and v6's first pass, and v8's). The fix each time was
visual iteration - raise `frac.z` toward 1.0 and/or add a touch more
`margin` until the piece clears the ridge in a render, not just trusting the
math once.

| Variant | Donor placement | Look |
|---|---|---|
| v3 `sentinal_kitbash_v3_bow` | DroneS perched on the bow edge (`frac [0.62,0,0.85]`, scale 16%) | forward recon scout riding the nose |
| v4 `sentinal_kitbash_v4_twin_wings` | two DroneS, one per wingtip (`frac [0,±0.68,0.18]`, scale 14% each, ±20° yaw) | twin escort drones flanking the hull |
| v5 `sentinal_kitbash_v5_heavy_rack` | one larger DroneS at the stern, rotated 180° (`frac [-0.55,0,0.3]`, scale 32%) | a heavy drone rack facing aft |

- `.blend` files in `03_blender/sentinal_kitbash_v{3,4,5}_*.blend`
- `.gif` files in `02_progress_photos/01_components/sentinal_kitbash_v{3,4,5}_*.gif`

### Kitbash v6-v10 - other vehicle donors

Five more donors from `model_inputs/Vehicle/`, each already converted from
the earlier `/dsw-preview-blend` pass (real FBX + real PNG textures already
sitting in each vehicle's own `preview_textures/` folder - no reconversion
needed). Same generalised script and technique as v3-v5.

| Variant | Donor | Placement | Look |
|---|---|---|---|
| v6 `sentinal_kitbash_v6_hammer_fin` | Hammer (Imperial) | dorsal-centre, rotated 90° to stand it on edge (`scale` 34%) | raised conning-tower / sensor fin - the Hammer's white panel reads as a deliberate material contrast against the rust hull |
| v7 `sentinal_kitbash_v7_tank_turret` | Tank (Atreides, WIP/placeholder-textured) | bow, dorsal (`scale` 22%) | bolted-on boarding turret, antenna and all |
| v8 `sentinal_kitbash_v8_hawk_pod` | Hawk (Atreides) | stern, dorsal, low profile (`scale` 30%) | small sensor blister - a deliberately subtle addition, for contrast against the louder variants |
| v9 `sentinal_kitbash_v9_ravager_engine` | Ravager (Common) | starboard wingtip (`scale` 26%) | auxiliary engine/thruster module bolted to the wing |
| v10 `sentinal_kitbash_v10_shuttle_pod` | Ravager_Shuttle (Common) | port wingtip (`scale` 28%) | docked escape-pod/shuttle module |

- `.blend` files in `03_blender/sentinal_kitbash_v{6..10}_*.blend`
- `.gif` files in `02_progress_photos/01_components/sentinal_kitbash_v{6..10}_*.gif`

### All ten kitbash variants, compared

| # | Donor | Where | Verdict |
|---|---|---|---|
| v1 | DroneA (Atreides) | dorsal-centre | works, superseded by v2 (wrong-faction donor) |
| v2 | DroneS (Smuggler) | dorsal-centre | **best default** - matches the house's own Drone unit on purpose |
| v3 | DroneS | bow | reads as a forward scout; a little exposed/unsupported-looking from the side |
| v4 | DroneS x2 | both wingtips | reads as an escort formation; most "alive" of the set |
| v5 | DroneS (large) | stern, reversed | reads as cargo/support, least "weapon-like" |
| v6 | Hammer | dorsal, on edge | strongest silhouette change of the ten - worth a second look at full scale |
| v7 | Tank | bow | good character, slightly busy next to v3 if combined |
| v8 | Hawk | stern | too subtle on its own; better as a *secondary* detail alongside a bigger piece |
| v9 | Ravager | wingtip | clean, reads immediately as "engine" |
| v10 | Ravager_Shuttle | wingtip | clean, reads immediately as "docked pod"; v9+v10 together (one per wingtip) is an obvious next combination to try |

## Redo: real kitbashing, not a toy glued on top

**Feedback that triggered this:** mounting a whole miniature donor ship on top of
the hull (v1-v10 above) reads as a toy stuck on a toy, not a kitbash. Real
hard-surface kitbashing cuts a recognisable chunk off a donor, scales it to
the HOST's own panel density (not a small decorative fraction), and
overlaps it into the host surface so the join disappears into shared mass.
v1-v10 are kept on disk for comparison but are **superseded** by the
technique below - don't use them as the reference for "how to kitbash this
ship."

### The technique

1. **Normalise the donor to the host's own size first** (`host_size /
   donor_size`), not to some small accessory fraction. A chunk cut from a
   normalised donor already reads at the host's own panel scale.
2. **Cut a real chunk**, not a whole ship: spatial box-select (same method as
   the unwelded-mesh removal note below, just KEEP-inside instead of
   delete-inside) on the NORMALISED donor, so the fractional box bounds
   already describe a host-scale piece.
3. **Embed it into the host surface** - push the mount point inward (toward
   the hull) by a fraction of the chunk's OWN size, instead of hovering it
   above the surface with a gap. The raw, jagged cut face from step 2 ends
   up buried inside the host (hidden), and only the donor's own clean outer
   surface shows - exactly how a glued model-kit part reads: overlapping
   mass, no attempt at a perfect seam.

Script: `08_scripts/15_extract_and_graft.py` (config format and the two bugs
hit building it are documented inline). A companion
`08_scripts/16_extract_preview.py` renders a candidate chunk ALONE from 4
angles, for dialling in the extraction box before committing to a full
host+graft render - use it, don't guess blind; several of the boxes below
needed 2-3 iterations.

### A third coordinate bug, found by this technique specifically

HMD-converted meshes with an armature (even "static" vehicle props like
these donors) store their BASE mesh data in **bind-pose space**, not the
visually-correct shape - confirmed on DroneS, where raw `mesh.data.vertices`
range (`y: 1.88..3.32`) didn't match the object's own `bound_box` /
evaluated-mesh range (`y: -0.84..0.84`) AT ALL. The Armature modifier
deforms the base data into the correct shape only at render/evaluation time.

This never mattered for v1-v10 or the recolour pass, because those only ever
read `object.bound_box` (which already reflects the deformed/evaluated
shape). It matters here because extraction needs **per-face** positions, and
`bmesh.from_mesh(obj.data)` reads the raw (wrong) base data. Fix: bake the
evaluated (posed) positions into the base mesh before any per-face
operation, then drop the Armature modifier so it isn't deformed a second
time - and re-parent to wherever the armature was parented (not to `None`),
or the chunk goes orphaned and stops inheriting its parent's scale/placement
entirely (this cost a `CHUNK size 0.0` and then a `half-extents` that
silently stayed un-normalised, in that order, before being traced to the
same root cause). See `references/traps.md`, "Kitbashing", for the full
writeup - this is now documented so the next donor doesn't re-trip it.

### The six donor chunks

Found by rendering each donor from 8 angles + top-down first, then iterating
the extraction box with `16_extract_preview.py` until the cut was clean (no
floating debris, no see-through hollow cross-section facing the camera).

| Donor | Chunk | Extraction box (fractional, post-normalise) | Reads as |
|---|---|---|---|
| DroneS | full wing blade | `x:[0.09,1.0] y:[-1,1] z:[0.1,0.9]` | sensor mast / stabiliser fin |
| Hammer | wingtip wedge | `x:[0.55,1.0] y:[-1,1] z:[-1,1]` | raised armoured blade |
| Tank | faceted turret-top plate | `x:[-0.3,0.6] y:[-1,1] z:[0.45,1.0]` | flush reinforcement plate (low-contrast - Tank's placeholder texture nearly matches Sentinal's own hull colour, so this one reads as a subtle panel rather than a loud addition) |
| Hawk | wing blade | `x:[0.35,1.0] y:[-1,1] z:[-1,1]` | wingtip extension |
| Ravager | compact sensor head | `x:[-0.17,0.17] y:[-0.3,0.3] z:[0.25,1.0]` | periscope/sensor dome |
| Ravager_Shuttle | hexagonal hatch cap | `x:[-0.55,0.55] y:[-0.55,0.55] z:[0.6,1.0]` | command/bridge module (the biggest, boldest chunk of the six) |

### Seven new variants

| # | File stem | What | Verdict |
|---|---|---|---|
| graft_v1 | `sentinal_graft_v1_droneS_fin` | DroneS wing, dorsal-centre | clean, reads as a mast growing out of the spine |
| graft_v2 | `sentinal_graft_v2_hammer_fin` | Hammer wedge, bow, stood on edge | sharp, strong silhouette, best "weapon-like" read |
| graft_v3 | `sentinal_graft_v3_tank_plate` | Tank plate, bow, flush | works but subtle to the point of being easy to miss - fine as ONE detail among louder ones, weak alone |
| graft_v4 | `sentinal_graft_v4_hawk_wing` | Hawk wing, wingtip, 15 deg | best "extends the existing silhouette" result of the seven |
| graft_v5 | `sentinal_graft_v5_ravager_dome` | Ravager dome, stern | good secondary detail, smaller and quieter than v2/v6 |
| graft_v6 | `sentinal_graft_v6_shuttle_hatch` | Shuttle hatch, dorsal, offset | **standout piece** - large, confident, reads as a built-in bridge module, not an add-on |
| graft_v7 | `sentinal_graft_v7_hero_combo` | shuttle hatch + Hammer fin + Hawk wing, combined | **the recommended default** - three donors, spaced so nothing collides, reads as one finished, intentionally-customised ship from every angle checked |

**Recommendation:** `graft_v7_hero_combo` is the answer to "what should Sentinal
actually look like" - it's the only variant that demonstrates the full
AAA-kitbash idea (multiple donors, real cut parts, flush integration) rather
than isolating one technique at a time. The individual graft_v1-v6 variants
exist so each donor's contribution can be judged on its own before deciding
whether to add, swap, or drop it from a combo.

## Open decisions

- Frigate in-game name still not locked (`house_thorvald/units.md` has candidates).
- **Pick a direction: `graft_v7_hero_combo` is the recommendation** - it's
  the finished, multi-donor result. If a single simpler addition is wanted
  instead, `graft_v6_shuttle_hatch` (boldest, best alone) or
  `graft_v4_hawk_wing` (best "extends the hull" read) are the next picks.
- v1-v10 (the whole-donor-mounted variants) are superseded by graft_v1-v7
  and kept only for comparison - don't ship one of those.
- Not tried yet: swapping the DroneS graft back in (ties to the house's
  Drone unit thematically, per the original ask) now that the real-chunk
  technique exists - graft_v1 uses DroneS already, but hasn't been combined
  into the hero combo alongside the shuttle hatch/Hammer fin/Hawk wing.
- Removal (cutting the wingtip nacelles, see above) still hasn't been tried
  in combination with any graft. It needs a spatial-box deletion + before/
  after render check rather than `02_remove_parts.py`'s boundary-edge proof,
  which doesn't apply to this mesh's topology.
- The Tank chunk (graft_v3) is real but low-contrast against Sentinal's own
  recolour - if it's wanted as a visible detail rather than a subtle one, it
  needs either a brighter accent pass on just that chunk or a different donor
  region.
