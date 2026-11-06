"""Build House Thorvald's councillor portraits and agent portraits from the supplied concept art.

    python 10_make_portraits.py            # writes 04_textures/ + progress sheets, and stages the PNGs in the editor res tree

Councillor order (= faction.characters.councilors order): Nobru, Ein, Silva, Haruka.
  Nobru, Silva, Haruka  <- house_thorvald/images/councillors_banner_portraits.jpg (the named banner busts)
  Ein                   <- house_thorvald/images/council_male_military_cape.jpg   (the "military" candidate)
Agents (the other candidates + the banner's Jool bust, which is no longer a councillor), 7 heads:
  A1 Jool bust, A2 robe/gold pattern, A3 black-copper jacket, A4 dark coat + gold chain, A5 grey beard + sword (M)
  A6 blue coat, A7 black abaya (F)

Outputs (all NEW files, no vanilla atlas is touched):
  UI/Faction/Menu/menuCouncilorsThorvald.png  4 x 336x624   (character.images.menuGfx)
  UI/Faction/Menu/councillorsThorvald.png     4 x 180x320   (character.images.tutoGfx)
  UI/Faction/councillors_thorvald.png         4 x 128x128   (character.gfx and the passive trait icon)
  UI/spying/agents/agents_thorvald.png        5x2 of 80x80  (agent.gfx)
  UI/spying/agents/agents_thorvald_big.png    5x2 of 240x240 (agent.largeGfx)
"""
import os
import shutil
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from portrait_lib import cutout, crop_aspect, load, over, sharpen  # noqa: E402

PROJ = os.path.dirname(HERE)
REPO = os.path.dirname(os.path.dirname(os.path.dirname(PROJ)))
IMG = os.path.join(REPO, "house_thorvald", "images")
OUT = os.path.join(PROJ, "04_textures")
PHOTO = os.path.join(PROJ, "02_progress_photos", "01_portraits")
RES = r"C:\dsw_mod\D4XEditor\res\res"
for d in (OUT, PHOTO):
    os.makedirs(d, exist_ok=True)

MENU = (336, 624)
TUTO = (180, 320)
ICON = 128
AG_BIG, AG_SMALL = 240, 80


def banner(name):
    return load(os.path.join(IMG, name))


def rgba_resize(im, size):
    return sharpen(im.resize(size, Image.LANCZOS), 0.5, 1.0)


# ------------------------------------------------------------------ councillors
def banner_bust(img, cx, width, top, aspect):
    c = crop_aspect(img, cx, top, width, aspect)
    W, H = c.size
    return cutout(c, (0, 4, W, H), sure_fg=[(int(W * .3), int(H * .35), int(W * .7), H)], bg_tol=20)


def make_council():
    bn = banner("councillors_banner_portraits.jpg")
    # (cx, width, top) in banner pixels; panel widths exclude the divider lines
    panels = {"Nobru": (738, 214, 466), "Silva": (323, 198, 453), "Haruka": (527, 194, 466)}
    menu, tuto, icon = {}, {}, {}
    for k, (cx, w, top) in panels.items():
        menu[k] = banner_bust(bn, cx, w, top, MENU[0] / MENU[1])
        tuto[k] = banner_bust(bn, cx, w, top, TUTO[0] / TUTO[1])
        # icon: head and collar square
        sq = crop_aspect(bn, cx, top - 6, w - 20, 1.0)
        W, H = sq.size
        icon[k] = cutout(sq, (0, 3, W, H), sure_fg=[(int(W * .3), int(H * .3), int(W * .7), H)], bg_tol=20)
    # Ein from the military-cape figure (1296x1776): head centred x 640, top of hair y 100
    cape = banner("council_male_military_cape.jpg")

    def ein(aspect, width=340, top=64):
        c = crop_aspect(cape, 640, top, width, aspect)
        W, H = c.size
        return cutout(c, (0, 4, W, H), sure_fg=[(int(W * .3), int(H * .3), int(W * .7), H)], bg_tol=22)
    menu["Ein"], tuto["Ein"] = ein(MENU[0] / MENU[1]), ein(TUTO[0] / TUTO[1])
    sq = crop_aspect(cape, 640, 70, 330, 1.0)
    W, H = sq.size
    icon["Ein"] = cutout(sq, (0, 3, W, H), sure_fg=[(int(W * .3), int(H * .3), int(W * .7), H)], bg_tol=22)

    order = ["Nobru", "Ein", "Silva", "Haruka"]
    m = Image.new("RGBA", (MENU[0] * 4, MENU[1]), (0, 0, 0, 0))
    t = Image.new("RGBA", (TUTO[0] * 4, TUTO[1]), (0, 0, 0, 0))
    ic = Image.new("RGBA", (ICON * 4, ICON), (0, 0, 0, 0))
    for i, k in enumerate(order):
        m.paste(rgba_resize(menu[k], MENU), (i * MENU[0], 0))
        t.paste(rgba_resize(tuto[k], TUTO), (i * TUTO[0], 0))
        # icons are opaque squares in vanilla: flatten on the backdrop colour
        flat = over(icon[k].resize((ICON, ICON), Image.LANCZOS), (34, 32, 34))
        ic.paste(flat.convert("RGBA"), (i * ICON, 0))
    return m, t, ic


