import numpy as np
D = r"C:\dsw_mod\extr\Character\Common\Landsraad"
def load(n):
    im = bpy.data.images.load(f"{D}\LandsraadGuard_{n}.png"); w, h = im.size
    return np.array(im.pixels[:]).reshape(h, w, 4), w, h
alb, w, h = load("Albedo"); mg, _, _ = load("MetallicGlossAO"); nm, _, _ = load("Normal")
print("size", w, h)
for name, (u, v) in dict(gold_trim=(0.2861, 0.7158), gunmetal=(0.9237, 0.7077)).items():
    x, y = int(u*w), int(v*h); sl = (slice(y-3, y+4), slice(x-3, x+4))
    print(f"{name:9s} albedo={alb[sl][..., :3].reshape(-1,3).mean(0).round(3)}  MGAO(rgb)={mg[sl][..., :3].reshape(-1,3).mean(0).round(3)}")
# overall statistics: which channel is bimodal (metal mask), which looks like AO
for i, ch in enumerate("RGB"):
    a = mg[..., i].ravel(); print(f"MGAO {ch}: mean {a.mean():.3f} min {a.min():.3f} max {a.max():.3f} frac>0.8 {(a>0.8).mean():.2f} frac<0.2 {(a<0.2).mean():.2f}")
# correlate each channel with albedo brightness
lum = alb[..., :3].mean(2).ravel()
for i, ch in enumerate("RGB"): print(f"corr(MGAO {ch}, albedo luminance) = {np.corrcoef(mg[..., i].ravel(), lum)[0,1]:.2f}")
print("normal map mean rgb", nm[..., :3].reshape(-1,3).mean(0).round(3), "(0.5,0.5,1 = tangent space)")
