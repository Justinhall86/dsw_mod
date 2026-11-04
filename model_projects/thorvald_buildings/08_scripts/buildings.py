"""The House Thorvald unique buildings (see house_thorvald/buildings.md). Each function builds into kit.OBJS.
Units are metres, Z up, front faces -Y, the footprint is centred on the origin and the ground is z = 0.
"""
import math

import kit as K
from kit import box, cyl, beam, emblem, banner, lamp, lamp_post, container, half_barrel, sphere

PI = math.pi


def foundation(w, d, h=0.3, mat="slab"):
    box("foundation", (w, d, h), (0, 0, 0), mat, bevel=0.05)
    box("edge_front", (w - 0.4, 0.14, 0.04), (0, -d / 2 + 0.2, h), "burnt", bevel=0.0)
    box("edge_back", (w - 0.4, 0.14, 0.04), (0, d / 2 - 0.2, h), "burnt", bevel=0.0)
    return h


def window_row(prefix, n, x0, dx, y, z, size=(0.5, 0.1, 0.7), mat="lamp"):
    for i in range(n):
        box("%s%d" % (prefix, i), size, (x0 + i * dx, y, z), mat, bevel=0.0)


# ---------------------------------------------------------------------------------------------------- 1
def consignment_terminal():
    """Main Base. A freight dock and silo yard that ships Spice and Plascrete off-world to Heighforge."""
    Z = foundation(18, 13)
    box("apron", (12.5, 5.0, 0.1), (0, -3.9, Z), "plate", bevel=0.02)
    for sx in (-5.8, 5.8):
        box("rail", (0.2, 5.0, 0.08), (sx, -3.9, Z + 0.1), "gun", bevel=0.0)
    for i, x in enumerate((-6.2, -2.4, 1.4)):                      # three silos
        cyl("silo%d" % i, 1.7, 7.0, (x, 3.0, Z), "gun", segs=28)
        for k, zb in enumerate((1.6, 4.4)):
            cyl("silo%d_band%d" % (i, k), 1.76, 0.5, (x, 3.0, Z + zb), "rust", segs=28)
        cyl("silo%d_cap" % i, 1.8, 1.5, (x, 3.0, Z + 7.0), "copper", r2=0.35, segs=28)
        cyl("silo%d_lamp" % i, 0.18, 0.5, (x, 3.0, Z + 8.5), "lamp", segs=8)
        box("silo%d_ladder" % i, (0.35, 0.1, 6.6), (x + 1.2, 1.35, Z), "rust_deep", bevel=0.0)
    cyl("manifold", 0.3, 7.6, (-2.4, 3.0, Z + 6.2), "plate", rot=(0, PI / 2, 0), center=True, segs=14)
    beam("conveyor", (-2.4, 1.2, Z + 5.0), (-2.4, -3.2, Z + 1.7), 0.8, "plate")
    for t in (0.15, 0.4, 0.65, 0.9):                                # conveyor supports
        y = 1.2 + (-3.2 - 1.2) * t
        zt = Z + 5.0 + (1.7 - 5.0) * t
        box("cv_leg%d" % int(t * 100), (0.3, 0.3, zt - Z - 0.4), (-2.4, y, Z), "gun", bevel=0.02)
    box("cab", (4.4, 3.4, 3.4), (6.6, 3.2, Z), "plate", bevel=0.06)
    box("cab_roof", (4.8, 3.8, 0.3), (6.6, 3.2, Z + 3.4), "gun", bevel=0.05)
    window_row("cab_win", 5, 5.3, 0.65, 1.44, Z + 1.7, (0.45, 0.08, 0.6))
    cyl("cab_mast", 0.08, 3.0, (7.8, 3.6, Z + 3.7), "gun", segs=8)
    for sx in (-5.6, 5.6):                                          # gantry legs + beam + trolley
        box("gantry_leg", (0.55, 0.55, 6.4), (sx, -3.9, Z + 0.1), "gun", bevel=0.04)
        box("gantry_foot", (1.2, 1.2, 0.25), (sx, -3.9, Z + 0.1), "burnt", bevel=0.03)
    box("gantry_beam", (12.4, 0.8, 0.8), (0, -3.9, Z + 6.3), "burnt", bevel=0.05)
    box("trolley", (1.4, 1.1, 0.5), (1.0, -3.9, Z + 5.8), "gun", bevel=0.04)
    cyl("hoist_cable", 0.04, 3.6, (1.0, -3.9, Z + 2.3), "plate", segs=6)
    box("hook", (0.5, 0.4, 0.45), (1.0, -3.9, Z + 1.9), "copper", bevel=0.03)
    container("crate_a", (-3.6, -4.8, Z + 0.1), "rust", 0.0)
    container("crate_b", (-3.6, -4.8, Z + 1.4), "gun", 0.0)
    container("crate_c", (3.2, -3.4, Z + 0.1), "burnt", 0.15)
    container("crate_d", (-0.2, -5.4, Z + 0.1), "gun", -0.1)
    banner("banner", (-8.2, -5.3, Z), 3.4, 1.2)
    lamp_post("post_a", (8.2, -5.4, Z))
    lamp_post("post_b", (-8.4, 5.0, Z))


