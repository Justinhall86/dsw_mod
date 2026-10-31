# Thorvald Frigate - working notes

**Audience:** an AI agent resuming this. **Game slot:** `A_Frigate` (unit) -> model `A_Frigate`
(currently `inherit: Kraken`, prefab `Vehicle/Atreide/Kraken/Prefab_Kraken.prefab`).

## Goal
Match the Shiro concept sheet `../thorvald_interceptor/01_input/reference_sheet_v2_frigate_jets.png`:
long charcoal slab hull, two banded copper turbine drums on stubby arms flanking the rear,
oxblood stripes, bone weathered plate, copper filigree, spine cannon. **House rule: only
pre-existing game parts, no hand-modelled primitives.**

## Decision log
- Three earlier folders attacked this ship: `thorvald_interceptor` (Wraith drum on 4 hulls),
  `thorvald_fighter` (Renegade copper recolour, keel fin removed), and this folder's v1-v6
  (hand-built dorsal kit - does not match the sheet and breaks the house rule; **deleted
  2026-10-29** along with its probe scripts and the primitives helper `dsw_kit.py`).
- Hull = **Renegade Frigate** (`model_inputs/Vehicle/Common/Renegade_Frigate`). The interceptor's
  "96 % asymmetric" verdict was a test bug (mirrored the wrong axis); it is perfectly
  symmetric about Y. Overlord rejected by eye (bulbous pod, twin spikes, red lights). Chronos
  is a genuine asymmetric prop. Kraken is a flat wedge.
- Renegade as shipped is a delta wing (10.2 x 9.35). Removing the wing panels
  (`|y| > 1.2`, `x < 1.36`) leaves the central spine (~2 wide, 6 long) + aft block + tail:
  a ~5:1 slab like the sheet.
- **Variant B (live):** also squash the aft block to 0.5x on Y so it is spine-width, and put
  the drums aft. Variant A (aft block kept full width, drums forward) reads as a T-bar - rejected
  and deleted; it survives only as the top row of `02_progress_photos/CONTACT_hull_AB.png`.

## IMPORTANT: orientation (corrected 2026-10-29)
**The Renegade's nose is +X**, not -X as `../thorvald_fighter/SPEC.md` says: the thin guns and the
cockpit-like dark box are at +X, the wings sweep wide at -X, and the wing-tip nozzles open toward -X
(engine glow). So the frigate's rear/exhaust is -X (the former "open U" is the exhaust end, now plugged),
the drums sit at the rear with louvre faces toward +X, and bells point -X. Verified only from the
vanilla preview renders - **confirm facing in game** (flip drum `rot_deg` 180 and `pos` x if wrong).

## Live build
```
blender -b --factory-startup --python 08_scripts/20_build_variant.py -- 01_input/frigate.json
```
Writes `03_blender/frigate_v13.blend` + renders `02_progress_photos/frigate_v13/`
(tq, top, side, rear, front, tq_rear; contact sheet `CONTACT_v12.png`). Blender 5.2.
Builder = interceptor builder plus: per-piece `lateral` axis, `seat {at, overlap}` + `pos`, `stretch`;
host `host_remove` / `host_squash`; and **`grafts`** - cut any donor part (`box_abs` | `disc_abs` |
`cyl_abs [c1,c2,r,lo,hi,axis]`), `scale` (float | per-axis in donor frame), `rot_deg`, `at [x,y,z|null]`
(host-centred; null z = raycast onto the deck), `sink`, `mirror_y`, `role`. Donors auto-resolve by name
(`donor()`), e.g. `spaceshuttle`, `vernius_harvester`. **Grafts cut `strict` by default (all verts inside):**
centroid-only cuts keep huge donor triangles whose corners shoot out as black spikes.
`pieces` (drums): Wraith disc `[-3.36,-3.40,0.95,1.30,3.90]`, `min_island_faces 12` (24 deletes the intake disc).

### Donor survey tools
`30_grid_survey.py -- <donor> <outdir> [--box ..|--cyl ..] [--strict] [--px N]` then
`31_grid_overlay.py <outdir> <donor> [step]` -> top+side renders with a labelled world-coordinate grid;
use it to choose cut boxes (and `--box --strict` to preview a cut). Donor catalogue (tinted tq renders)
was reviewed 2026-10-29; best sources so far: Wraith dome + pod, Spaceshuttle stepped top stack,
Renegade nozzle tubes. Tried and rejected: Tank turret (thin skin only), Wraith ring arc (sliver),
Chronos deck block (flat emblem plate), Kraken hex plate (Atreides emblem), Vernius Harvester barrels
and Spaceshuttle vent (ragged shells), Ravager Shuttle side cut (tiny nub).
Folder: `01_input` = vanilla Renegade copies (source for `05_recolour_copper.py` -> `04_textures`),
`02_progress_photos/hull_survey` = Renegade island map, `12_make_gif.py`/`10_turntable.py` for GIFs. Not in git.

## Texture pipeline (done 2026-10-29) -> `03_blender/frigate_v13_textured.blend`
Run in order, from this folder:
1. `blender -b 03_blender/frigate_v13.blend --python 08_scripts/40_dump_geo.py -- 04_textures/_geo.npz`
2. `python 08_scripts/41_make_atlas.py` -> `04_textures/Thorvald_Frigate_{Albedo,MetallicGlossAO,Normal}.png`
   (1024^2 = 2x2 cells of 512: 0 Renegade hull, 1 Wraith drum, 2 Wraith dome, 3 Shuttle stack).
   Each cell is "baked" with the 3D position/normal of every texel so stripes/plates are placed in 3D
   (oxblood bands at 11.5-15% and 21.5-24.5% back from the nose; bone plate = up-facing light panel on the spine
   and the shuttle top plate; bone weathering band + patches mid-drum; copper edge trim = bevel highlights).
   Tiled UVs (host u up to 1.99) wrap back into 0..1; no triangle straddles the seam.
