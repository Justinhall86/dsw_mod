"""Build one kitbash variant of a DSW character from a JSON spec, render it, optionally save the .blend.

  blender -b --python build_variant.py -- --spec variant.json --mode close|rest|posed [--save out.blend] [--base other.blend]

--mode close/rest: rest pose, weapons removed, renders front/tq/back of the shoulders (close) or upper body (rest).
--mode posed: keeps the base file's animation + weapon (use a preview .blend made by dsw-preview-blend) and renders
              in the game-facing direction. Always check this one - the T-pose hides most problems.
--base overrides spec["base_blend"] (e.g. loop over the halberd / gun / bazooka previews).

Spec (all keys optional except base_blend/body/rig/out_dir/name):
{
  "name": "G1",
  "base_blend": ".../landsraad_guard_halberd_preview.blend",
  "body": "LandsraadGuard", "rig": "Male01_LandsraadGuard",
  "out_dir": ".../02_progress_photos/variants",
  "inflate": [{"components": [11, 12, 23, 24], "dist": 0.015}],         # thicker armour shells
  "drop":    [21, 22],                                                  # body components to delete
  "cut":     {"components": [17, 18], "below_z": 1.70},                 # delete part of components below a height
  "parts": [                                                             # donor parts to graft
    {"blend": ".../Imperial_Sardaukar.blend", "object": "Imperial", "components": [14],
     "mirror": true,                       # also add a mirrored copy (for one-sided parts)
     "scale": 0.88, "pivot": [0.12, 0, 1.6], "offset": [-0.06, 0, -0.02], "rot_y": 0,
     "albedo": ".../recoloured_Albedo.png"}                              # from recolour_parts.py
  ],
  "shells": {"patches": ".../uv_patches.json", "params": {...build_shell params...}}   # modelled pauldrons
}
Component ids are ranks by vertex count on the UNTOUCHED mesh (see part_gallery.py); all deletions are applied
after the other edits using those original ids.
"""
import argparse
import os
import sys

import bpy

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import dsw_parts as P  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("--spec", required=True)
ap.add_argument("--mode", default="close", choices=("close", "rest", "posed"))
ap.add_argument("--save")
ap.add_argument("--base")
ap.add_argument("--tag", default="", help="extra file-name prefix for the renders")
a = ap.parse_args(P.script_args())
S = P.load_json(a.spec)
S["out_dir"] = os.path.abspath(S["out_dir"])   # relative render paths land on the drive root otherwise
if a.save:
    a.save = os.path.abspath(a.save)

bpy.ops.wm.open_mainfile(filepath=a.base or S["base_blend"])
sc = bpy.context.scene
rig = bpy.data.objects[S["rig"]]
body = bpy.data.objects[S["body"]]
keep_types = ("CAMERA", "LIGHT") if a.mode == "posed" else ("MESH", "CAMERA", "LIGHT")
for o in [o for o in bpy.data.objects if o.type in keep_types and o is not body]:
    bpy.data.objects.remove(o, do_unlink=True)          # posed keeps the weapon
if a.mode != "posed":
    P.rest_pose(rig)

comps = P.components(body)                               # ids from the untouched mesh
for item in S.get("inflate", []):
    P.inflate(body, [i for c in item["components"] for i in comps[c]], item["dist"])

added = []
for part in S.get("parts", []):
    dob = P.import_donor(part["blend"], part["object"])
    dcomps = P.components(dob)
    keep = {i for c in part["components"] for i in dcomps[c]}
    P.delete_verts(dob, keep, invert=True)
    dob.name = "%s_%s" % (os.path.splitext(os.path.basename(part["blend"]))[0], "-".join(map(str, part["components"])))
    if any(k in part for k in ("scale", "pivot", "offset", "rot_y")):
        P.nudge(dob, part.get("scale", 1.0), part.get("pivot", (0, 0, 0)), part.get("offset", (0, 0, 0)),
                part.get("rot_y", 0.0))
    if part.get("albedo"):
        P.set_albedo(dob, part["albedo"])
    wm = dob.matrix_world.copy()
    group = [dob] + ([P.mirror_object(dob)] if part.get("mirror") else [])
    for g in group:
        P.attach_to_rig(g, rig, wm)
    added += group

if S.get("shells"):
    patches = P.load_json(S["shells"]["patches"])
    added += [P.build_shell(body, rig, side, S["shells"]["params"], patches) for side in (1, -1)]

gone = {i for c in S.get("drop", []) for i in comps[c]}
if S.get("cut"):
    z = S["cut"]["below_z"]
    gone |= {i for c in S["cut"]["components"] for i in comps[c]
             if (body.matrix_world @ body.data.vertices[i].co).z < z}
if gone:
    P.delete_verts(body, gone)
bpy.context.view_layer.update()
print("VARIANT %s: +%d objects (%d tris), body %d polys" % (
    S["name"], len(added), sum(len(o.data.polygons) for o in added), len(body.data.polygons)))

P.setup_scene(sc)
cams = P.render_views(sc, S["out_dir"], "%s%s_%s" % (a.tag, a.mode, S["name"]), a.mode)
if a.save:
    sc.camera = cams["tq"]
    sc.frame_set(sc.frame_start)
    P.purge_orphans()
    bpy.ops.wm.save_as_mainfile(filepath=a.save)
    print("SAVED", a.save)
