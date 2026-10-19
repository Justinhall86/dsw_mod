"""Remove the orange selection-outline fringe that leaks into the baked albedo at grazing angles.
Real gold trim in the reference tops out at saturation ~0.60 and is bright; the fringe is darker and more saturated
(0.62-0.75, luma < 0.5). Those pixels (and very dark, brown-tinted shadows) are pulled toward a neutral dark grey.
Usage: python v2_03_albedo_fringe_fix.py [Elite_Albedo.png]   (edits in place, keeps Elite_Albedo_before_fringe_fix.png)"""
import numpy as np, os, shutil, sys
from PIL import Image
p = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), '04_textures', 'v2_2048', 'Elite_Albedo.png')
bak = p.replace('.png', '_before_fringe_fix.png')
if not os.path.exists(bak): shutil.copy2(p, bak)
a = np.asarray(Image.open(bak).convert('RGB')).astype(np.float32) / 255
mx, mn = a.max(2), a.min(2); sat = np.where(mx > 1e-6, (mx - mn) / np.maximum(mx, 1e-6), 0)
luma = a @ np.array([0.30, 0.59, 0.11]); ordr = (a[..., 0] >= a[..., 1]) & (a[..., 1] >= a[..., 2])
w = np.clip((sat - 0.57) / 0.08, 0, 1) * np.clip((0.55 - luma) / 0.10, 0, 1)            # fringe: dark + very saturated
w = np.maximum(w, np.clip((sat - 0.38) / 0.12, 0, 1) * np.clip((0.26 - luma) / 0.08, 0, 1) * 0.8)   # near-black brown cast in shadows
w = w * ordr
grey = np.stack([luma * 0.97, luma * 0.98, luma * 1.05], -1)
out = a * (1 - w[..., None]) + grey * w[..., None]
Image.fromarray((np.clip(out, 0, 1) * 255).astype(np.uint8)).save(p)
print('fringe pixels changed:', int((w > 0.1).sum()), f'({100 * (w > 0.1).mean():.2f}%)')
