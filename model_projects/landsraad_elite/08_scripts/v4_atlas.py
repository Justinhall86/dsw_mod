"""v4: shared atlas layout (pure numpy, used by Blender scripts and the system-Python texture builder).

The 1024x1024 parts atlas holds
  * three crops of the reference picture for the helmet (front, back, side), each pasted at ZOOM x native resolution, so the helmet's UVs are
    plain orthographic projections of the picture (the helmet then looks like the reference from those views by construction);
  * the pauldron (planar projection along its ring-plane normal, painted procedurally);
  * (later) the collar.
Picture <-> world: front u = 563 + 605 x, back u = 1480 - 605 x, side u = 2162 + 605 y, v = 1442 - 605 z   (picture pixels, 605 px per metre).
"""
import json
import os

import numpy as np

S, ROW0 = 605.0, 1442.0
CX = {"front": 563.0, "back": 1480.0, "side": 2162.0}
SIGN = {"front": 1.0, "back": -1.0, "side": 1.0}
ATLAS = 1024
ZOOM = 2

HERE = os.path.dirname(os.path.abspath(__file__)) if "__file__" in globals() else r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite\08_scripts"


class Island:
    def __init__(self, name, view, h0, h1, z0, z1, ax, ay, zoom=ZOOM):
        self.name, self.view, self.zoom, self.ax, self.ay = name, view, zoom, ax, ay
        us = sorted([CX[view] + SIGN[view] * S * h0, CX[view] + SIGN[view] * S * h1])
        self.u0, self.u1 = int(np.floor(us[0])), int(np.ceil(us[1]))
        self.v0, self.v1 = int(np.floor(ROW0 - S * z1)), int(np.ceil(ROW0 - S * z0))
        self.w, self.h = (self.u1 - self.u0) * zoom, (self.v1 - self.v0) * zoom

    def to_atlas(self, h, z):
        """picture world coords (h = x for front/back, y for side; z) -> atlas pixel coords (float)"""
        u = CX[self.view] + SIGN[self.view] * S * np.asarray(h); v = ROW0 - S * np.asarray(z)
        return self.ax + (u - self.u0) * self.zoom, self.ay + (v - self.v0) * self.zoom

    def to_uv(self, h, z):
        px, py = self.to_atlas(h, z)
        return px / ATLAS, 1.0 - py / ATLAS


ISLANDS = {
    "front": Island("front", "front", -0.19, 0.19, 1.64, 2.04, 0, 0),
    "back": Island("back", "back", -0.19, 0.19, 1.74, 2.04, 0, 486),
    "side": Island("side", "side", -0.19, 0.255, 1.64, 2.04, 464, 0),
}
# free area for the pauldron: x 464..1024, y 490..1024 ; collar strip: x 0..460, y 850..1024
PAD_RECT = (470, 492, 1018, 1018)      # x0, y0, x1, y1 (atlas pixels)
COLLAR_RECT = (4, 856, 458, 1018)

REG = None


def registration():
    """loft(game frame) -> picture frame parameters fitted by silhouette matching (v4_register.py)"""
    global REG
    if REG is None:
        REG = json.load(open(os.path.join(HERE, "intermediate_data", "helm_register.json")))
    return REG


def loft_to_pic(view, xyz):
    """game-frame points (N,3) -> (h, z) in the picture frame for the given view"""
    r = registration()["front" if view in ("front", "back") else "side"]["p"]
    P = np.asarray(xyz, dtype=float)
    h = (r["sh"] * P[:, 1] + r["th"]) if view == "side" else (r["sh"] * P[:, 0] + r["th"])
    z = r["sz"] * (P[:, 2] - 1.82) + 1.82 + r["tz"]
    return h, z


# ---- pauldron: planar projection (plane coordinates a, b of the ring-plane frame, metres) into PAD_RECT
PAD_AB = (-0.215, 0.275, -0.255, 0.190)      # a0, a1, b0, b1


def pad_scale():
    x0, y0, x1, y1 = PAD_RECT; a0, a1, b0, b1 = PAD_AB
    return min((x1 - x0) / (a1 - a0), (y1 - y0) / (b1 - b0))


def pad_to_atlas(a, b):
    x0, y0, x1, y1 = PAD_RECT; a0, a1, b0, b1 = PAD_AB; s = pad_scale()
    return x0 + (np.asarray(a) - a0) * s, y0 + (b1 - np.asarray(b)) * s


def pad_to_uv(a, b):
    px, py = pad_to_atlas(a, b)
    return px / ATLAS, 1.0 - py / ATLAS


PAD_DARK_PX = (1009.0, 1009.0)               # underside faces of the pauldron sample one dark texel patch here
def pad_dark_uv():
    return PAD_DARK_PX[0] / ATLAS, 1.0 - PAD_DARK_PX[1] / ATLAS


# ---- helmet: every quad of the loft owns one square cell (its two triangles share it), baked from the reference views
CELL, CELL_COLS, CELL_MARGIN, CELL_ORIGIN = 32, 14, 2, (0, 0)


def cell_px(k):
    return CELL_ORIGIN[0] + (k % CELL_COLS) * CELL, CELL_ORIGIN[1] + (k // CELL_COLS) * CELL


def cell_uv(k, s, t):
    """UV of the cell-local square coordinates (s, t) in [0, 1] (t runs downwards in the image)"""
    x0, y0 = cell_px(k); inner = CELL - 2 * CELL_MARGIN
    px = x0 + CELL_MARGIN + s * inner; py = y0 + CELL_MARGIN + t * inner
    return px / ATLAS, 1.0 - py / ATLAS
