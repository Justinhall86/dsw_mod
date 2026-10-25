import sys
import glob
from PIL import Image

frames_dir, out_gif = sys.argv[1], sys.argv[2]
paths = sorted(glob.glob(frames_dir + "/frame_*.png"))
imgs = [Image.open(p).convert("RGB") for p in paths]
imgs[0].save(out_gif, save_all=True, append_images=imgs[1:], duration=80, loop=0)
print("gif", out_gif, len(imgs), "frames")
