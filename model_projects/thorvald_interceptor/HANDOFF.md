# Thorvald Interceptor — Handoff / Working Notes

**Audience:** an AI agent resuming this task. Human prose is incidental.
**Status:** in progress. Four variants build cleanly and render; nothing is exported to the game yet.
**Last worked:** session paused mid-polish after fixing the drum-seating math.

Read this file top to bottom before touching anything. The "Traps" section is the
expensive part — every entry there cost at least one failed build.

---

## 1. The goal

Kitbash a **new fighter-class vehicle** for Dune: Spice Wars (D4X) from existing
vanilla game vehicles, matching a reference concept sheet, then eventually get it
into the game.

The user supplied **two** reference sheets. The second supersedes the first
(see §3).

The user's own suggestion, which turned out to be correct and is the core of the
current design: *"I think we can possibly use the jets from the smugglers frigate."*

---

## 2. TL;DR of where things stand

| Item | State |
|---|---|
| Project scaffold | Done |
| Donor inventory (16 vehicles measured) | Done — `01_input/donor_inventory.json` |
| Reference sheet v2 saved | Done — `01_input/reference_sheet_v2_frigate_jets.png` |
| Jet donor identified | **Wraith** (the Smuggler frigate) corner thruster pod |
| Hull donor(s) identified | Chronos (best visual) / Kraken (best topology) |
| Declarative builder | Done and working — `08_scripts/10_build_variant.py` |
| Four variants built + rendered | Done — `03_blender/*.blend`, `02_progress_photos/interceptor_*/` |
| Recolour pipeline | Done (fixed — see Trap 3) |
| Drum seating | Done (fixed — see Trap 5) |
| **Cannon / spine weapon** | **NOT started** |
| **Oxblood stripe decals** | **NOT started** |
| **Copper filigree detail** | **NOT started** |
| **Rear raised block / copper rim** | **NOT started** |
| **Thruster arms connecting drums to hull** | **NOT started — main visual gap** |
| **UV / texture bake** | **NOT started** |
| **HMD conversion / export** | **NOT started** |
| **data.cdb row / pak install** | **NOT started** |

The single biggest visual gap is that the drums **rest against** the hull rather
than being **joined to it by arms**. The reference clearly shows a stubby arm and
a copper hose running from each drum into the hull flank. Right now there is
nothing there. Fix that first (§7.1).

---

## 3. Reference analysis — what the target actually is

Two sheets exist. Compare them before designing anything.

- `01_input/reference_sheet.png` — **first** sheet. Four views. Slab hull, **four**
  big circular nacelles on outriggers (two per side), very wide stance.
- `01_input/reference_sheet_v2_frigate_jets.png` — **second/current** sheet.
  Three views (FRONT / SIDE / TOP). **Two** nacelles, one per side, mounted
  mid-hull on stubby outriggers.

The **v2 sheet is authoritative**. Variant C keeps a nod to the first sheet's
four-nacelle layout; everything else follows v2.

### Reading of the v2 sheet (this matters — do not re-derive it)

**FRONT VIEW**
- Central body is a **beetle/hexagonal face**: a dark faceted shell with a large
  copper-rimmed hexagonal recess in the middle, and a small copper **dome** above it.
- Above the dome, a stepped stack of dark plates with copper edge trim.
- Two **large circular turbine drums**, one per side. Each drum front face is a
  **copper ring** with a banded dark grille/louvre centre.
- A **thin copper tube/hose** loops from each drum down and inboard into the body's
  lower flank — clearly visible as a curved copper line.
- Small greeble cluster low on the body's left (some piping/nozzles).

**SIDE VIEW**
- Long **rectangular slab hull**, near-black charcoal.
- Forward section: flat slab with a **dark oxblood/maroon stripe** along the upper
  flank and a pale wear patch near the nose.
- Mid: a **raised block with copper vertical fins/ribs** — this is the ornate
  "spine" section. Warm copper tones dominate here.
- A **pale bone/cream weathered octagonal plate** sits over the mid/rear junction,
  copper-trimmed.
- Aft: a wedge tail with dark plating.
- A thin **spine cannon** runs forward along the top, ending in a small dark muzzle
  just above the nose.
- Drums are not visible in silhouette side view except as a hint at the rear —
  they sit inboard of the hull's top and bottom lines.

**TOP VIEW**
- Confirms **two drums**, one per side, mounted on **short stubby arms** that come
  straight out of the hull's flanks.
- Each drum is a **cylindrical barrel with horizontal banding**: alternating dark
  charcoal bands and **copper bands**, with **copper rims at both ends**, and a pale
  bone-coloured weathered band around the middle. Front end has a dark conical cap,
  rear end a dark divergent nozzle bell.
- The central body top is a dark complex plate with a **copper ladder/grille** panel
  aft and a small copper box near the front.
- A dark antenna/aerial sticks up on the right side of the body.

