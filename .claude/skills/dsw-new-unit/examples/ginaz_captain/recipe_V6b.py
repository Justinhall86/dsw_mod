"""The exact recipe of the Ginaz Captain body (from scripts/03_variants.py). Component ids are for the Smuggler/Mercenary,
Raider, Gurney and Bannerjee models as of 2026-10-24."""
TORSO = ("B_Spine01J", "B_Spine02J", "B_SpineTopJ", "B_lClavicleJ", "B_rClavicleJ", "B_Neck01J")

COLLAR = dict(z_bottom=1.60, top_front=1.692, top_side=1.755, top_back=1.775, rx=0.100, ry=0.096, cy=0.005,
              flare=0.012, open_deg=3.0, thick=0.010, rim=0.012, segs=36, mat_index=0,
              wine_uv=(0.2700, 0.2925, 0.8320, 0.8550),
              gold_uv=(0.2050, 0.2320, 0.3600, 0.3900))  # inside the big blue scarf patch -> solid gold

VARIANTS = {
    "V6b_GinazCollar": dict(base="Mercenary", donor="Bannerjee", metal=True,
                                remove=[13, 16, 6, 33, 34, 20, 23, 24, 17, 37, 55, 103, 40, 52, 67, 60],
                                head_neck_comps=[25], flip_neck_back=True, stitch_nape=1.766, neck_extend=(1.72, 1.65, 0.02, 1.76, 0.07), neck_backplate=(1.785, 1.62, 0.058, 0.066, 8.0, 172.0), collar_z=1.70, collar=COLLAR, min_island=12,
                                fill=[dict(donor="Raider", tag="tunic", exclude=[0, 11, 19, 20],
                                           bones=TORSO, zmax=1.64, clip_inside=True, margin=0.008,
                                           weights_from_base=True),
                                      dict(donor="Gurney", tag="coat", keep_comps=[9, 10, 22, 23])],
                                title="V6 + hand-modelled stand-up collar"),
}
