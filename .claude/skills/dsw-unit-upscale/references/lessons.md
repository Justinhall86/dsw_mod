# Lessons from the first polish pass

- Convert every claim to a render: before/after at the same camera, matte preview, then clips.
- All-zero maps (Non-Color order), alpha 0.07 MG maps, and a hazy preview each looked like "the textures are bad". Run `audit_unit.py` and `film_test.py` before repainting anything.
- x2 resize alone is soft: unsharp 0.55, then paint decoration at the NEW resolution with anti-aliased coverage measured in metres.
- Donor trim that was recoloured turns into blotches: clean it in the hook (recolour to the cloth) before painting proper cords/piping.
- Real metal = separate geometry + its own material (R 0.91 / G 0.75); gold paint in the albedo only reads as yellow.
- Pak size: the editor res tree is packed wholesale. Each unreferenced model folder adds 16-19 MB (2048 Raider maps). Say so before repackaging.
- Overwriting a live unit's CharMOD folder in the editor res tree changes what the next repackage installs: back it up first (`_previous_installed`).
- Blender 5 layered actions need `rig.animation_data.action_slot = action.slots[0]` or clips stay in rest pose.
- Never kill all Blender processes (the user may have the GUI open): stop only the background task you started.
- To apply only a subdivision modifier, hide the other modifiers first (`show_viewport = False`) instead of reordering with ops (a reorder loop hung once).
- Generic pass limits: it cannot know what is cloth, what is trim, or where decoration goes; leftover donor blotches stay (see the hem in the upscale test render) until a hook cleans them.