### Palette (measured from the sheet)

| Role | Hex (approx) | Notes |
|---|---|---|
| Charcoal hull | `#1a1a1d` | near-black, slight blue-cool cast |
| Copper | `#B26E3C` → `#A85A2A` | ornate filigree, rims, hoses, fins |
| Oxblood stripe | `#3a1414` | very dark maroon, low saturation |
| Bone/weathered plate | `#A89880` | desaturated cream, heavy wear |
| Dark nozzle cap | `#141416` | |

---

## 4. Hard-won technical discoveries

These are the load-bearing facts. Every one was established empirically in this
repo, not assumed.

### Trap 1 — HMD FBX stores BIND pose, and Y/Z are TRANSPOSED

**The single most important fact.** The game's HMD-converted FBX files store the
*bind pose* in `mesh.data.vertices`, not the shape you see when the file imports.
Worse, in bind pose the **Y and Z axes are swapped relative to the rendered pose**.

Verified on CarryAll:
- raw `mesh.data` bounds → `y -0.157..1.121`, `z -1.275..1.275`
- evaluated (depsgraph) bounds → `y -1.275..1.275`, `z -0.157..1.121`

So any coordinate you read off raw vertex data is wrong on two axes.

**Mandatory mitigation**, implemented in `import_and_flatten()` in
[10_build_variant.py](08_scripts/10_build_variant.py) and duplicated in
[12_isolate.py](08_scripts/12_isolate.py),
[13_render_donor.py](08_scripts/13_render_donor.py),
[11_islands_baked.py](08_scripts/11_islands_baked.py):

```python
dg = bpy.context.evaluated_depsgraph_get()
ev = o.evaluated_get(dg)
me = ev.to_mesh()
coords = [(o.matrix_world @ me.vertices[i].co).copy() for i in range(len(me.vertices))]
ev.to_mesh_clear()
for i, v in enumerate(o.data.vertices):
    v.co = coords[i]
# then REMOVE the armature modifier, unparent, and clear matrix_world to identity
```

After this the object's local coords **equal** world coords. All box/disc numbers
in the spec files are in that space.

The authoritative reference implementation with the long-form explanation is
`bake_pose_and_clear_armature()` in
[15_extract_and_graft.py](../sentinal/08_scripts/15_extract_and_graft.py).

### Trap 2 — only `*_real.fbx` imports

`model_inputs/Vehicle/**/**.fbx` (the plain ones) begin with the bytes `HMD` and
Blender refuses them. The importable copies are
`model_inputs/Vehicle/<Faction>/<Name>/preview_textures/<Name>_real.fbx`.

Also: every game FBX carries a **2 m `Cube`** bounds helper object. Delete it
before measuring or it dominates the bounds. `JUNK_NAMES` in
[blender_scene.py](08_scripts/blender_scene.py) covers `Cube, Camera, Light, Lamp`.

### Trap 3 — `ShaderNodeHueSaturation` `Hue` is an OFFSET, not an absolute hue

This produced a vivid **yellow** hull and a **lavender** drum in an early build.

Blender's Hue/Saturation node expects `Hue` to be a **delta** where `0.5` means
"unchanged". Feeding it an absolute hue (e.g. `0.585` for blue) rotates every
donor colour to a seemingly random result.

**Fixed** in `make_material()` in [10_build_variant.py](08_scripts/10_build_variant.py).
The current approach:
1. `Image Texture` (albedo, sRGB) → `RGBToBW` → per-vertex **luminance** (this keeps
   every painted seam, panel line and wear mark).
2. `MULTIPLY_ADD` with palette `gain` / `lift` to normalise luminance into a usable
   mid range.
3. `Mix (RGBA, MULTIPLY)` between the palette `RGB` and that luminance → `Base Color`.

Palette lives in the `PALETTE` dict in the same file:

```python
PALETTE = {
    "hull":    {"rgb": (0.030, 0.032, 0.038), "metal": 0.55, "rough": 0.52, "gain": 7.0, "lift": 0.14},
    "copper":  {"rgb": (0.440, 0.155, 0.048), "metal": 0.95, "rough": 0.30, "gain": 5.2, "lift": 0.10},
    "oxblood": {"rgb": (0.130, 0.022, 0.022), "metal": 0.35, "rough": 0.50, "gain": 7.0, "lift": 0.14},
    "steel":   {"rgb": (0.180, 0.185, 0.205), "metal": 0.85, "rough": 0.38, "gain": 6.0, "lift": 0.12},
    "bone":    {"rgb": (0.330, 0.290, 0.230), "metal": 0.30, "rough": 0.55, "gain": 6.0, "lift": 0.12},
}
```

`rgb` values are **linear**, not sRGB. Keep them linear.

### Trap 4 — connected-component ("island") selection is useless for cutting

