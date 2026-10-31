"""v6: frame folders (from v6_05_gif_frames.py) -> one looping GIF per clip (system python + Pillow).

  python 08_scripts/v6_06_gif_from_frames.py [--every 2] [--fps 15]

Every Nth frame is kept (game clips run at 30 fps; 2 = 15 fps keeps the files small). Each GIF is cropped to
the figure's bounding box so the frame is tight and the file stays readable.
"""
import argparse
import glob
import os

from PIL import Image, ImageChops

ap = argparse.ArgumentParser()
ap.add_argument("--every", type=int, default=2)
ap.add_argument("--fps", type=float, default=15)
a = ap.parse_args()
ROOT = r"C:\Users\justi\Python\dsw_mod\model_projects\landsraad_elite\02_progress_photos\21_gifs"
for d in sorted(p for p in glob.glob(os.path.join(ROOT, "*")) if os.path.isdir(p)):
    files = sorted(glob.glob(os.path.join(d, "f*.png")))[:: a.every]
    if not files:
        continue
    frames = [Image.open(f).convert("RGB") for f in files]
    bg = Image.new("RGB", frames[0].size, frames[0].getpixel((0, 0)))
    box = None
    for fr in frames:
        b = ImageChops.difference(fr, bg).getbbox()
        if b:
            box = b if box is None else (min(box[0], b[0]), min(box[1], b[1]), max(box[2], b[2]), max(box[3], b[3]))
    if box:
        pad = 8
        box = (max(0, box[0] - pad), max(0, box[1] - pad), min(frames[0].width, box[2] + pad), min(frames[0].height, box[3] + pad))
        frames = [fr.crop(box) for fr in frames]
    pal = [fr.quantize(colors=128, method=Image.Quantize.MEDIANCUT) for fr in frames]
    out = os.path.join(ROOT, os.path.basename(d) + ".gif")
    pal[0].save(out, save_all=True, append_images=pal[1:], duration=int(1000 / a.fps), loop=0, optimize=True)
    print("GIF", out, len(frames), "frames", os.path.getsize(out) // 1024, "KB")
