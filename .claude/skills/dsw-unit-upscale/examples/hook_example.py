"""Example --hook for upscale_textures.py: the Ginaz Captain tunic and coat (condensed from dsw-new-unit/scripts/41_polish_textures.py).

    blender -b C2_Captain_plum.blend --python scripts/upscale_textures.py -- out/tex cap5 --scale-mat Raider=1 --hook examples/hook_example.py

What a hook is for: everything a generic upscale cannot know - which donor blotches to clean, where piping and hems go, what is cloth.
All measurements are in METRES in the rest pose (ctx.P: x = left/right, y = depth, z = height; the unit stands at z 0..~1.95, front = -y),
so a design survives any texture resolution.  Coverage helpers anti-alias by the texel footprint (ctx.fp).
"""
GOLD = (205 / 255, 164 / 255, 86 / 255)
GOLD_D = (150 / 255, 108 / 255, 50 / 255)
TUNIC, COAT = 1, 2


def region_of(obj, tri):
    return {"RaiderFill_tunic": TUNIC, "GurneyFill_coat": COAT}.get(obj.name, 0)


def paint(ctx):
    PL, np, cv, R, fp = ctx.PL, ctx.np, ctx.cv, ctx.R, ctx.fp
    px, py, pz = ctx.P[..., 0], ctx.P[..., 1], ctx.P[..., 2]
    ax = np.abs(px)
    front = np.clip((-py - 0.005) / fp + 0.5, 0, 1)                 # soft "facing the viewer" mask
    if ctx.obj.name == "RaiderFill_tunic":
        # 1. clean donor tan trim that became blotchy gold after a recolour: recolour it to the cloth, keep the painted shading
        h, s, v = PL.hsv(cv.A)
        blotch = (R == TUNIC) & (h > 26) & (h < 62) & (s > 0.30) & (v > 0.45)
        PL.recolour(cv.A, PL.box_blur(blotch.astype(np.float32), 1) > 0.2, (66, 24, 38), (0.12, 0.26))
        # 2. piping down both chest edges and across the top (relief 1.2 mm), flagged as gold metal
        chest = (R == TUNIC) * front
        pipes = PL.cov_line(ax - 0.186, 0.0026, fp) * PL.cov_band(pz, 1.255, 1.60, fp) * chest
        top = PL.cov_line(pz - 1.262, 0.0022, fp) * PL.cov_band(ax, 0.0, 0.19, fp) * chest
        cv.paint(pipes, GOLD, 0.0012, True)
        cv.paint(top, GOLD, 0.0012, True)
        cv.cloth = (R == TUNIC).astype(np.float32)                  # twill only on cloth
        return {"weave": 0.035}
    if ctx.obj.name == "GurneyFill_coat":
        panel = (R == COAT) * front
        cv.paint(PL.cov_line(ax - 0.030, 0.0030, fp) * PL.cov_band(pz, 0.50, 1.02, fp) * panel, GOLD, 0.0013, True)   # coat opening
        cv.paint(PL.cov_line(pz - 0.515, 0.0030, fp) * (R == COAT), GOLD, 0.0013, True)                                # hem
        cv.paint(PL.cov_line(pz - 0.540, 0.0016, fp) * (R == COAT), GOLD_D, 0.0008, True)                              # fine second hem line
        cv.cloth = (R == COAT).astype(np.float32)
        return {"weave": 0.035}
    return None