These hulls are **hundreds of unwelded separate islands**. Measured counts:
Wraith = **196** islands, CarryAll = 152. Picking a "part" by island id gets you a
single rivet, not a nacelle.

Cut by **world-space geometric primitive** on face centroids instead. Two are
implemented in [10_build_variant.py](08_scripts/10_build_variant.py):

- `cut_box(objs, (x0,x1,y0,y1,z0,z1))` — absolute box.
- `cut_disc(objs, (cx, cy, radius, z0, z1))` — vertical cylinder, **preferred for
  round parts** (see Trap 5 note on why).

A box is the wrong tool for a cylinder. The Wraith's drum has struts welded to it
at the corners; any box tight enough to exclude the struts also shaves the drum,
and any box loose enough to keep the drum drags in torn strut stubs that render as
**black shards**.

### Trap 5 — cut fragments read as "torn black metal"

Two distinct causes, both fixed:

**(a) Fragment islands.** A cut that severs welded detail leaves a handful of thin
triangles floating in mid-air. Through them you see the *inside* of the shell,
which is what reads as broken metal.
→ `drop_fragments(objs, min_faces)` deletes any island with fewer than N faces.
→ Driven by the per-piece key `min_island_faces` (default 8; 12 is used for the
drums, which drops 15 islands / 93 faces from the raw disc cut).

**(b) Sliced detail crescents.** A disc radius of `1.35` on the Wraith drum caught
the gas-tube collars that sit ~`1.13` out from the drum centre, slicing them into
floating **"C" shaped crescents** that orbit the drum in the front view.
→ **Fixed** by tightening the disc radius to `0.95`, which excludes the collars
entirely. The cost is that the drum now comes alone, with no arm.
→ See §7.1 — the arm needs a *separate* piece, not a wider cut.

**(c) Optional hole sealing.** `seal_holes(objs)` runs
`bmesh.ops.triangle_fill` over boundary edges to cap the cut. Present but
**deliberately off by default** (`seal` defaults to `False`) — it was tried and
made the result worse in combination with the fragment problem because it caps
loops that should not be capped. Revisit only if a hole is actually visible.

### Trap 6 — the drums are NOT symmetric about their own axis, and neither is the donor

Two separate facts:

**(a) `mirror` applies a scale of `-1` on the mirrored copy and then
`recalc_normals()`.** This is correct and works, but a mirrored piece is a
**mirrored clone of the same cut**, not a second independent cut. Consequences:
- only the `+x` drum is ever cut from the donor;
- if that drum itself is asymmetric (it is slightly — the strut boss is on the
  inboard side), the mirrored copy has the boss on the *outboard* side;
- because the whole corner quadrant is diagonally symmetric in the donor, the
  `+x/-y` corner is a *different* corner from `+x/+y`. We cut `-x,-y`.

Accept this. Trying to cut two separate corners introduces more seam trouble than
the tiny boss asymmetry is worth.

> **CORRECTION (2026-10-29):** the table below is wrong for any ship that is not long
> on **Y**. `14_symmetry.py` only mirrors across X, so it measured the Renegade Frigate
> (long on X) nose-against-tail. Mirrored on its real lateral axis (Y) the **Renegade is
> 0.0 % unpaired = symmetric**. Chronos is genuinely asymmetric (89.5 % on X, 69.7 % on Y).
> Variant D's drums also landed on the nose/tail for the same reason (it mirrored on X).
> The frigate build now lives in `../thorvald_frigate/` (Renegade spine + Wraith drums,
> `08_scripts/20_build_variant.py` with a `lateral` axis per piece).

**(b) The host vehicles are frequently asymmetric props.** Measured with
[14_symmetry.py](08_scripts/14_symmetry.py) — this is a real, decisive result:

| Donor | Unpaired grid cells | Verdict |
|---|---|---|
| **Kraken** | 0.0 % | **symmetric** |
| **Banshee** | 0.0 % | **symmetric** |
| **Overlord** | 0.0 % | **symmetric** |
| **Hawk** | 1.3 % | **symmetric** |
| Chronos | **89.5 %** | **ASYMMETRIC PROP** |
| CarryAll | 94.8 % | ASYMMETRIC PROP |
| Renegade Frigate | **96.2 %** | **ASYMMETRIC PROP** |

**This is the most important open design problem.** The Chronos is currently the
hull for variants A and C because it *looks* closest to the reference (near-black
charcoal, aft raised block). But it is a **one-sided prop**, ~90 % non-mirror-
symmetric. Mounting a symmetric pair of drums on it produces a visibly lopsided
ship — you can see it in
`02_progress_photos/interceptor_A_reference/interceptor_A_reference_top.png`:
the left drum sits proud of the hull, the right one is half-swallowed.

Options for the next agent, in order of preference:
1. **Switch A/C to Kraken or Hawk** and accept the hull is not charcoal (recolour
   solves that anyway). Kraken is 0 % asymmetric AND only 520 tris.
