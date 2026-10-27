# Geometry pass

Budget first: `audit_unit.py` -> total tris. Typical headroom on a kitbash is 1-3k tris.

| Tool | Adds | Cost | Use for |
|---|---|---|---|
| `hardware.py` `build_hardware(rig, spec, surface_objs, tex_dir)` | domed buttons (ray-cast onto the surface, weights copied from the nearest vertex), toggles, rolled collar rim tube (segs = max(24, collar segs // 2), 6 sides) | ~600-800 tris, +1 material (`Mat_GinazGold`) | real gold/brass hardware instead of yellow paint |
| `add_geometry.py --subsurf OBJ:1` | Catmull-Clark level 1, weights/UVs/materials kept | x4-6 tris of that object (coat 524 -> 3,144) | faceted coats, hats, collars; check the render for shrinkage |
| `add_geometry.py --simple OBJ:1` | tris only, same shape | same | smoother skinning on hems before painting relief |
| recipe edits (`../dsw-new-unit/scripts/03_variants_v3.py`) | bun 12 x 22, sash tail 12 segments, collar 56 segments | few hundred | silhouette parts built by hand |

Rules that bit us:
- Hand-built parts need UVs pointing at texels of the unit's own texture (or a dedicated tiny material) and weights; a part with no weights stays at the origin when animated.
- Weights above 3 influences are limited and normalised on export (12b) and after subdividing (`add_geometry.py`).
- Subdivide ONE or TWO parts, then re-audit. Do not subdivide the Mercenary body: 4.3k -> 20k+ tris.
- Test with real clips (Run, FightIdle, AttackMelee01/02, FightHitFront): tears show on hems and the collar first. The cape bones B_Cape01-03 and the weapon bone B_Weapon animate from the clips.
- Not Sardaukar parts. Pair every graft with a removal.
