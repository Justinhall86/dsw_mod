"""Texture storytelling - runs in SYSTEM python (needs Pillow, which Blender
does not bundle).  18_variant_lib.paint_albedo() shells out to this file.

    python 18b_paint.py <src.png> <out.png> <spec.json>

spec.json is a list of ops; every op carries a "mask_file" (.npy bool array).
See paint_albedo() below for the supported modes.
"""
import json
import math
import os
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFont


def paint_albedo(src_path, out_path, ops, size=512):
    """Apply world-space paint instructions to a copy of the albedo.

    Every op carries its own UV mask.  Supported modes:
      replace  - take the target HUE/SAT and the base LUMINANCE (keeps every
                 panel line and shadow, exactly like the recolour pipeline)
      darken   - multiply the masked pixels by `factor`
      desat    - flatten saturation over the texture (stealth)
      stripes  - hazard stripes in `color`, tilted `angle` degrees
      stencil  - paint `text` in `color` inside the box
    """
    img = np.asarray(Image.open(src_path).convert("RGB")).astype(np.float32)
    h, w, _ = img.shape
    for op in ops:
        mode = op.get("mode", "replace")
        col = np.array(op.get("color", [214, 140, 58]), dtype=np.float32)
        alpha = float(op.get("alpha", 1.0))
        m = op.get("mask")
        if m is None:
            m = np.ones((h, w), dtype=bool)
        if mode == "desat":
            lum = img @ np.array([0.299, 0.587, 0.114], dtype=np.float32)
            grey = np.repeat(lum[..., None], 3, axis=2)
            f = float(op.get("factor", 0.85))
            tgt = img * (1 - f) + grey * f
            img[m] = tgt[m]
            continue
        if not m.any():
            print("  paint op made an EMPTY mask - box missed the hull?")
            continue
        if mode == "replace":
            lum = img @ np.array([0.299, 0.587, 0.114], dtype=np.float32)
            base_l = lum[m].mean() or 1.0
            tgt_l = float(col @ np.array([0.299, 0.587, 0.114])) or 1.0
            scaled = np.clip(col * (base_l / tgt_l), 0, 255)
            new = img * (1 - alpha) + scaled * alpha
            img[m] = new[m]
        elif mode in ("darken", "gain"):
            # same multiply; `factor` < 1 burns, > 1 lifts (keep the panel
            # lines, only move the value)
            img[m] = np.clip(img[m] * float(op.get("factor", 0.5)), 0, 255)
        elif mode == "stripes":
            period = float(op.get("period", 26))
            ang = math.radians(float(op.get("angle", 45)))
            yy, xx = np.mgrid[0:h, 0:w]
            proj = (xx * math.cos(ang) + yy * math.sin(ang))
            band = np.floor(proj / period) % 2
            sel = m & (band == 0)
            if sel.any():
                lum = img @ np.array([0.299, 0.587, 0.114], dtype=np.float32)
                base = np.clip(lum / 128.0, 0.4, 1.8)[..., None]
                stripe = np.clip(col * base, 0, 255)
                img[sel] = img[sel] * (1 - alpha) + stripe[sel] * alpha
        elif mode == "stencil":
            pil = Image.fromarray(img.astype(np.uint8))
            d = ImageDraw.Draw(pil)
            xs = np.where(m.any(axis=0))[0]
            ys = np.where(m.any(axis=1))[0]
            if len(xs) and len(ys):
                fnt = None
                try:
                    fnt = ImageFont.truetype(
                        "arial.ttf",
                        int(op.get("px", (ys.max() - ys.min()) * 0.7)))
                except Exception:
                    fnt = None
                txt = op.get("text", "")
                cx, cy = (xs.min() + xs.max()) // 2, (ys.min() + ys.max()) // 2
                d.text((cx, cy), txt, fill=tuple(int(c) for c in col),
                       font=fnt, anchor="mm")
            img = np.asarray(pil).astype(np.float32)
        else:
            raise SystemExit("unknown paint mode " + mode)
    os.makedirs(os.path.dirname(os.path.abspath(out_path)), exist_ok=True)
    Image.fromarray(np.clip(img, 0, 255).astype(np.uint8)).save(out_path)
    return out_path


if __name__ == "__main__":
    src, out, spec_path = sys.argv[1], sys.argv[2], sys.argv[3]
    ops = json.load(open(spec_path, encoding="utf-8"))
    for op in ops:
        f = op.pop("mask_file", None)
        if f:
            op["mask"] = np.load(f)
    paint_albedo(src, out, ops)
    print("PAINTED", out)