2. **Mirror-copy the Chronos hull itself**: cut the `+x` half, mirror it, and join.
   Gives a synthetic symmetric Chronos. Risk: the hull's centreline detail (the
   raised block is off-centre) would double up and look wrong.
3. **Accept the asymmetry** and design the ship as intentionally asymmetric. The
   reference is symmetric, so this fights the brief.

### Trap 7 — `mount` as a fraction of half-extent cannot seat a part

Original `mount` was `[fx, fy, fz]` = fractions of the host half-extent, with an
`embed` amount subtracted along the target direction. This is unstable: the result
depends on the **piece's own size** as well as the host's, so the *same* mount
number buried a long piece and left a short one floating. It produced both the
"drums float in space" and the "drums are buried inside the hull" failures in
successive builds.

**Fixed** by introducing an exact `seat` key, implemented in `make_piece()` in
[10_build_variant.py](08_scripts/10_build_variant.py):

```json
"seat": {"axis": "x", "overlap": 0.45}
```

Semantics: place the chunk so its **inner face sits `overlap` units inside the host
half-extent** on `axis`; everything else sticks out. The cross-axis position still
comes from `mount`'s `y`/`z` components.

**Bug encountered and fixed while implementing this:** `shift` was signed, and the
caller then multiplied by `sign` again → both drums landed on the `+x` side and only
**one drum rendered**. Renders showed a single nacelle. If you ever see "only one
piece appeared", check for a double-applied sign first.

### Trap 8 — texture paths: `preview_textures` uses lowercase names, `Image Texture` uses `_Albedo`

Two different naming conventions coexist on disk:

- `preview_textures/albedo.png`, `mgao.png`, `normal.png` — lowercase, used by the
  preview pipeline ([13_render_donor.py](08_scripts/13_render_donor.py)).
- `<Name>_Albedo.png`, `<Name>_MetallicGlossAOEmiss.png`, `<Name>_Normal.png` — in
  the **parent** dir, used by `texture_paths()` in
  [10_build_variant.py](08_scripts/10_build_variant.py).

Verified present for Chronos, Wraith, Kraken, Renegade_Frigate. Note the MGAO file
is `_MetallicGlossAOEmiss.png` (with `Emiss`), not `_MetallicGlossAO.png`;
`texture_paths()` tries both.

The FBX material nodes point at **dead paths** — an un-wired render comes out flat
magenta. Because of this, `13_render_donor.py` was written to wire textures by hand
before rendering.

**Wire by socket, never by node name.** `blender_scene.socket_of()` resolves the
socket; a texture feeding a `Normal Map` node reports `Color` but the useful answer
is `Normal`. Also: **replace the image datablock, do not re-point
`node.image.filepath`** — setting the path and calling `reload()` keeps the old
packed pixels.

### Trap 9 — `MetallicGlossAO` layout is R=metallic, G=gloss, B=AO

The game reads it that way. Dumping the packed map straight into
`Specular IOR Level` is what makes an unwired preview look **washed out / filmy**.
`preview_wiring.gamelike()` wires it correctly:
`SeparateColor` → `Red`→`Metallic`, `Green`→`1-x`→`Roughness` (with a `0.62`
roughness floor), `Blue`→multiply into `Base Color`.

`pw.soften_world()` also forces world strength `1.0` with a neutral
`(0.62, 0.62, 0.64)` tint; the saved blends default to `1.8` bluish which veils
everything. Both are **preview-only** and must not be baked into an exported blend.

Called at the end of `build()` in [10_build_variant.py](08_scripts/10_build_variant.py),
after every material exists, before centring.

---

## 5. Donor data

Measured by [01_inventory.py](08_scripts/01_inventory.py), stored in
[01_input/donor_inventory.json](01_input/donor_inventory.json).

| Donor | size x × y × z | tris | symmetric? | notes |
|---|---|---|---|---|
| Chronos | 6.10 × 9.29 × 2.77 | 4510 | **no (89.5 %)** | best *look*; charcoal; aft raised block; asymmetric prop |
| Kraken | 5.97 × 7.99 × 1.86 | **520** | **yes (0 %)** | flat dark wedge; lowest poly; safest hull |
| Renegade_Frigate | 10.20 × 9.35 × 2.59 | 1756 | **no (96.2 %)** | long grey slab; asymmetric prop |
| Wraith | 8.46 × 8.53 × 6.07 | 8416 | — | **THE JET DONOR** (Smuggler frigate) |
| Banshee | 3.66 × 6.26 × 2.02 | 6032 | yes (0 %) | big blade wings |
| Hawk | 4.50 × 2.87 × 0.94 | 1297 | yes (1.3 %) | arrowhead |
| Overlord | 3.84 × 13.61 × 5.21 | 5800 | yes (0 %) | very long, tall |
| CarryAll | 4.30 × 2.55 × 1.28 | 3671 | no (94.8 %) | twin nozzles at **+X** |
| Ravager | 3.60 × 2.98 × 2.28 | 2028 | — | |
| Harpy | 2.85 × 3.20 × 2.30 | 3431 | — | |
| DroneS | 2.22 × 1.68 × 1.44 | 2480 | — | |
| DroneA | 1.90 × 1.43 × 0.88 | 2694 | — | |
| Hammer | 4.08 × 2.41 × 1.54 | 1761 | — | |
| Tank / Harvester / etc. | — | — | — | in the JSON |

