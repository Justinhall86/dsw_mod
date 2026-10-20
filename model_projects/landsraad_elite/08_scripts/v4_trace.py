"""v4: trace the design's outlines from the reference picture (system Python + OpenCV).

The reference (01_input/landsraad_elite.jpg) shows front / back / side orthographic views of the clean low-poly design at
605 px per metre (soles at image row 1442). Mapping image <-> metres (fitted to the rig coordinates):
    front : u = 563  + 605 x      back : u = 1480 - 605 x      side (from +x) : u = 2162 + 605 y      v = 1442 - 605 z
This module crops a view at an integer zoom, builds colour masks (gold / dark / steel) on the CLEANED reference (bone shapes and the
orange selection outline already inpainted), and extracts polygons in metres with Douglas-Peucker simplification.
"""
import json
import os
import sys

import cv2
import numpy as np

PROJ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
S, ROW0 = 605.0, 1442.0
CX = {"front": 563.0, "back": 1480.0, "side": 2162.0}
SIGN = {"front": 1.0, "back": -1.0, "side": 1.0}       # u = CX + SIGN * S * h


def load_ref(cleaned=True):
    p = os.path.join(PROJ, "04_textures", "reference_cleaned.png") if cleaned else os.path.join(PROJ, "01_input", "landsraad_elite.jpg")
    return cv2.cvtColor(cv2.imread(p), cv2.COLOR_BGR2RGB)


class ViewCrop:
    """A zoomed crop of one view with metric <-> pixel conversion. h = horizontal world axis (x for front/back, y for side)."""

    def __init__(self, ref, view, h0, h1, z0, z1, zoom=4, dh=0.0, dz=0.0):
        self.view, self.zoom, self.dh, self.dz = view, zoom, dh, dz            # dh/dz: local registration shift (metres) of the picture vs the model
        us = sorted([CX[view] + SIGN[view] * S * (h0 + dh), CX[view] + SIGN[view] * S * (h1 + dh)])
        self.u0, self.u1 = int(np.floor(us[0])), int(np.ceil(us[1]))
        self.v0, self.v1 = int(np.floor(ROW0 - S * (z1 + dz))), int(np.ceil(ROW0 - S * (z0 + dz)))
        crop = ref[self.v0:self.v1, self.u0:self.u1]
        self.img = cv2.resize(crop, None, fx=zoom, fy=zoom, interpolation=cv2.INTER_CUBIC)

    def px_to_world(self, px, py):
        u = self.u0 + px / self.zoom; v = self.v0 + py / self.zoom
        h = (u - CX[self.view]) / (SIGN[self.view] * S) - self.dh
        z = (ROW0 - v) / S - self.dz
        return h, z

    def world_to_px(self, h, z):
        u = CX[self.view] + SIGN[self.view] * S * (h + self.dh); v = ROW0 - S * (z + self.dz)
        return (u - self.u0) * self.zoom, (v - self.v0) * self.zoom


def gold_mask(img):
    hsv = cv2.cvtColor(img, cv2.COLOR_RGB2HSV)
    h, s, v = hsv[..., 0].astype(int), hsv[..., 1] / 255.0, hsv[..., 2] / 255.0
    m = (h >= 12) & (h <= 27) & (s >= 0.28) & (s <= 0.66) & (v >= 0.45)
    return m.astype(np.uint8) * 255


def dark_mask(img):
    return (img.max(2) < 45).astype(np.uint8) * 255


def clean_mask(m, open_px=3, close_px=7):
    k1 = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (open_px, open_px)); k2 = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (close_px, close_px))
    return cv2.morphologyEx(cv2.morphologyEx(m, cv2.MORPH_CLOSE, k2), cv2.MORPH_OPEN, k1)


def polygons(mask, vc, eps_m=0.0035, min_area_m2=0.0004):
    """-> list of (polygon [(h,z)...] in metres, is_hole, area_m2) from a binary mask (outer contours and holes)."""
    cnts, hier = cv2.findContours(mask, cv2.RETR_CCOMP, cv2.CHAIN_APPROX_NONE)
    out = []
    for i, c in enumerate(cnts):
        area_px = cv2.contourArea(c)
        area_m2 = area_px / (vc.zoom * S) ** 2
        if area_m2 < min_area_m2:
            continue
        ap = cv2.approxPolyDP(c, eps_m * S * vc.zoom, True)[:, 0, :]
        out.append(([vc.px_to_world(float(x), float(y)) for x, y in ap], bool(hier[0][i][3] >= 0), area_m2))
    return out


def overlay(vc, polys, path, color_outer=(255, 0, 0), color_hole=(0, 160, 255), mask=None):
    im = vc.img.copy()
    if mask is not None:
        im = (im * 0.55 + np.dstack([mask, mask * 0, mask * 0]) * 0.25).astype(np.uint8)
    for poly, hole, _ in polys:
        pts = np.array([vc.world_to_px(h, z) for h, z in poly], np.int32)
        cv2.polylines(im, [pts], True, color_hole if hole else color_outer, 3)
        for p in pts:
            cv2.circle(im, tuple(int(x) for x in p), 6, (255, 255, 255), -1)
    cv2.imwrite(path, cv2.cvtColor(im, cv2.COLOR_RGB2BGR))


if __name__ == "__main__":
    ref = load_ref(True)
    vc = ViewCrop(ref, "side", -0.30, 0.45, 1.35, 1.90, zoom=4)
    m = clean_mask(gold_mask(vc.img))
    polys = polygons(m, vc)
    print("side-view gold polygons:", [(len(p), hole, round(a, 4)) for p, hole, a in polys])
    overlay(vc, polys, os.path.join(PROJ, "02_progress_photos", "10_parts_quality", "trace_side_pauldron_gold.png"), mask=m)
