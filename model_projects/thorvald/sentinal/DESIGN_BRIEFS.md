# Sentinal — 5 design briefs (written before any modelling)

Outlaw / renegade / mercenary House. Base model:
`model_inputs/Vehicle/Common/Renegade_Frigate`. Working house palette:
dark gunmetal `#32302C`, rust-bronze `#7A4C34`, amber trim `#D68C3A`.

These five are **five different design directions**, not five sizes of one
idea. Each is judged at game camera distance (~100 px), from above and from
the side. What went wrong last time (`graft_v1..v7`) is recorded at the
bottom of this file so it isn't repeated.

---

## Reference: what the vanilla hull actually is

Measured from `Renegade_Frigate_real.fbx` after baking the armature.
The axes were settled with orthographic renders plus marker cubes — the
length axis is **X**, not Y as the earlier read in SPEC.md assumed:

| axis | extent | reads as |
|---|---|---|
| **X** (length) | 10.20 | **bow = +X** (sloped prow, raised bridge just aft of it), **stern = -X** (long low slab) |
| **Y** (span) | 9.35 | the two swept wings, mirror-symmetric about y=0, each ending in a **nacelle cylinder** at y = +/-4.2, x ≈ -1.5 |
| **Z** (height) | 2.59 | low slab; the bow bridge is the tallest feature, plus a dorsal spine running aft |

From above the vanilla silhouette is a **broad swept delta with a blocky
head**: wings swept aft, blunt superstructure at the front, two fat cylinders
at the wingtips. The three features that define it are (a) the 9.35 span,
(b) the wingtip nacelles, (c) the raised bow bridge. Every brief below
attacks at least two of those three — attacking only one is how you get
"same hull, different bump."

Probed while planning: the hull **is** mirror-symmetric about y=0 (19
islands / 515 verts at each wingtip), and the albedo UVs are **not** mirrored
(starboard and port masks share zero pixels), so one-sided paint works.

---

## 1. SCYTHE — the cut-down raider

**Fantasy.** A corsair that has been *lightened*: an outlaw crew sawed the
wingtip nacelles off and cut the wings back to a swept delta so it can dive
and run. Scorched, stripped, nothing that adds mass.

**Silhouette goal.** From above: a narrow swept **dart** — vanilla's broad
delta collapses to a slim lance. From the side: low, clean, nothing sticking
up. Differ from vanilla by span (−45%) and a much sharper sweep; differ from
the other four by being the *leanest and most symmetric*.

**Changes (3–5).**
1. Delete the wingtip nacelle-cap islands by spatial box (re-probed:
   19 islands / 515 verts per tip, y frac |0.74..1.0|) — SPEC's scoped
   candidate, and the first cut of its kind on this hull.
2. Squash the wings in **Y** (span) to ~0.50 with a smooth falloff from the
   centreline, so no seam opens.
3. Shear the wing region aft (**−X**) so the wing sweeps instead of sitting
   square — a swept delta, not a shorter slab.
4. Texture: scorch darkening over the wing leading edges + amber hazard
   chevrons at the wing roots (the only bright thing left).

**Gameplay read:** fast raider / interceptor. Light, no armour, wins on speed.

---

## 2. BULWARK — the siege prow

**Fantasy.** A hired-out siege breaker. Someone welded stolen plate onto the
nose until it is a battering ram, and cut the wings to stubs so it can sit
right up against a wall without catching fire. Bow-heavy on purpose.

**Silhouette goal.** From above: a fat **wedge** — wide blunt front, narrow
tail, mass clearly in the front third. From the side: a rising wedge, nose
high, stern low. Differ from vanilla by mass distribution (bow-heavy) and
from the others by the blunt flat prow face.

**Changes.**
1. Swell the bow third: scale it in **Y** (×1.35) and push it **+X**, with a
   smooth falloff aft, so the front becomes a wedge.
2. Cut the wings to stubs (span × 0.34) — deliberately *removing* silhouette
   instead of only adding.
3. Hand-model a layered prow: 3 stacked armour plates with chamfered tops,
   embedded into the nose, plus a flat ram face across the very front.
4. Texture: prow repainted rust-bronze (stolen plate), amber hazard
   chevrons on the ram face, engine scorch at the stern.