### Wraith corner thruster — exact numbers (baked/evaluated space)

Donor bounds: `x -4.229..4.229`, `y -4.263..4.263`, `z -0.818..5.256`.

The pod in the `-x,-y` corner occupies:
- drum drum body: `x -4.23..-2.50`, `y -4.26..-2.53`, `z 1.34..3.80`
- drum axis is along **Z**; drum centre ≈ `(-3.36, -3.40)`, radius ≈ `1.05`
- two gas-tube collars at radius ≈ `1.13` (these are the crescents — exclude them)
- gas-tube arms: ids 1/2 (`x -3.89..-2.00`, `y -3.91..-2.05`, `z 2.14..2.90`)
  radiate inboard toward the ring

**Disc used in all four variants:** `disc_abs = [-3.36, -3.40, 0.95, 1.30, 3.90]`
→ `(cx, cy, radius, z0, z1)`, cuts **741 / 8416 faces (8.8 %)**, then
`min_island_faces: 12` drops **15 islands / 93 faces**.
Isolated piece measures **2.11 × 1.94 × 2.50**, 748 tris before fragment drop.

Full island dump: [01_input/islands_wraith.json](01_input/islands_wraith.json)
(raw survey) and `02_progress_photos/parts/isl_wraith_full_labels.json` (baked).
Text legend in `01_input/_wraith_parts.txt`.

---

## 6. File inventory — everything created in this project

