# thorvald_sworn_sword: Sworn Sword

A new House Thorvald unit built on the Thorvald Trooper v13 (`thorvald_trooper/Final/model/Thorvald_Trooper_v13.blend`).
The user's brief (2026-11-08) asked for these changes:
- Remove the kasa hat and the face wrap.
- Remove the apron and kama.
- Add a waist wrap with a sash hanging on one side.
- Add a samurai mask, a simple domed helmet and a horsehair tail.

References are in `01_input/reference/`. The user's Meshy sculpts are in `01_input/meshy/`. They are untextured and have no UVs, so they are used for shape and proportion only.

**Stage: S9 preview build after the quality pass. Not exported.** No HMD file, no `data.cdb` edit and nothing installed.

## Feedback on S4, and what changed

The user asked for:
- The Gunner mask, modified to look like a menpo.
- A less wide waist wrap.
- A more detailed helmet.
- A critical quality pass on every new part.

`08_scripts/11_build.py -- --tag S9` does all of this. It replaces `10_build.py`, which made S1–S4 and is kept for history.

## Parts
All new parts share one new material, `Mat_SwornKit`. It has a 2048 atlas with regions for the tail, sash, wrap, mask and helmet. The `REG` table in the script lists them.

| Part | How it is made |
|---|---|
| Hat, apron, kama | `TrooperHat` deleted. In `DuncanFill_sash` everything goes except a strip of the front apron at x −0.005 to 0.100, which becomes the sash. `DuncanFill_legs` comp 4 (Duncan's apron and kama) and comp 8 (back skirt) are deleted. Comp 7 is the groin and must stay. |
| Sash | The apron strip, extended 13 cm toward the knee with an angled end (the +x side is longer). It moves to the kit with planar UVs. Three vertical folds, darker edges with copper stitching. Its skin weights are its own. |
| Wrap | New geometry, not the Duncan band. It runs from z 1.262, just under the chest-plate rim (Gurney's bottom edge is at 1.260), down to z 1.045. Its radius comes from ray casts against Gurney at the top and the legs at the bottom; the rays start at a radius of 0.34 so they can't hit the A-pose arms. The rust wrap sits above z 1.125: six overlapping layers that each rise slowly and drop sharply, running slightly diagonal. Below that is dark trouser cloth, which keeps the visible wrap narrow; its hem dips 4.5 cm at the front and back centre to cover the crotch. Weights are copied from the old belt band by nearest vertex; the bottom rings are blended halfway toward the leg-top weights. |
| Mask | Gunner head-bone comps 0 and 1 (the mask halves) and 6 and 7 (the cheek studs, scaled to 0.55 as cord hooks). The red skull band is cut off with clean planes at donor head-local y > −0.03 and z > 0.08. The mask is moved from the donor's head bone to the trooper's and scaled to 1.06 × the face's half-width. The menpo shape adds a nose ridge (12 mm), a jutting chin (7 mm) and flared lower cheeks (9 mm). The Gunner's own painted texture is transferred into the kit and recoloured black lacquer with a gloss highlight. The studs are copper, and the mouth is oxblood with ivory teeth and snarl creases. |
| Helmet | A surface of revolution:<br>- Profile: kettle dome (height 1.30 × radius) with 8 raised ribs, a raised brow band with 16 copper rivets, a slim rolled copper brim and a copper socket.<br>- Fit: over the skull with a 12 mm margin; the brim is tilted 9° (z 1.895 at the front, 1.855 at the back).<br>- Paint: hammered gunmetal, with rib crests and band edges worn lighter.<br>- Badge: the trooper's gear emblem at 0.75 scale on the front.<br>- Skin: 100% B_HeadJ. |
| Tail | Swept along the Meshy path. It rises out of the socket (rise 9 cm), arcs back 20 cm, then falls; its y never moves back toward the body, and it hangs off the shoulder blades to z 1.47. Section: clumped and flattened (thickness 0.5 × width; width 3.4 cm at the root to 6.2 cm). A copper and black cord binding sits at 3.5–8.5% of the length. The paint runs from a dark root to lighter tips, with strand noise and a top-lit sheen. Weights blend from B_HeadJ through B_Neck01J to B_SpineTopJ, between z 1.98 and 1.66. |

**Shading:**
- **Ambient occlusion:** baked in Cycles (48 samples, distance 0.12) over all the kit parts with the body in place. It goes into the MetallicGlossAO blue channel and darkens the albedo.
- **Top light:** taken from the world normal.
- **Normal map:** from painted height (strands, folds, rivets, hammered plates).
- **Metal:** brim, studs, rivets and cords are metallic 0.85–0.88; the dome is 0.62; cloth and hair are 0.

**Budget:** 11,543 triangles without the katana; the trooper's ceiling is 12k. The kit is helmet 1,720, wrap 1,920, tail 1,120, mask 345 and sash 105. Materials: Commando, Duncan, Gurney, Thorvald_Trim, SwornKit, plus the katana.

## Checks
- `20_render.py` with `sheet.py`: the A-pose sheet.
- `30_anim_test.py` with `anim_sheet.py`: five clips, front and back three-quarter views.
- `31_clip_check.py`: vertices that end up inside the body in each clip frame.

## Lessons (this session)
- Blender resolves relative render paths against the .blend's folder. Always pass absolute paths.
- Painting into an image that is already packed and then calling `pack()` keeps the OLD packed pixels. Write the paint to a new image.
- Blender renders a mesh with its **active_render** UV layer. After transferring a donor texture through a second UV layer, set the new layer to active_render and remove the donor layer, or the part renders with the wrong UVs. The S5 mask rendered white because of this.
- Ray casting for body radius from far out hits the A-pose arms. Start the rays inside the arms' reach (0.34 m at the waist).

## Machine note
Built on the D: PC (WORKHORSE), which has Blender at `D:\Blender Foundation\Blender 5.2`. This PC has no game install, D4XEditor or `extr`, so the export and install must be done on the main PC.

## 2.0: the minimal version (2026-11-08)
The user asked for a separate, easier-to-maintain version. 1.0 (S9, `11_build.py`) is kept unchanged.
Builder: `08_scripts/12_build_v2.py -- --tag <tag>`, about half the length of 1.0's. It saves `03_blender/SwornSword2_<tag>.blend` and `04_textures/v2/<tag>/`.
Renders are in `02_progress_photos/30_v2/`. **Current: 2.0e.**

- **No helmet, badge or tail.** The trooper's own hair shows. The tail code is still there behind `--tail`, and it roots at the crown.
- **Mask:** the Thorvald hero's (Karlin's) Feydakin half-mask, comps 1 and 2 of `thorvald_hero_1/01_input/donors/Feydakin/Feydakin_unused.blend`, with the hero's gunmetal paint (`thorvald_hero_1/04_textures/B_face_recolour/`) carried into the kit atlas.
  - Fit: moved head bone to head bone, fitted to the head width × `--mask-rel 0.88` (user: smaller).
  - The head surface is pushed in 4 mm behind the mask.
  - No sculpting.
- **Sash:** a generated ribbon, 6 × 18 quads. It starts 1.2 cm above the rust/dark split, so it comes out from under the rust layers and hangs **over** the dark band (user: the band must not sit on top of the sash). It is ray-placed 4 mm in front of the wrap and legs and hangs straight below bulges. Angled hem as in 1.0; weights from the original Duncan apron. The old apron strip is deleted: its fold and crotch holes showed the band through it.
- **Shin stripe:** the three thin dim-orange painted lines on `DuncanFill_legs` (Mat_Duncan; z 0.15, 0.24 and 0.33) are erased to the surrounding cloth. One thick copper band (z 0.200–0.255, `--stripe-z`, darker 4 mm edges) is painted in their place, in a new image `SwornLegs_Albedo`.
- Wrap and strip are as in 1.0.
- **Budget:** 9,019 triangles without the katana (sash 216, wrap 1,920, mask 624). Same materials as the trooper plus Mat_SwornKit.
- **Motion:** `30_v2/anim/2.0e_anim_sheet.png`, five clips, nothing tearing. The clip check (`31_clip_check.py`) has not been run on 2.0.
- Not exported.

## In game (2026-11-09, D: PC, Steam build 26405381)
- 2.0e exported: `08_scripts/90_export_game_fbx.py` -> `91_package_game.py` (prefix ThSws, the Trooper's props.json) -> `06_game_ready/CharMOD/Male01_ThorvaldSwornSword/`
  (check_hmd OK, 9,255 tris with the katana). `93_roundtrip.py sworn`: `02_progress_photos/game_ready_roundtrip/roundtrip_sheet.png`.
- data.cdb: `52_cdb_edit.py` (model row Th_SwornSword -> `CharMOD/Male01_ThorvaldSwornSword/Prefab_ThorvaldSwornSword.prefab`; unit desc says
  half-mask, no helm/tail); `53_cdb_trade_val.py` (Consignment Terminal trade line `val: 1`; without it game.log said ATTRIBUTES baking FAIL).
  Both have `--revert` and backups in `07_data_cdb/`.
- The units, trait, Council spawn and Plascrete-trade spawn were already in the cdb; the engine side is hlboot `bbbc3e16971969ce`
  (Renegades 30+31, Quinn resource_trades, our `tool/thorvald_ticks/thorvald_sworn`), built on the new vanilla `478027b5d76378ea`.
- Pak: `mod_files/stage_and_pack.py --install` (13 asset folders + data.cdb). game.log: `[DataCache] Modified data.cdb`, no baking FAIL.
  Not yet seen by the user in a match.
