"""Build removal-kitbash variants: base body MINUS parts, with a DONOR head grafted on.

    blender -b --python 03_variants.py -- [V1 V2 ...]

Component ids come from 02_gallery.py (ids = rank by vertex count, deterministic per unit).
Head = faces whose vertices are all dominated by B_HeadJ.  Both pieces share the base's armature.
"""
import importlib
import os
import sys

import bmesh
import bpy
from mathutils import Vector
from mathutils.bvhtree import BVHTree

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))),
                                ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs  # noqa: E402
import dsw_parts as P  # noqa: E402
import hardware as HW  # noqa: E402
import trim_layout as TL  # noqa: E402
import hood as HD  # noqa: E402
import t5_shape as T5S  # noqa: E402
import skirt as SK  # noqa: E402
from dsw_core import script_args  # noqa: E402
from units import material_paths, paths  # noqa: E402

PROJ = os.path.dirname(HERE)
SHOTS = os.path.join(PROJ, "02_progress_photos", "03_variants")
BLENDS = os.path.join(PROJ, "03_blender")

TORSO = ("B_Spine01J", "B_Spine02J", "B_SpineTopJ", "B_lClavicleJ", "B_rClavicleJ", "B_Neck01J")

COLLAR = dict(z_bottom=1.60, top_front=1.692, top_side=1.755, top_back=1.775, rx=0.100, ry=0.096, cy=0.005,
              flare=0.012, open_deg=3.0, thick=0.010, rim=0.012, segs=36, mat_index=0,
              wine_uv=(0.2700, 0.2925, 0.8320, 0.8550),
              gold_uv=(0.2050, 0.2320, 0.3600, 0.3900))  # inside the big blue scarf patch -> solid gold

# Neophyte: short stand collar (jacket collar) around the Idualis02 neck; both UV patches = the Captain's wine mantle texel so it takes the jacket colour
COLLAR_N = dict(z_bottom=1.56, top_front=1.688, top_side=1.715, top_back=1.725, rx=0.068, ry=0.067, cy=0.012, flare=0.006,
                open_deg=5.0, thick=0.007, rim=0.011, segs=32, mat_index=0,
                wine_uv=(0.2700, 0.2925, 0.8320, 0.8550), gold_uv=(0.2050, 0.2320, 0.3600, 0.3900))

COLLAR_P = dict(COLLAR, segs=56, gold_uv=COLLAR["wine_uv"])      # top band is wine; the gold is the metal rim tube (hardware.py)
COLLAR_NP = dict(COLLAR_N, segs=44, gold_uv=COLLAR_N["wine_uv"])

# short black stand collar around the neck (both texel boxes = one flat near-black Commando texel)
_BLK = (0.708, 0.714, 0.958, 0.964)
COLLAR_T = dict(COLLAR_N, segs=44, wine_uv=_BLK, gold_uv=_BLK, rx=0.088, ry=0.086, flare=0.012, top_front=1.625, top_side=1.655, top_back=1.675)