Root: `C:\Users\justi\Python\dsw_mod\model_projects\thorvald_interceptor\`

> **Naming warning.** A sibling folder `model_projects/thorvald_fighter/` also
> exists. It is **NOT** this project — it is actually the *Renegade Frigate* project
> and is misnamed. Do not confuse them, and do not delete either. Renaming
> `thorvald_fighter` → `thorvald_renegade_frigate` is a known outstanding cleanup.

### `01_input/`
| File | Purpose |
|---|---|
| [reference_sheet.png](01_input/reference_sheet.png) | first concept sheet (4 nacelles) — superseded |
| [reference_sheet_v2_frigate_jets.png](01_input/reference_sheet_v2_frigate_jets.png) | **current authoritative reference** (2 nacelles) |
| [donor_inventory.json](01_input/donor_inventory.json) | measured dims/materials/bones for 16 donors |
| [variants.json](01_input/variants.json) | **the build spec** — edit this to change the ships |
| [islands_wraith.json](01_input/islands_wraith.json) | raw island survey of the Wraith |
| `_wraith_parts.txt` | text legend of the Wraith's baked islands (scratch but useful) |

### `08_scripts/` — the toolchain

| Script | What it does | Run it |
|---|---|---|
| [01_inventory.py](08_scripts/01_inventory.py) | measure every donor → `donor_inventory.json` | `blender -b --factory-startup --python 01_inventory.py` |
| [02_survey_islands.py](08_scripts/02_survey_islands.py) | island survey in **raw** space (superseded by 11) | — |
| [09_probe_box.py](08_scripts/09_probe_box.py) | render a translucent cage over a donor to *choose* a box | `-- <fbx> <out> <tag> --box x0,x1:y0,y1:z0,z1` (fractions) |
| [10_build_variant.py](08_scripts/10_build_variant.py) | **THE BUILDER.** assembles from spec, renders 5 views, saves .blend | `-- 01_input/variants.json` |
| [11_islands_baked.py](08_scripts/11_islands_baked.py) | island survey in **baked** space (the one to use) | `-- <fbx> [--min-faces N]` |
| [12_isolate.py](08_scripts/12_isolate.py) | cut one chunk and render it alone with its textures | `-- <fbx> <out> <tag> --box x0,x1:y0,y1:z0,z1 [--rot rx,ry,rz]` (absolute) |
| [13_render_donor.py](08_scripts/13_render_donor.py) | render a donor **with real textures wired** (fixes magenta) | `-- <fbx> <out> <tag> [--box ...] [--rot ...] [--px N]` |
| [14_symmetry.py](08_scripts/14_symmetry.py) | numeric mirror-symmetry test + width profile per y-station | `-- <fbx> [more.fbx ...]` |
| [blender_scene.py](08_scripts/blender_scene.py) | shared helpers: `reset_scene`, `setup_camera`, `render_to`, `wire_textures`, `socket_of`, `model_bounds`, `frame_camera_on`, `setup_render`, `setup_world`, `setup_lights`, `pack_all_images` | imported |
| [preview_wiring.py](08_scripts/preview_wiring.py) | `gamelike(mat)` wires MGAO correctly; `soften_world()`. **Preview only.** | imported |
| [parts_colour.py](08_scripts/parts_colour.py) | colour every island distinctly + render + print id/bounds/bone legend. Copied from `thorvald_vehicles/08_scripts/`. **Best tool for choosing cut boxes.** | `-- <fbx> <out> <tag> [--px N] [--min N]` |

Blender: `C:\Program Files\Blender Foundation\Blender 5.2\blender.exe`

### `03_blender/` — built scenes
`interceptor_A_reference.blend`, `interceptor_B_kraken.blend`,
`interceptor_C_quad.blend`, `interceptor_D_frigate.blend`
(`.blend1` files are Blender's automatic backups — ignore, do not delete.)

### `02_progress_photos/` — renders

**Start with [CONTACT_SHEET_variants.png](02_progress_photos/CONTACT_SHEET_variants.png)** —
all four variants × 4 views in one image. It is the fastest way to see the state and
it makes the asymmetry defect (§Trap 6b) obvious: look at the TOP row of A or D and
note the drums are not equidistant from the centreline.

| Dir | Contents |
|---|---|
| `hosts/` | 24 files — 6 candidate hosts × 4 views (`chronos_*`, `renegade_frigate_*`, `kraken_*`, `hawk_*`, `banshee_*`, `overlord_*`) |
| `pieces/` | 8 files — `wr_pod_iso_*` (drum alone) and `wr_corner_*` (drum + arms, attempt that failed) |
| `donors/` | 4 files — `wr_pod_*` textured drum |
| `parts/` | 18 files — rainbow island maps + label JSONs for carryall / wraith / chronos |
| `probe/` | 16 files — earlier box-cage probes (CarryAll, Wraith) |
| `interceptor_A_reference/` | 5 views of variant A |
| `interceptor_B_kraken/` | 5 views of variant B |
| `interceptor_C_quad/` | 5 views of variant C |
| `interceptor_D_frigate/` | 5 views of variant D |

### Empty, ready for the next stage
`04_textures/`, `05_fbx_export/`, `06_game_ready/`, `07_data_cdb/`

---

## 7. The builder, in detail

[10_build_variant.py](08_scripts/10_build_variant.py) — declarative. You never
hand-place geometry; you describe a spec and it assembles.

### Spec format (`01_input/variants.json`)

```jsonc
{
  "variants": [{
    "name": "interceptor_A_reference",
    "host": "chronos",            // key into DONORS
    "host_role": "hull",          // palette role for the host
    "res": 900,                   // render px
    "margin": 1.24,               // camera ortho margin
    "pieces": [{
      "donor":  "wraith",                                  // key into DONORS
      "role":   "copper",                                  // palette role
      "disc_abs": [-3.36, -3.40, 0.95, 1.30, 3.90],        // cx,cy,r,z0,z1 ABSOLUTE
      // OR "box_abs": [x0,x1,y0,y1,z0,z1]                 // absolute box
      "size":   3.05,                                      // longest dim after scaling
      "rot_deg": [90, 0, 0],                               // applied BEFORE mounting
      "mirror": "x",                                       // x | y | xy
      "seat":   {"axis": "x", "overlap": 0.45},            // exact surface seating
      "mount":  [0, 0.12, 0.02],                           // cross-axis fractions of host half-extent
      "min_island_faces": 12,                              // fragment cleanup
      "seal": false                                        // optional hole capping
    }]
  }]
}
```

`box_abs` and `disc_abs` are in the **donor's own baked space** — exactly the
numbers [11_islands_baked.py](08_scripts/11_islands_baked.py) and
[parts_colour.py](08_scripts/parts_colour.py) print. Do not guess them; print them.

### Pipeline inside `build()`

1. `bs.reset_scene()`
2. `import_and_flatten(host)` → bake pose, clear transforms
3. optional `host_cut`
4. centre host on origin, record `half = (mx-mn)/2`
5. host material from `texture_paths()` + `make_material(host_role)`
6. per piece → `make_piece()`:
   `import_and_flatten` → `cut_disc`/`cut_box` → `seal_holes?` →
   `drop_fragments` → normalise (centre, scale longest side to `size`) →
   `rot_deg` → for each mirror sign: clone → mirror+`recalc_normals` →
   `seat` or `mount` translate
7. `pw.soften_world()` + `pw.gamelike()` on every `Mat_*`
8. centre everything, report FINAL dims + tris
9. render 5 views (`front, side, top, tq, back`) → `02_progress_photos/<name>/`
10. `save_as_mainfile` → `03_blender/<name>.blend`

### Current variant state (as of pause)

| Variant | Host | Pieces | FINAL dims | tris | Read |
|---|---|---|---|---|---|
| **A_reference** | Chronos | 2× Wraith drum, size 3.05, seat x/0.45, mount y +0.12 | 9.67 × 9.29 × 2.77 | 5806 | closest to v2 sheet; **hull asymmetric** |
| **B_kraken** | Kraken | 2× drum, size 2.95, mount y +0.18 | 9.39 × 7.99 × 2.13 | 1816 | cleanest + symmetric; lowest poly |
| **C_quad** | Chronos | 4× drum, size 2.60, mount y ±0.34/−0.30 | 9.01 × 9.29 × 2.77 | 7102 | nods to first sheet's 4-nacelle layout |
| **D_frigate** | Renegade Frigate | 2× drum, size 3.05, mount y +0.06 | 13.77 × 9.35 × 2.59 | 3052 | long literal side-view read; **hull asymmetric** |

---

## 8. What to do next, in order

### 8.1 HIGHEST VALUE — connect the drums to the hull

Right now the drums **touch** the hull but have no arm. The reference clearly
shows a stubby arm plus a curved copper hose from each drum into the flank.

Cheapest credible fix: **add a second piece** cut from the Wraith's **gas-tube
arms**. Those are already the right shape (radial pipes) and share the Wraith
texture, so they recolour consistently.

Candidate arm islands on the Wraith (baked space, `-x,-y` corner):

| island id | verts | faces | bounds |
|---|---|---|---|
| 1 | 88 | 126 | `x -2.51..-2.00  y -3.91..-3.39  z 2.14..2.90` |
| 2 | 88 | 126 | `x -3.89..-3.37  y -2.56..-2.05  z 2.14..2.90` |
| 67 | 44 | 42 | `x -2.52..-1.99  y -3.91..-3.38  z 2.91..3.13` |
| 31 | 44 | 42 | `x -4.13..-2.60  y -4.16..-2.63  z 1.88..2.55` |

Proposed approach:
1. New piece in `variants.json`: `donor: "wraith"`, `box_abs` around island 1 and
   neighbours, e.g. `[-4.10, -1.95, -4.05, -3.30, 1.30, 3.25]`.
2. `role: "copper"` so it reads as the copper hose/arm.
3. `size` ≈ 1.6–2.2, `rot_deg` to lie horizontally, `mirror: "x"`,
   `seat` with a small overlap so it disappears into BOTH the hull and the drum.
4. Verify with [12_isolate.py](08_scripts/12_isolate.py) **before** rebuilding.

Alternative if the arms look wrong: model a simple arm shell by hand — but note
the repo convention is donor-derived geometry only, so a hand-modelled arm needs
its own justification.

### 8.2 Resolve the asymmetric-hull problem

See Trap 6b. Recommendation: **make B (Kraken) the primary candidate** and switch
A to Kraken or Hawk. The recolour palette makes hull colour irrelevant — a
charcoal Kraken will look like the reference once the palette is applied. That
removes a defect that currently cannot be fixed any other way.

### 8.3 Add the remaining reference features

In rough value order:

1. **Spine cannon** — a thin forward gun along the top. Donors: Chronos has
   `B_Cannon01..05` bones, Hawk has `B_Canon_L/R`, Banshee has `B_Canon`. A thin
   box cut from Chronos's cannon region (`x -3.30..-3.04, z 0.47..0.76` was one
   cannon island) scaled long and thin. Role `steel` or `hull`.
2. **Rear raised block with copper rim** — Chronos already has one
   (`x -0.52..1.99, y 1.93..2.62, z 1.02..1.76`); recolour role `copper` and it
   reads as the reference's ornate mid-block.
3. **Bone/weathered octagonal plate** — use `bone` palette role on a selected
   island. Kraken's large flat top face is a candidate.
4. **Oxblood stripes** — best done as a **material assignment** on selected faces,
   not geometry: assign `oxblood` role to faces whose centroid falls in a stripe
   band. Would need a small new function (`assign_by_band`) in the builder.
5. **Copper filigree** — hardest. Either accept the donor's own painted detail
   after recolour (already reads as panelling), or add thin copper band geometry
   from a donor ring.

### 8.4 Then the real pipeline

Once the shape is signed off:

1. **UV + bake** — the kitbash has multiple overlapping UV sets from different
   donors. Needs a single unified UV and a baked albedo/normal/MGAO set into
   `04_textures/`. Study the existing character pipeline
   (`atreides_test_roster/08_scripts/20_export_unit.py`) for the export/`rescue()`
   pattern, and see `model_projects/sentinal/` for a vehicle-scale precedent.
2. **Export FBX** → `05_fbx_export/`
3. **HMD Toolkit conversion** → `06_game_ready/`. Toolkit at
   `C:\Users\justi\Python\dsw_mod\HMD_toolkit\HMD_toolkit`.
   Verify with `check_hmd`.
4. **`data.cdb` row** → `07_data_cdb/`. Follow
   [howto_castledb_workflow.md](../../docs/howto_castledb_workflow.md)
   and copy the **Atreides template pattern**. A vehicle unit needs a `unit` row
   plus a `model` row; see how `S_Frigate` → `Wraith` is wired in §5.
5. **Pak build + install** —
   `C:\dsw_mod\D4XEditor\res\repackage.py --quiet`. It builds
   `res.compressed1.pak`; it **never touches `res.compressed.pak`**
   (`BASE_PAK` is read-only, `repackage.py:43`).

### 8.5 Do not forget

- **`modeling.md`** in the repo root is the running knowledge base. **Update it**
  with the traps from §4 — especially the Hue/Saturation offset bug, the
  demonstrate-asymmetric-donor table, and the `seat` pattern.
- **Clean up** `01_input/_wraith_parts.txt` if it is no longer wanted (it is
  referenced in §5, so keep it or update the reference).
- **Rename** `model_projects/thorvald_fighter/` → `thorvald_renegade_frigate`
  (it is the frigate project, not this one).

---

## 9. Commands you will actually need

```powershell
$B = "C:\Program Files\Blender Foundation\Blender 5.2\blender.exe"
$V = "C:\Users\justi\Python\dsw_mod\model_inputs\Vehicle"
cd C:\Users\justi\Python\dsw_mod\model_projects\thorvald_interceptor

