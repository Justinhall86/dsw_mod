import os
import sys

import bpy
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import polish_lib as PL  # noqa: E402

for mat in bpy.data.materials:
    if not mat.use_nodes or mat.name == "Mat_GinazGold":
        continue
    a, m, n = PL.material_images(mat)
    print("MAT", mat.name, "alb", a and a.image.name, a and a.image.colorspace_settings.name, "| mg", m and m.image.name, m and m.image.colorspace_settings.name, "| nrm", n and n.image.name, n and n.image.colorspace_settings.name)
    for tag, nd in (("A", a), ("M", m), ("N", n)):
        if nd is not None and nd.image is not None:
            arr = PL.img_to_array(nd.image)
            print("   ", tag, nd.image.size[:], "mean rgb", np.round(arr[..., :3].reshape(-1, 3).mean(0), 3), "alpha", round(float(arr[..., 3].mean()), 3))
