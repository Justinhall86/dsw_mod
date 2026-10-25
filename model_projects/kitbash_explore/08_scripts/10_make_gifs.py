"""Assemble the animation frames into one looping GIF per clip.

    python 10_make_gifs.py

Reads 02_progress_photos/09_anim_gif/frames/v3_<Clip>_f<NNN>.png (sorted by frame number), writes
02_progress_photos/09_anim_gif/v3_<Clip>.gif, and one combined v3_all_clips.gif with the clips back to back.
"""
import glob
import os
import re

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(os.path.dirname(HERE), "02_progress_photos", "09_anim_gif")
FRAMES = os.path.join(OUT, "frames")
DURATION = 80          # ms per frame (~12.5 fps)
CLIPS = ["Run", "AttackMelee01", "AttackRange", "FightIdle"]


def clip_frames(clip):
    files = glob.glob(os.path.join(FRAMES, "v3_%s_f*.png" % clip))
    files.sort(key=lambda p: int(re.search(r"_f(\d+)\.png$", p).group(1)))
    return [Image.open(f).convert("RGB") for f in files]


def save_gif(frames, path):
    frames[0].save(path, save_all=True, append_images=frames[1:], duration=DURATION, loop=0, optimize=True)
    print(path, len(frames), "frames", "%.2f MB" % (os.path.getsize(path) / 1e6))


all_frames = []
for c in CLIPS:
    fr = clip_frames(c)
    if not fr:
        print("no frames for", c)
        continue
    save_gif(fr, os.path.join(OUT, "v3_%s.gif" % c))
    all_frames += fr
if all_frames:
    save_gif(all_frames, os.path.join(OUT, "v3_all_clips.gif"))
