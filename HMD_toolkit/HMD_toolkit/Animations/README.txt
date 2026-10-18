================================================================================
 HMD ANIMATION <-> FBX PIPELINE  (engine-level documentation)
 Exporting, editing and creating HMD animations via Blender
================================================================================
NOTE: the HMD Toolkit GUI (see ../README.txt) now automates this pipeline --
the manual steps below (animfix, repackaging, event injection as separate
stages) are done in one click by the "FBX -> Animation" tab. This file
remains as deep technical documentation of the underlying tools, the HMD
animation format, and the conventions the tools compensate for.
================================================================================

OVERVIEW
--------
Game animations are HMD files (one animation per file) living under
Anim/<rigName>/ (e.g. Anim/Male01/) and named Anim_<rigName>_<AnimName>.hmd.
They drive bones BY NAME and carry gameplay events (e.g. 'hit' frames).
This pipeline plays them on the actual character in Blender, lets you edit
them or author new ones, and converts them back.

  EXPORT:  anim.hmd + model.hmd --[hmdanim2fbx.py]--> animated FBX --> Blender
  REIMPORT: Blender FBX export --[animfix.py]--> Anim_<rig>_<name>.fbx
            --[game repackager]--> .hmd --[animfix.py --inject-events]--> final

TOOLS (keep in one folder)
--------------------------
  hmd_reader.py, fbx_binary.py, hmd2fbx.py   shared with the Models pipeline
  hmd_anim.py                animation frame-data decoder (also a CLI dumper)
  hmdanim2fbx.py             model+animation -> animated FBX
  animfix.py                 Blender export -> repackager-ready FBX; events
  AnimHMD2FBX-DropHere.bat   drag & drop export
  AnimFix-DropHere.bat       drag & drop reimport fix

Requires Python 3 with numpy. Validated with Blender 4.5.

--------------------------------------------------------------------------------
STEP 1 - EXPORT: HMD animation -> animated FBX
--------------------------------------------------------------------------------
  python hmdanim2fbx.py model.hmd animation.hmd [output.fbx]

Drag & drop: drop animation .hmd files TOGETHER WITH at least one model .hmd
(or a folder containing both) onto AnimHMD2FBX-DropHere.bat. Files are told
apart by content (models vs animations), so game exports misnamed .fbx also
work. Each animation is paired with the rig that best covers its bone tracks
(full coverage first, then fewest unused bones). Folder drops write results
to <folder>/converted/ keeping the original file names.

The FBX contains the full rigged model plus the animation (30 fps), so the
character visibly plays it in Blender. The world looks LEFT-RIGHT MIRRORED -
intentional (left-handed game), matches what the game renders.

--------------------------------------------------------------------------------
STEP 2 - BLENDER: import, edit or author
--------------------------------------------------------------------------------
IMPORT settings: defaults, plus
  - Animation: ON
  - Manual Orientation: OFF        (overriding axes rotates the scene 90deg)
  - Automatic Bone Orientation: OFF
  - Armature Primary/Secondary Bone Axis: Y / X (defaults)

After import, fix the scene frame range (Blender never sets it):
  import bpy
  a = next(o for o in bpy.data.objects if o.animation_data
           and o.animation_data.action).animation_data.action
  bpy.context.scene.frame_start, bpy.context.scene.frame_end = map(int, a.frame_range)
(or set End manually from the Dope Sheet). Do this BEFORE exporting, or
Blender bakes padding frames up to the scene end.

Editing rules:
  - Pose/keyframe bones only. NEVER edit the armature (bone positions, names,
    parents, rolls) - animations drive bones by name in the original frames.
  - New animations: animate any converted model FBX of the right rig
    (e.g. testHMD.fbx for Male01) starting from an empty action.
  - Scene stays at 30 fps.

EXPORT settings (differences from defaults):
  - Transform: Forward = Y Forward, Up = Z Up
  - Armature: Primary Bone Axis Y, Secondary Bone Axis X  (DEFAULTS - do not
    change; wrong axes roll every bone frame and mangle the reimport. animfix
    detects this and refuses.)
  - Add Leaf Bones: OFF
  - Animation: ON, Key All Bones: ON, Sampling Rate 1.0, Simplify 0.0
(For MODEL exports the same recipe applies with Animation: OFF.)

--------------------------------------------------------------------------------
STEP 3 - ANIMFIX: make the export repackager-ready
--------------------------------------------------------------------------------
  python animfix.py <blender_export.fbx> [reference.hmd] [options]
  -> Anim_<rig>_<name>.fbx  (place under Anim/<rigName>/ in the resources)

Drag & drop: drop the Blender .fbx together with the reference animation .hmd
onto AnimFix-DropHere.bat.

Arguments:
  reference.hmd   The original animation (edited case), or ANY animation of
                  the same rig (new-animation case; enables the bone-frame
                  sanity check). Optional if --name is given.
  --name <Name>   Animation name, for NEW animations with no original.
                  With a reference and no --name, the reference's name is used.
  --rig <Rig>     Rig folder/name prefix, default Male01.
  --trim <N|ref>  Cut curves to N frames ('ref' = reference's length). Use
                  when Blender baked scene-range padding (animfix warns with
                  the exact command when lengths differ).

What it does: strips mesh/materials/skin (animation-only FBX), DROPS
object-level (non-bone) tracks (these would move whole reimported models),
snaps all keys to the exact 30fps grid (resampling if sparse), verifies bone
frames against the reference (catches wrong bone-axis exports), renames the
stack, normalizes headers, rebuilds definitions.

--------------------------------------------------------------------------------
STEP 4 - REPACKAGE + EVENTS
--------------------------------------------------------------------------------
Run the game's repackager on the Anim_<rig>_<name>.fbx placed in the anim
folder. Then restore/edit events (repackaging loses them; Blender never sees
them):

  python animfix.py --inject-events repackaged.hmd reference.hmd
      copies the reference's events (e.g. the original 'hit' frame)

  python animfix.py --inject-events repackaged.hmd --event 14:hit
  python animfix.py --inject-events repackaged.hmd --event 14:hit --event 40:sound
      sets events explicitly (frame:name); use after timing edits or for new
      animations. --event overrides the reference if both are given.

A .bak backup is written next to the patched file, and the result is
re-parsed as a self-check. Verify in HIDE: the event marker shows on the
timeline at the right frame.

--------------------------------------------------------------------------------
NOTES / GOTCHAS
--------------------------------------------------------------------------------
- Events drive gameplay (damage timing). Always re-inject after repackaging.
- A NEW animation file also needs game-side wiring (database/unit definitions
  referencing its name) before anything plays it in game.
- Rigs are bone-NAME contracts: one reference animation per rig serves all
  animations of that rig. Rest poses differ per model and don't matter.
- Track values are stored per frame (30 fps, baked). Interpolation styles/
  F-curve handles from Blender are baked out on export - what you see at
  full frames is what the game gets.
- hmd_anim.py <file.hmd> dumps an animation's tracks/flags/events for
  inspection or debugging.
- Animations play identically on original and reimported models (validated);
  object-level track stripping in animfix is what guarantees this.

VALIDATED
---------
- Null round-trip (AttackMelee01 on testHMD): repackaged result plays
  identically; per-frame simulation of the game's importer matched original
  data to <=5e-6 (rotations), bit-exact (translations), on all 3 animations.
- Edit test: timeline shift (pause) + moved 'hit' event -> correct in HIDE.
- Event injector: byte-identical output when re-injecting unchanged events.
================================================================================
