# Lessons and dead ends (so they are not repeated)

## Working with the user
- They judge by eye and want to SEE: send sheets/GIFs with SendUserFile, look at every render yourself first (Read the PNG).
- They circle problems on screenshots and expect iteration "until it no longer shows" - loop yourself, do not hand back half-fixed.
- Standing rules: never Sardaukar; kitbashes must REMOVE things (backpacks, belts, scarves, metal) as well as graft; "no scarf";
  they act on a reference image (here `ginaz_swordmaster_purple.jpg`: wine coat, gold braid, tall standing collar, rapier). Do the work, do not
  hand instructions; give a recommendation then let them choose.
- When the user names a thing the files do not have ("tailsword"), search inputs AND extracted assets, pick the closest and say so.
- The user may be reorganising `model_inputs/` while you work (files vanish): resolve by name, never restore.
- Another Claude session may be editing the same project folders (files change on disk under you): re-read before editing shared scripts.

## Blender / pipeline gotchas
| Dead end | Why | Do instead |
|---|---|---|
| anim frames all identical | Blender 5 layered action needs `action_slot` | set `action_slot = action.slots[0]` |
| hole in game, fine in Blender | game culls back faces | render with culling on (`view_culled.py`), fix winding |
| `bpy.ops.object.vertex_group_smooth` poll fail | no UI context headless | smooth weights manually (Laplacian over edges) |
| bmesh `faces.new` "face already exists" | same verts twice | own vertex grid for the second side |
| relative render paths land on drive root | Blender resolves vs `C:\` | always `os.path.abspath` |
| `bpy.data.objects.remove` while iterating | ReferenceError | collect into a list first |
| shell command > 2 min | tool timeout | `run_in_background`, then read the output file |
| sword appears twice | script run on a file that already had the sword | start from the sword-less blend |
| mesh cut leaves slivers | deleting faces at a height | plane `bisect` then clear one side |
| uniform pale "fringe" on cuts | UVs at texture seams | dilate masks 2 px; one skin texel for new patches |
| FBX "Invalid header" | game "fbx" files are HMD | `hmd2fbx.convert` first |
| MG channels re-wired -> grey metal coat | layouts differ per unit | keep importer wiring for previews |
| armpit fold under hard arm swing | fill weighted differently / arms contribute | weights from uncut base; do not strip arm weights |
| collar too short after cutting mantle collar | needed a design collar | hand-model it (`build_collar`) |

## Geometry rules of thumb
- Measure before cutting: bounding boxes + dominant bones per island (`comp_info`). Hypotheses by eye were wrong several times (the "nape
  ring" was a flare, not neck; the mantle hue ranges; which island was the blue shard).
- A removal that exposes inner layers shows the unit's under-layer colour (Warden coat went black) - decide if that is wanted.
- `clip_inside` needs rays from the spine axis; fine for torso fills, wrong for limbs.
- 27 iterations on the neck were mostly *diagnosis*: flat-colour per object + culled render + close-up strip would have found each problem in one pass.
  Run all three after the first build.

## Game / data
- `data.cdb` "does not round-trip exactly": only a trailing newline; use allow-inexact with a diff review.
- Takeover changes every recruit of that unit, including name/squad size; tell the user (they accepted it for the Warden).
- Textures: RGBA, alpha 255, per-material file names, `materials.props` entry per material (emissive 0.1 without an emissive map).
- Nothing has been seen in-game by the assistant (cannot see the screen) - always ask the user for the visual verdict.

## Lessons from the Neophyte and Master (2026-10-24 night)
- **Paint by 3D position, not by UV.** `rasterise()` in `21_neophyte_textures.py` / `30_master_textures.py` writes each triangle's UV footprint into per-texel
  arrays of rest-pose position + region id. Patterns (chest frogging bars = world-z bands, wrist wraps = distance to the wrist bone, hem filigree, cape hem) then
  land correctly on ANY donor UV layout. Tag regions on the base mesh in the recipe (`regions=` -> vertex attribute `reg`) BEFORE islands are deleted (ids shift).
- **Donor textures are low-res (256-512 px): fine patterns alias into noise.** Use thick, coarse lines (period >= 6 cm); a silver "speckle" in hair/beard looked
  like noise - use clean bands by position instead.
- **A long neck is cheapest to fix by lowering the head** (`head_shift_z`, vertices of head + neck tube in rest pose, ~4 cm) plus a short collar, not by
  scaling. Move any hand-modelled top-knot with it.
- **Glowing blue "eyeball" meshes** (Idualis heads, islands 33/34) are separate objects; delete them (`head_exclude`) rather than recolouring.
- **Hand-modelled cloth strip (sash tail)**: weight top 100 % pelvis fading to 55/45 pelvis/thigh at the hem so it follows the leg in Run; model both sides (own
  verts) so culling never hides it; point UV at an existing recoloured texel.
- **The Raider's "cowl" is its face mask** (islands 17/18), not a collar. Build collars by hand (`build_collar`, `COLLAR_N` for a short one).
- **The Mercenary's cape islands (13, 16) animate with the clips** (bones `B_Cape01-03`): a free cape for a hero; give them a `cape` region (dominant bone name contains Cape).
- **When told not to delete files**: `14_make_game_package.py` MOVES the converter's stray textures to `<project>/06_game_ready/<Model>_converter_strays/`.
- **New units should be ADDITIVE** (clone A_Trooper via cdb_tools `add-model`/`add-unit`), tested on a temp copy of data.cdb (`15_new_units_cdb.py` dry run). Taking over an
  existing slot (the Captain/Warden) is only right when the user wants the vanilla unit replaced. A cloned Trooper model entry carries `dynObjects: [Gun]`; drop it when the
  prefab has no Gun child. A single hero-like unit may need another wheel slot (cdb_tools picked pos 12; sectors are 0-11: check).
- **Shell quoting**: long Python heredocs containing triple quotes break the bash tool; write scripts with the Write tool and run them.

## Polish pass lessons (2026-10-25)
- **bpy image colour space**: set `image.colorspace_settings.name = "Non-Color"` BEFORE writing pixels; setting it afterwards clears the buffer (the maps came out all black and the
  chest lost its sheen).  `polish_lib.array_to_img` does it in the right order.
- **Judge in a GAME-STYLE preview**, not the FBX importer wiring: MetallicGlossAO colour -> Specular IOR Level is not what the game does.  `render_views.py --gamelike` / `preview_wiring.py`
  wires R metallic, G gloss (rough = 1-G), B AO.  Donor MG PNGs with low alpha (0.14) make that preview look dark; the shipped textures use alpha 255 (what we export).
  Do NOT save the game-style wiring into an export blend (the toolkit looks for the importer wiring): render from a copy.
- **Real gold = geometry + its own material**, not paint: buttons/toggles/rim in one `GinazHardware` object, `Mat_GinazGold` (64x16 textures: radial gradient albedo so a dome gets a highlight
  via UV u = distance from the centre; R 0.91 metallic, G 0.75 gloss).  Skin weights copied from the nearest surface vertex (`hardware.Surface`).
- **Anti-aliased painting**: coverage = clip((halfwidth - dist)/texel_footprint + 0.5); get the texel footprint from the rasterised position array (`polish_lib.footprint`).
- **Interlaced chain filigree** = two opposite-phase wave lines (`chain()` in 41): reads as embroidered scrollwork, far better than parallel waves at 512-1024 px.
- **Donor tan trim recoloured to gold becomes blotchy**: detect gold-hued texels in the region and recolour them to the base cloth before painting clean cords/piping.
- **Pak size**: the res tree is packed wholesale; unreferenced model folders still add to the pak (+16-19 MB each at 2048 Raider textures).
- **Overwriting a live unit's folder in the editor res tree changes what the NEXT repackage installs**; back the old folder up first (`_previous_installed`) and say so.
- **"Film" / washed-out look = preview lighting, not textures.** MG colour -> Specular IOR Level (importer wiring) + bright bluish world (1.8) veils everything. Check with a specular-off render (`film_test.py`
  modes diffuse/nospec/matte) before touching textures. Preview from matte wiring (`preview_wiring.py`: spec 0.12, rough floor 0.62, neutral world 1.0), via `make_preview_blend.py` PREVIEW blends. Never export from them.


## Thorvald Trooper (2026-10-26): bone-based swaps, flat-texel decals, shared texels

Built from the Commando with Mercenary forearms, Duncan legs/belt/sash, an Idualis02 half-mask head, a hand-modelled kasa hat and an emblem decal
(`model_projects/thorvald_trooper/`, recipes `T2_Trooper` / `T3_Trooper` in its `03_variants_trooper.py`).

- **Swap arms/legs by bone, not by island.** Commando/Duncan/Mercenary arms and legs are not separate islands; they are faces owned by `Shoulder/Elbow/Forearm/Wrist/Finger/Thumb`
  and `Hip/Knee/Ankle/Ball`. New recipe keys: `strip_bones` (+ `strip_outer`, `x_cut`) on the base and `match` (+ `match_outer`, `exclude_first`) on a fill. `bone_faces.py` lists
  what each bone owns. A face counts when 2 of its 3 verts match. All Male01 donors share the skeleton and their hip/shoulder joints line up, so no re-rigging.
- **Clavicle is shared with scarves and chest plates.** The Mercenary's clavicle bone owns its blue scarf and chest plate: take only the *outer* clavicle faces (|x| >= 0.2) and drop the scarf islands first.
- **Make a clean seam by plane.** `bisect_below` (new) cuts a torso at an exact height; a donor waist is lifted with `shift_z` to meet it. Cutting through a belt band leaves a sawtooth.
- **Stills lie about skinning: run the clips.** A decal built by matching coordinates back to vertex groups lost 30 vertices; they stayed behind in animation as streaks. Set weights per vertex while the mesh is built, and run `weight_check.py` (unweighted vertices per mesh).
- **Flat-texel decals need an unshared texel.** A hat or emblem points every face at ONE texel, so the recolour sets its colour. If that texel is also used by another part, the rule that runs first wins; the recolour now processes `hat` and `emblem` first.
- **Parts can share texels.** Duncan's tabard uses the same texels as his trousers; the legs claimed them and the skirt could never be a different colour. Sample each face's colour and re-point the ones to recolour at one flat texel (`retex_dark`). Classify by what a face is NOT (warm leather/gold, pale green) rather than by darkness. `image.pixels` is sRGB-encoded.
- **Pick colours by role, not hue.** Dark cloth is nearly neutral (saturation < 0.06), so hue rules skip it. Use value for near-neutral cloth.
- **`neck_extend` grabs every low boundary edge,** including the new cut edge of a clipped mask cloth, and stretches it down to the collar. Do not combine it with a clipped donor island; a stand collar is enough to hide the neck bottom.
- **A donor's "scarf" can be a neck gaiter.** Idualis02's red cloth (island 5) wraps the whole neck; `head_clip` (new) cuts an island below a height before the island ids shift.
- New helpers: `bone_faces.py`, `zbands.py` (z ranges where two parts overlap), `shot.py` (one orthographic close-up), `weight_check.py`.

## Thorvald Trooper v4 (2026-10-26): joining shoulders to a cut neck, and using an AI sculpt as a shape reference

- **Cutting a scarf off removes the shoulder slope too.** The cowl was also the trapezius. Leave it cut, then add a **yoke** (`build_yoke`): a double-walled loft from the collar ring out to the vest edge and pauldron bases,
  higher at the sides (`side_lift`), one flat texel, weighted SpineTop/Neck blending to the clavicle bones. Check from the top and the back, not only the front.
- **Shorten a neck by lowering the head** (`head_shift_z`) and shortening the stand collar; the hat follows because it is placed from the donor head's top.
- **An AI-generated model (Meshy etc.) is a shape reference, not an asset:** one fused 500k-vertex mesh, no UVs worth keeping, no texture. Open it with `--disable-autoexec`; a white material renders blank, so use `inspect_blend.py ... --clay`.
- **Carve a part out of a fused mesh by fitting it.** `extract_hat.py`: find the apex, fit the rim plane (PCA) to get the part's own axis (the sculpt's hat is tilted 5°, so a vertical-axis cone missed one side),
  measure the cone slope, keep vertices within a shell of the outer surface, level it, decimate. `meshy_profile.py` / `hat_profile.py` print the radius-vs-height profile.
- **Do not use the carved shell directly.** Where the sculpt fuses the part into the face it has holes. Read the profile from the intact sectors and rebuild a clean closed surface of revolution (`build_hat_profile`).
- New helpers: `inspect_blend.py`, `inspect_material.py`, `meshy_islands.py`, `meshy_profile.py`, `extract_hat.py`, `hat_profile.py`, `hat_preview.py`.

## Thorvald Trooper v5 (2026-10-26): auditing a kitbash for "choppy" geometry

- **Audit with back-face culling ON, from many sides.** `audit_views.py` (10 angles, whole figure or a close-up target) and `shot_multi.py` (6 sides of one spot) set `use_backface_culling` on every material, which is what the game shows. The front render hides slots and shards that
  the side, back, top and under views expose. `boundary_report.py` lists open loops per mesh (expected: hems, cuffs, soles; anything at a donor seam is a slot), `sliver_report.py` lists thin shard triangles.
- **Never cut a fragmented donor part at a plane.** A shoulder made of many separate pieces (pad plates, cloth strips) shreds when cut mid-way. Cut limbs at a joint, with the donors' bone boundary, and keep a whole part whole.
- **Cover a donor seam with a skinned band, and make the cut ends clean first.** `build_cuffs` (arm axis and radius from the vertices around the seam, not the bone heads, which did not match the mesh), `build_waist` (superellipse from the torso cross-section, restricted to |x| < 0.25 so the
  arms beside the waist are not measured). Plane-cut both parts with an offset each (sleeve end ragged further back than it looks: probe with the cut and read the face counts, 759 -> 759 means the cut found nothing).
- **Sample sizes by geometry near the seam, not by bounding boxes.** A slab across the arm axis also catches the torso; cap the radial distance. 18 vertices is too few: widen the slab.
- **Slivers:** `delete_slivers` (aspect >= 9, small area, above a height) removes the shards a bone-vote cut leaves; check `sliver_report.py` first so nothing real is deleted.
- **Proportion before polish:** a hat looked wrong because the head was small for the body (hat 3.4x head width vs 2.8x in the reference). Scale the head (`head_scale`, about the neck) before resizing the hat.
- **Hats are worn level or tipped forward.** An AI sculpt's hat was tilted back 5 degrees (front lifted); use `tilt` (positive = front lowered) instead of copying it.
- `run_t3.sh <tag>` rebuilds a recipe end to end (build, UV regions, recolour, apply textures); chain the steps in one script when iterating.

## Thorvald Trooper v6 (2026-10-26): swapping a mismatched head, then the upscale

- **A head from another art style looks pasted on** (different texture style, noisy low-res face, borrowed mask). Survey every head donor first (`head_survey.py` renders head + neck of each, front and three-quarter);
  the base unit's OWN head can already have what you want (the Commando has a cloth half mask and hair) and shares the body's atlas, which also removes a material.
- **Some heads have no neck** (they end at the mask). Raise the stand collar to the skull base at the back; a front-only height leaves a white band behind the head.
- **Scaling a part about an axis opens seams.** Slimming the shoulder + sleeve towards the arm axis detached the sleeve from the torso's armhole and opened slits at the armpit. Fade the scale to 1.0 where the part meets the body (`slim_ramp`) and cap any remaining small open loops (`fill_small_holes`, 4 to 8 edges, shoulder zone only).
- **A stricter cleanup filter can do harm.** Sliver aspect 6 deleted faces that bridged plate edges and cut white slits; aspect 9 with a small area is safe. Check renders after any deletion.
- **Layered pieces need rounder outlines than you expect.** Stacked yoke tiers with a large side-lift grew thin copper horns past the pauldrons; reduce the side-lift and the width.
- **The preview can invent "shine".** The importer wiring feeds the whole MetallicGlossAO colour into specular; judge shine in the matte game-style preview (`shot_game.py`) before touching a texture.
- **Upscale: merge duplicate material datablocks first** (`merge_materials.py`): each donor import brings its own `Mat_X.001`. The upscale paints a material using only the FIRST object (alphabetical) that uses it, and only on texels that object owns,
  so shared-flat-texel parts (hat, yoke, cuffs, skirt tabard) cannot be painted; paint real UV islands only (body, legs, arms).
- **Fix dtype in hooks:** `np.where(..., 1.0, -1.0)` is float64 and breaks `array_to_img` ("incorrect sequence item type: d"); cast to float32.
- **Budget:** add-on parts can eat a third of the triangles. Single-wall shells (the underside is hidden and culled), fewer segments, and dropping near-linear profile rings took 11,474 to 9,162 with no visible change.
- Chain the whole thing in one script (`run_final.sh`): rebuild, recolour, merge, upscale, previews, audit, compare. Guard `grep` with `|| true` under `set -e`.


## Trooper v7 lessons (trim atlas, caps, animation review)
- Flat-texel hacks cannot be painted: give custom parts real UVs in a TRIM atlas box layout (`trim_layout.py`) and paint in texture space.
- Pack the unit's materials into one 2048 atlas (quadrants + trim) with `atlas_pack.py`; abort if any UV is outside 0..1.
- Review with REAL clips x several cameras, culling ON, plus a 128 px squint. Rest-pose renders hid every problem found in v7.
- Cutting a sleeve for a cuff leaves open rings; when the elbow bends the hollow interior shows as dark flaps. Cap the rings (`holes_fill`, no new verts, so weights survive) and skin a small pad to the joint.
- When a kitbash removes the cowl/scarf, armpits open under raised arms: a cap dome 100% skinned to the shoulder bone closes them.
- `stretch_test.py` (edge length posed vs rest) finds torn geometry numerically; BVH queries must go through the object's inverse matrix (`clip_test.py`).
- Always copy `atlas_pack.py` args from the script header: it needs `--` args and runs inside Blender, not system Python.


## Trooper v8 lessons (rebuild instead of patching)
- If a kitbash needs caps, balls, rings and cuffs to hide holes, the base is wrong. Pick a donor with a COMPLETE upper body that matches the reference (Gurney:
  cuirass + layered pauldrons + whole arms) and change its proportions (`t5_shape.py`) instead.
- `obj_colours.py` (flat colour per object, culled, white background) and `islands.py` show what owns each surface and where nothing does. Run them first.
- A hand-built hood (`hood.py`) beats a donor head for masked designs: fit the radius per angle and height to the head verts plus an offset, then delete the hidden head faces.
- Cloth panels lofted from the body envelope (`skirt.py`, radius = max over the ring and everything above it) never tuck in; thin slabs survive culling.
- Recolour 512 textures on a 1024 upscale and soften class boundaries, or every plate edge stair-steps.
- `bisect_below` for a torso cut must be limited by |x|, or the T-pose hands vanish.
- Judge tone ONLY in the game-style preview: the neutral audit wiring adds a milky specular film that makes dark plates read silver.
