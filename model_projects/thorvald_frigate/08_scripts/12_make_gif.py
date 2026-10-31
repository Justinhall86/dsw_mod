"""Assemble a turntable PNG sequence into an optimised looping GIF."""
import os
import sys
from PIL import Image

SRC = sys.argv[1]
OUT = sys.argv[2]
DELAY = int(sys.argv[3]) if len(sys.argv) > 3 else 60
MAXW = int(sys.argv[4]) if len(sys.argv) > 4 else 0

names = sorted(f for f in os.listdir(SRC) if f.startswith("f") and f.endswith(".png"))
if not names:
    raise SystemExit("no frames in " + SRC)
frames = [Image.open(os.path.join(SRC, n)).convert("RGB") for n in names]
if MAXW and frames[0].width > MAXW:
    h = round(frames[0].height * MAXW / frames[0].width)
    frames = [f.resize((MAXW, h), Image.LANCZOS) for f in frames]
pal = frames[0].quantize(colors=255, method=Image.MEDIANCUT, dither=Image.NONE)
pframe = [f.quantize(palette=pal, dither=Image.NONE) for f in frames]
pframe[0].save(OUT, save_all=True, append_images=pframe[1:], duration=DELAY,
               loop=0, optimize=True, disposal=1)
print("GIF %s frames=%d bytes=%d" % (OUT, len(pframe), os.path.getsize(OUT)))