# ---------------------------------------------------------------------------------------------------- 2
def contract_hall():
    """Main Base. Where the house hires its soldiers: a columned hall under a wide kasa-hat roof."""
    Z = foundation(17, 17)
    box("plinth1", (13.4, 13.4, 0.5), (0, 0, Z), "plate", bevel=0.06)
    box("plinth2", (11.6, 11.6, 0.5), (0, 0, Z + 0.5), "slab", bevel=0.06)
    Z2 = Z + 1.0
    box("hall", (9.0, 9.0, 4.4), (0, 0, Z2), "gun", bevel=0.06)
    box("trim_low", (9.3, 9.3, 0.22), (0, 0, Z2 + 0.2), "burnt", bevel=0.02)
    box("trim_high", (9.3, 9.3, 0.22), (0, 0, Z2 + 4.2), "burnt", bevel=0.02)
    pts = [(v, w) for v in (-4.9, -1.63, 1.63, 4.9) for w in (-4.9, 4.9)] + [(w, v) for v in (-1.63, 1.63) for w in (-4.9, 4.9)]
    for k, (x, y) in enumerate(pts):                                # 12 perimeter columns
        cyl("col%d" % k, 0.28, 4.7, (x, y, Z2), "plate", segs=12)
        cyl("colcap%d" % k, 0.4, 0.2, (x, y, Z2 + 4.5), "copper", segs=12)
    cyl("roof", 7.6, 3.2, (0, 0, Z2 + 4.7), "rust_deep", r2=2.0, segs=40)        # the kasa-hat roof
    cyl("roof_rim", 7.7, 0.2, (0, 0, Z2 + 4.7), "burnt", segs=40)
    cyl("roof_band", 5.5, 0.12, (0, 0, Z2 + 5.9), "copper", r2=5.48, segs=40)
    cyl("drum", 2.0, 1.2, (0, 0, Z2 + 7.9), "plate", segs=32)
    cyl("drum_lamps", 2.04, 0.2, (0, 0, Z2 + 8.4), "lamp", segs=32)
    cyl("drum_cap", 2.3, 0.25, (0, 0, Z2 + 9.1), "copper", r2=0.4, segs=32)
    cyl("finial", 0.16, 1.4, (0, 0, Z2 + 9.35), "copper", r2=0.04, segs=10)
    box("door", (2.8, 0.3, 3.4), (0, -4.55, Z2), "glass", bevel=0.03)
    box("door_lintel", (3.4, 0.36, 0.3), (0, -4.57, Z2 + 3.4), "burnt", bevel=0.02)
    emblem("door_emblem", 1.7, (0, -4.74, Z2 + 1.5))
    for sx in (-4.2, 4.2):
        banner("banner%d" % int(sx), (sx, -6.2, Z + 0.5), 3.6, 1.1)
        cyl("brazier%d" % int(sx), 0.45, 0.8, (sx * 0.62, -6.4, Z + 0.5), "copper", r2=0.7, segs=12)
        cyl("brazier_fire%d" % int(sx), 0.5, 0.12, (sx * 0.62, -6.4, Z + 1.3), "lamp", segs=12)
    for (x, y) in ((-6.9, -6.9), (6.9, -6.9), (-6.9, 6.9), (6.9, 6.9)):
        lamp_post("post%d%d" % (x, y), (x, y, Z + 0.5), 3.6)


