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
