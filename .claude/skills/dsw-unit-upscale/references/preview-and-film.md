# Judging the result: the "film" problem

Symptom: polished units look washed out, as if seen through a layer of film (user report 2026-10-25).
Cause (measured with `film_test.py`): not the textures. Albedo mean colour/saturation were identical before and after; with specular off the model is vivid.
The FBX-importer wiring feeds the MetallicGlossAO colour into **Specular IOR Level**, and the saved blends used a bright bluish world (strength 1.8):
a broad bluish sheen over every surface. Old donor MG maps with alpha 0.07-0.14 hid it; the shipped alpha-255 maps exposed it.

Fix (`preview_wiring.py`, used by `render_views.py --gamelike` and `make_preview_blend.py`):
R -> Metallic, roughness = max(1 - G, 0.62), B -> AO multiply, specular 0.12, neutral grey world at strength 1.0 (`soften_world()`).

Rules:
- Judge ONLY from the matte wiring. Export blends keep the importer wiring (the HMD toolkit extracts textures by it): never export from a PREVIEW blend or a gamelike-saved blend.
- `make_preview_blend.py` writes `<Unit>_PREVIEW.blend` with matte wiring + FightIdle pose + camera: tell the user to open that file.
- If something still looks hazy: run `film_test.py` in modes `importer`, `diffuse`, `nospec`, `matte` on the same close-up and compare; if `diffuse` is vivid the textures are fine.
- The real game's shader may still differ: always say "not seen in the real game" until it has been.
