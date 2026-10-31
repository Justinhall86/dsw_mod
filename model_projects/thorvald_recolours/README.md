# Thorvald recolours: Corrino Harvester, Ornithopter

Texture-only recolours into the House Thorvald palette (see `house_thorvald/art_direction.md`).
Geometry, UVs, normal maps, MetallicGlossAO maps and emissive maps are unchanged; only the albedo
colour moved (size and alpha channel verified identical to vanilla).

| Source | Recoloured file | Mapping |
|---|---|---|
| `Vehicle/Imperial/Harvester/Harvester_Albedo.png` | `04_textures/Harvester_Albedo.png` | Corrino red -> deep rust `#48241A`, steel -> gunmetal, green -> copper, lamps -> ember |
| `Vehicle/Imperial/Harvester/Harvester_Track_Albedo.png` | `04_textures/Harvester_Track_Albedo.png` | orange pads -> deep rust, dark -> gunmetal |
| `Vehicle/Atreide/Ornithopter/Ornithopter_Albedo.png` | `04_textures/Ornithopter_Albedo.png` | green -> rust, brown -> copper, steel -> gunmetal, lamps -> ember |

The recoloured PNGs are real PNG (RGBA). The game ships DDS behind a `.png` name, so convert
before packing (see the dsw-model-modding skill).

Scripts (`08_scripts/`): `recolour.py` writes the textures; `drive.py harvester|ornithopter [--gif]`
renders vanilla and recoloured stills plus a turntable with the `bpy` module (Cycles CPU), using
`render.py`, which wires each material slot to its own textures (the vehicle-preview skill's
renderer puts one material on every mesh, which mis-textures the harvester tracks).

Not done: the Indoctrination Center building - its files are not in this repo
(`Structure/Buildings/IndoctrinationCenter/` lives in the game's pak).
