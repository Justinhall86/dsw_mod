================================================================================
 HMD <-> FBX MODDING PIPELINE  (engine-level documentation)
 Converting Heaps HMD models to editable FBX and back, with animations intact
 DISCLAIMER: This software was created with heavy assistance from ClaudeAI (using Fable 5).
================================================================================
NOTE: the HMD Toolkit GUI (see ../README.txt) now automates this pipeline --
the manual steps below (fbxfix, moving files, repackaging by hand) are done
in one click by the "FBX -> Model" tab, which also handles embedded textures,
PNG conversion, path wiring and prefab generation. This file remains as deep
technical documentation of the underlying tools and conventions.
================================================================================

OVERVIEW
--------
The game stores models as HMD (Heaps 3D, format v3; exported files may have a
misleading .fbx extension). Animations are separate HMD files that drive bones
by name, authored against the original skeleton's bone frames. This pipeline
lets an artist edit a model's MESH in Blender and reimport it with all original
animations still working.

    game HMD --[hmd2fbx.py]--> FBX --> Blender (edit mesh) --> Export FBX
        --[fbxfix.py + original HMD]--> fixed FBX --[game repackager]--> HMD

TOOLS (keep in one folder)
--------------------------
  hmd_reader.py          HMD parser (header, geometry, skin, animations)
  fbx_binary.py          binary FBX 7.4 reader/writer
  hmd2fbx.py             HMD -> rigged binary FBX converter
  fbxfix.py              makes a Blender-exported FBX repackager-ready
  HMD2FBX-DropHere.bat   drag & drop .hmd files -> .fbx
  FBXFix-DropHere.bat    drag & drop Blender .fbx + original .hmd -> _fixed.fbx

Requirements: Python 3 on PATH with numpy (pip install numpy). Blender 4.5
was used for validation; nearby versions should behave the same.

STEP 1 - HMD to FBX
-------------------
Drag the .hmd onto HMD2FBX-DropHere.bat (or: python hmd2fbx.py model.hmd).
Output: model.fbx containing the mesh, full 46-bone armature, skin weights,
bind pose, and material/texture references.

Batch mode: drop a whole FOLDER (or several files) onto the .bat. Folders are
searched recursively and HMD files are detected by content, so game exports
still named .fbx are found and converted too (output: name_converted.fbx).
A summary lists anything that failed; unsupported models (multi-part scenes,
colliders, blend shapes) are skipped with an error rather than aborting.

Note: the model appears LEFT-RIGHT MIRRORED in Blender. This is intentional -
the game is left-handed and its importer mirrors everything; the FBX must be
pre-mirrored so the round-trip is exact. What you see in Blender matches what
the game renders on screen.

STEP 2 - Edit in Blender
------------------------
Import with File > Import > FBX, default settings, into a fresh scene.

ALLOWED:  any mesh editing - move/add/delete vertices, remove parts, resculpt,
          add new geometry (weight-paint new vertices to existing bones),
          UV/material edits.
FORBIDDEN: touching the armature. Do not move, rotate, scale, rename, add or
          delete bones, and do not move/rotate the Armature or mesh objects.
          Animations replace every bone's transform each frame, so skeletal
          edits are overridden at best and break animations at worst.

Notes:
- The game uses max 3 bone influences per vertex (strongest 3 kept, weights
  renormalized). More influences won't break anything but will deform slightly
  differently in game than in Blender's preview.
- Hidden geometry (e.g. under a helmet) may not exist in the source model.

STEP 3 - Export from Blender
----------------------------
File > Export > FBX with:
  Transform: Forward = Y Forward, Up = Z Up   (critical)
  Armature:  Add Leaf Bones = OFF
  Animation section checkbox = OFF (called "Bake Animation" in older versions)
  Everything else: defaults (Apply Scalings: FBX Units Scale etc.)

STEP 4 - fbxfix
---------------
Select BOTH the exported .fbx AND the ORIGINAL .hmd (skeleton reference) and
drop them together onto FBXFix-DropHere.bat
(or: python fbxfix.py export.fbx original.hmd). Output: export_fixed.fbx.

What it does:
- restores every bone's rest transform and bind matrix from the reference HMD
  (Blender silently re-derives bone orientations; the game recomputes the bind
  pose from them, which would break original animations)
- normalizes GlobalSettings (axis/unit headers) so the game's importer injects
  no axis rotation and applies no unit scaling
- strips baked animation nodes and "_end" leaf bones
- warns about unknown bones, missing joints, or >3 influences

The reference HMD only needs to share the ARMATURE, not the mesh: any Male01-
armature HMD works for any FBX built on the Male01 skeleton (same for
Female01). Using the HMD the model originally came from is always safe.
Expected result: "no warnings -- ready for the repackager".

STEP 5 - Repackage
------------------
Feed the _fixed.fbx to the game's repackaging scripts to produce the final
HMD. Verify in the HIDE editor: correct idle pose, correct textures with
Culling: Back, and original animations playing without distortion.

WHY THE EXTRA STEPS EXIST (technical summary)
---------------------------------------------
The game's FBX->HMD importer (legacy Heaps) does three non-obvious things:
1. LEFT-HAND CONVERSION: negates geometry X, conjugates every node/bind matrix
   by diag(-1,1,1), and reverses triangle winding. hmd2fbx pre-mirrors the
   whole scene so this restores the original data exactly.
2. AXIS HANDLING: injects a +90 deg X PreRotation into root models when the
   FBX declares Y-up. hmd2fbx/fbxfix declare Z-up (with geometry baked to
   Z-up) so nothing is injected.
3. BIND POSE: rebuilt from the skeleton's rest pose / cluster matrices rather
   than trusted from the file. Original animations require the original bone
   frames, hence fbxfix's skeleton restoration from a reference HMD.
Original HMD animations are unaffected by all of this: they stay HMD-side and
drive bones by name, so they work with any reimported model whose skeleton
matches the original frames.

VALIDATED
---------
- testHMD.hmd (AtreideSoldier, Male01 armature, 6159 verts, 46 joints):
  direct reimport and full Blender null round-trip both byte-equivalent in
  behavior to the original (idle + AttackMelee01/02 + AttackLaunch clean).
- Mesh edit test (helmet removal) reimported with animations intact.
================================================================================