# ---------------------------------------------------------------------------------------------------- 3
def syndicate_exchange():
    """Main Base. A trading house: portico, ticker band and the emblem over the door."""
    Z = foundation(17, 13)
    box("plinth", (13.6, 9.6, 0.5), (0, 0.3, Z), "plate", bevel=0.05)
    Z2 = Z + 0.5
    box("main", (11, 7, 6.6), (0, 1.0, Z2), "gun", bevel=0.06)
    box("upper", (8.2, 5.4, 2.8), (0, 1.2, Z2 + 6.6), "plate", bevel=0.06)
    box("cornice", (11.4, 7.4, 0.3), (0, 1.0, Z2 + 6.4), "burnt", bevel=0.03)
    box("cornice_top", (8.6, 5.8, 0.25), (0, 1.2, Z2 + 9.4), "copper", bevel=0.03)
    for i in range(6):                                              # portico
        cyl("col%d" % i, 0.38, 5.0, (-4.0 + i * 1.6, -3.5, Z2), "plate", segs=14)
        cyl("colcap%d" % i, 0.55, 0.22, (-4.0 + i * 1.6, -3.5, Z2 + 4.9), "copper", segs=14)
    box("portico_roof", (11.2, 2.6, 0.5), (0, -3.2, Z2 + 5.1), "gun", bevel=0.05)
    box("portico_trim", (11.4, 0.2, 0.3), (0, -4.55, Z2 + 5.1), "burnt", bevel=0.02)
    box("door", (2.6, 0.2, 3.6), (0, -2.58, Z2), "glass", bevel=0.03)
    emblem("big_emblem", 2.6, (0, -1.56, Z2 + 8.0))
    box("ticker", (10.4, 0.12, 0.32), (0, -2.54, Z2 + 5.65), "lamp", bevel=0.0)
    for k, y in enumerate((-5.2, -5.8)):
        box("steps%d" % k, (7.6, 0.8, 0.17 * (k + 1)), (0, y, Z2 - 0.0), "plate", bevel=0.02)
    for sx in (-6.9, 6.9):                                          # flanking wings
        box("wing%d" % int(sx), (3.0, 6.4, 3.6), (sx, 1.0, Z2), "plate", bevel=0.05)
        box("wing_roof%d" % int(sx), (3.3, 6.7, 0.25), (sx, 1.0, Z2 + 3.6), "burnt", bevel=0.02)
    for i in range(4):
        for sx in (-8.45, 8.45):
            box("sidewin%d_%d" % (i, int(sx)), (0.1, 0.55, 1.0), (sx, -0.9 + i * 1.5, Z2 + 1.4), "lamp", bevel=0.0)
    cyl("mast", 0.12, 5.0, (-2.6, 1.6, Z2 + 9.6), "gun", segs=8)
    cyl("dish", 0.9, 0.18, (-2.6, 1.0, Z2 + 12.6), "copper", r2=0.15, segs=20, rot=(-0.6, 0, 0), center=True)
    cyl("vent1", 0.5, 1.2, (2.6, 2.4, Z2 + 9.6), "gun", segs=12)
    cyl("vent2", 0.5, 1.2, (3.9, 2.4, Z2 + 9.6), "gun", segs=12)
    banner("banner_l", (-7.8, -5.2, Z2), 3.6, 1.1)
    banner("banner_r", (7.8, -5.2, Z2), 3.6, 1.1)