# name -> dict(base, donor, remove=[base comp ids], title)
VARIANTS = {
    # House Thorvald Trooper: Commando body (lean dark suit, shoulder plates, belt) minus backpack and knee pads,
    # Raider wrapped/masked head, Gurney coat panels as the rust skirt.
    "T1_Trooper": dict(base="Commando", donor="Raider", remove=[4, 5, 6, 7, 41, 42, 43, 44, 14, 15, 27, 28],
                       head_shift_z=-0.05,
                       fill=[dict(donor="Gurney", tag="skirt", keep_comps=[5, 6, 9, 10, 19, 20, 22, 23])],
                       hat=dict(R=0.30, h=0.18, drop=0.085, black_uv=(0.711, 0.961), ember_uv=(0.195, 0.148), stripe=(0.89, 0.95)),
                       title="Thorvald Trooper T1: Commando - pack/knee pads + Raider head + Gurney skirt"),
    # T2: lean it down - Duncan's legs + the Mercenary's arms/shoulders on the Commando torso
    "T2_Trooper": dict(base="Commando", donor="Raider", remove=[4, 5, 6, 7, 41, 42, 43, 44],
                       head_shift_z=-0.05,
                       strip_bones=("Shoulder", "Elbow", "Forearm", "Wrist", "Finger", "Thumb", "Hip", "Knee", "Ankle", "Ball"), strip_outer=("Clavicle",), x_cut=0.20,
                       fill=[dict(donor="Mercenary", tag="arms", exclude_first=[6, 17, 40, 52, 60, 67, 18, 19],
                                  match=("Shoulder", "Elbow", "Forearm", "Wrist", "Finger", "Thumb"), match_outer=("Clavicle",), x_cut=0.20),
                             dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball")),
                             dict(donor="Gurney", tag="skirt", keep_comps=[5, 6, 9, 10, 19, 20, 22, 23])],
                       hat=dict(R=0.30, h=0.18, drop=0.085, black_uv=(0.711, 0.961), ember_uv=(0.195, 0.148), stripe=(0.89, 0.95)),
                       title="Thorvald Trooper T2: Commando torso + Mercenary arms + Duncan legs"),
    # T3: slimmer shoulders (Commando pads on Mercenary forearms), Idualis02 half-mask head, scarf cut away + stand collar,
    # Duncan's belt / sash / tabard as the waist (replaces the Gurney skirt)
    "T3_Trooper": dict(base="Commando", donor="Idualis02", remove=[4, 5, 6, 7, 41, 42, 43, 44, 24, 25, 26, 40],
                       head_shift_z=-0.092, head_scale=1.12, head_pivot_z=1.60,
                       cut_below_z=1.27, min_island=16,
                       head_bones=("B_HeadJ", "B_Neck01J"), head_clip=[(5, 1.69)],
                       collar_z=1.585, collar_r=0.205, collar=COLLAR_T,
                       strip_bones=("Elbow", "Forearm", "Wrist", "Finger", "Thumb", "Hip", "Knee", "Ankle", "Ball", "ROOT"),
                       fill=[dict(donor="Mercenary", tag="arms", match=("Elbow", "Forearm", "Wrist", "Finger", "Thumb")),
                             dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball")),
                             dict(donor="Duncan", tag="skirt", keep_comps=[1, 10], zmax=1.218, shift_z=0.062,
                                  retex_dark=dict(vmax=0.45, smax=0.30, uv=(0.7969, 0.4316)))],
                       hat=dict(profile=True, R=0.275, drop=0.092, tilt=4.0, black_uv=(0.711, 0.961), ember_uv=(0.1592, 0.5049), stripe=(0.92, 0.975)),
                       yoke=dict(uv=(0.711, 0.961), cy=0.005, rx_n=0.095, ry_n=0.093, rx_o=0.225, ry_o=0.112, z_neck=1.63, z_edge=1.578,
                                 side_lift=0.045, droop=1.8, segs=40, rows=5),
                       sliver_clean=dict(min_aspect=9.0, max_area=0.0015, zmin=1.3),
                       waist=dict(uv=(0.7969, 0.4316), z_join=1.292, half=0.022, segs=40),
                       cuffs=dict(uv=(0.7969, 0.4316), half=0.075, segs=24, slab=0.06, max_radius=0.10, mer_cut=0.04, base_cut=-0.07, band_shift=0.0),
                       emblem=dict(gear_uv=(0.1592, 0.5049), star_uv=(0.711, 0.961),
                                   spots=[dict(o=(0.085, -1.0, 1.44), d=(0, 1, 0), r=0.034),
                                          dict(o=(0.34, -0.02, 2.2), d=(0, 0, -1), r=0.028),
                                          dict(o=(-0.34, -0.02, 2.2), d=(0, 0, -1), r=0.028)]),
                       title="Thorvald Trooper T3: half mask head, Duncan waist, slimmer shoulders"),
    # T4: the Commando's OWN head (it already has a cloth half mask + hair, same art style and atlas as the body), slimmer shoulders,
    # layered copper-edged yoke, shorter collar
    "T4_Trooper": dict(base="Commando", donor="Commando", remove=[4, 5, 6, 7, 41, 42, 43, 44, 24, 25, 26, 40],
                       head_shift_z=-0.065, head_scale=1.08, head_pivot_z=1.60,
                       cut_below_z=1.27, min_island=16,
                       collar_z=1.585, collar_r=0.205, collar=dict(COLLAR_T, top_front=1.655, top_side=1.725, top_back=1.765, gold_uv=(0.385, 0.390, 0.633, 0.638)),
                       strip_bones=("Elbow", "Forearm", "Wrist", "Finger", "Thumb", "Hip", "Knee", "Ankle", "Ball", "ROOT"),
                       fill=[dict(donor="Mercenary", tag="arms", match=("Elbow", "Forearm", "Wrist", "Finger", "Thumb")),
                             dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball")),
                             dict(donor="Duncan", tag="skirt", keep_comps=[1, 10], zmax=1.218, shift_z=0.062,
                                  retex_dark=dict(vmax=0.45, smax=0.30, uv=(0.7969, 0.4316)))],
                       slim_arm=0.88, trim=True,
                       hat=dict(profile=True, R=0.260, drop=0.092, tilt=4.0, black_uv=(0.711, 0.961), ember_uv=(0.1592, 0.5049), stripe=(0.92, 0.975)),
                       shoulder_caps=dict(segs=12, rings=8),
                       elbow_balls=dict(segs=10, rings=6, rx=0.070, ry=0.070, rz=0.070, out=0.0, fwd=0.0, up=0.012),
                       yoke=dict(uv=(0.711, 0.961), edge_uv=(0.1592, 0.5049), cy=0.005, rx_n=0.095, ry_n=0.093, z_neck=1.625, side_lift=0.018,
                                 droop=1.5, segs=32, rows=3, single=True,
                                 tiers=[dict(rx_o=0.232, ry_o=0.118, z_edge=1.566),
                                        dict(rx_o=0.200, ry_o=0.108, z_edge=1.590),
                                        dict(rx_o=0.165, ry_o=0.100, z_edge=1.612)]),
                       sliver_clean=dict(min_aspect=9.0, max_area=0.0015, zmin=1.3),
                       fill_slots=dict(uv=(0.711, 0.961), min_edges=4, max_edges=8),
                       waist=dict(uv=(0.7969, 0.4316), z_join=1.292, half=0.022, segs=28),
                       cuffs=dict(uv=(0.7969, 0.4316), half=0.075, segs=20, slab=0.06, max_radius=0.10, mer_cut=0.04, base_cut=-0.07, band_shift=0.0),
                       emblem=dict(gear_uv=(0.1592, 0.5049), star_uv=(0.711, 0.961),
                                   spots=[dict(o=(0.085, -1.0, 1.44), d=(0, 1, 0), r=0.041),
                                          dict(o=(0.32, -0.02, 2.2), d=(0, 0, -1), r=0.031),
                                          dict(o=(-0.32, -0.02, 2.2), d=(0, 0, -1), r=0.031)]),
                       title="Thorvald Trooper T4: Commando head with its own half mask, slimmer shoulders, layered yoke"),
    # T5: a COMPLETE upper body.  Gurney's cuirass, back plate, layered pauldrons and whole arms (shoulder to glove, one skinned mesh: no
    # elbow seam) replace the Commando scraps; Duncan legs + sash/tabard as before; a hand-modelled hood + mask under the hat.
    "T5_Trooper": dict(base="Gurney", donor="Gurney", remove=[],
                       cut_below_z=1.26, cut_below_r=0.30, min_island=16,
                       strip_bones=("Hip", "Knee", "Ankle", "Ball", "ROOT"),
                       fill=[dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball"))],
                       skirt=dict(z_top=1.285, offset=0.020, flare=0.012, thick=0.005, dz=0.045, hip_max=0.6, hip_split=0.14,
                                  panels=[dict(a0=-50, a1=50, z_hem=0.74, cols=14, box="tab_front", flare=0.008, fold_amp=0.025, folds=3, phase=1.57),
                                          dict(a0=58, a1=175, z_hem=0.60, cols=16, box="tails", flare=0.016, fold_amp=0.04, folds=4, phase=0.0),
                                          dict(a0=-175, a1=-58, z_hem=0.60, cols=16, box="tails", flare=0.016, fold_amp=0.04, folds=4, phase=3.14)]),
                       trim=True,
                       hat=dict(profile=True, R=0.260, drop=0.092, tilt=4.0, black_uv=(0.711, 0.961), ember_uv=(0.1592, 0.5049), stripe=(0.92, 0.975)),
                       smooth_parts=35.0,
                       slim_upper=dict(arm=0.80, hand=0.90, pauldron=0.88, pauldron_ramp=(0.15, 0.26), pauldron_up=0.05),
                       hood=dict(z0=1.60, segs=32, offset=0.012, neck_r=0.115, keep_band=(1.785, 1.885), keep_deg=70, slit_deg=62),
                       waist=dict(uv=(0.7969, 0.4316), z_join=1.292, half=0.022, segs=28),
                       emblem=dict(gear_uv=(0.1592, 0.5049), star_uv=(0.711, 0.961),
                                   spots=[dict(o=(0.085, -1.0, 1.44), d=(0, 1, 0), r=0.041)]),
                       title="Thorvald Trooper T5: Gurney upper body + arms, Duncan legs + tabard, hood"),
    # T6 = T5 with Duncan's OWN sash / tunic / tabard (game-made cloth, recoloured rust with black trim) instead of the hand-built skirt and waist
    # ring, and a hood that sits on the face (tighter fit, slit lip onto the skin, the whole head ring kept behind the slit).
    "T6_Trooper": dict(base="Gurney", donor="Commando", remove=[],
                       cut_below_z=1.26, cut_below_r=0.30, min_island=16,
                       strip_bones=("Hip", "Knee", "Ankle", "Ball", "ROOT"),
                       fill=[dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball")),
                             dict(donor="Duncan", tag="sash", keep_comps=[1, 10, 27], zmax=1.34, own_albedo=True)],
                       trim=True,
                       hat=dict(profile=True, R=0.260, drop=0.092, tilt=4.0, black_uv=(0.711, 0.961), ember_uv=(0.1592, 0.5049), stripe=(0.92, 0.975)),
                       smooth_parts=35.0,
                       slim_upper=dict(arm=0.80, hand=0.90, pauldron=0.88, pauldron_ramp=(0.15, 0.26), pauldron_up=0.05),
                       neck_sleeve=dict(rings=(1.58, 1.62, 1.66, 1.70, 1.74, 1.78, 1.81), cols=20, a0=88, a1=272, offset=0.003, top_tuck=-0.018, side_tuck=-0.014, neck_r=0.10,
                                        neck_r_low=0.15, low_below=1.67),
                       emblem=dict(gear_uv=(0.1592, 0.5049), star_uv=(0.711, 0.961),
                                   spots=[dict(o=(0.085, -1.0, 1.44), d=(0, 1, 0), r=0.041)]),
                       title="Thorvald Trooper T6: Gurney upper body + arms, Duncan legs + sash/tabard, Commando head + face wrap"),
    # T7 = T6, standing tall like the Atreides Trooper and form-fitting: the head raised 3 cm (it sat low between the plates), the cuirass
    # slimmed (the upper chest / collar front pushed 8-10 cm further forward than the Atreides Trooper's - the hunched look), and the hat
    # centred on the skull with no forward tilt
    "T7_Trooper": dict(base="Gurney", donor="Commando", remove=[],
                       cut_below_z=1.26, cut_below_r=0.30, min_island=16,
                       strip_bones=("Hip", "Knee", "Ankle", "Ball", "ROOT"),
                       fill=[dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball")),
                             dict(donor="Duncan", tag="sash", keep_comps=[1, 10, 27], zmax=1.34, own_albedo=True)],
                       trim=True,
                       head_shift_z=0.03,
                       hat=dict(profile=True, R=0.260, drop=0.092, tilt=0.0, center="skull", black_uv=(0.711, 0.961), ember_uv=(0.1592, 0.5049), stripe=(0.92, 0.975)),
                       smooth_parts=35.0,
                       slim_upper=dict(arm=0.80, hand=0.90, pauldron=0.86, pauldron_ramp=(0.15, 0.26), pauldron_up=0.05,
                                       torso=dict(z=(1.30, 1.40), kx=0.93, ky_front=0.88, ky_back=0.90, upper_front=0.64, upper_z=(1.48, 1.62),
                                                  yc=0.02, x_max=0.34)),
                       neck_sleeve=dict(rings=(1.58, 1.62, 1.66, 1.70, 1.74, 1.78, 1.81, 1.84), cols=20, a0=88, a1=272, offset=0.003, top_tuck=-0.018, side_tuck=-0.014,
                                        neck_r=0.10, neck_r_low=0.15, low_below=1.67),
                       emblem=dict(gear_uv=(0.1592, 0.5049), star_uv=(0.711, 0.961),
                                   spots=[dict(o=(0.085, -1.0, 1.44), d=(0, 1, 0), r=0.041)]),
                       title="Thorvald Trooper T7: upright, form-fitting cuirass, centred hat"),
}
# T8: T7 with the cuirass taken in further (narrower, shallower front and back, waist tapered), pauldrons a touch smaller: skin-tight armour.
VARIANTS["T8_Trooper"] = dict(VARIANTS["T7_Trooper"],
                              slim_upper=dict(arm=0.80, hand=0.90, pauldron=0.82, pauldron_ramp=(0.15, 0.26), pauldron_up=0.05,
                                              torso=dict(z=(1.27, 1.37), kx=0.86, ky_front=0.80, ky_back=0.80, upper_front=0.58,
                                                         upper_z=(1.46, 1.60), yc=0.02, x_fade=0.24, x_max=0.38)),
                              title="Thorvald Trooper T8: skin-tight cuirass")
# T9: T8 pushed much harder (T8 read only slightly slimmer): torso -20 % wide, -28..-30 % deep, upper chest -48 %, shoulder shells x0.74 pulled down
# onto the shoulder joint.
VARIANTS["T9_Trooper"] = dict(VARIANTS["T7_Trooper"],
                              slim_upper=dict(arm=0.80, hand=0.90, pauldron=0.74, pauldron_ramp=(0.12, 0.24), pauldron_up=0.0,
                                              torso=dict(z=(1.26, 1.34), kx=0.80, ky_front=0.72, ky_back=0.70, upper_front=0.52,
                                                         upper_z=(1.44, 1.58), yc=0.02, x_fade=0.24, x_max=0.40)),
                              title="Thorvald Trooper T9: skin-tight cuirass")
# T10: T9 + the sash top taken in with the torso (T9 exposed its ragged edge) + the arm-weighted shoulder shells shrunk too (faded out down the arm).
VARIANTS["T10_Trooper"] = dict(VARIANTS["T9_Trooper"],
                               fill=[dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball")),
                                     dict(donor="Duncan", tag="sash", keep_comps=[1, 10, 27], zmax=1.34, own_albedo=True, slim=True)],
                               slim_upper=dict(VARIANTS["T9_Trooper"]["slim_upper"], pauldron_arm=(0.12, 0.24)),
                               title="Thorvald Trooper T10: skin-tight cuirass, smaller shoulder shells")
# T11: T10 one step stronger (T10 still read only moderately slimmer): torso -26 % wide, -34..-36 % deep, shells x0.66.
VARIANTS["T11_Trooper"] = dict(VARIANTS["T10_Trooper"],
                               slim_upper=dict(arm=0.80, hand=0.90, pauldron=0.66, pauldron_ramp=(0.12, 0.24), pauldron_up=0.0, pauldron_arm=(0.14, 0.28),
                                               torso=dict(z=(1.26, 1.34), kx=0.74, ky_front=0.66, ky_back=0.64, upper_front=0.48,
                                                          upper_z=(1.44, 1.58), yc=0.02, x_fade=0.24, x_max=0.40)),
                               title="Thorvald Trooper T11: skin-tight cuirass")
# T12: T11 + emblem conformed to the (now tighter) chest curve and moved in with the narrower plate; sash cut 3 cm lower (its ragged top
# edge showed at the waist sides).
VARIANTS["T12_Trooper"] = dict(VARIANTS["T11_Trooper"],
                               fill=[dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball")),
                                     dict(donor="Duncan", tag="sash", keep_comps=[1, 10, 27], zmax=1.31, own_albedo=True, slim=True)],
                               emblem=dict(gear_uv=(0.1592, 0.5049), star_uv=(0.711, 0.961),
                                           spots=[dict(o=(0.068, -1.0, 1.44), d=(0, 1, 0), r=0.036, conform=True)]),
                               title="Thorvald Trooper T12: skin-tight cuirass")
# T13: T12 with the emblem on the flat part of the left chest panel (x 0.04..0.08: T12's spot crossed the panel seam at x 0.09) and the torso
# taper starting lower (z 1.18..1.30) so Gurney's tunic hem (z 1.30..1.37) goes in with the plate instead of flaring out under it.
VARIANTS["T13_Trooper"] = dict(VARIANTS["T12_Trooper"],
                               slim_upper=dict(VARIANTS["T11_Trooper"]["slim_upper"],
                                               torso=dict(VARIANTS["T11_Trooper"]["slim_upper"]["torso"], z=(1.18, 1.30))),
                               emblem=dict(gear_uv=(0.1592, 0.5049), star_uv=(0.711, 0.961),
                                           spots=[dict(o=(0.058, -1.0, 1.46), d=(0, 1, 0), r=0.034, lift=0.009)]),
                               title="Thorvald Trooper T13: skin-tight cuirass")
# T14: back to T7 (the user preferred v11's bulk) with only the chest front flattened: the pec bulge (front at -0.23 m) and the lower plate's tip
# that jutted 10 cm ahead of the belt (-0.247 m at z 1.28) are pulled back toward a plane at -0.17 / -0.16 m.  Sash slimmed with it (stays tucked).
VARIANTS["T14_Trooper"] = dict(VARIANTS["T7_Trooper"],
                               fill=[dict(donor="Duncan", tag="legs", match=("Hip", "Knee", "Ankle", "Ball")),
                                     dict(donor="Duncan", tag="sash", keep_comps=[1, 10, 27], zmax=1.34, own_albedo=True, slim=True)],
                               slim_upper=dict(VARIANTS["T7_Trooper"]["slim_upper"],
                                               chest_flat=dict(knots=[(1.20, -0.16, 0.15), (1.34, -0.16, 0.15), (1.40, -0.17, 0.30),
                                                                      (1.56, -0.17, 0.30), (1.64, -0.15, 1.0)],
                                                               x_fade=0.14, x_max=0.24)),
                               title="Thorvald Trooper T14: v11 with a flat chest plate, no lip")

# ---------------------------------------------------------------------------------------------------------------------------------------
# House Thorvald DEMOLITION unit (reference 01_input/character_image_sheet.jpg): the Trooper (T14: pauldrons, black cuirass, Duncan legs + boots)
# plus the Ranged unit's right-bicep wrap with black sleeves, box pouches on the front and back of the belt.  Weapon: library bazooka.
# D1: T14 + arm wrap + Mercenary pouches 33, 34 at the front (x -0.15 / +0.15) and again at the back (x -0.11 / +0.11).
VARIANTS["D1_Demolition"] = dict(VARIANTS["T14_Trooper"],
                                 fill=VARIANTS["T14_Trooper"]["fill"] + [
                                     dict(donor="Mercenary", tag="pouches_f", keep_comps=[33, 34],
                                          to_back=dict(side="front", seat_on="Fill_sash", xs=(-0.15, 0.15), z=1.20, scale=0.65, gap=0.003)),
                                     dict(donor="Mercenary", tag="pouches_b", keep_comps=[33, 34],
                                          to_back=dict(seat_on="Fill_sash", xs=(-0.11, 0.11), z=1.20, scale=0.65, gap=0.003))],
                                 arm_wrap=dict(side="r", band=(0.08, 0.17), lift=0.008),
                                 title="Thorvald Demolition D1: Trooper + bicep wrap + belt pouches")
# D2: D1 + (a) two rocket canisters upright on the front of the belt between buckle and pouches (the bazooka's Missile, 8 cm wide x 14 cm tall, cap
# up, painted like the bazooka; front pouches moved out to x +-0.17), (b) heavier legs: the Mercenary's whole legs - trousers, armoured shins,
# knee caps (islands 4, 5, 9, 10, 21, 22, 29, 30; Duncan thigh + Mercenary shin left a sliver behind the knee) on Duncan's feet (the
# Mercenary's are open-toed), (c) copper rim strips
# along the open edges of the pauldron plates (Gurney islands 17, 18, 47, 48; build_plate_rims).
_W = os.path.join(PROJ, "01_input", "weapons")
_LIB = os.path.join(os.path.dirname(PROJ), "weapons", "thorvald_bazooka")
VARIANTS["D2_Demolition"] = dict(VARIANTS["D1_Demolition"],
                                 fill=[dict(donor="Mercenary", tag="legs", keep_comps=[4, 5, 9, 10, 21, 22, 29, 30], clip_under="Fill_sash"),
                                       dict(donor="Duncan", tag="feet", match=("Knee", "Ankle", "Ball")),   # the Mercenary's feet are open-toed (hollow
                                       # when kneeling); Duncan's slimmer shins come too, hidden inside the Mercenary shin plates, so the boot top is closed
                                       VARIANTS["D1_Demolition"]["fill"][1],
                                       dict(VARIANTS["D1_Demolition"]["fill"][2], to_back=dict(VARIANTS["D1_Demolition"]["fill"][2]["to_back"], xs=(-0.17, 0.17))),
                                       VARIANTS["D1_Demolition"]["fill"][3]],
                                 props=[dict(name="Canister", fbx=os.path.join(_W, "Missile_TRUE_FBX.fbx"), scale=(0.55, 0.36, 0.55), rot_deg=(-90.0, 0.0, 0.0),
                                             at=[(-0.09, 1.20), (0.09, 1.20)], seat_on="Fill_sash", gap=0.002,
                                             maps={"Base Color": os.path.join(_LIB, "textures", "Thorvald_Bazooka_Albedo.png"),
                                                   "Specular IOR Level": os.path.join(_LIB, "textures", "Bazooka_MetallicGlossAO.png"),
                                                   "Normal": os.path.join(_LIB, "textures", "Bazooka_Normal.png")})],
                                 regions=dict(pauldron=[17, 18, 47, 48]),
                                 plate_rims=dict(region="pauldron", width=0.009, lift=0.0015, uv=("yoke2", 0.5, 0.9375)),   # a solid copper band of the trim atlas (row 742)
                                 title="Thorvald Demolition D2: + belt canisters, armoured shins, copper-trimmed pauldrons")

# ---------------------------------------------------------------------------------------------------------------------------------------
# House Thorvald ELITE (reference 01_input/character_image_sheet.jpg): the Demolition body (Trooper cuirass, right-bicep wrap, Mercenary armoured
# shins + knee caps on Duncan boots, copper-rimmed pauldrons, back pouches) with full-size, TIERED pauldrons (two extra lames under each
# plate, copper-rimmed too); no front pouches, no canisters.  Weapons: library glaive (B_Weapon) + tower shield (B_Shield), Gurney's clips.
_D2 = VARIANTS["D2_Demolition"]
VARIANTS["E1_Elite"] = dict(_D2,
                            fill=[_D2["fill"][i] for i in (0, 1, 2, 4)],
                            props=[],
                            slim_upper=dict(_D2["slim_upper"], pauldron=1.0),
                            pauldron_tiers=dict(region="pauldron", scales=(0.96, 0.92), drops=(0.045, 0.09), to_shoulder=(0.4, 0.75),
                                                out=0.006, pivot_up=0.03, margin=0.004),
                            title="Thorvald Elite E1: Demolition body + full-size tiered pauldrons")
# E2: E1's lames hid completely under the full-size shells.  The top shell back at the Trooper's size (0.86) and two FULL-size lames slid
# 5.5 / 11 cm down the arm and 1 / 2 cm out: the stack covers about the same area as one big shell, in three visible bands.
# E3: E2's lames were still pushed under the shells (the clip rays from the shoulder cross the shell's long lower skirt).  Nested lames
# instead: each copy shrunk about the arm axis (x0.90, x0.80) and slid 6 / 12 cm down the arm, no clip: inside the plate above where they
# overlap, a visible band below its edge, each lower lame narrower (the sheet).
VARIANTS["E3_Elite"] = dict(VARIANTS["E1_Elite"],
                            slim_upper=dict(_D2["slim_upper"]),
                            pauldron_tiers=dict(region="pauldron", scales=(1.0, 1.0), radial=(0.90, 0.80), drops=(0.06, 0.12),
                                                to_shoulder=(0.45, 0.8), out=0.0, pivot_up=0.03),
                            title="Thorvald Elite E3: nested tiered pauldrons")
# E4 (after the user's review of v1): the lames read as the same plate repeated.  Now ONE articulated pauldron: only the plate's lowest 5 cm strip
# is copied as each lame (it follows the plate's own lower edge), tucked under the plate / lame above and flared back out, copper rivet rows along
# every lower edge.  Bulkier arms and gloves (no arm slimming, hands x1.12) and black goggles.
VARIANTS["E4_Elite"] = dict(VARIANTS["E1_Elite"],
                            slim_upper=dict(_D2["slim_upper"], arm=1.0, hand=1.12),
                            pauldron_tiers=None,
                            pauldron_lames=dict(region="pauldron", rows=((-0.03, 0.035), (0.017, 0.078)), segs=16, clear=0.014, tuck=0.006,
                                                flare=0.012, lip=0.010, thick=0.007, to_shoulder=(0.6, 0.85), edge_pct=0.85, edge_band=0.05,
                                                rivets=dict(every=2, r=0.0065, h=0.005, up=0.02)),
                            goggles=dict(z=1.857, sep=0.033, r=0.019, depth=0.014),
                            title="Thorvald Elite E4: articulated pauldrons with rivets, bulkier arms, goggles")
VARIANTS["E2_Elite"] = dict(VARIANTS["E1_Elite"],
                            slim_upper=dict(_D2["slim_upper"]),
                            pauldron_tiers=dict(region="pauldron", scales=(1.0, 1.0), drops=(0.055, 0.11), to_shoulder=(0.45, 0.8),
                                                out=0.010, pivot_up=0.03, margin=0.004),
                            title="Thorvald Elite E2: tiered pauldrons (three bands)")


def build_arm_wrap(rig, base, trim_mat, p):
    """Cloth wrap round ONE upper arm (the Ranged reference: right bicep).  The two arms share texels, so the band's own sleeve faces are
    re-pointed at the trim atlas's rust cloth (tab_front above the hem) instead of painted; the band is pushed out along the normals so it
    reads as a layer on the sleeve.  No new geometry: it deforms exactly like the sleeve."""
    import math
    side = p.get("side", "r")
    sh = rig.matrix_world @ rig.data.bones["B_%sShoulderJ" % side].head_local
    el = rig.matrix_world @ rig.data.bones["B_%sElbowJ" % side].head_local
    ax = (el - sh).normalized()
    d0, d1 = p["band"]
    mw = base.matrix_world
    names = {g.index: g.name for g in base.vertex_groups}
    arm_bones = ("B_%sShoulderJ" % side, "B_%sElbowJ" % side)
    def along(co):
        return (mw @ co - sh).dot(ax)
    def arm_w(v):
        return sum(g.weight for g in v.groups if names[g.group] in arm_bones)
    if trim_mat.name not in [m.name for m in base.data.materials if m]:
        base.data.materials.append(trim_mat)
    mi = [m.name for m in base.data.materials].index(trim_mat.name)
    uvd = base.data.uv_layers.active.data
    ref = Vector((0, 0, 1)) if abs(ax.z) < 0.9 else Vector((0, 1, 0))
    e1 = ax.cross(ref).normalized()
    e2 = ax.cross(e1)
    band = []
    for f in base.data.polygons:
        vs = [base.data.vertices[i] for i in f.vertices]
        if min(arm_w(v) for v in vs) < 0.5:
            continue
        t = sum(along(v.co) for v in vs) / len(vs)
        if d0 <= t <= d1:
            band.append(f)
    for f in band:
        f.material_index = mi
        for li in f.loop_indices:
            co = mw @ base.data.vertices[base.data.loops[li].vertex_index].co
            r = co - sh
            r = r - ax * r.dot(ax)
            a = (math.atan2(r.dot(e2), r.dot(e1)) / (2 * math.pi)) % 1.0
            a = 1.0 - abs(2.0 * a - 1.0)   # mirrored round the arm: continuous, no wrap-around seam
            t = (along(base.data.vertices[base.data.loops[li].vertex_index].co) - d0) / (d1 - d0)
            uvd[li].uv = TL.uv("tab_front", 0.1 + 0.8 * a, 0.35 + 0.55 * max(0.0, min(1.0, t)))
    inner = {i for f in band for i in f.vertices}
    border = {i for f in base.data.polygons if f not in band for i in f.vertices} & inner
    for i in inner:
        v = base.data.vertices[i]
        co = mw @ v.co
        r = co - sh
        r = (r - ax * r.dot(ax)).normalized()
        v.co = mw.inverted() @ (co + r * p.get("lift", 0.008) * (0.5 if i in border else 1.0))
    base.data.update()
    print("   arm wrap (%s): %d faces, %d verts lifted" % (side, len(band), len(inner)))


def build_plate_rims(rig, base, trim_mat, p):
    """Copper trim along the open rims of tagged plate islands (Demolition pauldrons): for every boundary edge of the tagged faces a thin quad
    is laid ON the plate, from the rim inward (`width`), lifted `lift` along the face normal, skinned like the rim's own vertices and pointed at
    a copper texel of the trim atlas.  A texture outline traced the painted detail instead of the rims."""
    reg_i = list(base["region_names"]).index(p["region"]) + 1
    attr = base.data.attributes["reg"]
    tagged = {i for i, a in enumerate(attr.data) if a.value == reg_i}
    if trim_mat.name not in [m.name for m in base.data.materials if m]:
        base.data.materials.append(trim_mat)
    mi = [m.name for m in base.data.materials].index(trim_mat.name)
    bm = bmesh.new()
    bm.from_mesh(base.data)
    bm.verts.ensure_lookup_table()
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    faces = [f for f in bm.faces if all(v.index in tagged for v in f.verts)]
    fs = set(faces)
    w, lift = p.get("width", 0.009), p.get("lift", 0.0015)
    uv = TL.uv(*p.get("uv", ("hat_rim", 0.5, 0.2)))
    n = 0
    for f in faces:
        for e in f.edges:
            if sum(1 for lf in e.link_faces if lf in fs) != 1:
                continue
            a, b = e.verts
            mid = (a.co + b.co) / 2
            ev = (b.co - a.co).normalized()
            d = f.calc_center_median() - mid
            d = (d - ev * d.dot(ev))
            if d.length < 1e-6:
                continue
            d = d.normalized() * min(w, d.length * 0.9)
            nv = f.normal * lift
            quad = []
            for src_v, off in ((a, nv), (b, nv), (b, nv + d), (a, nv + d)):
                v_ = bm.verts.new(src_v.co + off)
                v_[dl].clear()
                for gi, wt in src_v[dl].items():
                    v_[dl][gi] = wt
                quad.append(v_)
            try:
                nf = bm.faces.new(quad)
            except ValueError:
                continue
            nf.material_index = mi
            nf.normal_update()
            if nf.normal.dot(f.normal) < 0:
                nf.normal_flip()
            for lp in nf.loops:
                lp[uvl].uv = uv
            n += 1
    bm.to_mesh(base.data)
    bm.free()
    base.data.update()
    print("   plate rims (%s): %d copper strip quads on %d plate faces" % (p["region"], n, len(faces)))


def build_pauldron_tiers(rig, base, p):
    """Tiered (lamellar) pauldrons for the Elite: the tagged plate faces are copied once per tier, each copy scaled about the shoulder joint
    (`scales`) and slid down the upper arm (`drops`, metres along shoulder->elbow, plus `out` away from the body), so every lower lame shows
    a band below the one above.  A lame's vertices that end up outside the original plates are pushed back under them (ray from the
    shoulder), so the tiers overlap like roof tiles.  Skin: the copied weights blended toward the shoulder bone (`to_shoulder` per tier),
    so the lower lames follow the upper arm.  The copies keep the region tag, so build_plate_rims trims them too."""
    reg_i = list(base["region_names"]).index(p["region"]) + 1
    mw = base.matrix_world
    inv = mw.inverted()
    bm = bmesh.new()
    bm.from_mesh(base.data)
    rl = bm.verts.layers.int.get("reg")
    dl = bm.verts.layers.deform.active
    faces = [f for f in bm.faces if all(v[rl] == reg_i for v in f.verts)]
    gi = {g.name: g.index for g in base.vertex_groups}
    sides = {}
    for s in ("l", "r"):
        sh = rig.matrix_world @ rig.data.bones["B_%sShoulderJ" % s].head_local
        el = rig.matrix_world @ rig.data.bones["B_%sElbowJ" % s].head_local
        sides[s] = (sh, (el - sh).normalized(), gi.get("B_%sShoulderJ" % s))
    side_of = lambda co: min(sides, key=lambda s: (co - sides[s][0]).length)
    bm_orig = bmesh.new()   # the original plates, world space: what the lames tuck under
    vmap = {}
    for f in faces:
        for v in f.verts:
            if v not in vmap:
                vmap[v] = bm_orig.verts.new(mw @ v.co)
        bm_orig.faces.new([vmap[v] for v in f.verts])
    tree = BVHTree.FromBMesh(bm_orig)
    bm_orig.free()
    made, clipped = 0, 0
    for t, (sc, dr, blend) in enumerate(zip(p["scales"], p["drops"], p["to_shoulder"]), 1):
        dup = bmesh.ops.duplicate(bm, geom=faces)
        nverts = [g for g in dup["geom"] if isinstance(g, bmesh.types.BMVert)]
        for v in nverts:
            co = mw @ v.co
            s = side_of(co)
            c, ax, sg = sides[s]
            c = c + Vector((0, 0, p.get("pivot_up", 0.03)))
            out = Vector((1.0 if c.x > 0 else -1.0, 0, 0)) * p.get("out", 0.0) * t
            rel = co - c
            along = rel.dot(ax)
            if "radial" in p:   # nested lames: shrunk about the ARM AXIS (inside the plate above where they overlap), slid down the arm
                new = c + ax * (along + dr) + (rel - ax * along) * p["radial"][t - 1] + out
            else:
                new = c + rel * sc + ax * dr + out
            if p.get("clip", "radial" not in p):
                d = new - c
                hit = tree.ray_cast(c, d.normalized(), d.length + 0.003)
                if hit[0] is not None and hit[3] < d.length + p.get("margin", 0.004):
                    new = c + d.normalized() * max(hit[3] - p.get("margin", 0.004), 0.0)
                    clipped += 1
            v.co = inv @ new
            if sg is not None and blend > 0:
                ws = {k: w * (1.0 - blend) for k, w in v[dl].items()}
                ws[sg] = ws.get(sg, 0.0) + blend
                v[dl].clear()
                for k, w in ws.items():
                    v[dl][k] = w
        made += len([g for g in dup["geom"] if isinstance(g, bmesh.types.BMFace)])
    bm.to_mesh(base.data)
    bm.free()
    base.data.update()
    print("   pauldron tiers (%s): %d faces in %d extra tiers, %d verts tucked under the plates above" % (p["region"], made, len(p["scales"]), clipped))


def build_goggles(rig, head, trim_mat, p):
    """Black goggles: two lens cups (black frame, copper front ring, black lens recessed in it) seated on the face by rays from the front at
    (+-sep, z), and a strap round the head at the same height (rays from outside toward the head axis, 4 mm off the surface).  Added to
    the head mesh, 100 % B_HeadJ; trim-atlas UVs (black yoke0 texel, copper yoke2 band)."""
    import math
    mw = head.matrix_world
    inv = mw.inverted()
    if trim_mat.name not in [m.name for m in head.data.materials if m]:
        head.data.materials.append(trim_mat)
    mi = [m.name for m in head.data.materials].index(trim_mat.name)
    hg = head.vertex_groups.get("B_HeadJ") or head.vertex_groups.new(name="B_HeadJ")
    tree = BVHTree.FromObject(head, bpy.context.evaluated_depsgraph_get())
    bm = bmesh.new()
    bm.from_mesh(head.data)
    dl = bm.verts.layers.deform.verify()
    uvl = bm.loops.layers.uv.active
    BLK, CU = TL.uv("yoke0", 0.5, 0.5), TL.uv("yoke2", 0.5, 0.9375)
    z, sep, R = p["z"], p.get("sep", 0.034), p.get("r", 0.019)
    hc = rig.matrix_world @ rig.data.bones["B_HeadJ"].head_local
    made = []

    def V(co):
        v = bm.verts.new(inv @ co)
        v[dl][hg.index] = 1.0
        return v

    def face(vs, uv, outward):
        f = bm.faces.new(vs)
        f.material_index = mi
        f.normal_update()
        if f.normal.dot(inv.to_3x3() @ outward) < 0:
            f.normal_flip()
        for lp in f.loops:
            lp[uvl].uv = uv
        made.append(f)

    # strap: rays toward the head axis all the way round, two heights
    segs, half = p.get("segs", 28), p.get("strap", 0.009)
    rows = []
    for zz in (z - half, z + half):
        row = []
        for k in range(segs):
            a = 2 * math.pi * k / segs
            d = Vector((math.sin(a), -math.cos(a), 0.0))            # k = 0: straight ahead (-y)
            o = Vector((hc.x, hc.y, zz)) + d * 0.4
            hit, n, _i, _t = tree.ray_cast(o, -d, 0.5)
            pt = (hit if hit is not None else Vector((hc.x, hc.y, zz)) + d * 0.09) + d * p.get("lift", 0.004)
            row.append(V(pt))
        rows.append(row)
    for k in range(segs):
        j = (k + 1) % segs
        a = 2 * math.pi * (k + 0.5) / segs
        face((rows[0][k], rows[0][j], rows[1][j], rows[1][k]), BLK, Vector((math.sin(a), -math.cos(a), 0)))
    # lens cups
    for sx in (-1.0, 1.0):
        o = Vector((sx * sep, -0.5, z))
        hit, n, _i, _t = tree.ray_cast(o, Vector((0, 1, 0)), 1.0)
        if hit is None:
            print("   goggles: lens ray missed at x %.3f z %.3f" % (sx * sep, z))
            continue
        n = (n.normalized() + Vector((0, -1, 0))).normalized()
        t1 = n.cross(Vector((0, 0, 1))).normalized()
        t2 = t1.cross(n)
        circ = lambda base, r: [V(base + (t1 * math.cos(2 * math.pi * j / 14) + t2 * math.sin(2 * math.pi * j / 14)) * r) for j in range(14)]
        c0 = hit + n * 0.001
        r0 = circ(c0, R)
        r1 = circ(hit + n * p.get("depth", 0.014), R)
        r2 = circ(hit + n * p.get("depth", 0.014), R * 0.74)
        r3 = circ(hit + n * (p.get("depth", 0.014) - 0.004), R * 0.74)
        for j in range(14):
            jj = (j + 1) % 14
            mid = (t1 * math.cos(2 * math.pi * (j + 0.5) / 14) + t2 * math.sin(2 * math.pi * (j + 0.5) / 14))
            face((r0[j], r0[jj], r1[jj], r1[j]), BLK, mid)              # cup wall
            face((r1[j], r1[jj], r2[jj], r2[j]), CU, n)                 # copper front ring
            face((r2[j], r2[jj], r3[jj], r3[j]), BLK, -mid)             # inner wall down to the lens
        cen = V(hit + n * (p.get("depth", 0.014) - 0.004))
        for j in range(14):
            face((cen, r3[j], r3[(j + 1) % 14]), BLK, n)                # lens
    bm.to_mesh(head.data)
    bm.free()
    head.data.update()
    print("   goggles: %d faces at z %.3f, lenses at x +-%.3f" % (len(made), z, sep))


def _arm_frame(rig, s):
    sh = rig.matrix_world @ rig.data.bones["B_%sShoulderJ" % s].head_local
    el = rig.matrix_world @ rig.data.bones["B_%sElbowJ" % s].head_local
    ax = (el - sh).normalized()
    up = Vector((0, 0, 1))
    e1 = (up - ax * up.dot(ax)).normalized()     # theta 0 = the top of the arm
    e2 = ax.cross(e1)
    return sh, ax, e1, e2


def build_pauldron_lames(rig, base, trim_mat, p):
    """Articulated lames under the shoulder plate, so plate + lames read as ONE pauldron (the sheet; the Atreides Warden's layered shoulder).
    Each lame is a clean partial cone round the upper-arm axis (angles `arc` either side of the top of the arm, the inner side toward the
    chest left open), its radius per angle = the sleeve underneath + `clear`, flaring `flare` out toward its lower edge; lame 1 starts under
    the plate's lower edge, each next lame under the one above (`rows`: (t0, t1) metres down the arm from the plate edge).  A copper lip and
    underside on each lower edge, copper rivets along it (`rivets`), the body on a gunmetal texel of the plate.  Skin: the nearest plate
    vertex's weights blended toward the shoulder bone (`to_shoulder`), so the lames ride the upper arm."""
    import math
    from mathutils.kdtree import KDTree
    reg_i = list(base["region_names"]).index(p["region"]) + 1
    mw = base.matrix_world
    inv = mw.inverted()
    bm = bmesh.new()
    bm.from_mesh(base.data)
    rl = bm.verts.layers.int.get("reg")
    dl = bm.verts.layers.deform.active
    uvl = bm.loops.layers.uv.active
    gi = {g.name: g.index for g in base.vertex_groups}
    plate = [f for f in bm.faces if all(v[rl] == reg_i for v in f.verts)]
    plate_v = {v for f in plate for v in f.verts}
    if trim_mat.name not in [m.name for m in base.data.materials if m]:
        base.data.materials.append(trim_mat)
    mi = [m.name for m in base.data.materials].index(trim_mat.name)
    plate_mi = plate[0].material_index
    # a gunmetal texel of the plate: the UV centre of the left plate face nearest the left plate's middle (the arms share texels)
    left = [f for f in plate if (mw @ f.calc_center_median()).x > 0]
    pc = sum((mw @ f.calc_center_median() for f in left), Vector()) / len(left)
    f_mid = min(left, key=lambda f: ((mw @ f.calc_center_median()) - pc).length)
    BODY = sum((lp[uvl].uv for lp in f_mid.loops), Vector((0.0, 0.0))) / len(f_mid.loops)
    CU = TL.uv("yoke2", 0.5, 0.9375)
    pv = list(plate_v)
    kd = KDTree(len(pv))
    for i, v in enumerate(pv):
        kd.insert(mw @ v.co, i)
    kd.balance()
    sleeve_co = [mw @ v.co for v in bm.verts if v not in plate_v]
    made, nriv = 0, 0
    flare = p.get("flare", 0.012)
    for s in ("l", "r"):
        c, ax, e1, e2 = _arm_frame(rig, s)
        sg = gi.get("B_%sShoulderJ" % s)
        side_pv = [mw @ v.co for v in plate_v if ((mw @ v.co) - c).length < 0.35]
        ts = sorted((q - c).dot(ax) for q in side_pv if ((q - c) - ax * (q - c).dot(ax)).dot(e1) > 0)
        te = ts[int(len(ts) * p.get("edge_pct", 0.9))]             # the plate's lower edge, down the arm from the shoulder joint
        segs = p.get("segs", 16)
        pl = []                                                     # plate samples (t, angle, radius) near its lower edge
        for q in side_pv:
            q = q - c
            tt = q.dot(ax)
            rad = q - ax * tt
            if tt > te - p.get("edge_band", 0.05):
                pl.append((tt, math.atan2(rad.dot(e2), rad.dot(e1)), rad.length))
        angs = sorted(a_ for _t, a_, _r in pl)
        a_lo, a_hi = angs[int(len(angs) * 0.04)], angs[int(len(angs) * 0.96)]   # the plate's own coverage round the arm
        ths = [a_lo + (a_hi - a_lo) * j / segs for j in range(segs + 1)]

        def r_plate(th):
            rs = [r_ for t_, a_, r_ in pl if abs((a_ - th + math.pi) % (2 * math.pi) - math.pi) < 0.3]
            return max(rs) if rs else 0.0
        sl = []                                                     # sleeve samples (t, angle, radius) round this upper arm
        for q in sleeve_co:
            q = q - c
            tt = q.dot(ax)
            if -0.05 < tt < te + 0.2:
                rad = q - ax * tt
                if rad.length < 0.2:
                    sl.append((tt, math.atan2(rad.dot(e2), rad.dot(e1)), rad.length))

        def r_need(th, tt):
            best = 0.0
            for (t_, a_, r_) in sl:
                if abs(t_ - tt) < 0.03 and abs((a_ - th + math.pi) % (2 * math.pi) - math.pi) < 0.35:
                    best = max(best, r_)
            return best + p.get("clear", 0.012)

        prev = None
        for k, (t0, t1) in enumerate(p["rows"], 1):
            T0, T1 = te + t0, te + t1
            rads = [max(r_need(th, T0), r_need(th, T1), p.get("r_min", 0.07)) for th in ths]
            if prev is None:                                        # lame 1: just inside the plate's lower edge
                rads = [max(r, r_plate(th) - p.get("tuck", 0.008)) for r, th in zip(rads, ths)]
            else:                                                   # next lames: just inside the lame above
                rads = [max(r, rp - p.get("tuck", 0.008)) for r, rp in zip(rads, prev)]
            rads = [(rads[max(0, j - 1)] + rads[j] + rads[min(segs, j + 1)]) / 3 for j in range(segs + 1)]   # smooth round the arm
            blend = p["to_shoulder"][k - 1]
            rows = {}
            lipt = T1 - p.get("lip", 0.010)
            for name, tt, kr, dr in (("top", T0, 0.0, 0.0), ("lip", lipt, (lipt - T0) / (T1 - T0), 0.0), ("bot", T1, 1.0, 0.0),
                                     ("in", T1, 1.0, -p.get("thick", 0.007))):
                row = []
                for j, th in enumerate(ths):
                    d = e1 * math.cos(th) + e2 * math.sin(th)
                    pos = c + ax * tt + d * (rads[j] + flare * kr + dr)
                    v = bm.verts.new(inv @ pos)
                    src = pv[kd.find(pos)[1]]
                    ws = {g: w * (1.0 - blend) for g, w in src[dl].items()}
                    if sg is not None:
                        ws[sg] = ws.get(sg, 0.0) + blend
                    for g, w in ws.items():
                        v[dl][g] = w
                    row.append((v, d))
                rows[name] = row
            prev = [r + flare for r in rads]
            for r0, r1, kind in (("top", "lip", "body"), ("lip", "bot", "cu"), ("bot", "in", "cu")):
                for j in range(segs):
                    a0, d0 = rows[r0][j]
                    b0 = rows[r0][j + 1][0]
                    a1 = rows[r1][j][0]
                    b1 = rows[r1][j + 1][0]
                    f = bm.faces.new((a0, a1, b1, b0))
                    f.normal_update()
                    hint = d0 if kind == "body" or r0 == "lip" else ax
                    if f.normal.dot(inv.to_3x3() @ hint) < 0:
                        f.normal_flip()
                    f.material_index = mi
                    for lp in f.loops:
                        if kind == "body":   # the trim atlas's cuff box, repainted weathered gunmetal for the Elite (no cuffs on it)
                            lp[uvl].uv = TL.uv("cuff", 0.05 + 0.9 * (j + (1 if lp.vert in (b0, b1) else 0)) / segs,
                                               0.1 + 0.8 * (1 if lp.vert in (a1, b1) else 0))
                        else:
                            lp[uvl].uv = CU
                    made += 1
            rv = p.get("rivets")
            if rv:
                R, Hh = rv.get("r", 0.0065), rv.get("h", 0.005)
                tt = T1 - rv.get("up", 0.02)
                for j in range(1, segs, rv.get("every", 2)):
                    d = e1 * math.cos(ths[j]) + e2 * math.sin(ths[j])
                    base_pt = c + ax * tt + d * (rads[j] + flare * (tt - T0) / (T1 - T0) + 0.0008)
                    u2 = d.cross(ax).normalized()
                    ring_ = [bm.verts.new(inv @ (base_pt + (ax * math.cos(2 * math.pi * q / 8) + u2 * math.sin(2 * math.pi * q / 8)) * R))
                             for q in range(8)]
                    top = bm.verts.new(inv @ (base_pt + d * Hh))
                    src = rows["top"][j][0]
                    for v_ in ring_ + [top]:
                        for g, w in src[dl].items():
                            v_[dl][g] = w
                    for q in range(8):
                        f_ = bm.faces.new((ring_[q], ring_[(q + 1) % 8], top))
                        f_.normal_update()
                        if f_.normal.dot(inv.to_3x3() @ d) < 0:
                            f_.normal_flip()
                        f_.material_index = mi
                        for lp in f_.loops:
                            lp[uvl].uv = CU
                    nriv += 1
        print("   pauldron lames (side %s): plate edge %.3f m down the arm, radii %.3f..%.3f" % (s, te, min(rads), max(rads)))
    bm.to_mesh(base.data)
    bm.free()
    base.data.update()
    print("   pauldron lames: %d faces, %d rivets" % (made, nriv))


def build_props(rig, fill_objs, p):
    """Small rigid props from a game weapon file (e.g. the bazooka's rocket as belt canisters): scaled, stood upright, each placed at (x, z)
    on the FRONT of an earlier fill (the sash belt) by a ray from in front, skinned like the nearest belt vertex.  Material: the given albedo
    (already painted), so the recolour pass leaves it alone."""
    import math
    from mathutils import Matrix
    from mathutils.kdtree import KDTree
    seat = next(o for o in fill_objs if p["seat_on"] in o.name)
    bvh = BVHTree.FromObject(seat, bpy.context.evaluated_depsgraph_get())
    kd = KDTree(len(seat.data.vertices))
    for sv in seat.data.vertices:
        kd.insert(seat.matrix_world @ sv.co, sv.index)
    kd.balance()
    snames = {g.index: g.name for g in seat.vertex_groups}
    mat = seat.data.materials[0].copy()   # a copy of a working game material, rewired to the prop's maps
    mat.name = "Mat_" + p["name"]
    print("   prop material wiring:", bs.wire_textures(mat, p["maps"]))
    made = []
    for k, (x, z) in enumerate(p["at"]):
        before = set(bpy.data.objects)
        bpy.ops.import_scene.fbx(filepath=p["fbx"])
        new = [o for o in bpy.data.objects if o not in before]
        ob = max([o for o in new if o.type == "MESH"], key=lambda o: len(o.data.vertices))
        for o in new:
            if o is not ob:
                bpy.data.objects.remove(o, do_unlink=True)
        ob.data.transform(ob.matrix_world)
        ob.parent = None
        ob.matrix_world = Matrix.Identity(4)
        rx, ry, rz = (math.radians(d) for d in p.get("rot_deg", (90.0, 0.0, 0.0)))
        sc = p["scale"] if isinstance(p["scale"], (tuple, list)) else (p["scale"],) * 3   # per-axis (in the prop's own axes) or uniform
        S = Matrix.Diagonal((sc[0], sc[1], sc[2], 1.0))
        ob.data.transform(Matrix.Rotation(rz, 4, "Z") @ Matrix.Rotation(ry, 4, "Y") @ Matrix.Rotation(rx, 4, "X") @ S)
        vs = ob.data.vertices
        c = sum((v_.co for v_ in vs), Vector()) / len(vs)
        hit = bvh.ray_cast(Vector((x, -1.0, z)), Vector((0, 1, 0)))[0]
        y = (hit.y - p.get("gap", 0.003)) if hit is not None else -0.15
        dy_ = y - max(v_.co.y for v_ in vs)
        ob.data.transform(Matrix.Translation(Vector((x - c.x, dy_, z - c.z))))
        ob.data.materials.clear()
        ob.data.materials.append(mat)
        ob.name = ob.data.name = "%s_%d" % (p["name"], k)
        src = seat.data.vertices[kd.find(Vector((x, y, z)))[1]]
        for g in list(ob.vertex_groups):
            ob.vertex_groups.remove(g)
        idx = [v_.index for v_ in vs]
        for g in src.groups:
            if g.weight > 0.0:
                ob.vertex_groups.new(name=snames[g.group]).add(idx, g.weight, "REPLACE")
        ob.parent = rig
        mod = ob.modifiers.new("Armature", "ARMATURE")
        mod.object = rig
        made.append(ob)
        print("   prop %s at x %.2f z %.2f y %.3f (%s), %d verts" % (ob.name, x, z, y, "hit" if hit is not None else "MISS", len(vs)))
    return made


def dominant(obj):
    names = {g.index: g.name for g in obj.vertex_groups}
    return {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in obj.data.vertices if v.groups}


def keep_faces(obj, pred):
    dom = dominant(obj)
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.faces.ensure_lookup_table()
    kill = [f for f in bm.faces if not pred([dom.get(v.index) for v in f.verts])]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(kill)


def keep_faces_pos(obj, pred):
    """Like keep_faces, but pred(bones, centre) also gets the face centre in world space (to split a bone's faces by position)."""
    dom = dominant(obj)
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.faces.ensure_lookup_table()
    mw = obj.matrix_world
    kill = [f for f in bm.faces if not pred([dom.get(v.index) for v in f.verts], mw @ f.calc_center_median())]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()


def bone_vote(ds, subs, outer_x_subs=(), centre=None, x_cut=0.20):
    """True if the majority of a face's dominant bones match `subs`, or match `outer_x_subs` while the face is outboard of x_cut."""
    n = sum(1 for d in ds if d and any(x in d for x in subs))
    if n >= 2:
        return True
    m = sum(1 for d in ds if d and any(x in d for x in outer_x_subs))
    return m >= 2 and centre is not None and abs(centre.x) >= x_cut


def bisect_below(obj, z, r=None):
    """Cut the mesh exactly at height z and drop everything below it (clean straight edge).  With r: only faces within |x| < r (the torso;
    T-pose hands hang below the cut and must survive)."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    fs = [f for f in bm.faces if r is None or abs(f.calc_center_median().x) < r]
    geom = list({v for f in fs for v in f.verts}) + list({e for f in fs for e in f.edges}) + fs
    bmesh.ops.bisect_plane(bm, geom=geom, plane_co=(0, 0, z), plane_no=(0, 0, 1), clear_inner=True)
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()


def bisect_above(obj, z, r):
    """Cut the mesh EXACTLY at height z (plane bisect, straight edge) and drop what is above, but only for
    faces near the neck (|x| < r) so shoulders/arms are untouched.  UVs and weights interpolate."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    region = [f for f in bm.faces if abs(f.calc_center_median().x) < r and max(v.co.z for v in f.verts) > z]
    geom = list({e for f in region for e in f.edges}) + region + list({v for f in region for v in f.verts})
    bmesh.ops.bisect_plane(bm, geom=geom, plane_co=(0, 0, z), plane_no=(0, 0, 1), clear_outer=True)
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()


def extend_neck(obj, z_max, z_bottom, flare, back_z=None, drop=0.07, bone_from="B_Neck01J", bone_to="B_SpineTopJ"):
    """Extrude the open bottom edge of the neck (boundary edges below z_max) down by `drop` and out by `flare`
    so the neck sinks into the collar instead of floating above it.  New verts: UV copied from their source
    vertex, weights half neck / half upper spine, faces smooth."""
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}
    def low(e):
        zmax = max(v.co.z for v in e.verts)
        if zmax < z_max:
            return True
        # the tube's bottom edge slopes up at the back: take those edges too
        return back_z is not None and zmax < back_z and min(v.co.y for v in e.verts) > 0.0
    edges = [e for e in bm.edges if e.is_boundary and low(e)]
    src_uv = {v: v.link_loops[0][uvl].uv.copy() for e in edges for v in e.verts}
    res = bmesh.ops.extrude_edge_only(bm, edges=edges)
    new_v = [g for g in res["geom"] if isinstance(g, bmesh.types.BMVert)]
    new_f = {f for v in new_v for f in v.link_faces}
    # map each new vert to its source (same position before moving)
    olds = list(src_uv)
    for v in new_v:
        src = min(olds, key=lambda o: (o.co - v.co).length)
        r = math.hypot(v.co.x, v.co.y)
        fl = flare if v.co.y < 0.0 else 0.0  # flare only the front: at the back it pokes out of the silhouette
        k = (r + fl) / r if r > 1e-4 else 1.0
        v.co.x *= k
        v.co.y *= k
        v.co.z = min(v.co.z - drop, z_bottom)  # drop, but always at least down to z_bottom (back edge sits higher)
        w = v[dl]
        w.clear()
        w[gi[bone_from]] = 0.5
        w[gi[bone_to]] = 0.5
    skin = src_uv[max(src_uv, key=lambda o: abs(o.co.x))]  # side of the neck's bottom ring = plain skin texel
    obj["neck_skin_uv"] = (skin.x, skin.y)  # reused by neck_backplate so every patch matches
    for f in bm.faces:  # back of the neck below the hairline also samples beard -> plain skin
        c = f.calc_center_median()
        if c.y > 0.0 and c.z < 1.775 and f not in new_f:
            for lp in f.loops:
                lp[uvl].uv = skin
    for f in new_f:
        f.smooth = True
        for lp in f.loops:
            lp[uvl].uv = skin
    bmesh.ops.recalc_face_normals(bm, faces=list(new_f))
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(edges)


