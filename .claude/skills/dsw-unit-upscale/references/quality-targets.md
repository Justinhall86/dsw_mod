# Quality targets (measured from vanilla Male01 units and from our own results)

| Thing | Vanilla / target | Notes |
|---|---|---|
| Triangles per unit | 5-9k typical, 12k for the FlameThrower | aim 7-9.5k, ceiling 12k; Mercenary body alone is 8.2k, Bannerjee head 1.85k |
| Materials | 1-3 per unit (+1 for metal hardware is fine) | each material = one draw call |
| Albedo / MG / normal sizes | 512-2048 square; head and torso 1024-2048 | upscale to 1024 for body/coat/head, keep 2048 maps, cap 2048 |
| Texel density | torso ~700 texels/m (Raider 2048) vs 150-320 for kitbash donors | `audit_unit.py` prints it; the weakest material is what the eye sees |
| Channel layout | MetallicGlossAO: R metallic, G gloss, B AO; normal OpenGL (green up, unverified in game) | |
| Alpha | 255 everywhere | donor MG maps had alpha 0.07-0.14: fixed when upscaling |
| Bone influences | max 3 per vertex, normalised | `12b_assemble_export.py` enforces on export; `add_geometry.py` re-limits after subdividing |
| Rig | Male01 46 joints (+7 whip joints on the Mercenary) | never edit the armature |
| Metal | gold/brass/steel flagged in MG: metallic ~0.9, gloss ~0.72 | cloth/leather metallic ~0, rough floor in the preview |

Where triangles actually help: collars (>= 24 segments), button domes, rolled rims, buns/ponytails, sash tails, coat hems, shoulder rounding. Flat panels gain nothing.
Where textures matter most: chest/collar band (what the RTS camera sees), face, hem, belt buckle. Backs and soles can stay at x1.