**Gameplay read:** siege / heavy assault. Slow, armoured, first through the
breach.

---

## 3. MULE — the salvage hauler

**Fantasy.** The house's workhorse: a captured frigate with its aft bloated
into a cargo block and shipping containers lashed along both flanks — every
container a different colour, because none of them came from the same ship.
Patchwork, honest, ugly.

**Silhouette goal.** From above: **stern-heavy** — narrow clipped nose, wide
blocky rear. From the side: tall square mass behind, thin snout in front.
Differ from vanilla by the aft bulge and the row of containers; differ from
BULWARK by being the exact mirror of its mass distribution.

**Changes.**
1. Cut the bow bridge right down (Z × 0.35, smooth falloff) — removing the
   vanilla's tallest feature to make room for a different kind of bulk.
2. Swell the stern third: **Y** ×1.30 and **Z** ×1.55 with a falloff toward
   the middle, into a cargo block.
3. Hand-model 4 strapped cargo containers per side along the wing roots,
   staggered in size, sunk into the hull (nothing floats).
4. Texture: **mismatched replacement panels** — 8 hull rectangles repainted
   in different faded colours + a stencilled code. The strongest texture
   story of the five.

**Gameplay read:** escort / logistics. A hauler that can hold a lane.

---

## 4. NIGHTWISP — the silent runner

**Fantasy.** Vane Torrver's ship: matte-black, everything smoothed, every
antenna gone — except one long sensor boom on the *port* side only, which is
how you tell it's theirs. The only thing symmetrical about this ship is the
absence of decoration.

**Silhouette goal.** From above: a **thin flat blade with one arm sticking
out** — asymmetric, identifiable in a glance. From the side: almost no
height at all. Differ from vanilla by height (−45%), from SCYTHE by being
flat-and-asymmetric rather than swept-and-symmetric.

**Changes.**
1. Flatten the bow bridge (Z × 0.28) and delete the nacelle caps — the two
   tallest/offensive features gone.
2. Flatten the whole hull in Z (× 0.62) with a smooth falloff, so it reads
   as a blade.
3. Mirror-break: the starboard wing (+Y) shears aft and pulls in (Y × 0.82);
   port stays stock. The two sides no longer match.
4. Hand-model a long thin sensor boom + dish on the **port** wing only,
   with two struts back to the hull — nothing floats.
5. Texture: desaturate + darken the whole albedo to matte black-brown, one
   amber running light at the boom tip, faint amber trim only.

**Gameplay read:** stealth / scout escort. Opens fights from camouflage,
like Vane Torrver.

---

## 5. LONGSHOT — the spinal-gun brig

**Fantasy.** A jury-rigged gun-brig: the hull has been *stretched* and a gun
runs the whole length of the spine, with oversized engine shrouds bolted to
the back. Purpose-built, ugly, effective — a ship that fires once and hits
something three kilometres away.

**Silhouette goal.** From above: a long thin **cross** — by far the longest
of the five (length ×1.5) with narrowed wings. From the side: a long
horizontal bar with a raised barrel along the top. Differ from vanilla by
length (+50%) and the continuous dorsal line; differ from the others by
being long-and-thin where they are short-and-wide or flat.

**Changes.**
1. Scale the entire hull in **X** ×1.5 about its centre — a bulk proportion
   change, costs nothing, the biggest single silhouette win available.
2. Narrow the wings (span × 0.72) so the long body dominates the read.
3. Hand-model a spinal gun: barrel + mantlet running ~70% of the hull length
   on the dorsal centreline, plus a muzzle block.
4. Hand-model two oversized engine shrouds at the stern (open cylinders
   embedded into the aft face) to justify the length.
5. Texture: an amber stripe down the full length of the spine (drawn through
   a UV mask of the dorsal centreline), scorched shrouds, hull glyph on the
   forward flank.

**Gameplay read:** fire support / escort. Long-range, fixed-position shooter.

---

## Contrast matrix (why these five, not five magnitudes)

