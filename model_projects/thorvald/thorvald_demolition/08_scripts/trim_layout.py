"""Layout of the Thorvald TRIM atlas (1024 x 1024) shared by the model builder and the texture painter, plus the hat profile.

Boxes are pixel rectangles (x0, y0, x1, y1) with the ORIGIN AT THE BOTTOM-LEFT (Blender UV space, v up).  Rows of the saved image run top-down, so the
painter flips y.  For the lofted parts (hat, yoke, cuffs, waist) u runs once around the part (0..1 = 360 degrees) and v runs along the profile.
"""
SIZE = 1024

BOX = {
    "hat_out": (0, 0, 512, 192),        # outer surface, apex (v 0) -> rim edge (v 1)
    "hat_under": (0, 192, 512, 320),    # underside, same profile fractions
    "hat_rim": (0, 320, 512, 352),      # the rim's edge band: v 0 = outer ring, v 1 = inner ring
    "cuff": (0, 352, 256, 448),         # elbow cuff, along the arm (v 0 = shoulder end -> 1)
    "cap": (256, 352, 512, 448),        # shoulder cap (dome under the pauldron): planar x/y -> u/v
    "tab_front": (0, 448, 512, 704),    # skirt tabard: planar projection from the front, x -> u, z -> v (hem at the bottom)
    "yoke0": (512, 0, 1024, 96),        # three stacked yoke tiers (neck v 0 -> edge v 1)
    "yoke1": (512, 96, 1024, 192),
    "yoke2": (512, 192, 1024, 288),
    "waist": (512, 288, 1024, 384),     # cummerbund ring
    "tab_back": (512, 384, 1024, 640),  # skirt tabard seen from behind
    "tails": (0, 704, 512, 1024),       # dark coat tails: u across the panel, v hem (0) -> waist (1)
    "hood": (512, 640, 1024, 1024),     # hood + mask: u = angle around the head (0 = front), v = height (neck 0 -> crown 1)
}

# tabard planar mapping (metres, rest pose, before the waist is lifted)
TAB_X = (-0.27, 0.27)
TAB_Z = (0.69, 1.225)
TAB_HEM = 0.052            # height of the patterned hem band in metres

# ---- hat profile measured from the Meshy sculpt (extract_hat.py + hat_profile.py); metres at the sculpt's scale ------------------
HAT_RINGS = (0.0, 0.062, 0.066, 0.070, 0.175, 0.180, 0.184, 0.25, 0.265, 0.272)
HAT_OUTER_Z = (0.0, -0.0372, -0.0366, -0.0420, -0.1024, -0.1000, -0.1100, -0.1559, -0.1660, -0.1708)
HAT_THICK = (0.004, 0.0067, 0.0067, 0.0067, 0.0067, 0.0067, 0.0160, 0.0260, 0.0135, 0.0120)
HAT_RIM_R = 0.272


def hat_vfrac():
    """Arc-length fraction (0 apex .. 1 rim) of each hat ring along the outer profile."""
    import math
    d = [0.0]
    for i in range(1, len(HAT_RINGS)):
        d.append(d[-1] + math.hypot(HAT_RINGS[i] - HAT_RINGS[i - 1], HAT_OUTER_Z[i] - HAT_OUTER_Z[i - 1]))
    return [x / d[-1] for x in d]


def uv(box, u, v):
    """(u, v) in 0..1 of a region -> atlas UV (0..1)."""
    x0, y0, x1, y1 = BOX[box]
    return ((x0 + u * (x1 - x0)) / SIZE, (y0 + v * (y1 - y0)) / SIZE)

# hood rings (rest pose heights, metres) and where the eye slit sits (ring index range); painter + builder share them
HOOD_RINGS = (1.600, 1.625, 1.650, 1.675, 1.700, 1.725, 1.750, 1.775, 1.805, 1.835, 1.865, 1.895, 1.925, 1.950)
HOOD_SLIT = (8, 10)
HOOD_TOP = 1.985
