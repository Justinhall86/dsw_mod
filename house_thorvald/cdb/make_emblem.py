"""Draw the House Thorvald emblem: a gear ring with a star inside it (art_direction.md, "Emblem (canon)").

    python make_emblem.py

Writes, relative to house_thorvald/:
    images/emblem_gear_star.png                  512 px master, transparent background
    pak_assets/UI/Faction/ThorvaldEmblem.png     64 px, the file data.cdb points faction.images.emblem at
Drawn at 4x and downsampled so the teeth and the star stay crisp at 64 px.
"""
import math
import os

from PIL import Image, ImageDraw

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

BURNT_ORANGE = (0xCC, 0x55, 0x00)    # the faction colour
DARK_ORANGE = (0x7A, 0x32, 0x00)     # edge/shade on the gear
DISC = (0x23, 0x20, 0x1C)            # gunmetal black, the disc behind the star
STAR = (0xE0, 0x8A, 0x3C)            # copper-bronze star

S = 2048
C = S / 2


def polar(r, a):
    return (C + r * math.cos(a), C + r * math.sin(a))


def star_points(r_out, r_in, rot):
    return [polar(r_out if i % 2 == 0 else r_in, rot + i * math.pi / 5) for i in range(10)]


def gear_points(r_root, r_tip, teeth):
    """Trapezoid teeth: wide at the root, narrower at the tip."""
    pts = []
    step = 2 * math.pi / teeth
    for i in range(teeth):
        a = i * step - math.pi / 2
        for da, r in ((-0.30, r_root), (-0.17, r_tip), (0.17, r_tip), (0.30, r_root)):
            pts.append(polar(r, a + da * step * 1.5))
    return pts


img = Image.new("RGBA", (S, S), (0, 0, 0, 0))
d = ImageDraw.Draw(img)

d.polygon(gear_points(0.78 * C, 0.98 * C, 12), fill=DARK_ORANGE)            # gear edge/shade
d.polygon(gear_points(0.78 * C, 0.93 * C, 12), fill=BURNT_ORANGE)           # gear face
d.ellipse([C - 0.80 * C, C - 0.80 * C, C + 0.80 * C, C + 0.80 * C], fill=BURNT_ORANGE)
d.ellipse([C - 0.60 * C, C - 0.60 * C, C + 0.60 * C, C + 0.60 * C], fill=DARK_ORANGE)   # ring groove
d.ellipse([C - 0.56 * C, C - 0.56 * C, C + 0.56 * C, C + 0.56 * C], fill=DISC)          # dark disc
rot = -math.pi / 2                                                                       # point up
d.polygon(star_points(0.46 * C, 0.19 * C, rot), fill=STAR)
d.polygon(star_points(0.20 * C, 0.08 * C, rot + math.pi / 5 * 0), fill=DISC)             # inset, as on the banner

os.makedirs(os.path.join(ROOT, "pak_assets", "UI", "Faction"), exist_ok=True)
img.resize((512, 512), Image.LANCZOS).save(os.path.join(ROOT, "images", "emblem_gear_star.png"))
img.resize((64, 64), Image.LANCZOS).save(os.path.join(ROOT, "pak_assets", "UI", "Faction", "ThorvaldEmblem.png"))
print("wrote images/emblem_gear_star.png (512) and pak_assets/UI/Faction/ThorvaldEmblem.png (64)")
