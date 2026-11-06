"""Recolour the Feydakin face texture (B's face_graft, see 20_structure_pass.py): hair -> black,
half-mask -> gunmetal grey, eyes -> brown (round 12; were black).

Round 12 fix: comps 3 and 4 are the FACE SKIN (mirrored halves, the eye is painted on them - checked by overlaying
every component's UVs on the source texture), not hair wisps as round 7 assumed. Painting them hair-black made the
whole face charcoal. Hair is comps 0 (the hair mass), 6 and 7 only. System Python (Pillow + numpy; Blender's bundled Python has neither).

Eyes are found by COLOUR, not geometry: they turned out to be painted detail on the mask's own UV island
(the mask wraps the eye-socket rim), not a separate component - confirmed by rendering with the eye pixels
highlighted (04_textures/B_face_recolour/, see SPEC.md "Round 7").

Inputs (already in 04_textures/B_face_recolour/, regenerate only if missing):
  Fremen_Feydakin_Albedo_source.png  - the shipped DDS-as-.png converted to a real PNG (PIL can't read DDS)
  face_uv.json                       - UV triangles per component, from dump_uvs.py against
                                        01_input/donors/Feydakin/Feydakin_unused.blend, object "Feydakin":
      blender -b --python .claude/skills/dsw-part-kitbash/scripts/dump_uvs.py --
          --blend 01_input/donors/Feydakin/Feydakin_unused.blend --object Feydakin
          --components 0 3 4 6 7 --key hair --json 04_textures/B_face_recolour/face_uv.json
      (repeat with --components 1 2 --key mask, then --components 0 1 2 3 4 5 6 7 --key head)
Output: 04_textures/B_face_recolour/Feydakin_Albedo_eyes_hair_mask.png, applied by 20_structure_pass.py's
face_graft via P.set_textures(fob, albedo=...).
"""
import json
import os

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
TEX = os.path.join(HERE, os.pardir, "04_textures", "B_face_recolour")
SRC = os.path.join(TEX, "Fremen_Feydakin_Albedo_source.png")
UV_JSON = os.path.join(TEX, "face_uv.json")
OUT = os.path.join(TEX, "Feydakin_Albedo_eyes_hair_mask.png")

HAIR_BLACK = (20, 19, 18)       # the house's established near-black (matches B's own palette "black")
MASK_GUNMETAL = (58, 61, 66)    # cool grey-metal, distinct from B's warmer "iron" (48,46,46)
EYE_BROWN = (96, 60, 34)        # iris colour at average brightness; the source shading is kept
SKIN_TONE = (0.80, 0.74, 0.71)  # round 14: a shade darker (round 13 was 0.92,0.86,0.84 - Feydakin's skin read glowing orange)
SKIN_DESAT = 0.35               # ... and pull this far toward its own grey

img = Image.open(SRC).convert("RGB")
size = img.size
arr = np.array(img).astype(np.int32)
tris = json.load(open(UV_JSON))


def mask_for(keys, dilate=0):
    """dilate: grow the painted area by this many pixels past the exact UV boundary, so bilinear filtering at
    render time samples the NEW colour rather than bleeding in a thin strip of the old one along the seam
    (seen on the forehead/nose seam before this was added - 04_textures/B_face_recolour/ history)."""
    m = Image.new("L", size, 0)
    d = ImageDraw.Draw(m)
    for k in keys:
        for tri in tris[k]:
            d.polygon([(u * size[0], (1 - v) * size[1]) for u, v in tri], fill=255)
    if dilate:
        m = m.filter(ImageFilter.MaxFilter(2 * dilate + 1))
    return np.array(m) > 0


hair_mask = mask_for(["hair_0", "hair_6", "hair_7"], dilate=3)
mask_mask = mask_for(["mask_1", "mask_2"], dilate=3)
head_mask = mask_for(["head_0", "head_1", "head_2", "head_3", "head_4", "head_5", "head_6", "head_7"])

print("hair px:", hair_mask.sum(), "mask px:", mask_mask.sum(), "head px:", head_mask.sum())

# find the blue iris pixels anywhere within the head's own UV footprint (restricts the search to the visible
# head, so a stray blue fleck elsewhere in the shared body UV atlas is never touched).
r, g, b = arr[..., 0], arr[..., 1], arr[..., 2]
blue_dominant = (b > r + 10) & (b > g + 5)
eye_mask = blue_dominant & head_mask
print("eye px (blue, anywhere within the head footprint):", eye_mask.sum())

lum = arr[..., :3].sum(-1).astype(np.float64)


def tint(out, m, colour, lo=0.4, hi=1.6):
    """Fill m with colour, keeping the painted shading: scale by each pixel's brightness relative to m's mean
    (round 12 - round 7's flat fills wiped the hair strands and mask panel lines)."""
    rel = np.clip(lum / max(lum[m].mean(), 1.0), lo, hi)[..., None]
    out[m] = np.clip(np.array(colour) * rel, 0, 255)[m]


out = arr.copy()
skin_mask = mask_for(["head_3", "head_4"]) & ~hair_mask & ~mask_mask
grey = arr[..., :3].mean(-1, keepdims=True)
out[skin_mask] = ((arr * (1 - SKIN_DESAT) + grey * SKIN_DESAT) * np.array(SKIN_TONE))[skin_mask]
tint(out, hair_mask, HAIR_BLACK)
tint(out, mask_mask, MASK_GUNMETAL, 0.6, 1.4)
tint(out, eye_mask, EYE_BROWN)   # last, so it wins over the hair/mask fill where they overlap

os.makedirs(TEX, exist_ok=True)
Image.fromarray(out.astype(np.uint8), "RGB").save(OUT)
print("saved", OUT)
