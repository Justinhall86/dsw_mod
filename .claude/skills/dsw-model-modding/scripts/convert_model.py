#!/usr/bin/env python3
"""Blender FBX -> game-ready model folder in the editor's res tree, in one command.

  1. HMD Toolkit convert_fbx.py: restore the rig skeleton, repackage to HMD, extract the embedded
     textures as <Name>_Albedo/_MetallicGlossAO/_Normal.png and point the HMD at
     CharMOD/<Name>/... (paths are resolved from the game's resource root)
  2. textures -> RGBA with alpha 255 (RGB-only PNGs are what Blender bakes produce; the working
     models all use RGBA)
  3. fix_normals.py if the HMD has zero-length / inward normals (cause of the all-BLACK Ginaz model)
  4. a unit prefab built from a vanilla prefab with the body swapped (keeps the template's weapons on
     their bones), plus the template folder's props.json (hmd.animPaths: where the template's
     animations live - needed for animations whose model entry gives no animName, e.g. Idle) and
     materials.props (PBR/emissive settings keyed by HMD material name; without it the model renders
     darker than vanilla - Duncan ships emissive: 1)
  5. check_hmd.py on the result; optional copy into the project (model_outputs/<Unit>/game_ready)

Usage:
  python convert_model.py <Male01_Name.fbx> [--rig Male01] \
      [--prefab-template Character/Atreide/Unit/Duncan/Prefab_AtreidesDuncan.prefab] \
      [--prefab-name Prefab_Name] [--copy-to <project>/model_outputs/<Unit>/game_ready]

The FBX basename becomes the folder and HMD name, so name it <Rig>_<Name>.fbx.
Next: cdb_tools.py add-model (inherit = the template's animation set) / add-unit / start-unit,
then repackage.py.
"""
import argparse
import json
import os
import shutil
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from dsw_common import cfg, editor_res  # noqa: E402
import fix_normals  # noqa: E402
import make_prefab  # noqa: E402

sys.path.insert(0, os.path.join(cfg("toolkit_dir"), "Models"))
import hmd_reader as H  # noqa: E402


