"""v5 track B: a hand-built "Elite" from the VANILLA Landsraad Guard - direct mesh edits only.

  blender -b --python 08_scripts/v5_11_handrolled.py -- [B1 B2 ...]      (env CLOSE=1 / POSED=1 as in v5_03)

Edits (all keep the skin weights: vertices only move, duplicated pieces copy their weights):
  inflate   - push armour shells out along their normals (chest 11/12, back 23/24, hood 17/18, forearms 05/06)
  pads      - enlarge the guard's own shoulder pads (21/22) and add lower layers (duplicated, scaled, shifted) = stacked lames
  flare     - widen the hood flare (17/18) sideways below z_top so it meets the bigger pads
Same textures as the vanilla guard, so colour and pixel quality match exactly.
"""
import importlib.util
import math
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

_s = importlib.util.spec_from_file_location("v5_13", os.path.join(os.path.dirname(os.path.abspath(__file__)), "v5_13_pauldron_dome.py"))
DOME = importlib.util.module_from_spec(_s)
_s.loader.exec_module(DOME)

MP = r"C:\Users\justi\Python\dsw_mod\model_projects"
LE = os.path.join(MP, "landsraad_elite")
WEAPON = os.environ.get("WEAPON", "halberd")
GUARD = os.path.join(MP, "landsraad_guard", "03_blender", "landsraad_guard_%s_preview.blend" % WEAPON)
OUT = os.path.join(LE, "02_progress_photos", "17_handrolled")
os.makedirs(OUT, exist_ok=True)
CLOSE = os.environ.get("CLOSE") == "1"
FINAL = os.environ.get("FINAL") == "1"
POSED = os.environ.get("POSED") == "1" or FINAL

VARIANTS = {
    "B1": dict(inflate={(11, 12, 23, 24): 0.015, (17, 18): 0.018, (5, 6): 0.012},
               pad_scale=1.6, pad_lift=(0.02, 0.02),                      # (out, up)
               layers=[(1.45, (0.035, -0.075))],                          # (scale, (out, up)) per extra lame
               flare=(1.10, 1.75)),                                       # (x scale, only below z)
    # pads tilted so they cap the shoulder (top toward the neck, bottom out), lower lame tilted less = fanned pauldron
    "B3": dict(inflate={(11, 12, 23, 24): 0.015, (17, 18): 0.018, (5, 6): 0.012},
               pad_scale=1.3, pad_lift=(0.0, 0.03), pad_tilt=35,
               layers=[(1.2, (0.03, -0.07), 18)],
               flare=(1.10, 1.75)),
    "B4": dict(inflate={(11, 12, 23, 24): 0.018, (17, 18): 0.02, (5, 6): 0.015},
               pad_scale=1.4, pad_lift=(-0.01, 0.04), pad_tilt=45,
               layers=[(1.3, (0.02, -0.05), 30), (1.2, (0.05, -0.11), 15)],
               flare=(1.12, 1.75)),
    # B4 tuned to sit against the grafted collar (used by v5_03 "BC"): pads pulled in toward the neck
    "B5": dict(inflate={(11, 12, 23, 24): 0.018, (17, 18): 0.02, (5, 6): 0.015},
               pad_scale=1.45, pad_lift=(-0.06, 0.03), pad_tilt=45,
               layers=[(1.35, (-0.03, -0.05), 30), (1.25, (0.0, -0.11), 15)],
               flare=(1.0, 1.75)),
    # REDO (user: stacked copies look derpy): one newly modelled pauldron shell per shoulder (v5_13), vanilla pads removed
    "R1": dict(inflate={(11, 12, 23, 24): 0.012, (5, 6): 0.01}, drop=(21, 22),
               dome=dict(off=(0.02, 0.0, 0.06), radii=(0.15, 0.14, 0.11), phi=100, theta=(-40, 88), seg=(16, 9), thick=0.018,
                         flare=0.12, rim_rows=1, ridge=(5, 0.014), w_shoulder_bottom=0.4)),
    "R2": dict(inflate={(11, 12, 23, 24): 0.015, (5, 6): 0.012}, drop=(21, 22),
               dome=dict(off=(0.035, 0.0, 0.06), radii=(0.175, 0.16, 0.13), phi=105, theta=(-48, 88), seg=(18, 10),
                         thick=0.024, flare=0.22, rim_rows=1, ridge=(6, 0.022), w_shoulder_bottom=0.4)),
    "R2c": dict(inflate={(11, 12, 23, 24): 0.015, (5, 6): 0.012},
                dome=dict(off=(0.035, 0.0, 0.06), radii=(0.175, 0.16, 0.13), phi=105, theta=(-48, 88), seg=(18, 10),
                          thick=0.024, flare=0.22, rim_rows=1, ridge=(6, 0.022), w_shoulder_bottom=0.4)),
    # same body for the collar combo in v5_03 ("RC" drops the pads itself, so no "drop" here)
    "R1c": dict(inflate={(11, 12, 23, 24): 0.012, (5, 6): 0.01},
                dome=dict(off=(0.02, 0.0, 0.06), radii=(0.15, 0.14, 0.11), phi=100, theta=(-40, 88), seg=(16, 9), thick=0.018,
                         flare=0.12, rim_rows=1, ridge=(5, 0.014), w_shoulder_bottom=0.4)),
    "B2": dict(inflate={(11, 12, 23, 24): 0.02, (17, 18): 0.022, (5, 6): 0.015},
               pad_scale=1.8, pad_lift=(0.03, 0.03),
               layers=[(1.6, (0.045, -0.07)), (1.4, (0.06, -0.135))],
               flare=(1.14, 1.75)),
}


