# Texture pass

What `upscale_textures.py` does per material, and what it deliberately does not:

1. Resize each of albedo / MetallicGlossAO / normal by the scale factor (Blender bilinear), then an unsharp mask on the albedo (0.55, radius 1).
   Without the unsharp step a plain x2 reads as soft; above ~0.8 it rings around dark piping.
2. `Canvas.finalize`: relief from painted height (hook) -> detail normal added to the ORIGINAL normal (renormalised) + emboss shading and contact darkening
   on the albedo; gold-hued paint (hue 32-54, sat > 0.42, val > 0.55) -> MG metallic 0.9, gloss 0.72 (`--no-auto-metal` to skip); optional twill weave.
3. Every PNG is RGBA with alpha 255; nodes are re-pointed at the new images; a new blend is saved (the input is never overwritten).

**It does not change colours.** `compare_audits.py` fails the run if the mean colour moves > 8% or saturation drops > 8%.

## Writing a hook (unit-specific painting)
Work in metres in the rest pose (`ctx.P` x/y/z; the unit is ~1.95 m tall, front = -y), so the design is resolution independent.
`ctx.fp` is the texel size in metres: `PL.cov_line(dist, half_width, fp)` gives soft anti-aliased lines. Primitives: `cov_line`, `cov_stripes`, `cov_band`, `cov_wave`
(wavy lines; two opposite phases make an interlaced chain). `cv.paint(coverage, rgb, height_m, gold)` blends colour, raises relief (1-1.5 mm is plenty) and flags metal.
Clean first, then paint: donor tan trim turns into blotchy gold scribbles after a recolour; `PL.recolour(img, mask, rgb255, (vlo, vhi))` keeps the painted shading but
switches the hue. Use `PL.hsv`. `examples/hook_example.py` is a working tunic + coat hook; `../dsw-new-unit/scripts/41_polish_textures.py` is the full Master version
(frogging cords, vine, chain filigree, silver hair streaks).

## Gotchas
- Set `colorspace_settings.name = "Non-Color"` BEFORE writing pixels (`PL.array_to_img` does this). The wrong order gives all-zero maps: the audit flags "ALL ZERO".
- A material shared by two objects is processed once (key = material name).
- `rasterise` loops over triangles in numpy: roughly 10-40 s for a 2048 map with 8k triangles. Only hooks and `--weave` need it.
- Twill at strength 0.035 may shimmer at distance in game: drop to 0 if it does (unverified in game).
- Normal convention (green up) is the Blender/FBX importer one; if relief looks inverted in game, flip the green channel in `Canvas.finalize`.
