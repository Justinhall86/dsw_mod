#!/usr/bin/env python3
"""Build a viewable donor .blend for each vanilla male hero (mesh + Male01 rig + shipped textures + run clip).

Two steps, because Blender's Python has no Pillow:
    python 10_build_donor_blends.py --prep                      (HMD -> FBX, DDS -> PNG, writes manifest.json)
    blender -b --factory-startup --python 10_build_donor_blends.py   (builds the .blend files from the manifest)
Set ONLY=Duncan,Gurney to build a subset in the Blender step.

Each hero's mesh and run clip are HMD files named .fbx. They go through the HMD toolkit, the DDS textures
(named .png) are converted to real PNG in the scratch folder, then the scene is built and packed.
Output: 01_input/donors/<Hero>/<Hero>_<UnitId>.blend
"""
import json
import os
import subprocess
import sys

EXTR = r"C:\dsw_mod\extr"
TOOLKIT = r"C:\Users\justi\Python\dsw_mod\HMD_toolkit\HMD_toolkit"
PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\thorvald\thorvald_hero_1"
OUT_DIR = os.path.join(PROJ, "01_input", "donors")
WORK = r"C:\Users\justi\AppData\Local\Temp\claude\c--Users-justi-Python-dsw-mod\4db32100-dbea-4fb1-918c-0078b660cde3\scratchpad\donor_build"
RUN_HMD = os.path.join(EXTR, "Anim", "Male01", "Anim_Male01_Run.fbx")

# hero name, unit id (cdb), mesh folder under extr\Character, mesh file, texture base name, has emissive
DONORS = [
    ("Duncan", "A_Hero_1", r"Atreide\Unit\Duncan", "Male01_AtreidesDuncan.fbx", "Duncan", True),
    ("Gurney", "A_Hero_2", r"Atreide\Unit\Gurney", "Male01_AtreidesGurney.fbx", "Gurney", True),
    ("Rabban", "H_Hero_1", r"Harkonnen\Unit\Rabban", "Male01_HarkonnenRabban.fbx", "Rabban", True),
    ("Iakin", "H_Hero_2", r"Harkonnen\Unit\Nefud", "Male01_HarkonnenNefud.fbx", "Nefud", False),
    ("Otheym", "F_Hero_2", r"Fremen\Unit\Otheym", "Male01_FremenOtheym.fbx", "Otheym", False),
    ("Bannerjee", "S_Hero_2", r"Smuggler\Unit\Bannerjee", "male01_SmugglerBannerjee.fbx", "Bannerjee", False),
    ("Whitmore", "E_Hero_1", r"Ecaz\Unit\WhitmoreBludd", "Male01_WhitmoreBludd.fbx", "WhitmoreBludd", False),
    ("Ctair", "V_Hero_2", r"Vernius\Unit\Ctair", "Male01_Ctair.fbx", "Ctair", True),
]


def run(cmd, cwd):
    print("RUN:", " ".join(cmd))
    r = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if r.stdout.strip():
        print(r.stdout.strip()[-800:])
    if r.returncode != 0:
        print(r.stderr.strip()[-1200:])
        raise SystemExit("failed: %s" % " ".join(cmd))


def to_png(src_dds, dst_png):
    """Shipped '.png' textures are DDS. Convert to real PNG for Blender (system Python: Blender has no Pillow)."""
    from PIL import Image

    Image.open(src_dds).convert("RGBA").save(dst_png)
    return dst_png