# ---------------------------------------------------------------------------------------------------- 4
def ledger_office():
    """Main Base. The spymaster's counting house: a vault tower with a round vault door."""
    Z = foundation(13, 13)
    TX, TY = 1.6, 0.8
    box("tower", (7.6, 7.6, 8.0), (TX, TY, Z), "gun", bevel=0.06)
    box("tower_top", (6.2, 6.2, 1.6), (TX, TY, Z + 8.0), "plate", bevel=0.05)
    box("parapet", (7.9, 7.9, 0.3), (TX, TY, Z + 7.8), "burnt", bevel=0.03)
    box("parapet_top", (6.5, 6.5, 0.24), (TX, TY, Z + 9.6), "copper", bevel=0.03)
    box("annex", (3.8, 7.6, 3.8), (-4.1, TY, Z), "plate", bevel=0.06)
    box("annex_roof", (4.1, 7.9, 0.25), (-4.1, TY, Z + 3.8), "burnt", bevel=0.02)
    for i in range(5):
        box("slit%d" % i, (0.1, 0.5, 1.4), (-6.03, -1.9 + i * 1.3, Z + 1.2), "lamp", bevel=0.0)
    for i in range(5):                                              # slit windows up the tower side
        for k in range(3):
            box("tslit%d_%d" % (i, k), (0.1, 0.45, 1.3), (TX + 3.84, -1.2 + i * 1.3, Z + 1.6 + k * 2.3), "lamp", bevel=0.0)
    yf = TY - 3.8                                                   # front face of the tower
    box("vault_frame", (4.6, 0.5, 4.6), (TX, yf - 0.1, Z + 0.3), "gun", bevel=0.1)
    cyl("vault_ring", 2.15, 0.35, (TX, yf - 0.4, Z + 2.6), "plate", segs=40, rot=(PI / 2, 0, 0), center=True)
    cyl("vault_door", 1.85, 0.4, (TX, yf - 0.55, Z + 2.6), "copper", segs=40, rot=(PI / 2, 0, 0), center=True)
    cyl("vault_hub", 0.55, 0.5, (TX, yf - 0.8, Z + 2.6), "burnt", segs=20, rot=(PI / 2, 0, 0), center=True)
    for k in range(4):
        box("spoke%d" % k, (3.5, 0.18, 0.2), (TX, yf - 0.9, Z + 2.6), "gun", bevel=0.01, center=True, rot=(0, k * PI / 4, 0))
    emblem("tower_emblem", 2.6, (TX, yf - 0.12, Z + 6.4))
    for k, y in enumerate((yf - 1.4, yf - 2.0)):
        box("steps%d" % k, (4.8, 0.7, 0.17 * (k + 1)), (TX, y, Z), "plate", bevel=0.02)
    for i in range(3):
        box("shutter%d" % i, (1.2, 0.9, 0.5), (TX - 1.6 + i * 1.6, 1.8, Z + 9.84), "gun", bevel=0.03)
    cyl("chimney", 0.45, 2.0, (TX + 2.0, 2.6, Z + 9.84), "gun", segs=12)
    banner("banner", (-5.0, -4.8, Z), 3.4, 1.1)
    lamp_post("post", (5.9, -5.0, Z), 3.8)