# rebuild all four variants (renders + .blend)
& $B -b --factory-startup --python 08_scripts\10_build_variant.py -- 01_input\variants.json

# isolate one chunk to check a cut before committing to it
& $B -b --factory-startup --python 08_scripts\12_isolate.py -- `
    "$V\Smuggler\Wraith\preview_textures\Wraith_real.fbx" `
    "02_progress_photos\pieces" "wr_test" `
    --box "-4.10,-1.95:-4.05,-3.30:1.30,3.25" --rot "0,0,-45"

# textured single-donor render (use this to SEE a donor properly)
& $B -b --factory-startup --python 08_scripts\13_render_donor.py -- `
    "$V\Imperial\Chronos\preview_textures\Chronos_real.fbx" `
    "02_progress_photos\hosts" "chronos" --px 700

# is this donor mirror-symmetric? (run before choosing a host)
& $B -b --factory-startup --python 08_scripts\14_symmetry.py -- `
    "$V\Atreide\Kraken\preview_textures\Kraken_real.fbx"

# baked island survey (numbers for box_abs / disc_abs)
& $B -b --factory-startup --python 08_scripts\11_islands_baked.py -- `
    "$V\Smuggler\Wraith\preview_textures\Wraith_real.fbx" --min-faces 8

# rainbow island map - THE tool for choosing a cut region
& $B -b --factory-startup --python 08_scripts\parts_colour.py -- `
    "$V\Smuggler\Wraith\preview_textures\Wraith_real.fbx" `
    "02_progress_photos\parts" "isl_wraith" --px 900 --min 3
```

