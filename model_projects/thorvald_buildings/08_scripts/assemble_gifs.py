"""Turn the turntable frames build.py wrote (/tmp/tb_frames/<Name>/frame_*.png) into 02_progress_photos/<Name>_turntable.gif.

    python3 assemble_gifs.py [Name ...]
One global palette per GIF (per-frame palettes shimmer), 24 frames at 80 ms.
"""
import glob
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
FR = os.path.join(os.environ.get("TB_FRAMES", "/tmp"), "tb_frames")
names = sys.argv[1:] or sorted(os.listdir(FR))
for n in names:
    paths = sorted(glob.glob(os.path.join(FR, n, "frame_*.png")))
    if len(paths) != 24:
        print("SKIP", n, len(paths), "frames")
        continue
    fr = [Image.open(p).convert("RGB") for p in paths]
    w, h = fr[0].size
    sheet = Image.new("RGB", (w * 4, h))
    for i, f in enumerate(fr[::6][:4]):
        sheet.paste(f, (i * w, 0))
    ref = sheet.quantize(colors=256, method=Image.Quantize.MEDIANCUT)
    q = [f.quantize(palette=ref) for f in fr]
    out = os.path.join(PROJ, "02_progress_photos", n + "_turntable.gif")
    q[0].save(out, save_all=True, append_images=q[1:], duration=80, loop=0, optimize=False)
    print("GIF", out, os.path.getsize(out) // 1024, "KB")
