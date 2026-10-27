import os
import glob
import numpy as np
from PIL import Image

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\thorvald_vehicles"

print("--- textures (recoloured) ---")
for f in sorted(glob.glob(os.path.join(PROJ, "04_textures", "*", "*.png"))):
    a = np.asarray(Image.open(f).convert("RGB")).astype(np.float32)
    v = a.max(-1)
    print("%-9s %-34s p50=%3d p95=%3d p99=%3d max=%3d" % (
        os.path.basename(os.path.dirname(f)), os.path.basename(f),
        np.percentile(v, 50), np.percentile(v, 95), np.percentile(v, 99), v.max()))

print("--- renders (non-background pixels) ---")
for f in sorted(glob.glob(os.path.join(PROJ, "02_progress_photos", "*", "*_tq.png"))):
    a = np.asarray(Image.open(f).convert("RGB")).astype(np.float32)
    bg = (a > 245).all(-1)
    m = a[~bg]
    if len(m) == 0:
        continue
    v = m.max(-1)
    print("%-9s model_frac=%.3f mean=%6.1f p50=%3d p95=%3d" % (
        os.path.basename(os.path.dirname(f)), (~bg).mean(),
        v.mean(), np.percentile(v, 50), np.percentile(v, 95)))