def neck_skin_uv(bm, uvl):
    """One shared plain-skin texel for every neck patch: the vertex nearest the side of the neck under the jaw."""
    target = Vector((0.065, -0.02, 1.72))
    v = min((x for x in bm.verts if x.link_loops), key=lambda x: (x.co - target).length)
    return v.link_loops[0][uvl].uv.copy()


def neck_backplate(obj, z_top, z_bottom, r_top, r_bottom, a0=-15.0, a1=195.0, segs=18, rows=5,
                   bone_top="B_HeadJ", bone_mid="B_Neck01J", bone_bottom="B_SpineTopJ"):
    """Curved double-sided skin panel around the BACK half of the neck (angles a0..a1, 90 = straight back),
    a little inside the neck surface: hidden where the neck exists, closes any see-through gap where it
    does not.  UV = one plain skin texel from the side of the neck; weights blend head -> neck -> spine."""
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}
    for b in (bone_top, bone_mid, bone_bottom):
        if b not in gi:
            gi[b] = obj.vertex_groups.new(name=b).index
    skin = Vector(obj["neck_skin_uv"]) if "neck_skin_uv" in obj else neck_skin_uv(bm, uvl)
    def make_grid(dr):
        grid = []
        for r_i in range(rows + 1):
            t = r_i / rows
            z = z_top + (z_bottom - z_top) * t
            r = r_top + (r_bottom - r_top) * t + dr
            row = []
            for s_i in range(segs + 1):
                a = math.radians(a0 + (a1 - a0) * s_i / segs)
                v = bm.verts.new((r * math.cos(a), r * math.sin(a), z))
                w = v[dl]
                if t < 0.5:
                    w[gi[bone_top]] = 1.0 - 2 * t
                    w[gi[bone_mid]] = 2 * t
                else:
                    w[gi[bone_mid]] = 2 - 2 * t
                    w[gi[bone_bottom]] = 2 * t - 1
                row.append(v)
            grid.append(row)
        return grid

    made = 0
    for dr, flip in ((0.0, False), (-0.001, True)):  # outer side + inner side (own verts): never culled away
        grid = make_grid(dr)
        for r_i in range(rows):
            for s_i in range(segs):
                q = (grid[r_i][s_i], grid[r_i][s_i + 1], grid[r_i + 1][s_i + 1], grid[r_i + 1][s_i])
                f = bm.faces.new(tuple(reversed(q)) if flip else q)
                f.smooth = True
                for lp in f.loops:
                    lp[uvl].uv = skin
                made += 1
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return made


