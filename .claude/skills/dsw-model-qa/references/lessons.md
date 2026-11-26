# Lessons (each one cost a pass)

## Seeing the problem
- **The game culls back faces; Blender's render does not.** Every QA render culls (`gap_check.py` always does, `turnaround.py --cull`).
  Inward-wound faces and the inside of open shells look solid in Blender and are see-through in game.
- **Scan poses.** Ranger RM11: rest pose 12 candidates, poses 26; the nape and pouch gaps never showed at rest.
- **Enclosed transparency ≠ defect.** About two thirds of the candidates were natural space (between legs, arm/body, handle loops,
  fingers). Localise (`at` list) before fixing anything.
- **`scene.ray_cast` hits `hide_render` objects.** Remove the weapon (`--drop`) instead of hiding it, or the localisation names it.
- **The anim camera names lie.** Clips turn the unit to face +Y, so in `anim_shots.py` the "back" camera sees the chest. Check which side a
  crop shows before describing it.
- **`clip_test.py` penetration counts that are the same in every clip are layering by design** (hood lining inside the shell, mask edges
  under the hood), not motion problems. Look at the frames.
- **`anim_gif_frames.py` renders every frame** (its `--frames` is ignored): a long Idle took hours. Use `anim_shots.py --frames N` for checks
  and keep the every-frame script for the one clip you turn into a GIF.

## Fixing it
- **Grafted parts carry their import transform.** The builders' `bisect_below/above` cut in object space; a "cut at z 1.58" on a graft cut
  nothing (RM8). `fit_ops.cut` is world space.
- **A point-centred push slides cloth.** `push_out` from one centre moved the snood's front verts down the chest into a bib; the
  "short snood" cut appeared not to work because the push ran after it. Use `axis=True`.
- **Per-vertex weights tear props.** RM12 copied the sash weights onto the pouches vertex by vertex; the thin strap got different weights from
  the pouch body and bent away (a worse gap than before). `rigid_weights` fixed it.
- **Unwelded mirror seams.** Gurney's halves are not joined at x = 0: open loops run along the centre line and open as the back bends.
  `cap` welds them; when it reports 0 faces filled, the weld alone closed it.
- **Removing a part uncovers what it hid.** The Ranger's removed pauldrons had covered the collar/torso panel junction at the nape; in Run
  the two panels (neck vs spine bones) parted. `weld_weights` on the junction.
- **One change per pass, and compare.** A fix can create a new gap elsewhere; `gap_compare.py` lists NEW candidates explicitly.

## Running in a cloud session (no Blender install, no display)
- `pip install bpy==5.2.4` (matches the desktop Blender 5.2) into a venv; `scripts/bl.py` stands in for `blender -b file --python script -- args`.
- EEVEE needs OpenGL: `apt-get install -y libegl1 libgl1-mesa-dri libegl-mesa0` (Mesa software GL). Then renders work, ~25-40 s each on
  4 cores. Without it use Cycles CPU (`BLENDER_EEVEE` fails with `libEGL.so.1` missing).
- `pip install scipy` into the same venv for `gap_check.py`.
- Heavy runs (a gap scan is 24 renders) go in the background; wait with a loop on the log, not with sleep.

## Path traps in this repo (found 2026-11-26)
- `dsw-new-unit/scripts/units.py` and copies in unit projects compute `MI` (model_inputs) one or two folders off since the projects moved
  under `model_projects/thorvald/`; texture lookup by name then fails silently (magenta renders). Scripts set `units.MI` at run time.
- HMD-converted FBX (`hmd2fbx.convert`) have texture nodes pointing at non-existent paths: wire textures yourself (magenta otherwise).
- Unit projects' `03_variants_trooper.py` adds the kitbash skill path from its old location; drivers add the right one.
