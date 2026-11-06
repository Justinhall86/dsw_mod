"""Round 15: helmet donor survey for Karlin (house_thorvald reference: a closed gunmetal helmet with copper seams, open
face window, breathing mask, two tall antennae). Every vanilla unit with headgear (no Sardaukar), head only.

  python 60_helmet_survey.py --prep                                   (HMD -> FBX, DDS albedo -> PNG)
  blender -b --factory-startup --python 60_helmet_survey.py           (front + side + back of each head, textured)
  python 60_helmet_survey.py --assemble                               (labelled sheet)

Head = faces whose vertices are all dominated by B_HeadJ (helmets are rigid on the head bone), so the sheet shows exactly
what a graft onto Karlin's head would bring. Output 02_progress_photos/30_helmet/survey/.
"""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
EXTR = r"C:\dsw_mod\extr\Character"
DONOR_DIR = os.path.join(PROJ, "05_fbx_export", "helmet_donors")
OUT = os.path.join(PROJ, "02_progress_photos", "30_helmet", "survey")
CANDIDATES = {
    "Warden": "Atreide/Unit/Warden/Female01_AtreideWarden.fbx",
    "AtreidesSoldier": "Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
    "HeavyWeapon": "Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
    "HarkTrooper": "Harkonnen/Unit/Trooper/Male01_HarkonnenTrooper.fbx",
    "HarkHouseGuard": "Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
    "Vanguard": "Harkonnen/Unit/Vanguard/Female01_HarkonnenVanguard.fbx",
    "Gunner": "Harkonnen/Unit/Gunner/Female01_HarkonnenGunner.fbx",
    "Cerberus": "Harkonnen/Unit/Cerberus/Male01_Cerberus.fbx",
    "ImpTrooper": "Imperial/Trooper/Male01_ImperialTrooper.fbx",
    "ImpHouseGuard": "Imperial/HouseGuard/Male01_HouseGuard.fbx",
    "FlameThrower": "Imperial/FlameThrower/Male01_ImperialFlameThrower.fbx",
    "Knight": "Ecaz/Unit/Knight/Male01_Knight.fbx",
    "Squire": "Ecaz/Unit/Squire/Male01_Squire.fbx",
    "Musketeer": "Ecaz/Unit/Musketeer/Female01_EcazMusketeer.fbx",
    "FightEngineer": "Vernius/Unit/Fight_Engineer/Male01_FightEngineer.fbx",
    "Suboid": "Vernius/Unit/Suboid/Male01_Suboid.fbx",
    "Commando": "Common/Commando/Male01_Commando.fbx",
    "Marauder": "Common/Marauder/Male01_Marauder.fbx",
    "Militia": "Common/Militia/Male01_Militia01.fbx",
    "Scout": "Smuggler/Unit/Scout/Male01_Scout.fbx",
    "Mercenary": "Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
    "Watcher": "Fremen/Unit/Watcher/Female01_Watcher.fbx",
}
VIEWS = ("front", "side", "back")

if "--prep" in sys.argv:
    from PIL import Image
    sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
    import hmd2fbx
    os.makedirs(DONOR_DIR, exist_ok=True)
    manifest = {}
    for key, rel in CANDIDATES.items():
        src = os.path.join(EXTR, rel)
        dst = os.path.join(DONOR_DIR, key + "_TRUE_FBX.fbx")
        if not os.path.exists(dst):
            hmd2fbx.convert(src, dst, verbose=False)
        folder = os.path.dirname(src)
        albs = sorted(f for f in os.listdir(folder) if f.endswith("_Albedo.png"))
        maps = {}
        for f in albs:
            png = os.path.join(DONOR_DIR, "%s__%s" % (key, f))
            if not os.path.exists(png):
                Image.open(os.path.join(folder, f)).convert("RGBA").save(png)
            maps[f.replace("_Albedo.png", "")] = png
        manifest[key] = {"fbx": dst, "albedos": maps}
        print(key, "ok", list(maps))
    json.dump(manifest, open(os.path.join(DONOR_DIR, "manifest.json"), "w"), indent=1)
    raise SystemExit