def transfer_weights(src, dst):
    """Replace dst's skin weights with src's, interpolated from the nearest src face (Data Transfer).
    A grafted fill then deforms exactly like the base surface it replaces, so it cannot tear away
    from the base's surrounding parts in motion."""
    for g in list(dst.vertex_groups):
        dst.vertex_groups.remove(g)
    for g in src.vertex_groups:
        dst.vertex_groups.new(name=g.name)
    mod = dst.modifiers.new("WeightXfer", "DATA_TRANSFER")
    mod.object = src
    mod.use_vert_data = True
    mod.data_types_verts = {"VGROUP_WEIGHTS"}
    mod.vert_mapping = "POLYINTERP_NEAREST"
    mod.layers_vgroup_select_src = "ALL"
    mod.layers_vgroup_select_dst = "NAME"
    with bpy.context.temp_override(object=dst, active_object=dst, selected_objects=[dst]):
        bpy.ops.object.modifier_move_to_index(modifier=mod.name, index=0)
        bpy.ops.object.modifier_apply(modifier=mod.name)


def calm_weights(obj, strip=("B_lShoulderJ", "B_rShoulderJ", "B_lElbowJ", "B_rElbowJ"), smooth_repeat=4):
    """Torso fill must follow the SPINE, not the arms: drop arm-bone weights, renormalise, then smooth so no
    vertex is yanked differently from its neighbours (that is what folds the chest when an arm swings across)."""
    names = {g.index: g.name for g in obj.vertex_groups}
    for v in obj.data.vertices:
        keep = [(g.group, g.weight) for g in v.groups if names[g.group] not in strip]
        tot = sum(w for _, w in keep)
        for g in list(v.groups):
            obj.vertex_groups[g.group].remove([v.index])
        if tot <= 1e-6:
            obj.vertex_groups["B_SpineTopJ"].add([v.index], 1.0, "REPLACE")
            continue
        for gi, w in keep:
            obj.vertex_groups[gi].add([v.index], w / tot, "REPLACE")
    me = obj.data
    nbr = [[] for _ in me.vertices]
    for e in me.edges:
        a, b = e.vertices
        nbr[a].append(b)
        nbr[b].append(a)
    W = [{g.group: g.weight for g in v.groups} for v in me.vertices]
    for _ in range(smooth_repeat):  # Laplacian smoothing of the weights, factor 0.5
        new = []
        for i, w in enumerate(W):
            if not nbr[i]:
                new.append(w)
                continue
            acc = {}
            for j in nbr[i]:
                for gi, x in W[j].items():
                    acc[gi] = acc.get(gi, 0.0) + x / len(nbr[i])
            mix = {gi: 0.5 * w.get(gi, 0.0) + 0.5 * acc.get(gi, 0.0) for gi in set(w) | set(acc)}
            tot = sum(mix.values()) or 1.0
            new.append({gi: x / tot for gi, x in mix.items() if x / tot > 1e-3})
        W = new
    for i, w in enumerate(W):
        for g in list(me.vertices[i].groups):
            obj.vertex_groups[g.group].remove([i])
        for gi, x in w.items():
            obj.vertex_groups[gi].add([i], x, "REPLACE")


def build_collar(obj, p):
    """Model a tall stand-up (mandarin) collar into `obj`: a double-walled shell around the neck, open in a V at the
    front, rising towards the back; the top band samples a gold texel patch, the rest a coat texel patch.

    p: z_bottom, top_front, top_side, top_back, rx, ry, cy (ellipse centre y), flare, open_deg, thick, rim,
       wine_uv (u0, u1, v0, v1), gold_uv (u0, u1, v0, v1), segs, mat_index
    """
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}
    segs = p.get("segs", 28)
    a0 = -90.0 + p["open_deg"]
    a1 = 270.0 - p["open_deg"]

    def top_at(a):
        d = abs(((a + 90.0 + 180.0) % 360.0) - 180.0)  # 0 at the front, 180 at the back
        t = max(0.0, min(1.0, (d - p["open_deg"]) / (180.0 - p["open_deg"])))
        side = p["top_front"] + (p["top_side"] - p["top_front"]) * math.sin(min(t * 2, 1.0) * math.pi / 2)
        return side if t < 0.5 else p["top_side"] + (p["top_back"] - p["top_side"]) * math.sin((t - 0.5) * math.pi)

    rows = []  # per wall (outer, inner): list over angle of [bottom, mid, top] verts
    for wall, dr in (("out", 0.0), ("in", -p["thick"])):
        cols = []
        for s_i in range(segs + 1):
            a = a0 + (a1 - a0) * s_i / segs
            top = top_at(a)
            col = []
            for k, z in enumerate((p["z_bottom"], top - p["rim"], top)):
                u = (z - p["z_bottom"]) / max(top - p["z_bottom"], 1e-4)
                rx = p["rx"] + dr + p["flare"] * u
                ry = p["ry"] + dr + p["flare"] * u
                v = bm.verts.new((rx * math.cos(math.radians(a)), p["cy"] + ry * math.sin(math.radians(a)), z))
                w = v[dl]
                if k == 0:
                    w[gi["B_SpineTopJ"]] = 1.0
                else:
                    w[gi["B_SpineTopJ"]] = 0.55
                    w[gi["B_Neck01J"]] = 0.45
                col.append(v)
            cols.append(col)
        rows.append(cols)

    def uv_in(box, fu, fv):
        return (box[0] + (box[1] - box[0]) * fu, box[2] + (box[3] - box[2]) * fv)

    faces = []

    def quad(vs, box, us, vs_):
        f = bm.faces.new(vs)
        f.material_index = p.get("mat_index", 0)
        f.smooth = True
        for lp, fu, fv in zip(f.loops, us, vs_):
            lp[uvl].uv = uv_in(box, fu, fv)
        faces.append(f)

    out, inn = rows
    for s_i in range(segs):
        fu0, fu1 = s_i / segs, (s_i + 1) / segs
        for wall in (out, inn):
            c0, c1 = wall[s_i], wall[s_i + 1]
            quad((c0[0], c1[0], c1[1], c0[1]), p["wine_uv"], (fu0, fu1, fu1, fu0), (0, 0, 1, 1))   # body
            quad((c0[1], c1[1], c1[2], c0[2]), p["gold_uv"], (fu0, fu1, fu1, fu0), (0, 0, 1, 1))   # gold band
        quad((out[s_i][2], out[s_i + 1][2], inn[s_i + 1][2], inn[s_i][2]), p["gold_uv"], (fu0, fu1, fu1, fu0), (1, 1, 0, 0))  # rim
    for end in (0, segs):  # close the two front edges of the V
        o, i = out[end], inn[end]
        quad((o[0], o[1], i[1], i[0]), p["wine_uv"], (0, 1, 1, 0), (0, 0, 1, 1))
        quad((o[1], o[2], i[2], i[1]), p["gold_uv"], (0, 1, 1, 0), (0, 0, 1, 1))
    bmesh.ops.recalc_face_normals(bm, faces=faces)
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(faces)


