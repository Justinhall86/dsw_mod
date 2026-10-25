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