3. `blender -b 03_blender/frigate_v13.blend --python 08_scripts/42_apply_atlas.py -- 03_blender/frigate_v13_textured.blend 02_progress_photos/frigate_v13_textured --turntable 36`
   Remaps UVs, joins ONE mesh (4,192 tris) with ONE material, toolkit wiring saved; game-like preview wiring only for renders.
GIFs: `02_progress_photos/gif/` (v12 palette preview, v12 textured). `12_make_gif.py <frames> <out.gif> 70 <maxw>`.

## v12 changes from the user's painted reference (2026-10-29)
Hull width x1.2 (`host_squash` y 1.2 before the nose-block squash); drums smaller/shorter (size 2.1, stretch 1.0)
and dark gunmetal with copper rings; front guns enlarged with `host_scale` (local scale of the barrel rod, applied
AFTER the squash so thickness isn't halved); two-tier superstructure (grafts stack on earlier grafts via raycast);
texture: top colour == side colour (flat polished charcoal), no bone plates, no rust/weathering, polished MGAO.
Preview roughness floor lowered to 0.32 in `42_apply_atlas.py` so metal looks polished.

## v13 (2026-10-29): removed the doubled stack, simpler copper
Single superstructure (the v12 two-tier stack was two copies of the same Shuttle plate stack and looked duplicated);
it is now full hull width (scale [1.65,1.45,2.0], sink 0.42 so the ragged cut edge is buried in the hull) and charcoal like
the hull. Fine copper is gone: no bevel-highlight edge trim; copper = bold accents opened with a 5-11 px morphological
filter + two broad hull straps + domes + jet rings, so it still reads zoomed out in an RTS. `42_apply_atlas.py` also renders
`tex_stack_*` closeups of the superstructure.

## GAME EXPORT (done 2026-10-29, installed, NOT yet tested in game)
Slot: model `A_Frigate` (unit `A_Frigate`, the Thorvald/Atreides utility frigate, formerly the Kraken). Only the model row changed:
mesh -> `VehMOD/Thorvald_Frigate/Prefab_Thorvald_Frigate.prefab`, rigName 15 -> 29 (RenegadeFrigate), inherit Kraken -> RenegadeFrigate
(Run/Idle/FightIdle/Death anims from `Anim/RenegateFregate/`), scale 1.6 -> 1.2. `python 08_scripts/52_cdb_edit.py --revert` restores the Kraken.
Pipeline (from this folder): 50_export_fbx.py (Blender; skin to vanilla armature, frame restored via scene["frigate_offset"]) ->
`python 08_scripts/51_convert_vehicle.py 05_fbx_export/Thorvald_Frigate.fbx` (toolkit, ref = vanilla Renegade HMD; writes
`<editor>/res/res/VehMOD/Thorvald_Frigate/` + copy in `06_game_ready/`) -> 52_cdb_edit.py -> `C:\dsw_mod\D4XEditor\res\repackage.py --quiet`.
Verified: HMD valid, raw bounds in the vanilla Renegade frame (nose = raw -Z), skeleton B_ROOT/B_Body, normals 99.9%, all 8 files in the installed pak.
To test: start a NEW game, check game.log for `[DataCache] Modified data.cdb`, recruit the Kraken-slot frigate (Thorvald/Atreides, Guild Favor).
Look at in game: facing (nose should lead; if it flies backwards rotate the ship 180 deg about Z in 50_export_fbx.py), muzzle/missile origin
(prefab `Muzzles` group, placed at nose-top and yawed 180 deg from the Kraken's), engine/reactor FX (still the Kraken's `FX_Kraken_Reactors` attached to
B_Body, so they sit at Kraken positions), sounds (RenegadeFrigate/Ravager movement sounds + Kraken select/voice lines), unit text still says "Kraken".

## Done / known gaps (in order)
Done: hull trim + squash, rear drums (facing +X), bells + engine plug, shuttle plate stack, two Wraith domes,
single-material texture atlas with the sheet's palette (charcoal / copper / oxblood / bone).
1. Geometry still plain vs the sheet: no arms/hoses between drums and hull, no flank armour plates / ladder grille /
   spine cannon (Renegade's own guns are at the nose; Chronos/Tank cuts failed).
2. Texture polish: bone patches on the drums are bright/blocky; hull reads very dark; stripe positions were
   estimated from the sheet, not measured.
3. Faint copper fuzz on drum rims (thin strut fragments).
4. (superseded: export is done, see GAME EXPORT above) was: the merged mesh has no armature/`B_Body` skin (re-skin with the rest-space
   transform trick in `../thorvald_fighter/SPEC.md`), then FBX (Y fwd, Z up) -> HMD toolkit -> `data.cdb`
   `A_Frigate` -> pak. Precedent `../sentinal`. Confirm nose direction in game first.

## Corrections made on 2026-10-29
Fixed the Renegade symmetry verdict in `../thorvald_interceptor/HANDOFF.md` and `modeling.md` 15.5.