# ---------------------------------------------------------------------------------------------------- 5
def subcontract_depot():
    """Village. An airfield variant: landing pad, hangar, fuel tanks and a control tower."""
    Z = foundation(22, 18)
    cyl("pad_outer", 5.6, 0.1, (-5.2, -2.0, Z), "burnt", segs=48)
    cyl("pad_inner", 5.1, 0.14, (-5.2, -2.0, Z), "plate", segs=48)
    for sx in (-1.4, 1.4):
        box("H_leg", (0.5, 3.6, 0.04), (-5.2 + sx, -2.0, Z + 0.14), "burnt", bevel=0.0)
    box("H_bar", (2.8, 0.5, 0.04), (-5.2, -2.0, Z + 0.14), "burnt", bevel=0.0)
    box("hangar_walls", (9.4, 7.2, 3.4), (5.8, 3.4, Z), "gun", bevel=0.06)
    half_barrel("hangar_roof", 3.6, 9.4, (5.8, 3.4, Z + 3.4), "plate", squash=0.62)
    box("hangar_door", (6.2, 0.3, 3.0), (5.8, -0.28, Z), "glass", bevel=0.03)
    box("hangar_lintel", (6.8, 0.36, 0.3), (5.8, -0.3, Z + 3.0), "burnt", bevel=0.02)
    emblem("hangar_emblem", 2.0, (5.8, -0.35, Z + 3.7))
    for i in range(5):
        box("hangar_win%d" % i, (0.5, 0.1, 0.35), (2.6 + i * 1.2, -0.2, Z + 3.05), "lamp", bevel=0.0)
    for i, y in enumerate((-6.6, -4.4)):                            # fuel tanks
        cyl("tank%d" % i, 1.05, 5.2, (5.8, y, Z + 1.35), "plate",
            rot=(0, PI / 2, 0), center=True, segs=24)
        for k in (-1.8, 1.8):
            box("cradle%d_%d" % (i, int(k * 10)), (0.5, 1.6, 1.2), (5.8 + k, y, Z), "gun", bevel=0.04)
        cyl("tank_band%d" % i, 1.08, 0.5, (5.8, y, Z + 1.35), "burnt", rot=(0, PI / 2, 0), center=True, segs=24)
        cyl("tank_dome%d" % i, 0.3, 0.3, (5.8, y, Z + 2.4), "copper", segs=12)
    cyl("tower_shaft", 0.9, 7.0, (-9.0, 6.0, Z), "gun", segs=16)
    cyl("tower_cab", 1.9, 1.7, (-9.0, 6.0, Z + 7.0), "glass", segs=16)
    cyl("tower_cab_rim", 2.0, 0.25, (-9.0, 6.0, Z + 7.0), "burnt", segs=16)
    cyl("tower_roof", 2.3, 0.9, (-9.0, 6.0, Z + 8.7), "rust_deep", r2=0.3, segs=16)
    cyl("tower_mast", 0.07, 2.4, (-9.0, 6.0, Z + 9.5), "gun", segs=8)
    cyl("windsock_pole", 0.07, 3.4, (-9.0, -4.8, Z), "gun", segs=8)
    cyl("windsock", 0.4, 1.6, (-8.1, -4.8, Z + 3.2), "burnt", r2=0.12, segs=12, rot=(0, PI / 2 + 0.1, 0), center=True)
    banner("banner", (-2.0, 7.4, Z), 3.2, 1.0)
    for (x, y) in ((-10.2, -8.0), (10.2, -8.0), (10.2, 8.2)):
        lamp_post("post%d" % int(x), (x, y, Z), 4.0)


