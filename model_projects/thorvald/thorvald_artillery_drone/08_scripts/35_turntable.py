"""Turntable GIF of a painted drone variant, flying or deployed (36 frames, 60 ms, one global palette).

    blender -b --factory-startup --python 35_turntable.py -- <variant> <fly|dep> <out.gif> [--px 480] [--squad]

The drone turns, the camera and light stay (frame 0 faces the drone's front, like the vehicle-preview turntables).
"""
import math
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import drone_scene as ds  # noqa: E402

from PIL import Image  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
VAR, STATE, OUT = argv[0], argv[1], os.path.abspath(argv[2])
PX = int(argv[argv.index("--px") + 1]) if "--px" in argv else 480
CLIP, FRAME = {"fly": ("Idle", 0), "dep": ("Opening", 44)}[STATE]
N = 36

ds.reset()
cam = ds.stage(px=(PX, PX), samples=16)
blend = os.path.join(ds.PROJ, "03_blender", "variants", VAR + ".blend")
if VAR == "vanilla":
    meshes, arms, root = ds.load_vanilla_drone(CLIP, FRAME)
else:
    meshes, arms, root = ds.load_variant(blend, CLIP, FRAME, tag=VAR)
if "--squad" in argv:
    ds.load_squad([(1.2, 3.6, 0), (2.4, 3.0, 0), (0.0, 3.2, 0)], rotz=3.0)
ds.gamelike_all()
ds.aim(cam, (0.0, 0.0, 0.9), -90, 22, 6.4)
tmp = os.path.join(os.path.dirname(OUT), "_tt_%s_%s" % (VAR, STATE))
os.makedirs(tmp, exist_ok=True)
frames = []
for i in range(N):
    root.rotation_euler = (0, 0, math.radians(360.0 * i / N))
    bpy.context.view_layer.update()
    p = os.path.join(tmp, "f%03d.png" % i)
    ds.render(p)
    frames.append(Image.open(p).convert("RGB"))
if len(frames) != N:
    raise SystemExit("expected %d frames" % N)
strip = Image.new("RGB", (PX * 4, PX))
for k, i in enumerate((0, 9, 18, 27)):
    strip.paste(frames[i], (k * PX, 0))
pal = strip.quantize(colors=255, method=Image.MEDIANCUT)
q = [f.quantize(palette=pal, dither=Image.NONE) for f in frames]
q[0].save(OUT, save_all=True, append_images=q[1:], duration=60, loop=0)
for f in os.listdir(tmp):
    os.remove(os.path.join(tmp, f))
os.rmdir(tmp)
print("GIF", OUT, N, "frames")
