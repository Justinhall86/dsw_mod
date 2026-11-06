"""Painting hook for the House Thorvald Trooper upscale (dsw-unit-upscale `--hook`).

    blender -b Trooper_merged.blend --python upscale_textures.py -- out/tex up2 --hook thorvald_hook.py

Everything is in METRES in the rest pose (x left/right, y depth with the front at -y, z height ~0..1.95), so the design survives any resolution.
Only parts with real UV islands are painted (Commando body, Duncan legs, Mercenary arms); the hat, yoke, cuffs, waist and skirt tabard point many faces at one
flat texel, so position-based painting cannot work on them.  Painted copper is flagged as metal.
"""
COPPER = (0.62, 0.36, 0.19)
COPPER_D = (0.40, 0.21, 0.11)
RUST_D = (0.20, 0.085, 0.05)
SEAM = (0.025, 0.022, 0.020)
LEATHER = (0.22, 0.095, 0.055)


def region_of(obj, tri):
    return 1


def paint(ctx):
    PL, np, cv, R, fp = ctx.PL, ctx.np, ctx.cv, ctx.R, ctx.fp
    px, py, pz = ctx.P[..., 0], ctx.P[..., 1], ctx.P[..., 2]
    ax = np.abs(px)
    on = (R > 0).astype(np.float32)            # only texels that belong to this object's triangles
    name = ctx.obj.name
    if ctx.mat.name == "Mat_Base":
        return None

    if name == "Commando":
        front = on * np.clip((-py - 0.03) / fp + 0.5, 0, 1)
        back = on * np.clip((py - 0.05) / fp + 0.5, 0, 1)
        torso = PL.cov_band(pz, 1.285, 1.60, fp)
        # chest: centre seam + two abdominal seams (dark line with a thin copper edge below it)
        for z in (1.350, 1.402):
            ln = PL.cov_line(pz - z, 0.0016, fp) * PL.cov_band(ax, 0.0, 0.17, fp) * front
            cv.paint(ln, SEAM, 0.0010)
            cv.paint(PL.cov_line(pz - (z - 0.0034), 0.0009, fp) * PL.cov_band(ax, 0.0, 0.17, fp) * front, COPPER_D, 0.0006, True)
        cv.paint(PL.cov_line(ax, 0.0015, fp) * PL.cov_band(pz, 1.29, 1.55, fp) * front, SEAM, 0.0010)
        # back plate: centre seam and two cross seams
        cv.paint(PL.cov_line(ax, 0.0015, fp) * PL.cov_band(pz, 1.29, 1.56, fp) * back, SEAM, 0.0010)
        for z in (1.375, 1.455):
            cv.paint(PL.cov_line(pz - z, 0.0016, fp) * PL.cov_band(ax, 0.0, 0.19, fp) * back, SEAM, 0.0010)
        # pauldrons: lamellar bands (dark line + copper edge) and a row of rivets on the middle band
        paul = PL.cov_band(ax, 0.20, 0.47, fp) * PL.cov_band(pz, 1.40, 1.68, fp) * on
        for z in (1.452, 1.492, 1.532, 1.572):
            cv.paint(PL.cov_line(pz - z, 0.0020, fp) * paul, SEAM, 0.0012)
            cv.paint(PL.cov_line(pz - (z - 0.0042), 0.0011, fp) * paul, COPPER, 0.0008, True)
        riv = PL.cov_stripes(px, 0.034, 0.0075, 0.0, fp) * PL.cov_line(pz - 1.512, 0.0040, fp) * paul
        cv.paint(riv, COPPER, 0.0016, True)
        # a rim line along the lower edge of the vest
        cv.paint(PL.cov_line(pz - 1.296, 0.0022, fp) * PL.cov_band(ax, 0.0, 0.24, fp) * on, COPPER_D, 0.0008, True)
        return {"weave": 0.0, "relief": 1.0, "emboss": 0.30}

    if name == "DuncanFill_legs":
        legs = on * PL.cov_band(ax, 0.04, 0.34, fp)
        # boots: two leather straps with a copper buckle stud on the front, and a top rim
        for z, w in ((0.150, 0.0085), (0.236, 0.0085)):
            strap = PL.cov_line(pz - z, w, fp) * legs
            cv.paint(strap, LEATHER, 0.0012)
            cv.paint(PL.cov_line(pz - z - w * 0.55, 0.0009, fp) * legs, COPPER_D, 0.0006, True)
            stud = PL.cov_line(pz - z, 0.0042, fp) * PL.cov_line(ax - 0.118, 0.0050, fp) * legs * np.clip((-py - 0.06) / fp + 0.5, 0, 1)
            cv.paint(stud, COPPER, 0.0018, True)
        cv.paint(PL.cov_line(pz - 0.330, 0.0030, fp) * legs, LEATHER, 0.0010)       # boot top rim
        return {"weave": 0.0, "relief": 1.0, "emboss": 0.30}

    if name == "MercenaryFill_arms":
        # forearm guards: stitched bands across the guard, measured along the arm axis from the elbow seam
        import math
        sgn = np.where(px >= 0, 1.0, -1.0).astype(np.float32)
        a = np.array([0.65, -0.08, -0.76], np.float32)
        a /= np.linalg.norm(a)
        c = np.stack([sgn * 0.45, np.zeros_like(px), np.full_like(px, 1.37)], axis=-1)
        d = ctx.P - c
        ax_dir = np.stack([sgn * a[0], np.full_like(px, a[1]), np.full_like(px, a[2])], axis=-1)
        t = (d * ax_dir).sum(-1).astype(np.float32)
        guard = on * PL.cov_band(t, 0.04, 0.30, fp)
        for tt in (0.12, 0.20, 0.28):
            cv.paint(PL.cov_line(t - tt, 0.0016, fp) * guard, RUST_D, 0.0010)
        # stitches: dashes just beside the first and last bands
        for tt in (0.12, 0.28):
            along = PL.cov_stripes((px * 4.0 + pz * 4.0 + py * 4.0).astype(np.float32), 0.012, 0.0045, 0.0, fp)
            cv.paint(PL.cov_line(t - (tt + 0.0065), 0.0009, fp) * guard * along, COPPER_D, 0.0006, True)
        return {"weave": 0.0, "relief": 1.0, "emboss": 0.30}
    return None