def wire_material(meshes, maps):
    import bpy

    mat = bpy.data.materials.new("Mat_Donor")
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)

    def tex(path, label, loc):
        nd = nt.nodes.new("ShaderNodeTexImage")
        img = bpy.data.images.load(path, check_existing=False)
        img.pack()
        nd.image = img
        nd.label = label
        nd.location = loc
        return nd

    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); bsdf.location = (-200, 0)
    out = nt.nodes.new("ShaderNodeOutputMaterial"); out.location = (200, 0)
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])

    alb = tex(maps["albedo"], "Albedo", (-700, 300))
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    mga = tex(maps["mgao"], "MetallicGlossAO", (-700, 0))
    mga.image.colorspace_settings.name = "Non-Color"
    nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    nrm = tex(maps["normal"], "Normal", (-700, -300))
    nrm.image.colorspace_settings.name = "Non-Color"
    nmap = nt.nodes.new("ShaderNodeNormalMap"); nmap.location = (-400, -300)
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    if "emissive" in maps:
        emi = tex(maps["emissive"], "Emissive", (-700, -600))
        emi.image.colorspace_settings.name = "Non-Color"
        nt.links.new(emi.outputs["Color"], bsdf.inputs["Emission Color"])
        bsdf.inputs["Emission Strength"].default_value = 1.0

    for m in meshes:
        m.data.materials.clear()
        m.data.materials.append(mat)


def prep(name, unit_id, mesh_dir, mesh_file, tex_base, has_emissive):
    """System Python: HMD -> FBX and DDS -> PNG. Returns the manifest entry."""
    print("prep %s (%s)" % (name, unit_id))
    os.makedirs(WORK, exist_ok=True)
    mesh_hmd = os.path.join(EXTR, "Character", mesh_dir, mesh_file)
    tex_dir = os.path.dirname(mesh_hmd)
    body_fbx = os.path.join(WORK, "%s_%s_body.fbx" % (name, unit_id))
    run(
        [sys.executable, "hmdanim2fbx.py", mesh_hmd, RUN_HMD, body_fbx],
        os.path.join(TOOLKIT, "Animations"),
    )
    maps = {}
    suffixes = {"albedo": "Albedo", "mgao": "MetallicGlossAO", "normal": "Normal"}
    if has_emissive:
        suffixes["emissive"] = "Emissive"
    for key, suffix in suffixes.items():
        src = os.path.join(tex_dir, "%s_%s.png" % (tex_base, suffix))
        dst = os.path.join(WORK, "%s_%s_%s.png" % (name, unit_id, suffix))
        maps[key] = to_png(src, dst)
    return {"name": name, "unit_id": unit_id, "body_fbx": body_fbx, "maps": maps}


def build(entry):
    import bpy

    name, unit_id = entry["name"], entry["unit_id"]
    body_fbx, maps = entry["body_fbx"], entry["maps"]
    print("=" * 70)
    print("%s (%s)" % (name, unit_id))
    print("=" * 70)

    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=body_fbx)
    meshes = [o for o in bpy.context.scene.objects if o.type == "MESH" and len(o.data.vertices) >= 50]
    rig = next(o for o in bpy.context.scene.objects if o.type == "ARMATURE")
    rig.name = "Rig"
    for i, m in enumerate(meshes):
        m.name = "%s_%s_%02d" % (name, unit_id, i)
    wire_material(meshes, maps)
    print("   meshes:", [m.name for m in meshes], "| bones:", len(rig.data.bones))
    if rig.animation_data and rig.animation_data.action:
        act = rig.animation_data.action
        print("   action:", act.name, "frames", act.frame_range[:])
        bpy.context.scene.frame_start = int(act.frame_range[0])
        bpy.context.scene.frame_end = int(act.frame_range[1])

    out_dir = os.path.join(OUT_DIR, name)
    os.makedirs(out_dir, exist_ok=True)
    out_blend = os.path.join(out_dir, "%s_%s.blend" % (name, unit_id))
    bpy.ops.wm.save_as_mainfile(filepath=out_blend, compress=True)
    print("   saved", out_blend, "%.2f MB" % (os.path.getsize(out_blend) / 1e6))


MANIFEST = os.path.join(WORK, "manifest.json")

if "--prep" in sys.argv:
    entries = [prep(*d) for d in DONORS]
    os.makedirs(WORK, exist_ok=True)
    with open(MANIFEST, "w", encoding="utf-8") as f:
        json.dump(entries, f, indent=1)
    print("manifest:", MANIFEST)
else:
    only = os.environ.get("ONLY")
    with open(MANIFEST, encoding="utf-8") as f:
        entries = json.load(f)
    for e in entries:
        if only and e["name"] not in only.split(","):
            continue
        build(e)
    print("ALL DONE")