def trim_above(obj, z, r):
    """Delete faces with ANY vertex above z, within |x| < r (clean horizontal cut, no slivers left standing)."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    kill = [f for f in bm.faces if max(v.co.z for v in f.verts) > z and abs(f.calc_center_median().x) < r]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(kill)


def clip_inside(part, base, margin):
    """Push every vertex of `part` that lies OUTSIDE `base`'s surface back under it.

    Ray from the spine axis (0, 0, z) out to the vertex: if the base mesh is hit before the vertex,
    the vertex pokes through -> move it to (hit - margin).  Vertices where no base surface covers
    them (open chest front) are left alone, so no holes open.
    """
    bm = bmesh.new()
    bm.from_mesh(base.data)
    bm.transform(base.matrix_world)
    tree = BVHTree.FromBMesh(bm)
    bm.free()
    inv = part.matrix_world.inverted()
    moved = 0
    for vt in part.data.vertices:
        p = part.matrix_world @ vt.co
        o = Vector((0.0, 0.0, p.z))
        d = p - o
        dist = d.length
        if dist < 1e-4:
            continue
        d.normalize()
        hit, _n, _i, t = tree.ray_cast(o, d, dist + margin)
        if hit is not None and t < dist + margin:
            vt.co = inv @ (o + d * max(t - margin, 0.0))
            moved += 1
    part.data.update()
    return moved


def stitch_nape(obj, z_split, a_lo=8.0, a_hi=172.0, z_hi=1.825, z_lo=0.0, seam_z=1.79):
    """Close the open band at the back of the neck between the head's lower edge and the neck tube's
    upper edge by zipping the two boundary chains together, each side of the x=0 seam separately.

    New faces take the UV of the nearest NECK-chain vertex, so the strip samples plain nape skin.
    """
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active

    def ang(v):
        return math.degrees(math.atan2(v.co.y, v.co.x))

    def side(v):  # which half a seam vertex belongs to: mean x of its faces
        xs = [f.calc_center_median().x for f in v.link_faces]
        return 1 if sum(xs) / len(xs) >= 0 else -1

    bverts = {v for e in bm.edges if e.is_boundary for v in e.verts}
    back = [v for v in bverts if a_lo <= ang(v) <= a_hi]
    made = 0
    for s in (1, -1):
        # lower edge only: the x=0 centre seam is unwelded all the way up the skull - keep just its bottom vertex
        head = sorted([v for v in back if z_split < v.co.z < z_hi and side(v) == s
                       and (abs(v.co.x) > 0.003 or v.co.z < seam_z)], key=ang)
        neck = sorted([v for v in back if z_lo < v.co.z <= z_split and side(v) == s], key=ang)
        if len(head) < 2 or len(neck) < 2:
            continue
        uv_of = {}
        for v in neck:
            uv_of[v] = v.link_loops[0][uvl].uv.copy()
        i = j = 0
        while i < len(head) - 1 or j < len(neck) - 1:  # zipper between the two angle-sorted chains
            adv_head = j >= len(neck) - 1 or (i < len(head) - 1 and ang(head[i + 1]) <= ang(neck[j + 1]))
            if adv_head:
                tri = (head[i], head[i + 1], neck[j])
                i += 1
            else:
                tri = (head[i], neck[j + 1], neck[j])
                j += 1
            try:
                f = bm.faces.new(tri)
            except ValueError:
                continue
            c = f.calc_center_median()
            f.normal_update()
            if f.normal.dot(Vector((c.x, c.y, 0))) < 0:
                f.normal_flip()
            for lp in f.loops:
                src = lp.vert if lp.vert in uv_of else min(neck, key=lambda n: (n.co - lp.vert.co).length)
                lp[uvl].uv = uv_of[src]
            f.smooth = True
            made += 1
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return made


def import_unit(key):
    before = {o.name for o in bpy.data.objects}
    fbx, wanted = paths(key)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o.name not in before]
    for o in list(new):
        if o.name.split(".")[0] in bs.JUNK_NAMES and o.type in ("MESH", "CAMERA", "LIGHT"):
            bpy.data.objects.remove(o, do_unlink=True)
            new.remove(o)
    body = max([o for o in new if o.type == "MESH"], key=lambda o: len(o.data.polygons))
    rig = [o for o in new if o.type == "ARMATURE"][0]
    for mat in body.data.materials:
        if mat and mat.use_nodes:
            bs.wire_textures(mat, material_paths(key, mat.name))
    return body, rig


def build_bun(obj, pos, radii, uv_c, rings=8, segs=14, bone="B_HeadJ"):
    """Hand-modelled topknot: a small ellipsoid on the head, 100 % weighted to the head bone, every UV pointing at one hair texel
    (so the hair recolour makes it black like the rest of the hair)."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}[bone]
    res = bmesh.ops.create_uvsphere(bm, u_segments=segs, v_segments=rings, radius=1.0)
    verts = res["verts"]
    for v in verts:
        v.co = Vector((pos[0] + v.co.x * radii[0], pos[1] + v.co.y * radii[1], pos[2] + v.co.z * radii[2]))
        v[dl][gi] = 1.0
    faces = {f for v in verts for f in v.link_faces}
    for f in faces:
        f.smooth = True
        f.material_index = 0
        for lp in f.loops:
            lp[uvl].uv = uv_c
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(faces)


def build_sash_tail(obj, x, z_top, z_bot, y, width, sway, uv_c, bone_top="B_ROOTJ", bone_bot="B_rHipJ", segs=6):
    """Hand-modelled sash tail: a flat cloth strip hanging from the belt on the front of the jacket skirt.
    Weights: top 100 % pelvis, fading to 55/45 pelvis/thigh at the hem so it follows the leg a little (less clipping in a run).
    Both sides are modelled (own verts) so back-face culling never hides it.  UV = one sash texel (the texture script recolours it)."""
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}
    for b in (bone_top, bone_bot):
        if b not in gi:
            gi[b] = obj.vertex_groups.new(name=b).index
    made = 0
    for dy, flip in ((0.0, False), (0.002, True)):
        rows = []
        for i in range(segs + 1):
            u = i / segs
            z = z_top + (z_bot - z_top) * u
            cx = x + sway * math.sin(u * math.pi * 1.2)
            w = width * (1.0 - 0.25 * u)
            row = []
            for sx in (-0.5, 0.5):
                v = bm.verts.new((cx + sx * w, y - dy + 0.012 * u, z))
                v[dl][gi[bone_top]] = 1.0 - 0.45 * u
                v[dl][gi[bone_bot]] = 0.45 * u
                row.append(v)
            rows.append(row)
        for i in range(segs):
            q = (rows[i][0], rows[i][1], rows[i + 1][1], rows[i + 1][0])
            f = bm.faces.new(tuple(reversed(q)) if flip else q)
            f.smooth = True
            f.material_index = 0
            for lp in f.loops:
                lp[uvl].uv = uv_c
            made += 1
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return made


def tag_regions(obj, comps, regions):
    """Tag vertices with a region id BEFORE any deletion (island ids shift afterwards); texture scripts read the 'reg' attribute."""
    if not regions:
        return
    names = list(regions)
    attr = obj.data.attributes.new("reg", "INT", "POINT")
    vals = [0] * len(obj.data.vertices)
    for ri, n in enumerate(names, 1):
        for k in regions[n]:
            for i in comps[k]:
                vals[i] = ri
    attr.data.foreach_set("value", vals)
    obj["region_names"] = names


def build_cuffs(rig, parts, skirt, p):
    """Cloth cuff band around each arm at the elbow joint, hiding the seam where the base's upper sleeve meets the donor forearm.
    The band is aligned to the real arm axis (shoulder -> wrist bone heads from the rig), sized from the geometry actually there
    (95th percentile radius of `parts` within the window), double-walled with slightly narrowed ends, and skinned shoulder -> elbow along its length.
    One flat texel on the skirt material (the recolour makes it rust)."""
    import math
    mw = rig.matrix_world
    bones = rig.data.bones
    half, segs = p.get("half", 0.045), p.get("segs", 24)
    trim = p.get("trim_mat") is not None
    objs = []
    for side, sgn in (("l", 1), ("r", -1)):
        sh, el, wr = [mw @ bones["B_%s%sJ" % (side, n)].head_local for n in ("Shoulder", "Elbow", "Wrist")]
        axis = (wr - sh).normalized()
        centre = el + axis * p.get("shift", 0.0)
        # locate the seam from the meshes: arm axis = from the base's shoulder sleeve to the donor's elbow; the seam is the sleeve's far end along it
        import numpy as np
        base = parts[0]
        donor_arm = next((o for o in parts[1:]), None)
        bdom = dominant(base)
        sleeve = np.array([list(base.matrix_world @ v.co) for v in base.data.vertices
                           if "Shoulder" in (bdom.get(v.index) or "") and sgn * (base.matrix_world @ v.co).x > 0.05])
        ddom = dominant(donor_arm) if donor_arm else {}
        elbow = np.array([list(donor_arm.matrix_world @ v.co) for v in donor_arm.data.vertices
                          if "Elbow" in (ddom.get(v.index) or "") and sgn * (donor_arm.matrix_world @ v.co).x > 0.05]) if donor_arm else np.zeros((0, 3))
        if len(sleeve) > 8 and len(elbow) > 8:
            cs, ce = sleeve.mean(0), elbow.mean(0)
            axis = Vector(ce - cs).normalized()
            tt = (sleeve - cs) @ np.array(axis)
            end = sleeve[tt >= tt.max() - 0.025]
            centre = Vector(end.mean(0)) + axis * p.get("shift", 0.012)
            print("   cuff %s: seam from meshes: sleeve end at (%.2f %.2f %.2f), axis (%.2f %.2f %.2f), %d end verts"
                  % (side, centre.x, centre.y, centre.z, axis.x, axis.y, axis.z, len(end)))
        else:
            print("   cuff %s: not enough sleeve/elbow vertices, using the bone axis" % side)
        # clean the seam: cut the base's sleeve and the donor's forearm with one plane perpendicular to the arm axis (bone-vote edges are ragged);
        # the base keeps the proximal side, the donor the distal side, overlapping by 2 x `overlap`
        if p.get("plane_cut", True):
            ov = p.get("overlap", 0.012)
            for obj, keep_proximal in ((parts[0], True), (parts[1], False)):
                inv = obj.matrix_world.inverted()
                bmc = bmesh.new()
                bmc.from_mesh(obj.data)
                region = [f for f in bmc.faces
                          if sgn * (obj.matrix_world @ f.calc_center_median()).x > 0.28
                          and ((obj.matrix_world @ f.calc_center_median()) - centre).length < p.get("cut_region", 0.25)]
                geom = list({e for f in region for e in f.edges}) + region + list({v for f in region for v in f.verts})
                pc = centre + axis * (p.get("base_cut", -0.03) if keep_proximal else p.get("mer_cut", 0.04))  # donor cut further along the arm: removes its ragged top edge
                before = len(bmc.faces)
                bmesh.ops.bisect_plane(bmc, geom=geom, plane_co=inv @ pc, plane_no=inv.to_3x3() @ axis,
                                       clear_outer=keep_proximal, clear_inner=not keep_proximal)
                bmesh.ops.delete(bmc, geom=[v for v in bmc.verts if not v.link_faces], context="VERTS")
                bmc.to_mesh(obj.data)
                obj.data.update()
                print("   cuff %s: plane-cut %s: faces %d -> %d" % (side, obj.name, before, len(bmc.faces)))
                bmc.free()
        centre = centre + axis * p.get("band_shift", 0.02)  # the cuff straddles the base's sleeve end and the donor's clean cut
        # centre + radius from the geometry around the seam: average the arm's vertices in a slab across the axis (twice, so the centre settles
        # on the real centreline), then take the 85th percentile of their distance from it
        pool = [o.matrix_world @ v.co for o in parts for v in o.data.vertices]
        sel, m = [], Vector()
        for _ in range(3):
            sel = []
            for w in pool:
                d = w - centre
                t = d.dot(axis)
                if abs(t) < p.get("slab", 0.03):
                    rv = d - axis * t
                    if rv.length < p.get("max_radius", 0.11):
                        sel.append(rv)
            if len(sel) < 6:
                break
            m = sum(sel, Vector()) / len(sel)
            centre = centre + m
        rad = sorted((rv - m).length for rv in sel)
        R = (rad[int(len(rad) * 0.90)] if rad else 0.07) + p.get("margin", 0.006)
        ref = Vector((0, 0, 1)) if abs(axis.z) < 0.9 else Vector((0, 1, 0))
        u = axis.cross(ref).normalized()
        v_ = axis.cross(u).normalized()
        bm = bmesh.new()
        uvl = bm.loops.layers.uv.new(parts[0].data.uv_layers.active.name)
        dl = bm.verts.layers.deform.new()
        vp = {}
        names = ["B_%sShoulderJ" % side, "B_%sElbowJ" % side]

        def ringset(thick):
            rings = []
            for ri_, (t, k) in enumerate(((-half, 0.88), (-half * 0.80, 0.98), (half * 0.80, 0.98), (half, 0.88))):
                ring = []
                for i in range(segs):
                    a = 2 * math.pi * i / segs
                    r = R * k - thick
                    vt = bm.verts.new(centre + axis * t + (u * math.cos(a) + v_ * math.sin(a)) * r)
                    we = max(0.0, min(1.0, (t + half) / (2 * half)))
                    vt[dl][0] = 1.0 - we
                    vt[dl][1] = we
                    vp[vt] = (i, ri_)
                    ring.append(vt)
                rings.append(ring)
            return rings
        outer, inner = ringset(0.0), ringset(p.get("thick", 0.006))
        faces = []
        for r_i in range(3):
            for i in range(segs):
                i2 = (i + 1) % segs
                faces.append((bm.faces.new((outer[r_i][i], outer[r_i][i2], outer[r_i + 1][i2], outer[r_i + 1][i])), 1))
                faces.append((bm.faces.new((inner[r_i][i], inner[r_i][i2], inner[r_i + 1][i2], inner[r_i + 1][i])), -1))
        for end in (0, 3):
            for i in range(segs):
                i2 = (i + 1) % segs
                faces.append((bm.faces.new((outer[end][i], outer[end][i2], inner[end][i2], inner[end][i])), 0 if end == 3 else 2))
        bm.normal_update()
        for f, kind in faces:
            c = f.calc_center_median()
            radial = c - (centre + axis * (c - centre).dot(axis))
            along = (c - centre).dot(axis)
            if kind == 1 and f.normal.dot(radial) < 0:
                f.normal_flip()
            elif kind == -1 and f.normal.dot(radial) > 0:
                f.normal_flip()
            elif kind in (0, 2) and f.normal.dot(axis * (1 if kind == 0 else -1)) < 0:
                f.normal_flip()
            if trim:
                ks = [vp[x][0] for x in f.verts]
                wrap = (max(ks) - min(ks)) > 1
                for lp in f.loops:
                    i_, ri_ = vp[lp.vert]
                    if wrap and i_ == 0:
                        i_ = segs
                    lp[uvl].uv = TL.uv("cuff", i_ / segs, (0.0, 0.1, 0.9, 1.0)[ri_])
            else:
                for lp in f.loops:
                    lp[uvl].uv = p["uv"]
        me = bpy.data.meshes.new("TrooperCuff%s" % side.upper())
        bm.to_mesh(me)
        bm.free()
        obj = bpy.data.objects.new("TrooperCuff%s" % side.upper(), me)
        bpy.context.collection.objects.link(obj)
        me.materials.append(p["trim_mat"] if trim else skirt.data.materials[0])
        for n in names:
            obj.vertex_groups.new(name=n)
        obj.parent = rig
        mod = obj.modifiers.new("Armature", "ARMATURE")
        mod.object = rig
        objs.append(obj)
        print("   cuff %s: centre (%.2f %.2f %.2f) radius %.3f from %d verts, faces %d" % (side, centre.x, centre.y, centre.z, R, len(rad), len(me.polygons)))
    return objs


def fill_small_holes(obj, uv, min_edges=4, max_edges=8, xr=(0.10, 0.30), zr=(1.28, 1.58)):
    """Cap small open loops (thin slits through the torso at the armpit) with faces.  Only loops of min..max edges whose centre lies in the
    shoulder zone; 3-edge holes (where slivers were removed on purpose) and the big structural openings (neck, armholes, hem) are left alone."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    mw = obj.matrix_world
    bnd = [e for e in bm.edges if len(e.link_faces) == 1]
    seen, loops = set(), []
    for e0 in bnd:
        if e0.index in seen:
            continue
        stack, mem = [e0], []
        seen.add(e0.index)
        while stack:
            e = stack.pop()
            mem.append(e)
            for vv in e.verts:
                for e2 in vv.link_edges:
                    if len(e2.link_faces) == 1 and e2.index not in seen:
                        seen.add(e2.index)
                        stack.append(e2)
        loops.append(mem)
    made = 0
    for L in loops:
        if not (min_edges <= len(L) <= max_edges):
            continue
        vs = {vv for e in L for vv in e.verts}
        c = sum((mw @ vv.co for vv in vs), Vector()) / len(vs)
        if not (xr[0] <= abs(c.x) <= xr[1] and zr[0] <= c.z <= zr[1]):
            continue
        res = bmesh.ops.holes_fill(bm, edges=L, sides=len(L))
        for f in res["faces"]:
            f.material_index = 0
            for lp in f.loops:
                lp[uvl].uv = uv
            made += 1
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return made


def cap_cut_loops(obj, min_edges=20, max_edges=45):
    """Close the open rings left where a sleeve was plane-cut for a cuff.  Bending the elbow pulls the hollow end out from under the cuff and shows the
    inside as dark flaps; a cap needs no new vertices (weights come with the ring) and takes its UVs from the ring's own cloth."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    seen, loops = set(), []
    for e0 in [e for e in bm.edges if len(e.link_faces) == 1]:
        if e0.index in seen:
            continue
        stack, mem = [e0], []
        seen.add(e0.index)
        while stack:
            e = stack.pop()
            mem.append(e)
            for vv in e.verts:
                for e2 in vv.link_edges:
                    if len(e2.link_faces) == 1 and e2.index not in seen:
                        seen.add(e2.index)
                        stack.append(e2)
        loops.append(mem)
    made = 0
    for L in loops:
        if not (min_edges <= len(L) <= max_edges):
            continue
        nb = [e.link_faces[0] for e in L]
        mi = nb[0].material_index
        uvs = [lp[uvl].uv.copy() for f in nb for lp in f.loops]
        cu = sum(uvs, Vector((0, 0))) / len(uvs)
        res = bmesh.ops.holes_fill(bm, edges=L, sides=len(L))
        for f in res["faces"]:
            f.material_index = mi
            for lp in f.loops:
                lp[uvl].uv = cu
            made += 1
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return made