Filter Blender's noisy stdout: `2>&1 | Select-String -Pattern "BUILDING|FINAL|Traceback"`.
A build takes ~25 s for all four variants.

---

## 10. Honest assessment of the current models

Variant quality, judged by eye against the v2 reference:

**A (Chronos)** — Best colour match (charcoal). Drums read correctly as banded
copper turbine drums. Fails on **asymmetry**: in
`02_progress_photos/CONTACT_SHEET_variants.png` the TOP view shows the left drum
proud of the hull outline while the right drum is set further in — the hull is a
one-sided prop. The hull's own aft raised block is a good stand-in for the
reference's ornate mid-block. **If the hull were symmetric this would be the winner.**

**B (Kraken)** — Cleanest and most symmetric; drums sit evenly. Hull is a low-poly
wedge, so it lacks the reference's slab-and-steps silhouette, but it is only 1816
tris and recolours to charcoal convincingly. **Safest base to iterate from.**

**C (Quad)** — Most visually interesting. Four drums staggered fore/aft genuinely
echoes the first reference sheet and gives the ship a heavy industrial presence.
Still inherits the Chronos asymmetry (visible in the TOP view: the two port drums
and two starboard drums are not at mirrored offsets).

**D (Frigate)** — Longest and most literal side-view read, but the host is 96 %
asymmetric, the worst of the set, and at 13.77 units long it is oversized for a
fighter. In the contact sheet the starboard drum is noticeably further out than the
port one. **Deprioritise.**

**What none of them have yet:** the spine cannon, the connecting arms/hoses, the
bone octagonal plate, and the oxblood stripes. Those four features are what make
the reference read as *ornate imperial hardware* rather than *a hull with two
engines bolted on*. They are the remaining work.
