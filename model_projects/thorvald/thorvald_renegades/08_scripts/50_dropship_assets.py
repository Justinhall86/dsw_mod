"""Renegade drop ship = the vanilla SpaceShuttle (same mesh, rig and landing clips) in a dark Renegade livery.

    py -3.14 50_dropship_assets.py

Why not the Ravager shuttle hull: ent.ShuttleSpawn's descent and lift-off are in the SpaceShuttle animation clips
(UnitSpawnArriving / UnitSpawnDrop / Leaving), so the carrier must use that rig. The HMD stores its texture paths as
length-prefixed strings; the albedo path is swapped for one of the SAME length in our folder, nothing else changes.
Output: ../06_game_ready/VehMOD/Renegade_DropShip/ (staged by mod_files/stage_and_pack.py).
"""
import json
import os
import shutil

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__)); PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
SRC = os.path.join(REPO, "model_inputs", "Vehicle", "Atreide", "SpaceShuttle")
OUT = os.path.join(PROJ, "06_game_ready", "VehMOD", "Renegade_DropShip"); os.makedirs(OUT, exist_ok=True)
OLD = b"Vehicle/Atreide/SpaceShuttle/SpaceShuttle_Albedo.png"
NEW = b"VehMOD/Renegade_DropShip/RenegadeDropShip_Albedo.png"
assert len(OLD) == len(NEW)

hmd = open(os.path.join(SRC, "SpaceShuttle.fbx"), "rb").read()
assert hmd[:3] == b"HMD" and hmd.count(OLD) == 1
open(os.path.join(OUT, "Renegade_DropShip.hmd"), "wb").write(hmd.replace(OLD, NEW))

im = Image.open(os.path.join(SRC, "SpaceShuttle_Albedo.png")).convert("RGBA")
a = np.asarray(im).astype(np.float32)
hsv = np.asarray(im.convert("RGB").convert("HSV")).astype(np.float32)
h, s, v = hsv[..., 0], hsv[..., 1], hsv[..., 2]
rgb = a[..., :3]
grey = rgb.mean(-1, keepdims=True)
out = grey * 0.55 * np.array([1.0, 0.97, 0.94])                       # hull: warm charcoal
panel = (s > 90) & (h > 60) & (h < 120)                                # the green livery panels -> oxblood
out[panel] = (v[panel, None] / 255.0) * np.array([150, 34, 28]) * 1.15
glass = (s > 25) & (h > 120) & (h < 180)                               # canopy / lights: keep, a little darker
out[glass] = rgb[glass] * 0.8
res = np.dstack([out.clip(0, 255), a[..., 3]]).astype(np.uint8)
Image.fromarray(res, "RGBA").save(os.path.join(OUT, "RenegadeDropShip_Albedo.png"))
print("panel px", int(panel.sum()), "glass px", int(glass.sum()))

# The vanilla HMD's Mat_Reactor points at a misspelt folder (Vehicle/Atreide/SapceShuttle/Reactor_albedo.png). The engine then falls back to
# the file of that name beside the HMD. Without this copy every drop ship throws on spawn and the Renegade drop timer never resets (2026-11-18).
shutil.copy2(os.path.join(SRC, "Reactor_albedo.png"), OUT)
shutil.copy2(os.path.join(SRC, "materials.props"), OUT)
shutil.copy2(os.path.join(SRC, "props.json"), OUT)                    # hmd.animPaths -> /Anim/SpaceShuttle (vanilla clips)
json.dump({"type": "prefab", "children": [{"type": "model", "name": "Renegade_DropShip",
                                            "source": "VehMOD/Renegade_DropShip/Renegade_DropShip.hmd"}]},
          open(os.path.join(OUT, "Prefab_Renegade_DropShip.prefab"), "w"), indent="\t")
print("OK", OUT, os.listdir(OUT))