# ---------------------------------------------------------------------------------------------------- 6
def deep_mine_works():
    """Village. A mine headframe, winch house, ore crusher and bin."""
    Z = foundation(19, 16)
    # mine portal at the back, rails running to the front
    box("portal_l", (1.1, 2.0, 3.6), (-8.2, 6.2, Z), "plate", bevel=0.05)
    box("portal_r", (1.1, 2.0, 3.6), (-4.6, 6.2, Z), "plate", bevel=0.05)
    box("portal_top", (5.2, 2.0, 1.0), (-6.4, 6.2, Z + 3.6), "gun", bevel=0.05)
    box("portal_dark", (2.6, 1.0, 3.5), (-6.4, 6.9, Z), "glass", bevel=0.02)
    box("portal_trim", (5.4, 0.2, 0.28), (-6.4, 5.15, Z + 4.6), "burnt", bevel=0.01)
    for x in (-7.0, -5.8):
        box("rail", (0.12, 9.0, 0.1), (x, 0.9, Z), "copper", bevel=0.0)
    for i in range(9):
        box("sleeper%d" % i, (1.9, 0.22, 0.08), (-6.4, 5.4 - i * 1.0, Z), "rust_deep", bevel=0.0)
    box("cart", (1.3, 1.9, 0.9), (-6.4, 1.2, Z + 0.3), "rust", bevel=0.05)
    for sx in (-0.55, 0.55):
        for sy in (-0.6, 0.6):
            cyl("cartwheel", 0.22, 0.12, (-6.4 + sx * 1.3, 1.2 + sy, Z + 0.22), "gun", rot=(0, PI / 2, 0), center=True, segs=12)
    # headframe: A-frame with a sheave wheel
    for sx in (-1.0, 1.0):
        for sy in (-1.2, 1.2):
            beam("hf_leg", (sx * 2.2 + 0.0, sy * 1.6 + 1.0, Z), (sx * 0.5, 1.0 + sy * 0.3, Z + 10.0), 0.4, "gun")
    for zz in (3.2, 6.0):
        wd = 2 * (2.2 - 1.7 * zz / 10.0)
        box("hf_brace_a", (wd, 0.25, 0.25), (0, 1.0 - 1.6 + 1.3 * zz / 10.0, Z + zz), "plate", bevel=0.01)
        box("hf_brace_b", (wd, 0.25, 0.25), (0, 1.0 + 1.6 - 1.3 * zz / 10.0, Z + zz), "plate", bevel=0.01)
    cyl("sheave", 1.3, 0.35, (0, 1.0, Z + 10.2), "copper", segs=32, rot=(PI / 2, 0, 0), center=True)
    cyl("sheave_hub", 0.35, 0.8, (0, 1.0, Z + 10.2), "burnt", segs=16, rot=(PI / 2, 0, 0), center=True)
    cyl("cable", 0.05, 10.0, (0.0, 1.0, Z), "plate", segs=6)
    cyl("hf_lamp", 0.2, 0.4, (0, 1.0, Z + 11.0), "lamp", segs=8)
    # winch house
    box("winch", (4.4, 3.2, 2.8), (5.4, 3.6, Z), "plate", bevel=0.06)
    box("winch_roof", (4.8, 3.6, 0.3), (5.4, 3.6, Z + 2.8), "burnt", bevel=0.03)
    window_row("winch_win", 4, 4.2, 0.8, 1.94, Z + 1.5, (0.5, 0.08, 0.5))
    cyl("winch_drum", 0.9, 1.6, (3.0, 3.6, Z + 1.0), "gun", rot=(0, PI / 2, 0), center=True, segs=20)
    # crusher + conveyor + ore bin
    for sx in (-1.4, 1.4):
        for sy in (-1.4, 1.4):
            box("crusher_leg", (0.4, 0.4, 3.0), (5.8 + sx, -3.0 + sy, Z), "gun", bevel=0.03)
    cyl("hopper", 1.2, 2.4, (5.8, -3.0, Z + 3.0), "rust", r2=2.4, segs=24)
    cyl("hopper_rim", 2.5, 0.2, (5.8, -3.0, Z + 5.4), "burnt", segs=24)
    cyl("crusher_body", 1.5, 2.4, (5.8, -3.0, Z + 0.6), "gun", segs=20)
    beam("belt", (3.6, -3.0, Z + 1.0), (-2.7, -5.4, Z + 3.6), 0.8, "plate")
    box("bin", (3.4, 2.6, 2.2), (-3.6, -5.6, Z), "rust_deep", bevel=0.05)
    box("bin_chute", (1.4, 1.2, 0.8), (-3.6, -6.9, Z + 0.5), "gun", bevel=0.03)
    for i, (x, y, s) in enumerate(((-6.6, -4.2, 1.5), (-8.0, -5.6, 1.1), (-6.2, -6.4, 0.9), (7.8, -6.4, 1.2))):
        sphere("ore%d" % i, s, (x, y, Z + s * 0.45), "rock", scale=(1.2, 1.0, 0.7), seed=i)
    cyl("mast", 0.1, 6.0, (8.2, 5.8, Z), "gun", segs=8)
    box("floodlights", (1.4, 0.2, 0.7), (8.2, 5.6, Z + 5.6), "lamp", bevel=0.0)
    banner("banner", (-1.4, -7.0, Z), 3.2, 1.0)