def components(bm):
    bm.verts.ensure_lookup_table()
    seen, comps = set(), []
    for v in bm.verts:
        if v.index in seen:
            continue
        st, c = [v], []
        seen.add(v.index)
        while st:
            x = st.pop()
            c.append(x.index)
            for e in x.link_edges:
                o = e.other_vert(x)
                if o.index not in seen:
                    seen.add(o.index)
                    st.append(o)
        comps.append(c)
    return sorted(comps, key=len, reverse=True)


def edit_guard(guard, spec):
    bm = bmesh.new()
    bm.from_mesh(guard.data)
    bm.normal_update()
    comps = components(bm)
    V = bm.verts
    # 1. inflate shells
    for ids, d in spec["inflate"].items():
        for ci in ids:
            for i in comps[ci]:
                n = V[i].normal.copy()
                if abs(V[i].co.x) < 0.004:      # centre seam: the two halves must move together
                    n.x = 0.0
                    n.normalize()
                V[i].co += n * d
    # 2. widen the hood flare below z_top (smoothly: full effect at the bottom, none at z_top)
    sx, ztop = spec.get("flare", (1.0, 1.75))
    for ci in (17, 18):
        zs = [V[i].co.z for i in comps[ci]]
        zmin = min(zs)
        for i in comps[ci]:
            v = V[i]
            if v.co.z < ztop:
                t = (ztop - v.co.z) / max(ztop - zmin, 1e-6)
                v.co.x *= 1 + (sx - 1) * t
    # 3. pads: layers first (copies of the ORIGINAL pad), then enlarge the original
    pads = [[V[i] for i in comps[ci]] for ci in (21, 22)]   # grab both before duplicating (indices go stale)
    for pad in pads:
        c =sum((v.co for v in pad), Vector()) / len(pad)
        side = 1 if c.x > 0 else -1
        faces = list({f for v in pad for f in v.link_faces})
        top = Vector((c.x, c.y, max(v.co.z for v in pad)))

        def tilt(deg):   # rotate about the front-back axis through the pad top: bottom swings out, top in
            return (Matrix.Translation(top) @ Matrix.Rotation(math.radians(-side * deg), 4, "Y")
                    @ Matrix.Translation(-top))
        for layer in spec.get("layers", []):
            scale, (out, up) = layer[0], layer[1]
            ang = layer[2] if len(layer) > 2 else 0
            dup = bmesh.ops.duplicate(bm, geom=pad + faces + list({e for v in pad for e in v.link_edges}))
            nv = [g for g in dup["geom"] if isinstance(g, bmesh.types.BMVert)]
            m = Matrix.Translation(c + Vector((side * out, 0, up))) @ Matrix.Scale(scale, 4) @ Matrix.Translation(-c)
            bmesh.ops.transform(bm, matrix=m @ tilt(ang), verts=nv)
        out, up = spec.get("pad_lift", (0.0, 0.0))
        m = Matrix.Translation(c + Vector((side * out, 0, up))) @ Matrix.Scale(spec.get("pad_scale", 1.0), 4) @ Matrix.Translation(-c)
        bmesh.ops.transform(bm, matrix=m @ tilt(spec.get("pad_tilt", 0)), verts=pad)
    if spec.get("drop"):              # last, so the component indices above stay valid
        gone = {V[i] for ci in spec["drop"] for i in comps[ci]}
        bmesh.ops.delete(bm, geom=list(gone), context="VERTS")
    bm.to_mesh(guard.data)
    bm.free()
    guard.data.update()
    if spec.get("dome"):
        DOME.add_pauldrons(guard, spec["dome"])