if "--assemble" in sys.argv:
    from PIL import Image, ImageDraw
    keys = [k for k in CANDIDATES if os.path.exists(os.path.join(OUT, "%s_front.png" % k))]
    w = h = 220
    cols = 2
    per = len(VIEWS) * w
    rows = (len(keys) + cols - 1) // cols
    sheet = Image.new("RGB", (cols * (per + 10), rows * (h + 20)), (60, 62, 66))
    d = ImageDraw.Draw(sheet)
    for i, k in enumerate(keys):
        x0, y0 = (i % cols) * (per + 10), (i // cols) * (h + 20)
        d.text((x0 + 4, y0 + 2), k, fill=(255, 255, 255))
        for j, v in enumerate(VIEWS):
            im = Image.open(os.path.join(OUT, "%s_%s.png" % (k, v))).convert("RGB").resize((w, h))
            sheet.paste(im, (x0 + j * w, y0 + 18))
    sheet.save(os.path.join(OUT, "helmet_survey_sheet.png"))
    print("saved", os.path.join(OUT, "helmet_survey_sheet.png"))
    raise SystemExit

import bmesh  # noqa: E402
import bpy  # noqa: E402
from mathutils import Vector  # noqa: E402

os.makedirs(OUT, exist_ok=True)
manifest = json.load(open(os.path.join(DONOR_DIR, "manifest.json")))
only = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
for key, info in manifest.items():
    if only and key not in only:
        continue
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=info["fbx"])
    sc = bpy.context.scene
    meshes = [o for o in sc.objects if o.type == "MESH"]
    keep_any = False
    for o in meshes:
        gn = {g.index: g.name for g in o.vertex_groups}
        dom = {v.index: gn[max(v.groups, key=lambda g: g.weight).group] for v in o.data.vertices if v.groups}
        bm = bmesh.new()
        bm.from_mesh(o.data)
        kill = [f for f in bm.faces if not all(dom.get(v.index) == "B_HeadJ" for v in f.verts)]
        bmesh.ops.delete(bm, geom=kill, context="FACES")
        bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
        bm.to_mesh(o.data)
        bm.free()
        keep_any |= len(o.data.vertices) > 0
        for slot in o.material_slots:
            m = slot.material
            if not m:
                continue
            m.use_nodes = True
            nt = m.node_tree
            bsdf = next((n for n in nt.nodes if n.type == "BSDF_PRINCIPLED"), None)
            if bsdf is None:
                continue
            alb = None
            for stem, png in info["albedos"].items():
                if stem.lower() in m.name.lower() or len(info["albedos"]) == 1:
                    alb = png
            alb = alb or next(iter(info["albedos"].values()), None)
            if alb:
                t = nt.nodes.new("ShaderNodeTexImage")
                t.image = bpy.data.images.load(alb, check_existing=True)
                nt.links.new(t.outputs["Color"], bsdf.inputs["Base Color"])
            bsdf.inputs["Roughness"].default_value = 0.65
    if not keep_any:
        print("SKIP", key, "no head-bone faces")
        continue
    ps = [o.matrix_world @ v.co for o in meshes for v in o.data.vertices]
    lo = Vector([min(p[i] for p in ps) for i in range(3)])
    hi = Vector([max(p[i] for p in ps) for i in range(3)])
    c = (lo + hi) / 2
    size = max(hi - lo) * 1.35
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = sc.render.resolution_y = 360
    sc.view_settings.view_transform = "Standard"
    sc.world = bpy.data.worlds.new("W")
    sc.world.color = (0.5, 0.52, 0.56)
    for rot, e in (((0.9, 0.2, 0.5), 3.0), ((1.3, 0, -2.5), 1.0)):
        L = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", "SUN"))
        L.data.energy = e
        L.rotation_euler = rot
        sc.collection.objects.link(L)
    cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = size
    sc.collection.objects.link(cam)
    sc.camera = cam
    # face direction: the importer's HMD heads face -Y (Karlin's donor blends do)
    for v, d in zip(VIEWS, ((0, -1, 0), (1, 0, 0), (0, 1, 0))):
        cam.location = c + Vector(d) * 3
        cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (key, v))
        bpy.ops.render.render(write_still=True)
    print("RENDERED", key, len(ps), "verts")
