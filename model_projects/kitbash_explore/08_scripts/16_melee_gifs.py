"""Assemble the melee gallery frames into one looping GIF per weapon.

    python -I 16_melee_gifs.py [Weapon ...]     (no names = every weapon folder)

Reads 02_progress_photos/11_melee_weapons/<Weapon>/<Clip>/f<NNN>.png (15_melee_gallery.py writes them) and
writes 02_progress_photos/11_melee_weapons/<Weapon>_attacks.gif: AttackMelee01, AttackMelee02, AttackMelee03
back to back, frames in frame-number order.
"""
import glob
import os
import re
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(os.path.dirname(HERE), "02_progress_photos", "11_melee_weapons")
CLIPS = ["Duncan_AttackMelee01", "Duncan_AttackMelee02", "Common_AttackMelee03"]
DURATION = 80  # ms per frame, the same timing as the earlier Ginaz GIFs


def clip_frames(weapon_dir, clip):
    files = glob.glob(os.path.join(weapon_dir, clip, "f*.png"))
    files.sort(key=lambda p: int(re.search(r"f(\d+)\.png$", p).group(1)))
    return [Image.open(f).convert("RGB") for f in files]


weapons = sys.argv[1:] or sorted(d for d in os.listdir(OUT)
                                 if os.path.isdir(os.path.join(OUT, d)) and d != "check")
for weapon in weapons:
    frames = []
    for clip in CLIPS:
        frames += clip_frames(os.path.join(OUT, weapon), clip)
    if not frames:
        print("no frames for", weapon)
        continue
    path = os.path.join(OUT, weapon + "_attacks.gif")
    frames[0].save(path, save_all=True, append_images=frames[1:], duration=DURATION, loop=0, optimize=True)
    print(path, len(frames), "frames", "%.2f MB" % (os.path.getsize(path) / 1e6))