def lights_and_world(sc):
    w = bpy.data.worlds.new("W")
    sc.world = w
    w.use_nodes = True
    w.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.58, 0.64, 1)
    w.node_tree.nodes["Background"].inputs[1].default_value = 1.6
    for nm, kind, en, loc, rot, size in (("Sun", "SUN", 3.5, (0, 0, 5), (52, 0, 35), None),
                                         ("Fill", "AREA", 160, (-1.8, -2.4, 1.8), (68, 0, -40), 3.0),
                                         ("Rim", "AREA", 120, (1.6, 2.6, 2.2), (115, 0, 200), 2.0)):
        ld = bpy.data.lights.new(nm, kind)
        ld.energy = en
        if size:
            ld.size = size
        o = bpy.data.objects.new(nm, ld)
        bpy.context.collection.objects.link(o)
        o.location = loc
        o.rotation_euler = [math.radians(a) for a in rot]


def build(name, spec):
    bpy.ops.wm.open_mainfile(filepath=GUARD)
    sc = bpy.context.scene
    rig = bpy.data.objects["Male01_LandsraadGuard"]
    guard = bpy.data.objects["LandsraadGuard"]
    kill = ("CAMERA", "LIGHT") if POSED else ("MESH", "CAMERA", "LIGHT")
    for o in [o for o in bpy.data.objects if o.type in kill and o is not guard]:
        bpy.data.objects.remove(o, do_unlink=True)
    if not POSED:
        rig.data.pose_position = "REST"
        if rig.animation_data:
            rig.animation_data.action = None
    edit_guard(guard, spec)
    print("B", name, "guard now", len(guard.data.vertices), "verts", len(guard.data.polygons), "polys")
    lights_and_world(sc)
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = sc.render.resolution_y = 700
    sc.view_settings.view_transform = "Standard"
    if CLOSE:
        centre, scale = Vector((0, 0, 1.6)), 0.9
    elif POSED:
        centre, scale = Vector((-0.3, 0, 1.2)), 2.6
    else:
        centre, scale = Vector((0, 0, 1.4)), 1.7
    dirs = ((("front", (-1, 0, 0)), ("tq", (-1, -0.9, 0)), ("back", (1, 0, 0))) if POSED
            else (("front", (0, -1, 0)), ("tq", (-0.9, -1, 0)), ("back", (0, 1, 0))))
    for tag, d in dirs:
        cd = bpy.data.cameras.new(tag)
        cam = bpy.data.objects.new(tag, cd)
        bpy.context.collection.objects.link(cam)
        cam.location = centre + Vector(d).normalized() * 4
        cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
        cd.type, cd.ortho_scale = "ORTHO", scale
        sc.camera = cam
        pre = "close_" if CLOSE else ("final_%s_" % WEAPON if FINAL else ("posed_" if POSED else ""))
        sc.render.filepath = os.path.join(OUT, "%s%s_%s.png" % (pre, name, tag))
        bpy.ops.render.render(write_still=True)
    if FINAL:
        sc.camera = bpy.data.objects["tq"]
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(LE, "03_blender", "landsraad_elite_handrolled_%s_%s.blend" % (name, WEAPON)))


if __name__ == "__main__":   # v5_03 imports edit_guard/VARIANTS for the hand-built + collar combo
    args = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else list(VARIANTS)
    for n in args:
        build(n, VARIANTS[n])
