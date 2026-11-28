"""Assemble the per-ship sheets, the lineups and the table image from 10_render.py output (Pillow only).
    python 20_sheets.py <render dir> <stats.json> <gallery out dir>
"""
import json, os, sys, shutil
from PIL import Image, ImageDraw, ImageFont
src, stats_p, out = sys.argv[1], sys.argv[2], sys.argv[3]
V = os.path.join(src, 'views')
os.makedirs(os.path.join(out, 'views'), exist_ok=True)
ST = json.load(open(stats_p))
F = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'; FB = '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf'
def font(n, b=False): return ImageFont.truetype(FB if b else F, n)
BG = (236, 236, 238); INK = (30, 30, 34); MUTE = (95, 95, 105)
ORDER = ['Kraken', 'Overlord', 'Chronos', 'Wraith', 'Altar', 'Monument', 'FolderRelay', 'Thorvald']
NAME = {'Kraken': ('Kraken', 'Atreides'), 'Overlord': ('Overlord', 'Harkonnen'), 'Chronos': ('Cronos', 'Corrino'),
        'Wraith': ('Wraith', 'Smugglers'), 'Altar': ('Altar', 'Fremen'), 'Monument': ('Monument of Eternal Grace', 'Ecaz'),
        'FolderRelay': ('Folder Relay', 'Vernius'), 'Thorvald': ('Thorvald cruiser (current mod)', 'Thorvald')}
PX_PER_M = 1000 / 20.0     # per-ship views: 20 m across 1000 px


def size_game(k):
    s = ST[k]['size_raw']; f = ST[k]['cdb_scale']
    return [round(x * f, 1) for x in s]


def scalebar(d, x, y, metres, ppm, label=None):
    w = int(metres * ppm)
    d.rectangle([x, y, x + w, y + 8], fill=INK)
    for i in range(metres + 1):
        d.line([x + int(i * ppm), y - 4, x + int(i * ppm), y + 12], fill=INK, width=1)
    d.text((x, y + 16), label or f'{metres} m (in-game size)', font=font(22), fill=INK)


for k in ORDER:
    for v in ('tq', 'tq_rear', 'top', 'rts'):
        shutil.copy(os.path.join(V, f'{k}_{v}.png'), os.path.join(out, 'views', f'{k}_{v}.png'))
    nm, fac = NAME[k]; st = ST[k]; gs = size_game(k)
    W, Hh = 2000, 100
    sheet = Image.new('RGB', (W, Hh + 700 + 1000), BG); d = ImageDraw.Draw(sheet)
    d.text((24, 14), f'{nm}', font=font(40, True), fill=INK)
    d.text((24, 62), f'{fac}  ·  unit {st["model_row"].upper() if k=="Thorvald" else st["model_row"]}  ·  in-game {gs[1]} m long × {gs[0]} m wide × {gs[2]} m tall  ·  all views at one fixed scale (20 m across a view)',
           font=font(22), fill=MUTE)
    sheet.paste(Image.open(os.path.join(V, f'{k}_tq.png')).convert('RGB'), (0, Hh))
    sheet.paste(Image.open(os.path.join(V, f'{k}_tq_rear.png')).convert('RGB'), (1000, Hh))
    sheet.paste(Image.open(os.path.join(V, f'{k}_top.png')).convert('RGB'), (0, Hh + 700))
    d.text((14, Hh + 8), '3/4 front', font=font(24, True), fill=INK)
    d.text((1014, Hh + 8), '3/4 rear', font=font(24, True), fill=INK)
    d.text((14, Hh + 708), 'top (nose down)', font=font(24, True), fill=INK)
    scalebar(d, 30, Hh + 700 + 930, 5, PX_PER_M)
    # right panel: thumbnail at native size + facts
    x0, y0 = 1040, Hh + 730
    d.text((x0, y0), 'RTS-distance thumbnail (native 420 × 300 px)', font=font(24, True), fill=INK)
    th = Image.open(os.path.join(V, f'{k}_rts.png')).convert('RGB')
    sheet.paste(th, (x0, y0 + 40)); d.rectangle([x0 - 1, y0 + 39, x0 + 420, y0 + 340], outline=MUTE)
    facts = [f'mesh   {st["mesh"]}', f'HMD model   {", ".join(st["hmd_models"])}',
             f'triangles   {st["tris"]:,}', f'materials   {len(st["materials"])}  ({", ".join(st["materials"])})',
             f'textures   {len(st["textures"])}  (' + ', '.join(sorted({v[0] + " px" for v in st["textures"].values()})) + ')',
             f'mesh bbox   {st["size_raw"][1]} × {st["size_raw"][0]} × {st["size_raw"][2]} (L × W × H, mesh units)',
             f'cdb model scale   × {st["cdb_scale"]}   (rig {st["rig"]}, anims {st["inherit"]})',
             'team-colour mask   none (colours are painted into the albedo)']
    yy = y0 + 370
    for line in facts:
        for i in range(0, len(line), 70):
            d.text((x0, yy), line[i:i + 70], font=font(21), fill=INK); yy += 30
    sheet.save(os.path.join(out, f'{ORDER.index(k)+1:02d}_{k}_sheet.png'), optimize=True)
    print('sheet', k)

