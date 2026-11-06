"""Render a looping Run-cycle GIF for one POC structure blend (three-quarter camera, matches the game-facing pose).

  blender -b --factory-startup --python 30_make_poc_gif.py -- --variant A|B|C

Uses the Run action already baked into 03_blender/structure/<variant>.blend (the donor's own 30-frame clip,
carried through every build stage). Frames render to a scratch folder, then assembled into a GIF with Pillow
(system Python step, Blender's bundled Python has no Pillow) - run this script via Blender first, then rerun it
with system python and --assemble to build the GIF from the rendered frames.
"""
import argparse
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
OUT_DIR = os.path.join(PROJ, "02_progress_photos", "10_poc_gifs")

VARIANTS = {
    "A": "A_academy_commandant",
    "B": "B_foundry_warlord",
    "C": "C_kinsman_of_the_earl",
}

ap = argparse.ArgumentParser()
ap.add_argument("--variant", required=True, choices=sorted(VARIANTS))
ap.add_argument("--assemble", action="store_true", help="system-python step: build the GIF from rendered frames")
if "--" in sys.argv:
    args = ap.parse_args(sys.argv[sys.argv.index("--") + 1:])
else:
    args = ap.parse_args()
name = VARIANTS[args.variant]
frame_dir = os.path.join(OUT_DIR, name + "_frames")
gif_path = os.path.join(OUT_DIR, name + ".gif")

if args.assemble:
    from PIL import Image
    files = sorted(f for f in os.listdir(frame_dir) if f.endswith(".png"))
    if not files:
        raise SystemExit("no frames in %s - run the Blender render step first" % frame_dir)
    frames = [Image.open(os.path.join(frame_dir, f)).convert("RGBA") for f in files]
    bg = [Image.new("RGB", im.size, (235, 237, 242)) for im in frames]
    for b, im in zip(bg, frames):
        b.paste(im, mask=im.split()[3])
    bg[0].save(gif_path, save_all=True, append_images=bg[1:], duration=1000 // 15, loop=0, optimize=True)
    print("GIF saved: %s (%d frames, %.2f MB)" % (gif_path, len(bg), os.path.getsize(gif_path) / 1e6))
else:
    import bpy
    os.makedirs(frame_dir, exist_ok=True)
    blend = os.path.join(PROJ, "03_blender", "structure", "%s.blend" % name)
    bpy.ops.wm.open_mainfile(filepath=blend)
    sc = bpy.context.scene
    rig = bpy.data.objects["Rig"]
    if not (rig.animation_data and rig.animation_data.action):
        raise SystemExit("no baked action on Rig in %s" % blend)
    act = rig.animation_data.action
    f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])

    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = 480
    sc.render.resolution_y = 640
    sc.render.film_transparent = True
    sc.view_settings.view_transform = "Standard"
    cam = sc.camera or next((o for o in sc.objects if o.type == "CAMERA" and "ThreeQuarter" in o.name), None)
    if cam is None:
        cam = next(o for o in sc.objects if o.type == "CAMERA")
    sc.camera = cam

    for f in range(f0, f1 + 1):
        sc.frame_set(f)
        sc.render.filepath = os.path.join(frame_dir, "f%03d.png" % f)
        bpy.ops.render.render(write_still=True)
    print("rendered %d frames to %s" % (f1 - f0 + 1, frame_dir))
