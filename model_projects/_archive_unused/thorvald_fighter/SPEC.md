# Thorvald Fighter - Renegade frigate kitbash

A House Thorvald rebuild of the vanilla **Renegade** frigate: copper accents and no ventral keel fin.

Current build: [`03_blender/Thorvald_Renegade_v3.blend`](03_blender/Thorvald_Renegade_v3.blend)
Renders: [`02_progress_photos/`](02_progress_photos/) (`v3_*` current, `base_*` = untouched source for comparison).

## House rule for this project

**Every added element has to come from a pre-existing game model** - grafted geometry from another DSW unit
or vehicle, not primitives modelled by hand. That way the quality, texel density, shading and normals are
known-good and match the rest of the game.

A scratch-built attempt (four hand-modelled top components: scanner dish, crew capsule, blaster turret,
sensor blister) was made and then **rejected** on those grounds. It is kept for reference only:
`03_blender/Thorvald_Renegade_v2_scratch_REJECTED.blend` and
[`02_progress_photos/rejected_scratch_parts/`](02_progress_photos/rejected_scratch_parts/).

## Source

`model_inputs/Vehicle/Common/Renegade_Frigate/` - single mesh `Renegade_Frigate` (2109 verts / 1756 faces,
194 islands) skinned to `Armature` bone `B_Body`, one material `Mat_Renegade_Frigate` with albedo +
MetallicGlossAO + normal maps (packed into the blend). Nose points **-X**, tail **+X**. **(Corrected 2026-10-29: this looks backwards - the guns and cockpit box are at +X and the engine glow/nozzles at -X, so the nose is probably +X. Unverified in game; see `../thorvald_frigate/HANDOFF.md`.)**

The mesh is a low-poly backface-culled game asset: 2086 open edges / 200 boundary loops are normal, so hole
checks are always per-island plus a visual render, never a global open-edge count.

## Done so far - copper accents, fin removed

- **Recolour:** cool (blue) pixels only - hue 205 deg +/- 80, saturation smoothstep 0.05 -> 0.20 - are pushed
  to House Thorvald copper `#B26E3C` with the original value kept, so all painted shading and the metal
  masks survive. 2665 of 262144 texels change (1.0%); the accent set (cockpit stripe, wingtip markers,
  panel flashes) now reads copper/orange.
- **Fin:** the thin ventral keel (islands 56, 57, 68, 69 - centreline blade, x -4.64..1.34, hanging 0.5 below
  the hull) is deleted. The aft ventral box (islands 86, 87, 168, 171, 74, 75, 34, 35, 44, 45) is structural
  and stays.
- Proof: every kept island keeps exactly its own boundary edges, filled-face count 0, and the underside
  renders (`v3_below`) show a closed hull. Hull now 2057 verts / 1712 faces / 190 islands.

Output textures: [`04_textures/renegade/Thorvald_Renegade_Albedo.png`](04_textures/renegade/Thorvald_Renegade_Albedo.png)
and `Thorvald_Renegade_MetallicGlossAO.png` (normal map unchanged).

## Next - graft top components from existing models

Candidates to survey in `model_inputs/Vehicle/` for parts to lift onto the top deck (scanner/antenna array,
turret or gun mount, cargo or crew module, sensor blister): the other frigates and capital ships, plus any
turret/drone. Each grafted part keeps its own material and island structure, is skinned to `B_Body` with a
single weight-1 vertex group, and gets its own texture island rather than a flat UV patch.

## Palette

| | hex |
| --- | --- |
| Copper accent | `#B26E3C` |
| Dark hull | `#1E1B18` / `#322E2A` |
| Rust / ochre | `#70341E` / `#E87024` |

## Reproduce

All scripts run headless and never save preview-only lighting into the blend
(`preview_wiring` from `thorvald_vehicles/08_scripts/`):

```
blender -b --factory-startup --python 08_scripts/01_fin_and_copper.py  -- <source.blend> <Thorvald_Renegade_v1.blend>
blender -b --factory-startup --python 08_scripts/03_drop_scratch_parts.py -- <in.blend> <Thorvald_Renegade_v3.blend>
blender -b --factory-startup --python 08_scripts/views.py              -- <Thorvald_Renegade_v3.blend> 02_progress_photos v3
```

`02_top_parts.py` / `detail.py` / `dump_eval.py` belong to the rejected scratch attempt and are kept only as
a record of the rest-space transform trick below.

## Gotcha - the armature remaps skinned meshes

The ship's mesh data sits in the FBX import's rotated rest space; the `B_Body` skin matrix is a pure axis
permutation (`(1,0,0)->(0,-1,0)`, `(0,1,0)->(0,0,1)`, `(0,0,1)->(-1,0,0)`). Any grafted part modelled or
placed in world coordinates gets thrown off the ship by the Armature modifier - push its vertices through
`M.inverted()` before skinning (see `02_top_parts.py`).

## Not done yet

- Grafted top components (see above).
- FBX export / in-game integration (`05_fbx_export` is empty) - needs the HMD pipeline and a vehicle row in
  `data.cdb`.
- No turntable GIF yet.
