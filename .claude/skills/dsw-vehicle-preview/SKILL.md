---
name: dsw-vehicle-preview
description: Make turntable GIF previews and front / back / three-quarter PNG renders for Dune Spice Wars vehicles and ships in model_inputs/Vehicle (tanks, harvesters, carryalls, ornithopters, drones, frigates, shuttles, turrets, Hawk, Ravager, Harpy, Chronos, etc.). Use whenever the user wants a preview, an animated gif, a turntable or a contact sheet of a vehicle, asks to loop through the vehicle folders and make sure each has a gif, wants front/back/three-quarter views of a vehicle, or hits HMD-named .fbx vehicle files that Blender will not open. Also use it to re-render previews after a model or texture change. Not for character models (use dsw-preview-blend or dsw-model-workshop).
---

# DSW vehicle previews

Produce, for every vehicle folder: `<Name>_preview.gif` (turntable) and `<Name>_front.png`,
`<Name>_back.png`, `<Name>_three_quarter.png`, all next to the model. Read `references/gotchas.md`
before changing anything; most of the traps there cost real time once.

## Quick start

From the repo root, with Blender 5.2 at its default install path (or set `BLENDER_EXE`):

```powershell
python .claude\skills\dsw-vehicle-preview\scripts\build_previews.py              # every vehicle
python .claude\skills\dsw-vehicle-preview\scripts\build_previews.py Tank Hawk    # just these
python .claude\skills\dsw-vehicle-preview\scripts\build_previews.py --diag Tank  # diagnostic views
python .claude\skills\dsw-vehicle-preview\scripts\build_previews.py --regen Hawk # redo an existing GIF
python .claude\skills\dsw-vehicle-preview\scripts\inventory.py --models          # what is in each folder
```

Needs Python with Pillow and numpy (both present in the repo's Python). Blender is driven headless.
Run it from the repo root or anywhere; paths resolve from the script location.

Each vehicle takes about 30 s. The full set takes roughly 20 minutes, so run it in the background and
check on it, rather than blocking a foreground call.

## What the pipeline does

1. **Convert the model.** `hmd2fbx.convert` turns each HMD into `preview_textures/<stem>_real.fbx`.
   A multi-part HMD (SpaceShuttle) is folded into its one mesh first. Output is checked for the FBX magic.
2. **Convert the textures.** DDS-behind-.png files become real PNGs in `preview_textures/`.
3. **Render.** `render_vehicle.py` runs in Blender: 36 turntable frames, then the three stills,
   from a single config JSON written to the temp folder.
4. **Assemble the GIF.** Pillow, one global palette, 60 ms per frame.
5. **Check.** The driver refuses a missing still or a GIF without exactly 36 frames, and reports
   `FAILED:` with the names it could not build.

Outputs go into each vehicle folder. The folder's existing `preview_textures/` stays in use.

## Catalog

`scripts/catalog.json` is the single list of vehicles. Each entry has:

- `folder`: relative to `model_inputs/Vehicle`, e.g. `Atreide/Tank`.
- `name`: used for every output file name.
- `models`: the HMD files to convert, base model first, then any attached parts.
- `albedo`, `mgao`, `normal`, `emissive`: texture files in the folder (omit what is absent).
- `flat_colour`: used when there is no albedo (Tank).
- `front`: which side faces the camera, `-Y` (default), `+Y`, `+X` or `-X`. Set it per vehicle.

Adding a vehicle: run `inventory.py --models`, pick the primary model and its textures, add an entry,
then run `--diag` on it and set `front` from the four views.

## Choosing a vehicle's front

Forward axis is not the same for every vehicle, so decide it per vehicle with `--diag`:

- Look at `%TEMP%\dsw_vehicle_preview\diag\<Name>_{front,back,x_pos,x_neg}.png`.
- The front has the gun, the cockpit or the nose. The Tank's barrel points along **+X**, so `front` is `+X`.
  The Hawk's nose points along **-Y**, the default.
- Put the four views in a contact sheet (`scripts/sheet.py out.png 4 <views...>`) to compare them in one look.
- Write the choice into `catalog.json`, then re-run that vehicle without `--diag`.

## Sharing each finished vehicle in chat

When the user asked to see the work as it goes, send each vehicle's files as soon as they are finished:

1. Load the tool once: `ToolSearch` with `select:SendUserFile`.
2. Call `SendUserFile` with `files` = the GIF plus `_front`, `_back`, `_three_quarter` PNGs,
   `status: "normal"`, and a short caption such as "Tank: turntable and front/back/three-quarter".
   Send only finished vehicles, never the frames, the diagnostics or the intermediate FBX.

## Files in this skill

- `scripts/build_previews.py`: driver. Catalog loop, conversion, Blender calls, GIF assembly, `--diag`, `--regen`.
- `scripts/render_vehicle.py`: runs inside Blender. Import, junk removal, material wiring, framing, render.
- `scripts/preview_wiring.py`: preview-only MetallicGlossAO wiring and neutral world (matches the thorvald previews).
- `scripts/inventory.py`: classifies every file by its real content, optionally counts models per HMD.
- `scripts/sheet.py`: contact sheet of PNGs, labelled by file name.
- `scripts/catalog.json`: the vehicle list.
- `references/gotchas.md`: every trap found so far, with the fix.