# ------------------------------------------------------------------ agents
def make_agents():
    bn = banner("councillors_banner_portraits.jpg")
    jobs = []  # (image, cx, top, side)
    jool = bn.crop((0, 466, 214, 680))
    jobs.append(("jool", jool, 107, 0, 214))
    for key, f, cx, top, side in [
        ("robe", "council_male_robe_gold_pattern.jpg", 910, 60, 480),
        ("jacket", "council_male_black_copper_jacket.jpg", 630, 40, 400),
        ("chain", "council_male_dark_coat_gold_chain.png", 315, 28, 350),
        ("sword", "council_male_grey_beard_sword.png", 360, 320, 560),
        ("blue", "council_female_blue_coat.jpg", 1118, 112, 440),
        ("abaya", "council_female_black_abaya.jpg", 895, 90, 500),
    ]:
        jobs.append((key, load(os.path.join(IMG, f)), cx, top, side))
    big = Image.new("RGBA", (AG_BIG * 5, AG_BIG * 2), (0, 0, 0, 0))
    small = Image.new("RGBA", (AG_SMALL * 5, AG_SMALL * 2), (0, 0, 0, 0))
    cells = []
    for i, (key, im, cx, top, side) in enumerate(jobs):
        if key == "jool":
            c = im
        else:
            x0 = int(cx - side / 2)
            c = im.crop((x0, top, x0 + side, top + side))
        W, H = c.size
        r = cutout(c, (0, 3, W, H), sure_fg=[(int(W * .4), int(H * .3), int(W * .6), int(H * .75))], bg_tol=24, iters=8)
        b = rgba_resize(r, (AG_BIG, AG_BIG))
        s = rgba_resize(r, (AG_SMALL, AG_SMALL))
        col, row = i % 5, i // 5
        big.paste(b, (col * AG_BIG, row * AG_BIG))
        small.paste(s, (col * AG_SMALL, row * AG_SMALL))
        cells.append((key, col, row))
    return big, small, cells


def save(img, rel):
    p = os.path.join(OUT, rel.replace("/", os.sep))
    os.makedirs(os.path.dirname(p), exist_ok=True)
    img.save(p)
    q = os.path.join(RES, "UI", rel.replace("/", os.sep))
    os.makedirs(os.path.dirname(q), exist_ok=True)
    shutil.copy2(p, q)
    print("wrote", p, img.size, "-> staged", q)


if __name__ == "__main__":
    m, t, ic = make_council()
    save(m, "Faction/Menu/menuCouncilorsThorvald.png")
    save(t, "Faction/Menu/councillorsThorvald.png")
    save(ic, "Faction/councillors_thorvald.png")
    big, small, cells = make_agents()
    save(big, "spying/agents/agents_thorvald_big.png")
    save(small, "spying/agents/agents_thorvald.png")
    print("agent cells:", cells)
    over(m, (66, 60, 62)).save(os.path.join(PHOTO, "council_menu_row.png"))
    over(t, (66, 60, 62)).save(os.path.join(PHOTO, "council_tuto_row.png"))
    over(big, (66, 60, 62)).save(os.path.join(PHOTO, "agents_big.png"))
