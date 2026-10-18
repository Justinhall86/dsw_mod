================================================================================
 HMD TOOLKIT
 Dune: Spice Wars (D4X) model & animation modding -- HMD <-> FBX, recolours,
 local repackaging, prefabs. GUI front-end over validated command-line tools.
================================================================================

REQUIREMENTS
------------
- Python 3 with numpy (pip install numpy). Pillow strongly recommended
  (pip install pillow) -- converts DDS/JPG/anything to PNG automatically.
  The toolkit auto-detects a suitable Python installation and reports it in
  the first log line, including whether Pillow was found.
- Blender (validated with 4.5) for editing.
- The game installed (its D4X.exe doubles as the repackaging runtime).

LAUNCH & FIRST-RUN SETUP
------------------------
Double-click HMD_Toolkit.pyw (or HMD_Toolkit.bat). Then open SETTINGS and set:
- Modding directory: your D4XEditor folder. Used tool-wide (output locations).
- Game directory:    the game's install folder (Steam: right-click the game
  -> Manage -> Browse local files). Only used to copy D4X.exe into a
  temporary stage for local repackaging; never modified.

Everything runs locally: repackaging happens in a throwaway stage inside
Repackager/, your directories are never touched except for the outputs you
ask for. Window size/position, directories and options persist per user
(gui_settings.json). All path fields support drag & drop from Explorer and
show an (i) tooltip with details -- hover them for the fine print.

THE TABS
--------
MODEL -> FBX      Game model HMD(s) (files or a folder, recursive; misnamed
                  .fbx game exports are detected by content) -> rigged FBX
                  for Blender.
                  - "Fix mislabeled game exports": renames HMD-content .fbx
                    to .hmd; the converted FBX takes the original name.
                  - "Embed textures": bakes images found beside the HMD into
                    the FBX, so it is self-contained in Blender.

FBX -> MODEL      One click from Blender export to finished kit:
                  skeleton restored from the chosen RIG (Male/Female bundled
                  in Rigs/, or Custom = any same-armature HMD), repackaged
                  locally, embedded textures extracted + renamed to
                  <name>_Albedo/_MetallicGlossAO/_Normal.png (non-PNG images
                  converted), HMD texture paths wired to
                  <resource dir>/<name>/..., base <name>.prefab written.
                  Output folder auto-fills to <modding dir>/res/
                  <resource dir>/<name> -- drop-in ready.

ANIMATION -> FBX  Animation HMD(s) + a rig model (or one folder with both)
                  -> animated FBX; each animation is paired with the model
                  whose skeleton best covers its tracks. Folder input writes
                  to <folder>/converted/ keeping original names.

FBX -> ANIMATION  One click from Blender export to finished
                  Anim_<rig>_<name>.hmd: curves/headers fixed (with a
                  bone-frame safety check against the reference), repackaged
                  locally, events injected.
                  - Reference animation: original (edited case) or any
                    same-rig animation (new case); pre-fills the event list.
                  - The event list REPLACES all events in the result --
                    what you see is what ships. frame:name, one per line.
                  - Input may also be a FINISHED HMD: then only its events
                    are edited in place (use it as its own reference to load
                    current events, tweak, re-inject).

RECOLOUR          Clone a model into a recolour kit without touching a hex
                  editor: pick the HMD (texture base auto-detected), give a
                  new base name, and the kit -- <base>.hmd with rewired
                  paths (any length), all companion images copied/renamed
                  (fake-PNG DDS and other formats converted to real PNG),
                  and a base prefab -- lands in <modding dir>/res/
                  <resource dir>/<base>/. Then edit the PNGs in any image
                  editor. "Inspect" lists a model's current texture paths.

SETTINGS          The two directories above.

BLENDER RECIPES
---------------
Import (models and animations): DEFAULT settings, plus Animation: ON.
  Do NOT enable Manual Orientation or Automatic Bone Orientation; leave
  armature Primary/Secondary Bone Axis at Y / X.
Export MODELS:     Forward = Y, Up = Z, Add Leaf Bones OFF, Animation OFF,
                   Path Mode = Copy with the Embed Textures button ON.
Export ANIMATIONS: Forward = Y, Up = Z, Add Leaf Bones OFF, Animation ON,
                   Key All Bones ON, Simplify 0.0.
After importing an animation, fix the scene end frame (Blender never sets
it) before exporting -- or use the Trim field ('ref' = reference length).

RULES OF THE ROAD
-----------------
- NEVER edit the armature (bone names/positions/parents/rolls). Mesh editing
  is free; new geometry must be weight-painted to existing bones. Animations
  drive bones BY NAME in the original frames.
- Rigs are bone-name contracts: one reference per rig serves all its models
  and animations (Rigs/Male01.hmd, Rigs/Female01.hmd).
- The game supports PNG textures only; the toolkit converts other formats
  where it can (Pillow). Keep Blender materials on PNG images.
- Texture paths inside an HMD resolve from the game's resource ROOT --
  they must match where the files are placed under res/. The pipelines wire
  this automatically; a magenta model in game means a path didn't match.
- Everything looks LEFT-RIGHT MIRRORED in Blender. Intentional (left-handed
  game); it matches what the game renders.
- Max 3 bone influences per vertex reach the game (strongest kept).
- Events (frame:name, e.g. 11:hit) drive gameplay timing; FBX cannot carry
  them, so FBX -> Animation injects them at the end (list auto-filled from
  the reference).

SHIPPING
--------
The toolkit's local repackaging only CONVERTS; building the shipping pak from the full res tree stays your usual process.
The generated <name>.prefab references just the model -- open it in the
editor to attach weapons etc.

FILE MAP
--------
HMD_Toolkit.pyw / .bat   the GUI (keep beside the folders below)
Models/                  model engines: hmd2fbx, fbxfix, retexture (+ CLI
                         drag&drop .bats and engine-level README)
Animations/              animation engines: hmdanim2fbx, animfix, hmd_anim
Repackager/              convert_fbx (one-shot pipelines), repack (local
                         repackaging), pakBuild.hl
Rigs/                    bundled rig references (Male01, Female01)
gui_settings.json        per-user settings (safe to delete to reset)

All engines are also usable from the command line -- run any of them without
arguments for usage, and see the READMEs inside Models/ and Animations/ for
deep technical documentation (format internals, validation history, and the
conventions the tools compensate for).
================================================================================