def delete_slivers(obj, min_aspect=9.0, max_area=0.0015, zmin=-9.0):
    """Delete long thin triangles (aspect = longest_edge^2 / (2 * area)) left behind by cuts: they render as stray shards.  Only faces above zmin."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    mw = obj.matrix_world
    kill = []
    for f in bm.faces:
        if len(f.verts) != 3:
            continue
        area = f.calc_area()
        if area < 1e-9 or area > max_area or (mw @ f.calc_center_median()).z < zmin:
            continue
        longest = max(e.calc_length() for e in f.edges)
        if longest * longest / (2 * area) >= min_aspect:
            kill.append(f)
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(kill)


def build_waist(rig, parts, skirt, p):
    """Cummerbund ring that covers the join between the torso's cut lower edge and a donor belt: a double-walled band whose outline is a rounded box
    sized from the vertices of `parts` around the join (so it matches the real cross-section), skinned ROOT (bottom) -> Spine01 (top),
    one flat texel on the skirt material (the recolour makes it rust)."""
    import math
    zc = p["z_join"]
    xs, ys = [], []
    for o in parts:
        for v in o.data.vertices:
            w = o.matrix_world @ v.co
            if abs(w.z - zc) < p.get("window", 0.025) and abs(w.x) < p.get("x_max", 0.25):  # torso only, not the arms beside it
                xs.append(w.x)
                ys.append(w.y)
    rx = (max(xs) - min(xs)) / 2 + p.get("margin", 0.006)
    ry = (max(ys) - min(ys)) / 2 + p.get("margin", 0.006)
    cy = (max(ys) + min(ys)) / 2
    n_exp = p.get("box", 2.6)          # superellipse exponent: 2 = ellipse, larger = boxier torso
    segs, half = p.get("segs", 40), p.get("half", 0.04)
    trim = p.get("trim_mat") is not None
    vp = {}
    bm = bmesh.new()
    uvl = bm.loops.layers.uv.new(parts[0].data.uv_layers.active.name)
    dl = bm.verts.layers.deform.new()
    names = ["B_ROOTJ", "B_Spine01J"]

    def point(a, k, z, thick):
        c, s_ = math.cos(a), math.sin(a)
        sx = math.copysign(abs(c) ** (2.0 / n_exp), c)
        sy = math.copysign(abs(s_) ** (2.0 / n_exp), s_)
        return (rx * k * sx - thick * sx, cy + ry * k * sy - thick * sy, z)

    def ringset(thick):
        rings = []
        for ri_, (z, k) in enumerate(((zc - half, 0.985), (zc - half * 0.7, 1.0), (zc + half * 0.7, 1.0), (zc + half, 0.985))):
            ring = []
            for i in range(segs):
                vt = bm.verts.new(point(2 * math.pi * i / segs, k, z, thick))
                we = (z - (zc - half)) / (2 * half)
                vt[dl][0] = 1.0 - we
                vt[dl][1] = we
                vp[vt] = (i, ri_)
                ring.append(vt)
            rings.append(ring)
        return rings
    outer, inner = ringset(0.0), ringset(p.get("thick", 0.006))
    faces = []
    for r_i in range(3):
        for i in range(segs):
            i2 = (i + 1) % segs
            faces.append((bm.faces.new((outer[r_i][i], outer[r_i][i2], outer[r_i + 1][i2], outer[r_i + 1][i])), 1))
            faces.append((bm.faces.new((inner[r_i][i], inner[r_i][i2], inner[r_i + 1][i2], inner[r_i + 1][i])), -1))
    for end in (0, 3):
        for i in range(segs):
            i2 = (i + 1) % segs
            faces.append((bm.faces.new((outer[end][i], outer[end][i2], inner[end][i2], inner[end][i])), 2 if end == 0 else 3))
    bm.normal_update()
    for f, kind in faces:
        c = f.calc_center_median()
        radial = Vector((c.x, c.y - cy, 0.0))
        if kind == 1 and f.normal.dot(radial) < 0:
            f.normal_flip()
        elif kind == -1 and f.normal.dot(radial) > 0:
            f.normal_flip()
        elif kind == 2 and f.normal.z > 0:
            f.normal_flip()
        elif kind == 3 and f.normal.z < 0:
            f.normal_flip()
        if trim:
            ks = [vp[x][0] for x in f.verts]
            wrap = (max(ks) - min(ks)) > 1
            for lp in f.loops:
                i_, ri_ = vp[lp.vert]
                if wrap and i_ == 0:
                    i_ = segs
                lp[uvl].uv = TL.uv("waist", i_ / segs, (0.0, 0.15, 0.85, 1.0)[ri_])
        else:
            for lp in f.loops:
                lp[uvl].uv = p["uv"]
    me = bpy.data.meshes.new("TrooperWaistMesh")
    bm.to_mesh(me)
    bm.free()
    obj = bpy.data.objects.new("TrooperWaist", me)
    bpy.context.collection.objects.link(obj)
    me.materials.append(p["trim_mat"] if trim else skirt.data.materials[0])
    for n in names:
        obj.vertex_groups.new(name=n)
    obj.parent = rig
    mod = obj.modifiers.new("Armature", "ARMATURE")
    mod.object = rig
    print("   waist ring: rx %.3f ry %.3f cy %.3f from %d verts, faces %d" % (rx, ry, cy, len(xs), len(me.polygons)))
    return obj


def slim_arm(base, arms, factor, ramp=(0.22, 0.36)):
    """Slim the base's shoulder pad + sleeve: scale their vertices towards the arm axis (shoulder-sleeve centroid -> donor elbow centroid) by
    `factor`.  Perpendicular scaling only, so the arm keeps its length and the donor forearm still meets it."""
    import numpy as np
    bdom, ddom = dominant(base), dominant(arms)
    done = 0
    for sgn in (1, -1):
        idx = [v.index for v in base.data.vertices
               if "Shoulder" in (bdom.get(v.index) or "") and sgn * (base.matrix_world @ v.co).x > 0.05]
        el = np.array([list(arms.matrix_world @ v.co) for v in arms.data.vertices
                       if "Elbow" in (ddom.get(v.index) or "") and sgn * (arms.matrix_world @ v.co).x > 0.05])
        if len(idx) < 8 or len(el) < 8:
            continue
        pts = np.array([list(base.matrix_world @ base.data.vertices[i].co) for i in idx])
        cs, ce = pts.mean(0), el.mean(0)
        ax = (ce - cs) / np.linalg.norm(ce - cs)
        inv = base.matrix_world.inverted()
        r0, r1 = ramp
        for i, w in zip(idx, pts):
            u = max(0.0, min(1.0, (abs(w[0]) - r0) / (r1 - r0)))
            fe = 1.0 - (1.0 - factor) * (u * u * (3 - 2 * u))   # no slimming where the sleeve meets the torso's armhole, full slimming outboard
            d = w - cs
            t = float(d @ ax)
            nw = cs + ax * t + (d - ax * t) * fe
            base.data.vertices[i].co = inv @ Vector(nw.tolist())
            done += 1
    base.data.update()
    return done


def build_shoulder_caps(rig, base, p):
    """A dome of cloth around each shoulder joint, 100% skinned to that shoulder bone, under the pauldron plates.  The kitbash's shoulder cover (the
    scarf's cowl) was cut away and the pauldrons are open plates, so when an arm rises you could see straight through the armpit; the cap rotates with
    the arm and keeps it closed.  Planar UVs into the trim atlas' 'cap' box."""
    import math
    mw = rig.matrix_world
    objs = []
    for side, sgn in (("l", 1), ("r", -1)):
        jn = p.get("joint", "Shoulder")
        j = mw @ rig.data.bones["B_%s%sJ" % (side, jn)].head_local
        c = j + Vector((sgn * p.get("out", 0.04), p.get("fwd", -0.01), p.get("up", -0.02)))
        rx, ry, rz = p.get("rx", 0.112), p.get("ry", 0.115), p.get("rz", 0.115)
        bm = bmesh.new()
        res = bmesh.ops.create_uvsphere(bm, u_segments=p.get("segs", 12), v_segments=p.get("rings", 8), radius=1.0)
        uvl = bm.loops.layers.uv.new(base.data.uv_layers.active.name)
        for v in bm.verts:
            v.co = Vector((c.x + v.co.x * rx, c.y + v.co.y * ry, c.z + v.co.z * rz))
        for f in bm.faces:
            for lp in f.loops:
                co = lp.vert.co
                u_ = max(0.0, min(1.0, ((co.x - c.x) / rx + 1.0) / 2.0))
                v_ = max(0.0, min(1.0, ((co.y - c.y) / ry + 1.0) / 2.0))
                lp[uvl].uv = TL.uv("cap", u_, v_)
        me = bpy.data.meshes.new("Trooper%s%s" % (p.get("name", "Cap"), side.upper()))
        bm.to_mesh(me)
        bm.free()
        obj = bpy.data.objects.new("Trooper%s%s" % (p.get("name", "Cap"), side.upper()), me)
        bpy.context.collection.objects.link(obj)
        me.materials.append(p["trim_mat"])
        vg = obj.vertex_groups.new(name="B_%s%sJ" % (side, jn))
        vg.add(list(range(len(me.vertices))), 1.0, "REPLACE")
        obj.parent = rig
        mod = obj.modifiers.new("Armature", "ARMATURE")
        mod.object = rig
        objs.append(obj)
        print("   shoulder cap (%s) %s at (%.3f %.3f %.3f) faces %d" % (jn, side, c.x, c.y, c.z, len(me.polygons)))
    return objs


def build_yoke(rig, base, p, skirt=None):
    """Shoulder yoke: a closed (double-walled) sloping cloth surface that links the neck collar to the vest edge and the pauldron bases, filling the
    wedges that were left when the scarf was cut away.  Rings run from the neck (u=0) to the outer outline (u=1); the outline is an ellipse that
    sits at the vest top in front/back (z_edge) and a little higher at the sides where the pauldrons start (z_edge + side_lift).  All faces use
    one flat texel; weights blend SpineTop with the clavicle bones towards the sides."""
    import math
    tiers = p.get("tiers")
    if tiers:  # layered yoke: one shell per tier (smaller + higher each time), copper edge row on each
        out = []
        for i, t in enumerate(tiers):
            q = dict(p)
            q.pop("tiers")
            q.update(t)
            q["name"] = "TrooperYoke%d" % i
            q["tier_index"] = i
            out.append(build_yoke(rig, base, q, skirt))
        return out
    segs, rows = p.get("segs", 40), p.get("rows", 5)
    cx, cy = 0.0, p.get("cy", 0.0)
    bm = bmesh.new()
    uvl = bm.loops.layers.uv.new(base.data.uv_layers.active.name)
    dl = bm.verts.layers.deform.new()
    names = ["B_SpineTopJ", "B_Neck01J", "B_lClavicleJ", "B_rClavicleJ"]
    gi = {n: i for i, n in enumerate(names)}
    vp = {}
    trim = p.get("trim_mat") is not None

    def smooth(x):
        return x * x * (3 - 2 * x)

    def surface(thick):
        rings = []
        for r_i in range(rows + 1):
            u = r_i / rows
            ring = []
            for k in range(segs):
                th = 2 * math.pi * k / segs
                c2 = math.cos(th) ** 2
                z_edge = p["z_edge"] + p["side_lift"] * c2
                rx = p["rx_n"] + (p["rx_o"] - p["rx_n"]) * u
                ry = p["ry_n"] + (p["ry_o"] - p["ry_n"]) * u
                z = p["z_neck"] + (z_edge - p["z_neck"]) * (1.0 - (1.0 - u) ** p.get("droop", 1.8)) - thick
                v = bm.verts.new((cx + rx * math.cos(th), cy + ry * math.sin(th), z))
                w = v[dl]
                side = abs(math.cos(th)) * smooth(u)             # 0 at the neck / front / back, 1 at the outer edge of the shoulders
                clav = gi["B_lClavicleJ"] if math.cos(th) > 0 else gi["B_rClavicleJ"]
                w[clav] = 0.65 * side
                w[gi["B_SpineTopJ"]] = (1.0 - 0.65 * side) * (0.55 + 0.45 * u)
                w[gi["B_Neck01J"]] = (1.0 - 0.65 * side) * (0.45 - 0.45 * u)
                vp[v] = (k, r_i)
                ring.append(v)
            rings.append(ring)
        return rings
    top = surface(0.0)
    bot = surface(p.get("thick", 0.006)) if not p.get("single") else None
    faces = []
    for r_i in range(rows):
        for k in range(segs):
            k2 = (k + 1) % segs
            for rings, up in (((top, True),) if bot is None else ((top, True), (bot, False))):
                f = bm.faces.new((rings[r_i][k], rings[r_i][k2], rings[r_i + 1][k2], rings[r_i + 1][k]))
                f.material_index = 1 if (p.get("edge_uv") and r_i == rows - 1 and skirt is not None) else 0
                faces.append((f, up))
    for k in range(segs if bot is not None else 0):  # close the outer edge between the two walls
        k2 = (k + 1) % segs
        f = bm.faces.new((top[rows][k], top[rows][k2], bot[rows][k2], bot[rows][k]))
        f.material_index = 1 if (p.get("edge_uv") and skirt is not None) else 0
        faces.append((f, None))
    bm.normal_update()
    for f, up in faces:
        c = f.calc_center_median()
        if up is True and f.normal.z < 0:
            f.normal_flip()
        elif up is False and f.normal.z > 0:
            f.normal_flip()
        elif up is None and f.normal.dot(Vector((c.x - cx, c.y - cy, 0.0))) < 0:
            f.normal_flip()
        if trim:
            f.material_index = 0
            ks = [vp[x][0] for x in f.verts]
            wrap = (max(ks) - min(ks)) > 1
            for lp in f.loops:
                k_, ri_ = vp[lp.vert]
                if wrap and k_ == 0:
                    k_ = segs
                lp[uvl].uv = TL.uv("yoke%d" % p.get("tier_index", 0), k_ / segs, ri_ / rows)
        else:
            for lp in f.loops:
                lp[uvl].uv = p["edge_uv"] if f.material_index == 1 else p["uv"]
    me = bpy.data.meshes.new("TrooperYokeMesh")
    bm.to_mesh(me)
    bm.free()
    obj = bpy.data.objects.new(p.get("name", "TrooperYoke"), me)
    bpy.context.collection.objects.link(obj)
    if trim:
        me.materials.append(p["trim_mat"])
    else:
        me.materials.append(base.data.materials[0])
        if skirt is not None:
            me.materials.append(skirt.data.materials[0])
    for n in names:
        obj.vertex_groups.new(name=n)
    obj.parent = rig
    mod = obj.modifiers.new("Armature", "ARMATURE")
    mod.object = rig
    print("   yoke faces %d" % len(me.polygons))
    return obj


def build_emblems(rig, base, skirt, p):
    """House emblem decals (copper gear ring, dark centre, copper star) laid on the base surface by raycast, each skinned to the
    bone of the nearest base vertex.  Gear/star point at one copper texel (Duncan's buckle), the centre at one black Commando texel."""
    import math
    from mathutils.kdtree import KDTree
    dg = bpy.context.evaluated_depsgraph_get()
    bvh = BVHTree.FromObject(base, dg)
    dom = dominant(base)
    kd = KDTree(len(base.data.vertices))
    for v in base.data.vertices:
        kd.insert(base.matrix_world @ v.co, v.index)
    kd.balance()
    bm = bmesh.new()
    uvl = bm.loops.layers.uv.new(base.data.uv_layers.active.name)
    dl = bm.verts.layers.deform.new()
    groups = []  # vertex group names, in the order the weights below index them
    made = []  # (vertex list, bone, normal)

    def on_surface(q, n, lift):  # conform: drop a flat-disc point back onto the curved plate (a flat disc sinks into a tight curve)
        if not conform:
            return q
        hit = bvh.ray_cast(q + n * 0.05, -n, 0.12)[0]
        return hit + n * (0.002 + lift) if hit is not None else q

    def layer(c, t, b, pts, lift, n, uv, mat):
        centre = bm.verts.new(on_surface(c + n * lift, n, lift))
        ring = [bm.verts.new(on_surface(c + n * lift + t * x + b * y, n, lift)) for x, y in pts]
        vs = [centre] + ring
        for i in range(len(ring)):
            f = bm.faces.new((centre, ring[i], ring[(i + 1) % len(ring)]))
            f.material_index = mat
            for lp in f.loops:
                lp[uvl].uv = uv
        return vs

    for sp in p["spots"]:
        conform = sp.get("conform", False)
        o, d = Vector(sp["o"]), Vector(sp["d"]).normalized()
        loc, n, _i, _dist = bvh.ray_cast(o, d)
        if loc is None:
            print("   emblem: ray missed", sp["o"])
            continue
        n = n if n.dot(d) < 0 else -n
        t = n.cross(Vector((0, 0, 1)))
        if t.length < 0.2:
            t = n.cross(Vector((0, 1, 0)))
        t.normalize()
        b = n.cross(t).normalized()
        R = sp["r"]
        teeth, step = 10, 2 * math.pi / 10
        gear = []
        for k in range(teeth):
            for off, rad in ((-0.5, 0.80), (-0.27, 1.0), (0.27, 1.0), (0.5, 0.80)):
                a = k * step + off * step
                gear.append((R * rad * math.cos(a), R * rad * math.sin(a)))
        hole = [(0.56 * R * math.cos(2 * math.pi * k / 24), 0.56 * R * math.sin(2 * math.pi * k / 24)) for k in range(24)]
        star = []
        for k in range(10):
            rad = 0.40 * R if k % 2 == 0 else 0.17 * R
            a = math.pi / 2 + k * math.pi / 5
            star.append((rad * math.cos(a), rad * math.sin(a)))
        c = loc + n * sp.get("lift", 0.002)
        vs = (layer(c, t, b, gear, 0.0, n, p["gear_uv"], 0) + layer(c, t, b, hole, 0.0015, n, p["star_uv"], 1)
              + layer(c, t, b, star, 0.0030, n, p["gear_uv"], 0))
        bone = dom.get(kd.find(loc)[1]) or "B_SpineTopJ"
        made.append((vs, bone, n))
        if bone not in groups:
            groups.append(bone)
        for v in vs:  # skin every vertex of the decal 100% to one bone (set here, not matched back by coordinates)
            v[dl][groups.index(bone)] = 1.0
        print("   emblem at (%.2f %.2f %.2f) on %s" % (loc.x, loc.y, loc.z, bone))
    bm.normal_update()
    nmap = {}
    for vs, _b, n in made:
        for v in vs:
            nmap[v] = n
    for f in bm.faces:
        if f.normal.dot(nmap[f.verts[0]]) < 0:
            f.normal_flip()
    me = bpy.data.meshes.new("TrooperEmblemMesh")
    bm.to_mesh(me)
    bm.free()
    obj = bpy.data.objects.new("TrooperEmblem", me)
    bpy.context.collection.objects.link(obj)
    me.materials.append(skirt.data.materials[0])
    me.materials.append(base.data.materials[0])
    for name in groups:
        obj.vertex_groups.new(name=name)
    obj.parent = rig
    mod = obj.modifiers.new("Armature", "ARMATURE")
    mod.object = rig
    return obj


# Kasa hat profile measured from the Meshy sculpt (extract_hat.py + hat_profile.py), levelled, apex at the origin, metres at the sculpt's scale.
# (rho = distance from the axis, z = height below the apex).  A slightly drooping cone, a small groove at rho ~0.18, a thicker band under
# the rim, rim radius 0.272.
# Two raised concentric rings, as on the sculpt: a small one around the apex cap (rho ~0.066) and a large one on the crown (rho ~0.18, with the
# brim stepping down 4 mm outside it).  Each is a 3 mm bead: (rho, z) goes surface -> ridge -> surface.
HAT_RINGS = TL.HAT_RINGS
HAT_OUTER_Z = TL.HAT_OUTER_Z
HAT_THICK = TL.HAT_THICK
HAT_RIM_R = TL.HAT_RIM_R