| | mass distribution | top silhouette | side silhouette | tone |
|---|---|---|---|---|
| vanilla | balanced, wide | broad **delta** | low slab + bridge | clean |
| **Scythe** | balanced, light | narrow **dart** | low, clean | scorched, stripped |
| **Bulwark** | **bow-heavy** | blunt **wedge** | rising wedge | armoured, deliberate |
| **Mule** | **stern-heavy** | snout + **block** | thin nose, fat rear | patchwork, mismatched |
| **Nightwisp** | asymmetric | **flat blade + one arm** | almost no height | matte, sinister |
| **Longshot** | elongated | long **cross** | long bar + barrel | jury-rigged, purposeful |

---

## What went wrong last time (do not repeat)

From `02_progress_photos/01_components/graft_v1..v7`:

1. Parts chosen by "what fits geometrically", not by a design idea — no
   variant had a story. **Every brief above has a one-line fantasy first.**
2. Donors were Imperial/Atreides (Hammer, Hawk) → reads "Atreides wing on a
   frigate". **These five use no donor ships at all** — additions are
   hand-modelled from the hull's own atlas, and the "salvaged" story is told
   with paint instead of a foreign-coloured chunk.
3. Additive only — silhouette barely changed. **Four of the five lead with a
   removal or a bulk-proportion change.**
4. Never judged at game distance. **Step 4 contact sheet is at 128 px.**
5. Only geometry explored; texture ignored. **Every brief has a paint step.**
6. Near-duplicates of one another. **See the contrast matrix.**

---

# What was actually built (and what changed after critique)

Everything below is produced by `08_scripts/19_build_variant.py` reading a
JSON config from `08_scripts/variant_configs/`. Rebuild any of them:

    blender -b --python 08_scripts/19_build_variant.py -- 08_scripts/variant_configs/v1_scythe.json

Then `python 08_scripts/21_contact_sheet.py` for the contact sheets and
`python 08_scripts/12_make_gif.py <frames> <out.gif>` for the turntables.

## Final numbers

| variant | L x span x H (m) | tris | vs vanilla (1756) |
|---|---|---|---|
| vanilla | 10.20 x 9.35 x 2.59 | 1756 | — |
| **Scythe** | 12.39 x **4.21** x 2.59 | 1256 | −28 % (nacelles + panels deleted) |
| **Bulwark** | 11.61 x **10.49** x 2.68 | 1804 | +3 % |
| **Mule** | 10.40 x **12.15** x **3.92** | 1828 | +4 % |
| **Nightwisp** | 11.58 x 9.78 x **1.42** | 1356 | −23 % |
| **Longshot** | **16.35** x 6.73 x 2.59 | 2080 | +18 % |

Each variant now owns a different axis: Scythe *loses span*, Bulwark and
Mule *gain span* (at opposite ends), Nightwisp *loses height*, Longshot
*gains length*. That was the point of the contrast matrix — no two rows
now share a primary axis.

## Brief → what was actually made

| brief said | what shipped | why it moved |
|---|---|---|
| Scythe: span x 0.50, shear −0.34 | span x **0.45**, shear **−0.46**, stern scorch 0.52/0.78 | first pass read as "small vanilla", not a blade |
| Bulwark: swell bow y x 1.35, wings x 0.34 | wings cut to stubs **aft of x=0.1 only**, prow swelled **y x 2.0 / x 1.16**, 4 stacked armour pieces (ram + 3 plates) | the original box cut the prow too, so the wedge never widened; and 2.3x made it read as manta wings |
| Mule: bridge z x 0.35, stern y x 1.30 / z x 1.55 | as briefed, plus 6 lashed containers on the deck and 6 mismatched replacement panels + `C-114` stencil | unchanged — it worked first time |
| Nightwisp: whole hull z x 0.62, one boom | z x **0.55**, bridge crushed, starboard wing sheared aft, port boom + dish, two-tone paint | z 0.62 was not flat enough against the others |
| Longshot: hull x x1.5, span x 0.72, barrel, 2 shrouds | as briefed (barrel 11 m on a 12 m rail, hollow muzzle, twin hollow stern shrouds) | unchanged — it worked first time |

## Critique round 1 (first contact sheet) — what was wrong

1. **Nightwisp was a black hole.** darken 0.5 over the whole texture killed
   every panel line; at 128 px it was a featureless smear.
