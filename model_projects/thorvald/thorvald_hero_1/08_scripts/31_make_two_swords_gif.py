"""Render a looping Run-cycle GIF for B with both swords mounted (22_mount_two_swords.py's output).
Same two-step pattern as 30_make_poc_gif.py (Blender render, then system-python assemble).

  blender -b --factory-startup --python 31_make_two_swords_gif.py
  python 31_make_two_swords_gif.py --assemble

Env: TWO_SWORDS_STEM (blend stem), TWO_SWORDS_ACTION (e.g. DualSwords_AttackMelee01; default: the active action),
GIF_FPS (round 14: default 30 = the clips' own rate; rounds 9-13 played 30 fps clips at 15 fps, i.e. half speed,
which made the strides look sluggish and steppy). The camera follows B_ROOTJ so the attack's lunge stays framed.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
OUT_DIR = os.path.join(PROJ, "02_progress_photos", "10_poc_gifs")
STEM = os.environ.get("TWO_SWORDS_STEM", "B_foundry_warlord_two_swords")   # e.g. B_foundry_warlord_arms_x1.2_two_swords
BLEND = os.path.join(PROJ, "03_blender", "weapons", STEM + ".blend")
ACTION = os.environ.get("TWO_SWORDS_ACTION", "")
FPS = int(os.environ.get("GIF_FPS", "30"))
SUFFIX = ("_" + ACTION.replace("DualSwords_", "")) if ACTION else ""
frame_dir = os.path.join(OUT_DIR, STEM + SUFFIX + "_frames")
gif_path = os.path.join(OUT_DIR, STEM + SUFFIX + ".gif")

if "--assemble" in sys.argv:
    from PIL import Image
    files = sorted(f for f in os.listdir(frame_dir) if f.endswith(".png"))
    if not files:
        raise SystemExit("no frames in %s - run the Blender render step first" % frame_dir)
    frames = [Image.open(os.path.join(frame_dir, f)).convert("RGBA") for f in files]
    bg = [Image.new("RGB", im.size, (235, 237, 242)) for im in frames]
    for b, im in zip(bg, frames):
        b.paste(im, mask=im.split()[3])
    bg[0].save(gif_path, save_all=True, append_images=bg[1:], duration=round(1000 / FPS), loop=0, optimize=True)
    print("GIF saved: %s (%d frames, %.2f MB)" % (gif_path, len(bg), os.path.getsize(gif_path) / 1e6))
else:
    import bpy
    from mathutils import Vector
    os.makedirs(frame_dir, exist_ok=True)
    bpy.ops.wm.open_mainfile(filepath=BLEND)
    sc = bpy.context.scene
    rig = bpy.data.objects["Rig"]
    if ACTION:
        rig.animation_data.action = bpy.data.actions[ACTION]
    if not (rig.animation_data and rig.animation_data.action):
        raise SystemExit("no baked action on Rig in %s" % BLEND)
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

    for old in os.listdir(frame_dir):
        if old.endswith(".png"):
            os.remove(os.path.join(frame_dir, old))     # our own render frames, regenerated below
    sc.frame_set(f0)
    root0 = (rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head).copy()
    cam0 = cam.location.copy()
    for f in range(f0, f1 + 1):
        sc.frame_set(f)
        d = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head - root0
        cam.location = cam0 + Vector((d.x, d.y, 0.0))      # follow the root on the ground plane only
        sc.render.filepath = os.path.join(frame_dir, "f%03d.png" % f)
        bpy.ops.render.render(write_still=True)
    print("rendered %d frames to %s" % (f1 - f0 + 1, frame_dir))
