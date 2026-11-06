"""Shared helpers for the Thorvald councillor / agent portrait cut-outs.

Vanilla portraits are transparent-background busts. Our concept art has a flat dark backdrop, so `cutout` runs GrabCut with the
backdrop colour as the "sure background" seed and feathers the edge. Output is RGBA at the requested size.
"""
import cv2
import numpy as np
from PIL import Image


def load(path):
    return Image.open(path).convert("RGB")


def crop_aspect(img, cx, top, width, aspect, pad_bottom=0):
    """Crop `width` wide, height = width/aspect, starting at `top`, centred on `cx`. Pads with edge colour if it runs off."""
    h = int(round(width / aspect))
    x0 = int(round(cx - width / 2))
    box = (x0, top, x0 + int(width), top + h)
    return img.crop(box)


def backdrop_seed(bgr, border=6):
    """Median colour of the outer frame of the crop: the backdrop."""
    h, w = bgr.shape[:2]
    ring = np.concatenate([bgr[:border].reshape(-1, 3), bgr[:, :border].reshape(-1, 3), bgr[:, -border:].reshape(-1, 3)])
    return np.median(ring, axis=0)


def cutout(pil_rgb, fg_rect, sure_fg=None, iters=6, bg_tol=26, grow=0, feather=1.2, keep_edges=("left", "right", "bottom")):
    """GrabCut the figure out of a flat backdrop.

    fg_rect: (x0, y0, x1, y1) in crop pixels; everything outside is sure background.
    sure_fg: optional list of (x0, y0, x1, y1) boxes that are certainly figure.
    keep_edges: crop edges the figure runs off (torso is cut by the frame): pixels there stay opaque if the figure touches them.
    Returns an RGBA PIL image.
    """
    bgr = cv2.cvtColor(np.array(pil_rgb), cv2.COLOR_RGB2BGR)
    h, w = bgr.shape[:2]
    mask = np.full((h, w), cv2.GC_PR_BGD, np.uint8)
    x0, y0, x1, y1 = fg_rect
    mask[:] = cv2.GC_BGD
    mask[y0:y1, x0:x1] = cv2.GC_PR_FGD
    # pixels that match the backdrop colour closely are probable background even inside the rect
    seed = backdrop_seed(bgr)
    dist = np.linalg.norm(bgr.astype(np.float32) - seed.astype(np.float32), axis=2)
    inside = np.zeros((h, w), bool)
    inside[y0:y1, x0:x1] = True
    mask[inside & (dist < bg_tol)] = cv2.GC_PR_BGD
    if sure_fg:
        for (a, b, c, d) in sure_fg:
            mask[b:d, a:c] = cv2.GC_FGD
    bgd = np.zeros((1, 65), np.float64)
    fgd = np.zeros((1, 65), np.float64)
    cv2.grabCut(bgr, mask, None, bgd, fgd, iters, cv2.GC_INIT_WITH_MASK)
    fg = ((mask == cv2.GC_FGD) | (mask == cv2.GC_PR_FGD)).astype(np.uint8) * 255
    # keep the largest blob only, fill holes
    n, lab, stats, _ = cv2.connectedComponentsWithStats(fg)
    if n > 1:
        big = 1 + int(np.argmax(stats[1:, cv2.CC_STAT_AREA]))
        fg = ((lab == big) * 255).astype(np.uint8)
    inv = 255 - fg
    n, lab, stats, _ = cv2.connectedComponentsWithStats(inv)
    for i in range(1, n):
        x, y, ww, hh, area = stats[i]
        touches = x == 0 or y == 0 or x + ww == w or y + hh == h
        if not touches:
            fg[lab == i] = 255
    if grow:
        k = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (2 * grow + 1, 2 * grow + 1))
        fg = cv2.dilate(fg, k) if grow > 0 else cv2.erode(fg, k)
    alpha = cv2.GaussianBlur(fg, (0, 0), feather) if feather else fg
    out = np.dstack([cv2.cvtColor(bgr, cv2.COLOR_BGR2RGB), alpha])
    return Image.fromarray(out, "RGBA")


def over(rgba, color=(110, 100, 100)):
    bg = Image.new("RGBA", rgba.size, color + (255,))
    bg.alpha_composite(rgba)
    return bg.convert("RGB")


def fit(rgba, size, resample=Image.LANCZOS):
    return rgba.resize(size, resample)


def sharpen(img, amount=0.6, radius=1.0):
    a = np.array(img.convert("RGBA")).astype(np.float32)
    rgb = a[:, :, :3]
    blur = cv2.GaussianBlur(rgb, (0, 0), radius)
    rgb = np.clip(rgb + amount * (rgb - blur), 0, 255)
    a[:, :, :3] = rgb
    return Image.fromarray(a.astype(np.uint8), "RGBA")