2. **Bulwark was "the brown ship".** The rust paint box covered x > 0.45 —
   more than half the hull — so the whole thing read rust-brown and the
   prow flare looked like a pair of manta wings instead of armour.
3. **Scythe read as a downsized vanilla.** Shear −0.34 only pushed the tips
   1.5 m past the stern; at the game camera the blade didn't register.
4. **All five sat in one mid-dark value band.** Silhouette separation was
   fine at 360 px and mush at 128 px, because value was doing no work.

## Fixes applied in round 2

* **Nightwisp** — darken 0.5 → 0.7, desat 0.9 → 0.8, a pale composite
  dorsal panel (`gain` 1.65) and a lighter starboard quarter, amber
  marking cut down to a small patch. Now the lightest-dark ship: two-tone
  instead of silhouette-only.
* **Bulwark** — whole-hull `gain` 1.18 (now the *lightest* of the five),
  rust restricted to x > 0.68, bigger stepped armour (ram 5.6 m wide +
  three rising plates), prow flare trimmed 2.3 → 2.0 so it reads as a
  ram rather than wings.
* **Scythe** — shear −0.34 → −0.46 and span 0.50 → 0.45, stern scorch
  deepened. It is now 12.4 m long and only 4.2 m wide: a sliver.
* **Value spread** across the row is now light (Bulwark) → mid (Mule,
  Longshot) → dark (Scythe, Nightwisp), so the 128 px row separates on
  value alone before silhouette is even read.

## Critique round 2 — verdict

At 360 px and at 128 px all six tiles (vanilla + five) are separable:

* **vanilla** — wide, pale, symmetric delta.
* **scythe** — a dark sliver, longest thin thing in the row.
* **bulwark** — light hull, wide flared nose with a stepped armour stack.
* **mule** — lumpy dorsal (the containers read even at 128 px).
* **nightwisp** — flat, two-tone, one arm sticking out to port.
* **longshot** — clearly the longest, amber spine down the middle.

No two share a silhouette cue. The story survives the crop.

## Ranked recommendation

1. **Mule** — the clearest role read at a glance; the cargo boxes explain
   themselves without a word of lore. Cheapest to ship, hardest to misread.
2. **Bulwark** — the most dramatic silhouette in the row and the only
   *light*-value variant, so it will pop against a desert map.
3. **Longshot** — unmistakable by length. The barrel should be chunkier
   (radius 0.24 → ~0.34) before shipping; at 100 px it is a hairline.
4. **Scythe** — works, but the blade only reads from directly above; from
   the game camera it is mostly "the thin one". Good as a fast-attack
   reskin, weak as a hero unit.
5. **Nightwisp** — the best *story* (it is Vane Torrver's stealth runner)
   and the most interesting build, but the hardest to read at game
   distance. Ship it only with an emissive navigation-light accent on the
   boom, or it will disappear against dark terrain.

## Known limitations / unresolved

* Preview stage only — no game import, no LOD, no HMD conversion.
* Bulwark's prow swell stretches the albedo ~2x across the nose; invisible
  on the rust-painted face, would matter if that hull ever got a pattern.
* Nightwisp's asymmetry is real but subtle from the 45° game camera; it
  shows in the top view and the turntable, not the play camera.
* Mule's containers are tapered boxes sharing the hull atlas — no straps,
  rails or latches modelled.
* The Longshot tri count (+18 %) comes mostly from the hollow shrouds; if
  the budget is strict, drop `segments` from 10 to 8.

## File map

    model_projects/sentinal/
      DESIGN_BRIEFS.md                     this file
      08_scripts/
        17_ref_views.py                    vanilla + house reference renders
        18_variant_lib.py                  Host / deform / delete / render
        18b_paint.py                       texture storytelling (system python)
        19_build_variant.py                build one variant from JSON
        21_contact_sheet.py                contact sheets (large + 128 px)
        variant_configs/v1..v5_*.json      the five recipes
      03_blender/sentinal_concept_*.blend  five self-contained blends
      04_textures/Sentinal_<name>_Albedo.png
      02_progress_photos/05_variants/
        contact/contact_sheet.png          360 px row + 128 px row
        contact/contact_sheet_128.png      the true game-distance test
        <name>_views/  <name>_turn/  <name>.gif