# ---------------------------------------------------------------------------------------------------- 7
def asylum_quarter():
    """Village. A walled refugee and deserter compound with gate towers and barracks rows."""
    Z = foundation(23, 20)
    W, D, T, H = 20.4, 17.4, 0.6, 2.4
    box("wall_back", (W, T, H), (0, D / 2, Z), "plate", bevel=0.04)
    box("wall_l", (T, D, H), (-W / 2, 0, Z), "plate", bevel=0.04)
    box("wall_r", (T, D, H), (W / 2, 0, Z), "plate", bevel=0.04)
    for sx in (-1, 1):
        box("wall_front", (W / 2 - 2.4, T, H), (sx * (W / 4 + 1.2), -D / 2, Z), "plate", bevel=0.04)
    for (x, y, l, w) in ((0, D / 2, W + 0.4, 0.2), (-W / 2, 0, 0.2, D), (W / 2, 0, 0.2, D)):
        box("cap", (l, w, 0.14), (x, y, Z + H), "burnt", bevel=0.01)
    for (x, y) in ((-W / 2, D / 2), (W / 2, D / 2), (-2.7, -D / 2), (2.7, -D / 2), (-W / 2, -D / 2), (W / 2, -D / 2)):
        big = abs(x) == 2.7
        s = 2.2 if big else 1.9
        h = 5.6 if big else 4.4
        box("tower", (s, s, h), (x, y, Z), "gun", bevel=0.05)
        box("tower_top", (s + 0.5, s + 0.5, 0.3), (x, y, Z + h), "burnt", bevel=0.02)
        cyl("tower_roof", s * 0.95, 1.0, (x, y, Z + h + 0.3), "rust_deep", r2=0.15, segs=4, rot=(0, 0, PI / 4))
        box("tower_lamp", (s * 0.5, 0.1, 0.4), (x, y - s / 2 - 0.02, Z + h - 0.9), "lamp", bevel=0.0)
    box("gate_beam", (5.4, 0.5, 1.7), (0, -D / 2, Z + 3.6), "gun", bevel=0.04)
    box("gate_trim", (5.6, 0.56, 0.16), (0, -D / 2, Z + 5.3), "burnt", bevel=0.01)
    emblem("gate_emblem", 1.4, (0, -D / 2 - 0.27, Z + 4.45))
    for i, y in enumerate((-4.5, 0.2, 4.9)):                        # barracks rows
        for sx in (-6.0, 6.0):
            box("hut%d_%d" % (i, int(sx)), (7.0, 3.2, 2.2), (sx, y, Z), "rust_deep", bevel=0.05)
            box("hut_roof%d_%d" % (i, int(sx)), (7.6, 3.6, 0.25), (sx, y, Z + 2.2), "gun", bevel=0.03, rot=(0.0, 0.0, 0.0))
            window_row("hut_win%d_%d" % (i, int(sx)), 3, sx - 2.0, 2.0, y - 1.64, Z + 1.2, (0.5, 0.08, 0.5))
            box("hut_door%d_%d" % (i, int(sx)), (0.9, 0.1, 1.5), (sx + (-3.0 if sx > 0 else 3.0) * 0 + 2.9, y - 1.64, Z), "glass", bevel=0.0)
    for (x, y) in ((-1.6, 0.4), (1.6, 0.4), (-1.6, 3.6), (1.6, 3.6)):  # central canopy
        cyl("canopy_post", 0.12, 3.2, (x, y, Z), "gun", segs=8)
    cyl("canopy", 3.1, 1.2, (0, 2.0, Z + 3.2), "rust", r2=0.2, segs=4, rot=(0, 0, PI / 4))
    cyl("canopy_lamp", 0.2, 0.5, (0, 2.0, Z + 4.35), "lamp", segs=8)
    cyl("well", 0.7, 0.7, (0, 2.0, Z), "plate", segs=16)
    for i, (x, y) in enumerate(((-3.0, -7.0), (3.4, -7.2))):
        container("crate%d" % i, (x, y, Z), "gun" if i else "rust", 0.2)
    banner("banner_l", (-7.8, -7.8, Z), 3.2, 1.0)
    banner("banner_r", (7.8, -7.8, Z), 3.2, 1.0)


BUILDINGS = {
    "ConsignmentTerminal": consignment_terminal,
    "ContractHall": contract_hall,
    "SyndicateExchange": syndicate_exchange,
    "LedgerOffice": ledger_office,
    "SubContractDepot": subcontract_depot,
    "DeepMineWorks": deep_mine_works,
    "AsylumQuarter": asylum_quarter,
}
