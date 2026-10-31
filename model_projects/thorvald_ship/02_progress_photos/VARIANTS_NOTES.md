# Th_Ship overnight variants (2026-10-30)

Board: `THSHIP_VARIANTS_BOARD.png`. Fit check vs vanilla fighters: `LINEUP_v3_labeled.png` (old v3 at scale 1.6), `LINEUP_favs_labeled.png` (picks at 1.25).
Blends: `03_blender/<name>_tex.blend` (textured, one mesh, one material). Rebuild: `08_scripts/45_gen_variants.py` then `LIST=... bash 08_scripts/46_run_variants.sh`.

## Honest fit check (what changed vs ship_v3)
- v3 was the biggest fighter on the field at the Hammer slot's scale 1.6, and busy (side gun rods, rear boxes beside the wing roots, gaps at the wing roots).
  Vanilla fighters are ONE clean shape with big panels and 2-3 tones plus one accent colour.
- All variants: side gun rods removed, the Ravager's rear side boxes removed, wings re-seated; copper only in bold bands.
- Two-tone palette (gunmetal panels on charcoal) reads better at RTS zoom than pure black; dark versions kept for comparison.
- Suggested in-game model scale: ~1.5 for the polished variants (at 1.25 they sit a little under the Hawk).

## Picks
1. **v11_arrow_polish** - cleanest single silhouette (no tip jets), copper wing tips + nose collar read instantly top-down, fewest parts (2.3k tris).
   Closest to how vanilla fighters read. Wing roots seated inboard.
2. **v12_compact_polish** - Hawk-like compact proportions, two-tone, slim tip jets keep a Thorvald "engine" identity; copper tips/collar.
3. **v07_sibling_drums** - small copper-ringed drums at the tips tie it to the frigate; most "House Thorvald", but busier.
Honourable: v13_thick_polish (chunky armoured wings) if you want it heavier.

## Known rough edges
- A thin light slit can still show at the wing-root trailing edge from directly above (v11 least).
- Tip tubes on the thick-wing versions (v05/v13) sit slightly below the wing tip in some angles.
- Chin gun is the twin Renegade-tube barrels; it may still read large next to the Hawk's tiny guns.
- Not exported to the game; Th_Ship still uses the Corrino Hammer model.