def to_rgba(folder):
    try:
        from PIL import Image
    except ImportError:
        print("WARNING: Pillow missing (pip install pillow); textures not converted to RGBA")
        return
    for f in os.listdir(folder):
        if f.lower().endswith(".png"):
            p = os.path.join(folder, f)
            im = Image.open(p)
            if im.mode != "RGBA":
                im.convert("RGBA").save(p)
                print(f"  {f}: {im.mode} -> RGBA")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("fbx")
    ap.add_argument("--rig", default="Male01")
    ap.add_argument("--resdir", default="CharMOD")
    ap.add_argument("--prefab-template", help="vanilla prefab (relative to extracted assets); omit = body only")
    ap.add_argument("--prefab-name", help="default: Prefab_<Name without rig prefix>")
    ap.add_argument("--copy-to")
    ap.add_argument("--vanilla-material", action="append", default=[], metavar="MAT=BASE",
                    help="point material MAT at game textures BASE_Albedo/_MetallicGlossAO/_Normal.png, e.g. "
                         "Mat_Sword=Character/Atreide/Unit/Soldier/AtreideSoldier01 (placeholder images are fine in Blender)")
    ap.add_argument("--own-textures", metavar="DIR",
                    help="folder with *_Albedo.png / *_MetallicGlossAO.png / *_Normal.png to copy over this model's own texture files after "
                         "conversion (when two materials were wired to the same canonical names the converter keeps only one of them)")
    ap.add_argument("--share-textures", metavar="BASE",
                    help="point every OTHER material at an existing texture set BASE (e.g. CharMOD/Male01_X/Male01_X) and delete "
                         "the duplicate PNGs this conversion wrote - for a second model variant that reuses the first one's textures")
    a = ap.parse_args()

    fbx = os.path.abspath(a.fbx)
    stem = os.path.splitext(os.path.basename(fbx))[0]
    outdir = os.path.join(editor_res(), "res", a.resdir)
    folder = os.path.join(outdir, stem)
    toolkit = cfg("toolkit_dir")
    d4x = os.path.join(cfg("game_dir"), "D4X.exe")

    cmd = [sys.executable, os.path.join(toolkit, "Repackager", "convert_fbx.py"), "model", fbx,
           "--ref", os.path.join(toolkit, "Rigs", a.rig + ".hmd"), "--outdir", outdir, "--resdir", a.resdir]
    if os.path.exists(d4x):
        cmd += ["--d4x", d4x]
    print(">", " ".join(cmd))
    r = subprocess.run(cmd, cwd=os.path.join(toolkit, "Repackager"))
    hmd = os.path.join(folder, stem + ".hmd")
    if r.returncode != 0 or not os.path.exists(hmd):
        sys.exit(f"conversion failed (exit {r.returncode}); expected {hmd}")

    if a.vanilla_material or a.share_textures:
        import retexture_materials as RM
        asg = dict(m.split("=", 1) for m in a.vanilla_material)
        if a.share_textures:
            for mat in RM.list_materials(hmd).values():
                asg.setdefault(mat["name"], a.share_textures)
        for c in RM.set_material_textures(hmd, asg):
            print("  texture %s %s: %s -> %s" % c)
        if a.share_textures:                           # the converter's own copies are now unreferenced
            for f in os.listdir(folder):
                if f.startswith(stem + "_") and f.endswith(".png"):
                        os.remove(os.path.join(folder, f))
    if a.own_textures:
        import glob
        for suf in ("Albedo", "MetallicGlossAO", "Normal"):
            hits = glob.glob(os.path.join(a.own_textures, f"*_{suf}.png"))
            if hits:
                shutil.copy2(hits[0], os.path.join(folder, f"{stem}_{suf}.png"))
                print(f"  own texture {suf}: {os.path.basename(hits[0])}")
    to_rgba(folder)
    d = H.load(hmd)
    g = d.geometries[0]
    zero, agree = fix_normals.stats(H.decode_vertices(d, g), [i for s in H.decode_indices(d, g) for i in s])
    if zero > g.vertexCount * 0.01 or agree < 90:
        print(f"normals broken ({zero} zero-length, {agree:.1f}% agree) -> repairing")
        fix_normals.fix(hmd, hmd)
        os.remove(hmd + ".bak")

    short = stem.split("_", 1)[1] if "_" in stem else stem
    pname = a.prefab_name or f"Prefab_{short}"
    tpl = a.prefab_template
    if tpl and not os.path.isabs(tpl):
        tpl = os.path.join(cfg("extr_dir"), tpl)
    prefab = make_prefab.build(tpl, f"{a.resdir}/{stem}/{stem}.hmd", keep_hidden=True, body_only=not tpl)
    ppath = os.path.join(folder, pname + ".prefab")
    with open(ppath, "w", encoding="utf-8", newline="\n") as f:
        json.dump(prefab, f, indent="\t")
        f.write("\n")
    print("prefab:", ppath)
    if tpl and os.path.exists(os.path.join(os.path.dirname(tpl), "props.json")):
        shutil.copy2(os.path.join(os.path.dirname(tpl), "props.json"), os.path.join(folder, "props.json"))
        print("props.json (animation paths) copied from the template folder")
    # materials.props carries PBR settings incl. emissive (e.g. Duncan: "emissive": 1), keyed by the
    # HMD material name. Without it the model renders darker than vanilla (Duncan Modified, 2026-10-19).
    if tpl:
        mprops = os.path.join(os.path.dirname(tpl), "materials.props")
        if os.path.exists(mprops):
            shutil.copy2(mprops, os.path.join(folder, "materials.props"))
            print("materials.props (PBR/emissive settings) copied from the template folder")

    chk = subprocess.run([sys.executable, os.path.join(HERE, "check_hmd.py"), hmd, "--rig", a.rig])
    if a.copy_to:
        if os.path.exists(a.copy_to):
            shutil.rmtree(a.copy_to)
        shutil.copytree(folder, a.copy_to)
        print("copied to", a.copy_to)
    print(f"\nmodel resource path for cdb_tools.py add-model --mesh:\n  {a.resdir}/{stem}/{pname}.prefab")
    sys.exit(chk.returncode)


if __name__ == "__main__":
    main()
