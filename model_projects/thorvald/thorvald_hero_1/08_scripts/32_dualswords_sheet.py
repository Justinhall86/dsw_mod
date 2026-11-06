"""Contact sheet of B's two-sword build on each DualSwords clip (22_mount_two_swords.py's output), plus a check
that the game->Blender transform mapping used for B_Weapon_L reproduces the clip's own B_Weapon exactly.

  blender -b --factory-startup --python 32_dualswords_sheet.py -- <out_dir>
  python 32_dualswords_sheet.py --assemble <out_dir>
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
STEM = os.environ.get("TWO_SWORDS_STEM", "B_foundry_warlord_two_swords")   # e.g. B_foundry_warlord_arms_x1.2_two_swords
BLEND = os.path.join(PROJ, "03_blender", "weapons", STEM + ".blend")
SHOTS = {"DualSwords_Run": [1, 8, 15, 22], "DualSwords_AttackMelee01": [1, 14, 28, 42],
         "DualSwords_FightIdle": [1, 20]}
args = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else sys.argv[1:]

if args and args[0] == "--assemble":
    from PIL import Image, ImageDraw
    out = args[1]
    files = sorted(f for f in os.listdir(out) if f.startswith("ds_") and f.endswith(".png"))
    ims = [Image.open(os.path.join(out, f)).convert("RGBA") for f in files]
    w, h = ims[0].size
    cols = 4
    rows = (len(ims) + cols - 1) // cols
    sheet = Image.new("RGB", (w * cols, h * rows), (235, 237, 242))
    for i, (f, im) in enumerate(zip(files, ims)):
        x, y = (i % cols) * w, (i // cols) * h
        sheet.paste(im, (x, y), im)
        ImageDraw.Draw(sheet).text((x + 6, y + 6), f[3:-4], fill=(0, 0, 0))
    sheet.save(os.path.join(out, "sheet.png"))
    print("sheet", os.path.join(out, "sheet.png"))
    raise SystemExit

import bpy  # noqa: E402

sys.path[:0] = [HERE]
out = args[0]
os.makedirs(out, exist_ok=True)
bpy.ops.wm.open_mainfile(filepath=BLEND)
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]

# mapping check on the right hand: Blender's B_Weapon (from the imported clip) vs the clip HMD's own track
import importlib.util  # noqa: E402
spec = importlib.util.spec_from_file_location("m22", os.path.join(HERE, "22_mount_two_swords.py"))
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
sys.path[:0] = [os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Animations")]
import hmd_anim as HA  # noqa: E402
from mathutils import Matrix, Quaternion  # noqa: E402
_, _, tr = HA.load_animation(r"C:\dsw_mod\extr\Anim\Male01\DualSwords\Anim_Male01_DualSwords_Run.fbx")
p, q = tr["B_Weapon"].position[0], tr["B_Weapon"].rotation[0]
want = Matrix.Translation((-p[0], p[1], p[2])) @ Quaternion((q[3], q[0], -q[1], -q[2])).to_matrix().to_4x4()
rig.animation_data.action = bpy.data.actions["DualSwords_Run"]
sc.frame_set(1)
got = rig.pose.bones["B_rWristJ"].matrix.inverted() @ rig.pose.bones["B_Weapon"].matrix
err = max(abs(got[i][j] - want[i][j]) for i in range(4) for j in range(4))
print("MAPPING CHECK B_Weapon max abs error: %.5f" % err)

sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x, sc.render.resolution_y = 360, 480
sc.render.film_transparent = True
sc.view_settings.view_transform = "Standard"
cam = sc.camera or next(o for o in sc.objects if o.type == "CAMERA")
sc.camera = cam
for act_name, frames in SHOTS.items():
    rig.animation_data.action = bpy.data.actions[act_name]
    for f in frames:
        sc.frame_set(f)
        sc.render.filepath = os.path.join(out, "ds_%s_f%03d.png" % (act_name.replace("DualSwords_", ""), f))
        bpy.ops.render.render(write_still=True)
print("rendered to", out)
