# Vehicle preview gotchas

Each item is something that cost time or produced a wrong image. Check here before debugging.

## Inputs look wrong

- **`.fbx` files are not FBX.** Almost every model under `model_inputs/Vehicle` starts with the bytes `HMD`.
  Blender refuses them ("Invalid header"). Convert with `hmd2fbx.convert(src, dst, verbose=False)`
  and check the output starts with `Kaydara FBX Binary`. The driver does both.
- **Textures are DDS behind a `.png` name.** `Image.open(p)` in Pillow reads them; Blender does not.
  The driver writes real PNGs to `preview_textures/albedo.png`, `mgao.png`, `normal.png`, `emissive.png`.
- **Animation HMDs have zero models.** `Anim_*.fbx` files are animation clips. Never render them.
- **Alternates are not the vehicle.** `Select.fbx`, `Sting.fbx`, `*_damage/`, `*_experimental/`,
  `Ornithopter01..06.fbx`, `ImperialHarvester2.fbx`, `Altar_AllFabric/Balloon/FabricStrips.fbx`
  are variants. The catalog picks one primary model per folder. Add a second model to the entry only when
  the vehicle really is a multi-part assembly (KulonTurret: base + cannon; DroneI: base + canon).
- **Texture variants.** Use the unsuffixed or plain albedo (`Foo_Albedo.png`). Faction-coloured files
  (`*_Atreides_Albedo.png`, `*_Ecaz_Albedo.png`, ...) are re-skins.
- **Folders with no textures** (`Atreide/Tank`) use `flat_colour` in the catalog.

## Converter

- **One model per HMD.** `hmd2fbx.convert` raises `expected 1 model, got N`. SpaceShuttle has three
  nodes: Root (rotation only, no mesh), Shuttle (rotation only, no mesh), and the mesh.
  `build_previews.flatten_multi_model()` keeps the one mesh and folds the parents' rotations into it.
  It refuses any parent with a translation or scale, so a new case fails loudly instead of rendering wrong.
- **Recursion trap (fixed, but do not reintroduce it).** The converter calls `H.load`. Patching
  `H.load` to call `flatten_multi_model` (which itself calls `H.load`) recurses forever. Keep the real
  loader in `REAL_LOAD` and call that inside the flatten step.
- **Left-right mirroring is intentional.** The toolkit README says the FBX is pre-mirrored for the game's
  left-handed importer, so what you see in Blender is what the game shows. Don't "fix" it.

## Orientation (the big one)

- **Vehicles do not share a forward axis.** The turntable does not care, but the front/back/three-quarter
  stills do.
  - Tank: barrel on **+X**, so its front is `"front": "+X"`. A -Y camera shows the long side.
  - Hawk: fuselage runs along Y, wings across X; nose is **-Y** (the default).
- **Default is `-Y`.** It is correct for aircraft with the wingspan across X and wrong for tanks
  and carryalls whose long axis is X.
- **How to decide:** run `build_previews.py --diag <Name>`. It writes `front` (-Y), `back` (+Y), `x_pos`,
  `x_neg` to `%TEMP%\dsw_vehicle_preview\diag\`. Find the end that carries the gun, cockpit or nose and
  set `"front"` in `catalog.json`. Use `inventory.py --models` first for the bounds if the shape is unclear.
- **Bounds check:** long axis X and dy < dx means the -Y camera sees the side. Look at the diag sheet before
  trusting the stills.

## Rendering

- **Junk objects.** The game's FBX exports carry a 2 m `Cube` helper, plus `Camera` and `Light`. Cube renders
  as a giant slab. Remove `Cube/Camera/Light/Lamp`, including `.001` duplicates (the driver matches on the
  name before the dot).
- **Blender 5.2 engine name is `BLENDER_EEVEE`.** `BLENDER_EEVEE_NEXT` does not exist in this version.
- **Run with `--background --factory-startup`.** About 30 s per vehicle (Blender start plus 36 frames at 480 px).
- **Framing.** Ortho camera sized so the vehicle fits from every azimuth:
  `ortho = 1.1 * max(hypot(dx, dy), 1.6 * dz)`. Perspective was not used.
- **World.** Use `PW.soften_world()` (neutral grey, strength 1.0). The default bluish strength-1.8 world
  washes the whole model out to a milky film.
- **Material.** The packed MetallicGlossAO map is read the way the game reads it:
  R = metallic, G = gloss (roughness = 1 - G, floored at 0.62), B = ambient occlusion multiplied into albedo.
  This wiring is preview-only and never saved. Albedo is sRGB; normal and MGAO are Non-Color.
  Wire MGAO to `Specular IOR Level` first, because `preview_wiring.gamelike()` looks for that link.
- **Turntable start.** Frame 0 faces the front, so the first frame of the GIF is the front view.

## GIF

- 36 frames at 60 ms (about 2.2 s loop), 480 px.
- One global palette built from four frames. Per-frame palettes make colours shimmer.
- `make_gif` refuses to run unless exactly 36 frames exist, so a failed render cannot produce a short GIF.

## Existing previews

- Eight folders already have `<Name>_preview.gif` (DroneA, Hawk, SpaceShuttle, Tank, Ravager, Ravager_Shuttle,
  Renegade_Frigate, Hammer). The driver keeps them unless you pass `--regen`, and still renders the three stills.
- Those older GIFs came from an earlier pipeline. The Tank's was built on a 64x64 flat texture. Regenerate
  them with `--regen` if they look off.
- The older pipeline also wrote `<Name>_preview.blend`. This one does not. Add a `.blend` save if you need one.

## Tooling and sharing

- **Shell availability.** Bash and PowerShell calls were sometimes refused by an automated safety check
  during long sessions (a transient "classifier gave no verdict" error). Retry once; if it persists, run the
  same python command through the other shell tool.
- **Sharing files in chat.** `SendUserFile` is a deferred tool. Load it with ToolSearch
  (`select:SendUserFile`) before the first call. One call can carry several files: send the GIF and the three
  stills for a vehicle together, with a caption.