# --- top-down lineup, one scene, one camera
lj = json.load(open(os.path.join(V, 'LINEUP_top.json')))
img = Image.open(os.path.join(V, 'LINEUP_top.png')).convert('RGB')
ppm = lj['px'][0] / lj['ortho_m']; cx, cy = lj['cam_centre']
T = 110
L = Image.new('RGB', (img.width, img.height + T + 60), BG); L.paste(img, (0, T)); d = ImageDraw.Draw(L)
d.text((24, 14), 'Frigates, top-down, one scene and one camera (true relative size in game)', font=font(36, True), fill=INK)
d.text((24, 64), 'Mesh × the data.cdb model scale. Nose points down. Grid pitch 19 m × 22 m.', font=font(22), fill=MUTE)
for key, x, y in lj['placed']:
    px = (x - cx) * ppm + img.width / 2; py = img.height / 2 - (y - cy) * ppm + T
    nm = NAME[key][0].replace(' of Eternal Grace', '').replace(' (current mod)', '')
    t = f'{nm} · {NAME[key][1]}'
    w = d.textlength(t, font=font(24, True))
    d.text((px - w / 2, py + 10.2 * ppm), t, font=font(24, True), fill=INK)
scalebar(d, 30, img.height + T + 8, 10, ppm, '10 m')
L.save(os.path.join(out, '00_LINEUP_top.png'), optimize=True)
shutil.copy(os.path.join(V, 'LINEUP_top.png'), os.path.join(out, 'views', 'LINEUP_top_raw.png'))

# --- 3/4 lineup from the per-ship views (all at the same 20 m framing, so sizes compare)
C = Image.new('RGB', (2000, 110 + 2 * (350 + 40)), BG); d = ImageDraw.Draw(C)
d.text((24, 14), 'Frigates, 3/4 front view, same scale', font=font(36, True), fill=INK)
d.text((24, 64), 'Each tile is 20 m across, same camera angle and lighting.', font=font(22), fill=MUTE)
for i, k in enumerate(ORDER):
    t = Image.open(os.path.join(V, f'{k}_tq.png')).convert('RGB').resize((500, 350), Image.LANCZOS)
    x, y = (i % 4) * 500, 110 + (i // 4) * 390
    C.paste(t, (x, y)); d.text((x + 12, y + 352), NAME[k][0].replace(' of Eternal Grace', '').replace(' (current mod)', '') + ' · ' + NAME[k][1], font=font(22, True), fill=INK)
C.save(os.path.join(out, '00_LINEUP_tq.png'), optimize=True)

# --- table image
cols = ['Ship', 'Unit / model row', 'Mesh path', 'In-game L×W×H (m)', 'Tris', 'Mats', 'Tex', 'Tint mask', 'cdb scale']
rows = []
for k in ORDER:
    st = ST[k]; gs = size_game(k)
    rows.append([NAME[k][0].replace(' of Eternal Grace', '').replace(' (current mod)', ''), st['model_row'], st['mesh'],
                 f'{gs[1]} × {gs[0]} × {gs[2]}', f'{st["tris"]:,}', str(len(st['materials'])), str(len(st['textures'])), 'no', f'×{st["cdb_scale"]}'])
cw = [190, 190, 700, 230, 90, 70, 60, 120, 120]
TB = Image.new('RGB', (sum(cw) + 30, 90 + 46 * (len(rows) + 1) + 70), BG); d = ImageDraw.Draw(TB)
d.text((15, 14), 'Frigate data (vanilla rows from data_vanilla_2026-11-09.cdb; Thorvald from the working data.cdb)', font=font(26, True), fill=INK)
y = 70
for r, row in enumerate([cols] + rows):
    x = 15
    if r % 2 == 1: d.rectangle([10, y - 4, sum(cw) + 20, y + 38], fill=(226, 226, 230))
    for c, val in enumerate(row):
        f = font(19, r == 0 or c == 0)
        while d.textlength(val, font=f) > cw[c] - 10 and len(val) > 4: val = val[:-2] + '…' if not val.endswith('…') else val[:-2] + '…'
        d.text((x, y), val, font=f, fill=INK); x += cw[c]
    y += 46
d.text((15, y + 6), 'L = nose to tail. Mesh bounding box after the rig and prefab rotation, times the cdb model scale.', font=font(19), fill=MUTE)
TB.save(os.path.join(out, '00_TABLE.png'), optimize=True)
print('done')
