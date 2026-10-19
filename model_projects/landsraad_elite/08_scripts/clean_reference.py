"""Remove the Blender bone-display shapes and the orange selection outline from the reference render, then fill the holes
smoothly (push-pull pyramid inpaint, numpy only). Output: 04_textures/reference_cleaned.png, used as the projection source
when baking the albedo."""
import numpy as np, os, sys
from PIL import Image
P = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
a8 = np.asarray(Image.open(f'{P}/01_input/landsraad_elite.jpg').convert('RGB')).astype(np.int32)
a = a8.astype(np.float32) / 255.0
H, W, _ = a.shape
spread = a8.max(2) - a8.min(2); mx8 = a8.max(2)
bone = (spread <= 2) & (mx8 >= 118) & (mx8 <= 172)            # flat neutral light grey = bone display shapes (armor always has a blue tint, spread >= 5)
mx, mn = a.max(2), a.min(2); sat = np.where(mx > 1e-6, (mx - mn) / np.maximum(mx, 1e-6), 0)
orange = (a[..., 0] >= a[..., 1]) & (a[..., 1] >= a[..., 2]) & (a[..., 0] > 0.30) & (sat > 0.62)
def dilate(m, n):
    out = m.copy()
    for _ in range(n):
        o = out.copy(); o[1:] |= out[:-1]; o[:-1] |= out[1:]; o[:, 1:] |= out[:, :-1]; o[:, :-1] |= out[:, 1:]; out = o
    return out
core = ~dilate(~bone, 2)                                      # interiors of flat regions only (stray pixels are real detail)
bone_region = (dilate(core, 5) & bone) | core
bad = dilate(bone_region, 5) | dilate(orange, 7)              # grow over the dark outlines / anti-aliased rims
known = ~bad
def pushpull(img, known):
    """img (H,W,3), known (H,W) bool -> img with unknown pixels filled smoothly from the nearest known colours."""
    levels = []
    c, w = img * known[..., None], known.astype(np.float32)
    while min(c.shape[:2]) > 2:
        levels.append((c, w))
        h2, w2 = c.shape[0] // 2 * 2, c.shape[1] // 2 * 2
        c = c[:h2, :w2].reshape(h2 // 2, 2, w2 // 2, 2, 3).sum((1, 3)); w = w[:h2, :w2].reshape(h2 // 2, 2, w2 // 2, 2).sum((1, 3))
    levels.append((c, w))
    # pull: average colour per cell where any weight exists
    avg = [np.where(w[..., None] > 0, c / np.maximum(w[..., None], 1e-9), 0) for c, w in levels]
    filled = avg[-1]
    for lvl in range(len(levels) - 2, -1, -1):
        up = np.repeat(np.repeat(filled, 2, 0), 2, 1)
        h, wd = levels[lvl][0].shape[:2]
        up = np.pad(up, ((0, max(0, h - up.shape[0])), (0, max(0, wd - up.shape[1])), (0, 0)), mode='edge')[:h, :wd]
        has = levels[lvl][1][..., None] > 0
        filled = np.where(has, avg[lvl], up)
    return filled
out = pushpull(a, known)
def boxblur(x, r):
    k = 2 * r + 1; c = np.cumsum(np.pad(x, ((r + 1, r), (0, 0), (0, 0)), mode='edge'), 0); x = (c[k:] - c[:-k]) / k
    c = np.cumsum(np.pad(x, ((0, 0), (r + 1, r), (0, 0)), mode='edge'), 1); return (c[:, k:] - c[:, :-k]) / k
filled = np.where(known[..., None], a, out)
for _ in range(3): filled = np.where(known[..., None], a, boxblur(filled, 6))   # soften only the filled patches
res = filled
print('masked', f'{100 * bad.mean():.2f}%')
Image.fromarray((np.clip(res, 0, 1) * 255).astype(np.uint8)).save(f'{P}/04_textures/reference_cleaned.png')
if '--preview' in sys.argv:
    d = f'{P}/02_progress_photos/08_upscale'; os.makedirs(d, exist_ok=True)
    f = lambda x: x[220:1460, 40:1100]; b = lambda x: x[220:1460, 1010:1960]
    Image.fromarray((np.concatenate([f(a), f(res)], 1) * 255).astype(np.uint8)).resize((1060, 620)).save(f'{d}/00_reference_before_after_cleanup.png')
    Image.fromarray((np.concatenate([b(a), b(res)], 1) * 255).astype(np.uint8)).resize((1000, 654)).save(f'{d}/00_reference_back_before_after_cleanup.png')