def build_hat_profile(rig, base, skirt, donor, p):
    """Conical (kasa) hat as a surface of revolution built from the measured profile above: outer skin, underside and rim edge (a closed
    thin shell, so it renders correctly with back-face culling).  Every face points at one flat texel (black on the base texture; the stripe
    on the skirt texture), so the recolour sets the colour.  p: R (rim radius, m), drop (rim below the head top), segs, stripe=(r0, r1) as a
    fraction of the rim radius, black_uv, ember_uv, tilt (deg, positive = brim front lowered)."""
    import math
    wv = [donor.matrix_world @ v.co for v in donor.data.vertices]
    top = max(c.z for c in wv)
    cx = sum(c.x for c in wv) / len(wv)
    cy = sum(c.y for c in wv) / len(wv)
    if p.get("center") == "skull":
        # centre on the CRANIUM (bounding-box centre of the head above the brow), not on the vertex average: the face is modelled far more
        # densely than the back of the head, which pulls the average ~3 cm forward and the hat with it
        sk = [c for c in wv if c.z > top - p.get("skull_depth", 0.10)]
        cx = (min(c.x for c in sk) + max(c.x for c in sk)) / 2
        cy = (min(c.y for c in sk) + max(c.y for c in sk)) / 2
        print("   hat centred on the skull at (%.3f %.3f) (vertex average was %.3f %.3f)" % (
            cx, cy, sum(c.x for c in wv) / len(wv), sum(c.y for c in wv) / len(wv)))
    S = p["R"] / HAT_RIM_R
    segs = p.get("segs", 32)
    apex_z = (top - p["drop"]) + 0.1708 * S
    bm = bmesh.new()
    uvl = bm.loops.layers.uv.new(base.data.uv_layers.active.name)

    def ring(i, inner):
        rho = HAT_RINGS[i] * S
        z = apex_z + (HAT_OUTER_Z[i] - (HAT_THICK[i] if inner else 0.0)) * S
        rho = max(rho - (0.0015 if inner and i == 0 else 0.0), 0.0015)
        return [bm.verts.new((cx + rho * math.cos(2 * math.pi * k / segs), cy + rho * math.sin(2 * math.pi * k / segs), z))
                for k in range(segs)]
    outer = [ring(i, False) for i in range(len(HAT_RINGS))]
    inner = [ring(i, True) for i in range(len(HAT_RINGS))]
    vp = {}   # vertex -> (k around, ring index, wall) for the trim-atlas UVs
    for i_, rg in enumerate(outer):
        for k_, vt in enumerate(rg):
            vp[vt] = (k_, i_, "o")
    for i_, rg in enumerate(inner):
        for k_, vt in enumerate(rg):
            vp[vt] = (k_, i_, "i")
    vf = TL.hat_vfrac()
    trim = p.get("trim_mat") is not None
    s0, s1 = p["stripe"]
    faces = []

    def quad(a, b, c, d, kind, i):
        try:
            f = bm.faces.new((a, b, c, d))
        except ValueError:
            return
        frac = (HAT_RINGS[i] + HAT_RINGS[min(i + 1, len(HAT_RINGS) - 1)]) / 2 / HAT_RIM_R
        f.material_index = 1 if (kind != "rim" and s0 <= frac <= s1) else 0
        faces.append((f, kind))
    for i in range(len(HAT_RINGS) - 1):
        for k in range(segs):
            k2 = (k + 1) % segs
            quad(outer[i][k], outer[i][k2], outer[i + 1][k2], outer[i + 1][k], "outer", i)
            quad(inner[i][k], inner[i][k2], inner[i + 1][k2], inner[i + 1][k], "inner", i)
    last = len(HAT_RINGS) - 1
    for k in range(segs):
        k2 = (k + 1) % segs
        quad(outer[last][k], outer[last][k2], inner[last][k2], inner[last][k], "rim", last - 1)
    bm.normal_update()
    for f, kind in faces:
        c = f.calc_center_median()
        radial = Vector((c.x - cx, c.y - cy, 0.0))
        if kind == "outer" and f.normal.z < 0:
            f.normal_flip()
        elif kind == "inner" and f.normal.z > 0:
            f.normal_flip()
        elif kind == "rim" and f.normal.dot(radial) < 0:
            f.normal_flip()
        if trim:
            f.material_index = 0
            ks = [vp[x][0] for x in f.verts]
            wrap = (max(ks) - min(ks)) > 1
            for lp in f.loops:
                k_, ri_, wall_ = vp[lp.vert]
                if wrap and k_ == 0:
                    k_ = segs
                u_ = k_ / segs
                if kind == "rim":
                    lp[uvl].uv = TL.uv("hat_rim", u_, 0.0 if wall_ == "o" else 1.0)
                else:
                    lp[uvl].uv = TL.uv("hat_out" if kind == "outer" else "hat_under", u_, vf[ri_])
        else:
            u, v = p["ember_uv"] if f.material_index == 1 else p["black_uv"]
            for lp in f.loops:
                lp[uvl].uv = (u, v)
    if p.get("tilt"):  # rotate about the head's x axis through the rim plane centre; positive = brim FRONT lowered (hat tipped forward)
        th = -math.radians(p["tilt"])
        pivot = Vector((cx, cy, top - p["drop"]))
        for vt in bm.verts:
            d = vt.co - pivot
            vt.co = pivot + Vector((d.x, d.y * math.cos(th) + d.z * math.sin(th), -d.y * math.sin(th) + d.z * math.cos(th)))
    me = bpy.data.meshes.new("TrooperHatMesh")
    bm.to_mesh(me)
    bm.free()
    hat = bpy.data.objects.new("TrooperHat", me)
    bpy.context.collection.objects.link(hat)
    if trim:
        me.materials.append(p["trim_mat"])
    else:
        me.materials.append(base.data.materials[0])
        me.materials.append(skirt.data.materials[0])
    vg = hat.vertex_groups.new(name="B_HeadJ")
    vg.add(list(range(len(me.vertices))), 1.0, "REPLACE")
    hat.parent = rig
    mod = hat.modifiers.new("Armature", "ARMATURE")
    mod.object = rig
    print("   hat (profile): top %.3f rim z %.3f apex z %.3f R %.3f faces %d" % (top, top - p["drop"], apex_z, p["R"], len(me.polygons)))
    return hat


def build_hat(rig, base, skirt, donor, p):
    """Hand-modelled conical (kasa) hat on the head bone: a double-sided slightly concave cone with an ember pinstripe ring.
    Every face points at ONE flat texel (black on the base texture; the stripe on the skirt texture), so the recolour decides the colour."""
    import math
    wv = [donor.matrix_world @ v.co for v in donor.data.vertices]
    top = max(c.z for c in wv)
    cx = sum(c.x for c in wv) / len(wv)
    cy = sum(c.y for c in wv) / len(wv)
    R, h, segs = p["R"], p["h"], p.get("segs", 40)
    z_rim = top - p["drop"]
    radii = [max(f * R, 0.002) for f in (0.0, 0.14, 0.28, 0.42, 0.56, 0.70, 0.82, 0.90, 0.96, 1.0)]
    zs = [z_rim + h * (1.0 - r / R) ** p.get("curve", 1.15) for r in radii]
    bm = bmesh.new()
    uvl = bm.loops.layers.uv.new(base.data.uv_layers.active.name)

    def ring(r, z, inner):
        rr = max(r - 0.004, 0.0015) if inner else r
        zz = z - 0.006 if inner else z
        return [bm.verts.new((cx + rr * math.cos(2 * math.pi * k / segs), cy + rr * math.sin(2 * math.pi * k / segs), zz))
                for k in range(segs)]
    outer = [ring(r, z, False) for r, z in zip(radii, zs)]
    inner = [ring(r, z, True) for r, z in zip(radii, zs)]
    stripe = p["stripe"]
    faces = []

    def quad(a, b, c, d, kind, i):
        try:
            f = bm.faces.new((a, b, c, d))
        except ValueError:
            return
        f.material_index = 1 if (stripe[0] <= radii[i] / R < stripe[1] and kind != "rim") else 0
        faces.append((f, kind))
    for i in range(len(radii) - 1):
        for k in range(segs):
            k2 = (k + 1) % segs
            quad(outer[i][k], outer[i][k2], outer[i + 1][k2], outer[i + 1][k], "outer", i)
            quad(inner[i][k], inner[i][k2], inner[i + 1][k2], inner[i + 1][k], "inner", i)
    last = len(radii) - 1
    for k in range(segs):
        k2 = (k + 1) % segs
        quad(outer[last][k], outer[last][k2], inner[last][k2], inner[last][k], "rim", last - 1)
    bm.normal_update()
    for f, kind in faces:
        c = f.calc_center_median()
        radial = Vector((c.x - cx, c.y - cy, 0.0))
        if kind == "outer" and f.normal.z < 0:
            f.normal_flip()
        elif kind == "inner" and f.normal.z > 0:
            f.normal_flip()
        elif kind == "rim" and f.normal.dot(radial) < 0:
            f.normal_flip()
        u, v = p["ember_uv"] if f.material_index == 1 else p["black_uv"]
        for lp in f.loops:
            lp[uvl].uv = (u, v)
    me = bpy.data.meshes.new("TrooperHatMesh")
    bm.to_mesh(me)
    bm.free()
    hat = bpy.data.objects.new("TrooperHat", me)
    bpy.context.collection.objects.link(hat)
    me.materials.append(base.data.materials[0])
    me.materials.append(skirt.data.materials[0])
    vg = hat.vertex_groups.new(name="B_HeadJ")
    vg.add(list(range(len(me.vertices))), 1.0, "REPLACE")
    hat.parent = rig
    mod = hat.modifiers.new("Armature", "ARMATURE")
    mod.object = rig
    print("   hat: top %.3f rim z %.3f apex z %.3f faces %d" % (top, z_rim, zs[0], len(me.polygons)))
    return hat


def smooth_by_angle(obj, deg=35.0):
    """Smooth shading with hard edges only where the surface really creases (hat steps, rim edge, ring corners)."""
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    lim = math.radians(deg)
    for f in bm.faces:
        f.smooth = True
    n = 0
    for e in bm.edges:
        sharp = len(e.link_faces) != 2 or e.calc_face_angle(0.0) > lim
        e.smooth = not sharp
        n += sharp
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return n


