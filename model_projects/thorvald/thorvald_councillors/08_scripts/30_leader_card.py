"""Earl Memnon Thorvald's faction-select card portrait, cut from the user's mock-up
house_thorvald/images/faction_screen_thorvald.jpg (the only Memnon art), framed like the vanilla card portraits
(UI/menu/<Faction>/box_portrait.png: 700 x 1700 RGBA, transparent above the head, hair top at y~270, chin at y~640).

    python 30_leader_card.py  ->  04_textures/menu/Thorvald/box_portrait.png  (+ a preview next to Corrino's)

Mock-up measurements (1376 x 768): hair top y 45, chin y 195, face centre x 1035, UI frame line y ~16, nameplate from y ~570.
The frame line is faded to transparent at the top; the nameplate is faded to black at the bottom (the card darkens there).
"""
import os
import sys

from PIL import Image, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
SRC = os.path.join(REPO, "house_thorvald", "images", "faction_screen_thorvald.jpg")
OUT = os.path.join(PROJ, "04_textures", "menu", "Thorvald", "box_portrait.png")

W, H = 700, 1700
HAIR, CHIN, CX = 45.0, 195.0, 1035.0          # mock-up
V_HAIR, V_CHIN = 270.0, 640.0                  # vanilla card
s = (V_CHIN - V_HAIR) / (CHIN - HAIR)
src = Image.open(SRC).convert("RGB")
x0 = CX - W / 2 / s
y0 = HAIR - V_HAIR / s
box = (x0, y0, x0 + W / s, y0 + H / s)
img = src.transform((W, H), Image.EXTENT, box, Image.BICUBIC)
img = img.filter(ImageFilter.UnsharpMask(radius=2, percent=60, threshold=2)).convert("RGBA")
px = img.load()
TOP0, TOP1 = 22.0, 40.0                        # mock-up y: fully clear above TOP0, opaque from TOP1 (hair starts at 45)
BOT0, BOT1 = 520.0, 566.0                      # mock-up y: fade to black before the nameplate
for Y in range(H):
    my = y0 + (Y + 0.5) / s
    a = min(max((my - TOP0) / (TOP1 - TOP0), 0.0), 1.0)
    d = 1.0 - min(max((my - BOT0) / (BOT1 - BOT0), 0.0), 1.0)
    if a == 1.0 and d == 1.0:
        continue
    for X in range(W):
        r, g, b, _ = px[X, Y]
        px[X, Y] = (int(r * d), int(g * d), int(b * d), int(255 * a))
os.makedirs(os.path.dirname(OUT), exist_ok=True)
img.save(OUT)
print("saved", OUT, img.size, "scale %.2f, mock-up box %s" % (s, tuple(round(v) for v in box)))

if len(sys.argv) > 1:                          # preview next to a vanilla portrait: 30_leader_card.py <corrino png> <out>
    ref = Image.open(sys.argv[1]).convert("RGBA")
    sheet = Image.new("RGBA", (W * 2 + 40, H), (40, 34, 38, 255))
    sheet.alpha_composite(ref, (0, 0))
    sheet.alpha_composite(img, (W + 40, 0))
    sheet.convert("RGB").resize(((W * 2 + 40) // 2, H // 2)).save(sys.argv[2])
    print("preview", sys.argv[2])
