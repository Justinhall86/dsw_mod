"""Survey several donors and tile their grid sheets into one montage.
    python 23_survey_many.py <outdir> donor1 donor2 ...
Extra donor keys (dronebase, dronecanon, kuloncannon, ravshuttle) are registered in 20_build_variant.DONORS."""
import os, subprocess, sys
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
BLENDER = r"D:\Blender Foundation\Blender 5.2\blender.exe"
out = os.path.abspath(sys.argv[1]); keys = sys.argv[2:]
ims = []
for k in keys:
    d = os.path.join(out, k)
    subprocess.run([BLENDER, "-b", "--factory-startup", "--python", os.path.join(HERE, "30_grid_survey.py"),
                    "--", k, d, "--px", "520"], capture_output=True)
    subprocess.run([sys.executable, os.path.join(HERE, "31_grid_overlay.py"), d, k, "0.5"], capture_output=True)
    g = os.path.join(d, k + "_grid.png")
    if os.path.exists(g):
        ims.append(Image.open(g).convert("RGB"))
    else:
        print("no grid for", k)
w, h = ims[0].size
rows = (len(ims) + 1) // 2
m = Image.new("RGB", (w * 2, h * rows), "white")
for i, im in enumerate(ims):
    m.paste(im.resize((w, h)), ((i % 2) * w, (i // 2) * h))
p = os.path.join(out, "MONTAGE_" + "_".join(keys[:2]) + ".png")
m.save(p); print(p, m.size)