def build(name, v):
    bs.reset_scene()
    base, rig = import_unit(v["base"])
    base.name, base.data.name = v["base"], v["base"] + "Mesh"
    trim_mat = None
    if v.get("trim"):  # one extra material (a copy of the base's, rewired) for the custom parts: real UVs painted in 04_textures/trim
        trim_mat = base.data.materials[0].copy()
        trim_mat.name = "Mat_Thorvald_Trim"
        tdir = os.path.join(PROJ, "04_textures", "trim")
        print("   trim material wiring:", bs.wire_textures(trim_mat, {"Base Color": os.path.join(tdir, "Trim_Albedo.png"),
                                                                      "Specular IOR Level": os.path.join(tdir, "Trim_MetallicGlossAO.png"),
                                                                      "Normal": os.path.join(tdir, "Trim_Normal.png")}))
    rig.name = "Armature"
    weight_src = None
    if any(f.get("weights_from_base") for f in v.get("fill", [])):
        weight_src = base.copy()  # the UNCUT base (chest plate still there): skin-weight source for fills
        weight_src.data = base.data.copy()
        weight_src.name = "WeightSource"
        bpy.context.collection.objects.link(weight_src)
        weight_src.hide_render = True
        for m in list(weight_src.modifiers):
            weight_src.modifiers.remove(m)
    comps = P.components(base)
    tag_regions(base, comps, v.get("regions"))
    ids = set(v["remove"])
    for k, comp in enumerate(comps):  # baked-in weapon/scabbard islands (the stick under the feet)
        w = P.comp_info(base, comp)["bones"]
        if w and any(s in w[0][0] for s in ("Weapon", "Scabbard")):
            ids.add(k)
    if v.get("drop_above_z"):  # keep only the lower body of the base (islands whose centre is below this height)
        for k, comp in enumerate(comps):
            if P.comp_info(base, comp)["centre"][2] > v["drop_above_z"]:
                ids.add(k)
    if v.get("metal"):  # every island that is mostly metal (MetallicGlossAO red channel)
        fm = importlib.import_module("04_metal_map").face_metal(base, v["base"])
        v2c = {i: k for k, comp in enumerate(comps) for i in comp}
        share = {}
        for p in base.data.polygons:
            a = share.setdefault(v2c[p.vertices[0]], [0, 0])
            a[0] += fm[p.index] > 0.5
            a[1] += 1
        ids |= {k for k, (m, n) in share.items() if m / n >= 0.6}
    rem = [i for k in sorted(ids) for i in comps[k]]
    P.delete_verts(base, rem)
    if v.get("strip_bones"):  # remove the base's arms / legs by bone, so donors' arms / legs replace them
        sub = tuple(v["strip_bones"])
        n0 = len(base.data.polygons)
        outer = tuple(v.get("strip_outer", ()))
        keep_faces_pos(base, lambda ds, c: not bone_vote(ds, sub, outer, c, v.get("x_cut", 0.20)))
        print("   stripped %d base faces by bone %s" % (n0 - len(base.data.polygons), sub))
    if v.get("cut_below_z"):  # clean horizontal lower edge of the torso (a donor waist takes over below it)
        bisect_below(base, v["cut_below_z"], v.get("cut_below_r"))
    if v.get("slim_upper"):
        print("   upper body slimmed: %d verts moved" % T5S.slim_upper(base, rig, v["slim_upper"]))
    cut = keep_faces(base, lambda ds: "B_HeadJ" not in ds)
    if "collar_z" in v:  # trim the base's standing collar to a clean horizontal edge
        bisect_above(base, v["collar_z"], v.get("collar_r", 0.25))
    if "collar" in v:  # hand-modelled stand-up collar (see build_collar)
        print("   collar faces %d" % build_collar(base, v["collar"]))
    if v.get("min_island"):  # scraps the cuts left behind in the upper body
        scraps = [c for c in P.components(base) if len(c) < v["min_island"]
                  and P.comp_info(base, c)["centre"][2] > 1.4]
        P.delete_verts(base, [i for c in scraps for i in c])
    fill_objs = []
    for f in v.get("fill", []):  # donor body region (torso etc.) to cover what the removals opened up
        part, prig = import_unit(f["donor"])
        part.name = part.data.name = "%sFill_%s" % (f["donor"], f.get("tag", "torso"))
        pc = P.components(part)
        tag_regions(part, pc, f.get("regions"))
        for k in f.get("exclude_first", []):  # whole donor islands dropped BEFORE the bone filter (ids shift afterwards)
            P.delete_verts(part, list(pc[k]))
        if "match" in f:  # donor faces whose majority bone name contains one of these substrings (arms, legs...)
            sub, outer = tuple(f["match"]), tuple(f.get("match_outer", ()))
            keep_faces_pos(part, lambda ds, c: bone_vote(ds, sub, outer, c, f.get("x_cut", 0.20)))
        elif "keep_comps" in f:  # take whole donor islands (e.g. coat panels) instead of a bone region
            P.delete_verts(part, [i for k in f["keep_comps"] for i in pc[k]], invert=True)
        else:
            P.delete_verts(part, [i for k in f.get("exclude", []) for i in pc[k]])
            bones = set(f["bones"])
            keep_faces(part, lambda ds: all(d in bones for d in ds))
        if "zmax" in f:
            trim_above(part, f["zmax"], 9.0)
        if f.get("retex_dark"):  # faces whose texel is dark + neutral share texels with another part (Duncan: tabard = trousers):
            rd = f["retex_dark"]  # point them at ONE flat texel so the recolour can colour them on their own
            import numpy as np
            img = next(n.image for n in part.data.materials[0].node_tree.nodes
                       if n.type == "TEX_IMAGE" and n.image and "Albedo" in (n.image.filepath or n.image.name))
            wpx, hpx = img.size
            px = np.array(img.pixels[:], dtype=np.float32).reshape(hpx, wpx, 4)
            uvd = part.data.uv_layers.active.data
            nre = 0
            for poly in part.data.polygons:
                uvs = [uvd[li].uv for li in poly.loop_indices]
                cu = sum(u.x for u in uvs) / len(uvs)
                cv = sum(u.y for u in uvs) / len(uvs)
                col = px[min(hpx - 1, int((cv % 1.0) * hpx)), min(wpx - 1, int((cu % 1.0) * wpx)), :3]
                mx, mn = float(col.max()), float(col.min())
                sat = (mx - mn) / mx if mx > 1e-6 else 0.0
                import colorsys as _cs
                hue = _cs.rgb_to_hsv(float(col[0]), float(col[1]), float(col[2]))[0] * 360.0
                warm = sat > rd["smax"] and (hue < 75 or hue > 340)        # brown belt leather, gold buckle
                green = 80 <= hue <= 200 and sat > 0.06 and mx > rd["vmax"]  # the pale-green sash panel
                if not (warm or green):
                    if trim_mat is not None:   # real UVs: planar projection from the front / back into the tabard boxes
                        if len(part.data.materials) < 2:
                            part.data.materials.append(trim_mat)
                        poly.material_index = 1
                        box = "tab_front" if poly.normal.y < 0 else "tab_back"
                        for li in poly.loop_indices:
                            w_ = part.matrix_world @ part.data.vertices[part.data.loops[li].vertex_index].co
                            u_ = (w_.x - TL.TAB_X[0]) / (TL.TAB_X[1] - TL.TAB_X[0])
                            v_ = (w_.z - TL.TAB_Z[0]) / (TL.TAB_Z[1] - TL.TAB_Z[0])
                            u_ = u_ if box == "tab_front" else 1.0 - u_
                            uvd[li].uv = TL.uv(box, max(0.0, min(1.0, u_)), max(0.0, min(1.0, v_)))
                    else:
                        for li in poly.loop_indices:
                            uvd[li].uv = rd["uv"]
                    nre += 1
            print("   %s: %d dark faces re-pointed at one flat texel" % (part.name, nre))
        if f.get("own_albedo"):  # the donor shares texels between this part and another kept part (Duncan: tunic = trousers): give it its own copy
            import shutil
            m0 = part.data.materials[0]
            m1 = m0.copy()
            m1.name = "Mat_%s%s" % (f["donor"], f.get("tag", "part").capitalize())
            for lk in m1.node_tree.links:
                if lk.to_socket.name == "Base Color" and lk.from_node.type == "TEX_IMAGE":
                    src = bpy.path.abspath(lk.from_node.image.filepath)
                    dst = os.path.join(PROJ, "04_textures", "src", "%s_%s_Albedo.png" % (f["donor"], f.get("tag", "part").capitalize()))
                    os.makedirs(os.path.dirname(dst), exist_ok=True)
                    shutil.copyfile(src, dst)
                    lk.from_node.image = bpy.data.images.load(dst, check_existing=False)
            part.data.materials[0] = m1
            print("   %s: own albedo copy %s" % (part.name, m1.name))
        if f.get("shift_z"):  # rigid lift of the whole part (e.g. a donor waist up to meet the torso's cut edge)
            for vt in part.data.vertices:
                vt.co.z += f["shift_z"]
            part.data.update()
        if f.get("slim") and v.get("slim_upper"):  # the part's top tucks under the torso: take it in with the torso so its edge stays hidden
            print("   %s slimmed with the torso: %d verts moved" % (part.name, T5S.slim_upper(part, rig, v["slim_upper"])))
        sxy = f.get("scale_xy", 1.0)
        if sxy != 1.0:
            for vt in part.data.vertices:
                vt.co.x *= sxy
                vt.co.y *= sxy
        if f.get("sash_tail"):
            print("   sash tail faces %d" % build_sash_tail(part, **f["sash_tail"]))
        if f.get("to_back"):  # belt pouches: turned round to the back (rotation about z, no mirror), each island set at its x (`xs`) and seated on the
            tb = f["to_back"]  # back of an earlier fill (the sash belt) by a ray from behind, its inner face `gap` off the surface
            front = tb.get("side", "back") == "front"   # side="front": no turn, seated on the front of the belt by a ray from in front
            if not front:
                for vt in part.data.vertices:
                    vt.co.x, vt.co.y = -vt.co.x, -vt.co.y
            seat = next(o for o in fill_objs if tb["seat_on"] in o.name)
            bvh = BVHTree.FromObject(seat, bpy.context.evaluated_depsgraph_get())
            comps_ = sorted(P.components(part), key=lambda c: sum(part.data.vertices[i].co.x for i in c) / len(c))
            for k, comp in enumerate(comps_):
                vs = [part.data.vertices[i] for i in comp]
                ctr = sum((v_.co for v_ in vs), Vector()) / len(vs)
                for v_ in vs:   # optional uniform scale about the island centre (the Mercenary's pouches are bulky)
                    v_.co = ctr + (v_.co - ctr) * tb.get("scale", 1.0)
                cx = ctr.x
                cz = (tb["z"] if "z" in tb else ctr.z)
                dz_ = cz - ctr.z
                dx = tb["xs"][k % len(tb["xs"])] - cx   # explicit x per island, left to right (donor pouches may all sit on one hip)
                if front:
                    hit = bvh.ray_cast(Vector((cx + dx, -1.0, cz)), Vector((0, 1, 0)))[0]
                    dy = (hit.y - tb.get("gap", 0.004) - max(v_.co.y for v_ in vs)) if hit is not None else 0.0
                else:
                    hit = bvh.ray_cast(Vector((cx + dx, 1.0, cz)), Vector((0, -1, 0)))[0]
                    dy = (hit.y + tb.get("gap", 0.004) - min(v_.co.y for v_ in vs)) if hit is not None else 0.0
                for v_ in vs:
                    v_.co.x += dx
                    v_.co.y += dy
                    v_.co.z += dz_
                print("   pouch at x %.2f z %.2f seated y %+.3f (%s)" % (cx + dx, cz, dy, "hit" if hit is not None else "MISS"))
            part.data.update()
            # skin: each island takes the weights of the belt vertex nearest its centre (the donor's front-hip pouches carry thigh weights,
            # which swing them off the back in Run)
            from mathutils.kdtree import KDTree
            kd = KDTree(len(seat.data.vertices))
            for sv in seat.data.vertices:
                kd.insert(seat.matrix_world @ sv.co, sv.index)
            kd.balance()
            snames = {g.index: g.name for g in seat.vertex_groups}
            for comp in P.components(part):
                c_ = sum((part.data.vertices[i].co for i in comp), Vector()) / len(comp)
                src = seat.data.vertices[kd.find(c_)[1]]
                ws = [(snames[g.group], g.weight) for g in src.groups if g.weight > 0.0]
                for g in part.vertex_groups:
                    g.remove(list(comp))
                for bn, wt in ws:
                    vg = part.vertex_groups.get(bn) or part.vertex_groups.new(name=bn)
                    vg.add(list(comp), wt, "REPLACE")
                print("   pouch skinned like the belt: %s" % ", ".join("%s %.2f" % x for x in ws))
        if f.get("clip_inside"):
            n = clip_inside(part, base, f.get("margin", 0.008))
            print("   clip %s: %d verts pushed under the base surface" % (part.name, n))
        if f.get("weights_from_base") and weight_src is not None:
            transfer_weights(weight_src, part)
            print("   %s: skin weights transferred from the uncut base" % part.name)
        if f.get("calm_weights"):
            calm_weights(part)
            print("   %s: arm weights stripped + smoothed" % part.name)
        part.parent = rig
        for m in part.modifiers:
            if m.type == "ARMATURE":
                m.object = rig
        bpy.data.objects.remove(prig, do_unlink=True)
        fill_objs.append(part)
        print("   fill %s faces %d" % (part.name, len(part.data.polygons)))
    for f, part in zip(v.get("fill", []), fill_objs):   # after ALL fills: tuck a fill under a later one (thighs that poke through the apron)
        if f.get("clip_under"):
            cover = next(o for o in fill_objs if f["clip_under"] in o.name)
            print("   %s tucked under %s: %d verts" % (part.name, cover.name, clip_inside(part, cover, f.get("clip_margin", 0.006))))
    if v.get("slim_arm"):
        arms_obj = next(o for o in fill_objs if "arms" in o.name)
        print("   shoulders slimmed to %.2f: %d vertices" % (v["slim_arm"], slim_arm(base, arms_obj, v["slim_arm"], v.get("slim_ramp", (0.22, 0.36)))))
    if weight_src is not None:
        bpy.data.objects.remove(weight_src, do_unlink=True)
    donor, drig = import_unit(v["donor"])
    donor.name, donor.data.name = v["donor"] + "Head", v["donor"] + "HeadMesh"
    hb = set(v.get("head_bones", ("B_HeadJ",)))
    if v.get("head_clip"):  # shorten donor islands BEFORE anything else (ids shift afterwards): [(island id, z)] drops faces centred below z
        dc0 = P.components(donor)
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        bm.faces.ensure_lookup_table()
        for k, zlim in v["head_clip"]:
            vs = set(dc0[k])
            kill = [f for f in bm.faces if all(x.index in vs for x in f.verts) and f.calc_center_median().z < zlim]
            bmesh.ops.delete(bm, geom=kill, context="FACES")
            print("   head_clip island %d below z %.2f: %d faces" % (k, zlim, len(kill)))
        bmesh.ops.delete(bm, geom=[x for x in bm.verts if not x.link_faces], context="VERTS")
        bm.to_mesh(donor.data)
        bm.free()
    if v.get("head_exclude"):
        dc = P.components(donor)
        P.delete_verts(donor, [i for k in v["head_exclude"] for i in dc[k]])
    if v.get("head_neck_comps"):  # head + the neck faces of ONLY these donor islands (others flare out)
        dc = P.components(donor)
        neck_v = {i for k in v["head_neck_comps"] for i in dc[k]}
        dom = dominant(donor)
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        kill = []
        for f in bm.faces:
            ds = [dom.get(x.index) for x in f.verts]
            if all(d == "B_HeadJ" for d in ds):
                continue
            if all(x.index in neck_v for x in f.verts):
                back = f.calc_center_median().y > 0.0
                if back:  # whole tube at the BACK, whatever bone it is weighted to (closes the nape)
                    if v.get("flip_neck_back"):
                        f.normal_flip()  # Bannerjee's tube back is wound inward (render-verified: culled = hole)
                    continue
                if all(d in ("B_HeadJ", "B_Neck01J") for d in ds):  # front: neck-weighted faces only
                    continue
            kill.append(f)
        bmesh.ops.delete(bm, geom=kill, context="FACES")
        bmesh.ops.delete(bm, geom=[x for x in bm.verts if not x.link_faces], context="VERTS")
        bm.to_mesh(donor.data)
        bm.free()
    else:
        keep_faces(donor, lambda ds: all(d in hb for d in ds))
    if v.get("head_shift_z"):  # lower the whole head (and its neck tube) in rest pose: shortens a long neck without distorting the face
        for vt in donor.data.vertices:
            vt.co.z += v["head_shift_z"]
        donor.data.update()
        print("   head shifted by %.3f" % v["head_shift_z"])
    if v.get("head_scale"):  # enlarge the donor head about a point on the neck axis (proportions: our heads read small on these bodies)
        hs, pz = v["head_scale"], v.get("head_pivot_z", 1.62)
        for vt in donor.data.vertices:
            vt.co.x *= hs
            vt.co.y = vt.co.y * hs
            vt.co.z = pz + (vt.co.z - pz) * hs
        donor.data.update()
        print("   head scaled x%.2f about z %.2f" % (hs, pz))
    if "bun" in v:
        print("   topknot faces %d" % build_bun(donor, **v["bun"]))
    if "stitch_nape" in v:
        print("   nape stitched with %d faces" % stitch_nape(donor, v["stitch_nape"], a_lo=20.0, a_hi=160.0))
    if "neck_extend" in v:
        print("   neck extended from %d edges" % extend_neck(donor, *v["neck_extend"]))
    if "stitch2" in v:  # second zipper: tube's sloped back edge -> top of the neck extension
        zs, zh, zl = v["stitch2"]
        print("   back band stitched with %d faces" % stitch_nape(donor, zs, z_hi=zh, z_lo=zl, seam_z=zh))
    if "neck_double" in v:  # back-of-neck zone: double-sided + plain skin, so no culled holes whatever the winding
        z0, z1 = v["neck_double"]
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        uvl = bm.loops.layers.uv.active
        side_v = max((x for x in bm.verts if z0 < x.co.z < z1 and x.link_loops), key=lambda x: abs(x.co.x))
        skin = side_v.link_loops[0][uvl].uv.copy()
        zone = [f for f in bm.faces if z0 < f.calc_center_median().z < z1 and f.calc_center_median().y > -0.02]
        for f in zone:
            for lp in f.loops:
                lp[uvl].uv = skin
        dup = bmesh.ops.duplicate(bm, geom=zone)
        dfaces = [g for g in dup["geom"] if isinstance(g, bmesh.types.BMFace)]
        for f in dfaces:
            f.normal_flip()
        bm.to_mesh(donor.data)
        bm.free()
        print("   neck zone double-sided: %d faces" % len(zone))
    if "neck_backplate" in v:
        print("   neck backplate faces %d" % neck_backplate(donor, *v["neck_backplate"]))
    if v.get("neck_outward"):  # neck-zone faces must face OUT (game material culls back faces)
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        flipped = 0

        def outness(f):
            c = f.calc_center_median()
            f.normal_update()
            return f.normal.dot(Vector((c.x, c.y, 0.0)))
        # the head's own convention, read off back-of-skull hair faces (object may be mirrored on import)
        ref = [outness(f) for f in bm.faces if f.calc_center_median().z > 1.85 and f.calc_center_median().y > 0.05]
        sign = 1.0 if sum(1 for r in ref if r > 0) >= len(ref) / 2 else -1.0
        print("   neck_outward: reference sign %+d from %d hair faces" % (sign, len(ref)))
        for f in bm.faces:
            c = f.calc_center_median()
            if c.z < 1.79 and (c.x ** 2 + c.y ** 2) ** 0.5 < 0.11:
                if outness(f) * sign < 0:
                    f.normal_flip()
                    flipped += 1
        bm.to_mesh(donor.data)
        bm.free()
        print("   neck faces flipped outward: %d" % flipped)
    if "head_trim" in v:  # drop flared neck/collar lips: low faces that reach far from the neck axis
        zt, rt = v["head_trim"]
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        kill = [f for f in bm.faces if any(x.co.z < zt and (x.co.x ** 2 + x.co.y ** 2) ** 0.5 > rt for x in f.verts)]
        bmesh.ops.delete(bm, geom=kill, context="FACES")
        bmesh.ops.delete(bm, geom=[x for x in bm.verts if not x.link_faces], context="VERTS")
        bm.to_mesh(donor.data)
        bm.free()
        print("   head trim removed %d faces" % len(kill))
    donor.parent = rig
    for m in donor.modifiers:
        if m.type == "ARMATURE":
            m.object = rig
    bpy.data.objects.remove(drig, do_unlink=True)
    bpy.context.view_layer.update()
    skirt_obj = (next((o for o in fill_objs if "skirt" in o.name), None) or next((o for o in fill_objs if "legs" in o.name and o.name.startswith("Duncan")), None)
                 or next((o for o in fill_objs if o.name.startswith("Duncan")), None)   # emblem / hat texels are in Duncan's texture layout
                 or next((o for o in fill_objs if "legs" in o.name), None))
    if v.get("hat"):
        (build_hat_profile if v["hat"].get("profile") else build_hat)(rig, base, skirt_obj, donor, dict(v["hat"], trim_mat=trim_mat))
    if v.get("emblem"):
        build_emblems(rig, base, skirt_obj, v["emblem"])
    if v.get("arm_wrap"):
        build_arm_wrap(rig, base, trim_mat, v["arm_wrap"])
    if v.get("pauldron_tiers"):
        build_pauldron_tiers(rig, base, v["pauldron_tiers"])
    if v.get("pauldron_lames"):
        build_pauldron_lames(rig, base, trim_mat, v["pauldron_lames"])
    if v.get("goggles"):
        build_goggles(rig, donor, trim_mat, v["goggles"])
    if v.get("plate_rims"):
        build_plate_rims(rig, base, trim_mat, v["plate_rims"])
    if v.get("props"):
        for pp in v["props"]:
            build_props(rig, fill_objs, pp)
    if v.get("yoke"):
        build_yoke(rig, base, dict(v["yoke"], trim_mat=trim_mat), skirt_obj)
    if v.get("neck_sleeve"):
        HD.build_neck_sleeve(rig, donor, base, v["neck_sleeve"], trim_mat)
    if v.get("hood"):
        HD.build_hood(rig, donor, base, dict(v["hood"], rings=TL.HOOD_RINGS, slit=(TL.HOOD_SLIT[0], TL.HOOD_SLIT[1], v["hood"].get("slit_deg", 62))), trim_mat)
    if v.get("sliver_clean"):
        sc = v["sliver_clean"]
        print("   slivers removed from the base: %d" % delete_slivers(base, sc.get("min_aspect", 9.0), sc.get("max_area", 0.0015), sc.get("zmin", 1.3)))
    if v.get("fill_slots"):
        fs = v["fill_slots"]
        print("   slots capped on the base: %d faces" % fill_small_holes(base, fs["uv"], fs.get("min_edges", 4), fs.get("max_edges", 8)))
    waist_parts = [base, skirt_obj]
    if v.get("skirt"):
        sk = SK.build_skirt(rig, [base] + fill_objs, v["skirt"], trim_mat, base.data.uv_layers.active.name)
        waist_parts = [base, sk]
    if v.get("waist"):
        build_waist(rig, waist_parts, skirt_obj, dict(v["waist"], trim_mat=trim_mat))
    if v.get("shoulder_caps"):
        build_shoulder_caps(rig, base, dict(v["shoulder_caps"], trim_mat=trim_mat))
    if v.get("elbow_balls"):
        build_shoulder_caps(rig, base, dict(v["elbow_balls"], trim_mat=trim_mat, joint="Elbow", name="Elbow"))
    if v.get("cuffs"):
        build_cuffs(rig, [base] + [o for o in fill_objs if "arms" in o.name], skirt_obj, dict(v["cuffs"], trim_mat=trim_mat))
        if v["cuffs"].get("cap_cut", True):
            for ao in [o for o in fill_objs if "arms" in o.name]:
                print("   sleeve cut loops capped on %s: %d faces" % (ao.name, cap_cut_loops(ao)))
    if v.get("smooth_parts"):
        for o in bpy.data.objects:
            if o.type == "MESH" and o.name.startswith("Trooper"):
                print("   smooth shading %s: %d hard edges" % (o.name, smooth_by_angle(o, v["smooth_parts"])))
    print(name, "removed verts", len(rem), "head faces", cut, "donor head tris", len(donor.data.polygons))
    if v.get("hardware"):
        HW.build_hardware(rig, v["hardware"], [base] + fill_objs, os.path.join(PROJ, "04_textures", "gold"))

    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    for img in list(bpy.data.images):
        if img.users == 0:
            bpy.data.images.remove(img)
    bs.pack_all_images()
    lo, hi = bs.model_bounds(base)
    for o in fill_objs:  # frame every part (the base alone may have lost its legs)
        flo, fhi = bs.model_bounds(o)
        lo = Vector((min(lo.x, flo.x), min(lo.y, flo.y), min(lo.z, flo.z)))
        hi = Vector((max(hi.x, fhi.x), max(hi.y, fhi.y), max(hi.z, fhi.z)))
    hlo, hhi = bs.model_bounds(donor)
    top = max(hi.z, hhi.z)
    centre = Vector((0, 0, (lo.z + top) / 2))
    scale = (top - lo.z) * 1.1
    os.makedirs(SHOTS, exist_ok=True)
    for tag, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0)), ("back", (0, 1, 0))):
        bs.setup_render(500, 700)
        cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=d, distance=scale * 2.5)
        bs.render_to(os.path.join(SHOTS, "%s_%s.png" % (name, tag)), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    bs.setup_render(500, 500)
    cam = bs.setup_camera(target=Vector((0, 0, 1.68)), ortho_scale=0.75, direction=(0.5, -0.85, 0.05), distance=4)
    bs.render_to(os.path.join(SHOTS, "%s_head.png" % name), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
    cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=(0.7, -0.7, 0), distance=scale * 2.5)
    bs.setup_render(1000, 1300)
    os.makedirs(BLENDS, exist_ok=True)
    try:
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(BLENDS, name + ".blend"), compress=True)
    except Exception as e:
        print("save failed", e)


keys = script_args() or list(VARIANTS)
for k in keys:
    build(k, VARIANTS[k])

