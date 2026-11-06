"""Turntable GIFs for building models, reusing the dsw-vehicle-preview pipeline.

    python render_buildings.py                 # every entry in BUILDINGS
    python render_buildings.py WaterExtractor  # just these

Writes model_outputs/unbuildable_buildings_skirmish/<name>.gif (36 frames, 480 px, 60 ms).
Textures and the HMD conversion are handled by build_previews.py in the vehicle skill; this file
only supplies the building list and one converter for a two-mesh HMD (KulonTent).
"""
import json
import os
import shutil
import subprocess
import sys
import traceback

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
VEHICLE_SCRIPTS = os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts")
sys.path.insert(0, VEHICLE_SCRIPTS)
import build_previews as B  # noqa: E402  (parses sys.argv for --diag/--regen; we pass neither)

ROOT = os.path.join(REPO, "model_inputs", "Structure")
OUT = os.path.join(REPO, "model_outputs", "unbuildable_buildings_skirmish")
SCR = os.path.join(B.SCRATCH, "bld")
os.makedirs(OUT, exist_ok=True)

# models[] is base first; textures are the unsuffixed (neutral) ones. The prefab, not the folder's
# first .fbx, says which models a building really uses (WaterExtractor: Model_IceExtractor + Addon).
BUILDINGS = [
    dict(name="IndoctrinationCenter", folder="Buildings/IndoctrinationCenter", models=["IndoctrinationCenter.fbx"],
         albedo="IndoctrinationCenter_Albedo.png", mgao="IndoctrinationCenter_MetallicGlossAOEmiss.png",
         normal="IndoctrinationCenter_Normal.png", emissive="IndoctrinationCenter_Emissive.png"),
    dict(name="HarvestTent", folder="Buildings/HarvestTent", models=["HarvestTent.fbx"],
         albedo="HarvestTent_Albedo.png", mgao="HarvestTent_MetallicGlossAO.png",
         normal="HarvestTent_Normal.png", emissive="HarvestTent_Emissive.png"),
    dict(name="KulonTent", folder="Buildings/KulonTent", models=["KulonTent.fbx"], split_meshes=[1, 2],
         albedo="KulonTent_Albedo.png", mgao="KulonTent_MetallicGlossAO.png", normal="KulonTent_Normal.png"),
    dict(name="WaterExtractor", folder="Buildings/WaterExtractor", models=["Model_IceExtractor.fbx", "WaterExtractor_Addon.fbx"],
         albedo="WaterExtractor_Albedo.png", mgao="WaterExtractor_MetallicGlossAO.png", normal="WaterExtractor_Normal.png"),
    dict(name="Masterpiece_(RecruitmentOffice_model)", folder="Buildings/RecruitmentOffice", models=["RecruitmentOffice.fbx"],
         albedo="RecruitmentOffice_Albedo.png", mgao="RecruitmentOffice_MetallicGlossAO.png",
         normal="RecruitmentOffice_Normal.png", emissive="RecruitmentOffice_Emissive.png"),
    dict(name="SpiceCollectors_FremenProcessingPlant_(SpiceCollector_model)", folder="Buildings/SpiceCollector",
         models=["SpiceCollector.fbx"], albedo="SpiceCollector_albedo.png",
         mgao="SpiceCollector_MetallicGlossAO.png", normal="SpiceCollector_Normal.png"),
    dict(name="CorrinoBasePreview", folder="Base/Corrino",
         models=["CorrinoBase.fbx", "CorrinoBase_District_01.fbx", "CorrinoBase_District_02.fbx", "CorrinoBase_District_03.fbx"],
         albedo="CorrinoBase_Albedo.png", mgao="CorrinoBase_MetallicGlossAO.png", normal="CorrinoBase_Normal.png"),
]


def convert_mesh(hmd, idx, out):
    """HMD with several meshes -> FBX of mesh idx only. Only safe when the parent node is an identity
    (checked for KulonTent: root has no translation, rotation or scale), because the parent is dropped."""
    def load_one(_path):
        d = B.REAL_LOAD(hmd)
        d.models = [d.models[idx]]
        return d
    B.H.load = load_one
    try:
        B.hmd2fbx.convert(hmd, out, verbose=False)
    finally:
        B.H.load = B.REAL_LOAD
    return out


def build(e):
    d = os.path.join(ROOT, *e["folder"].split("/"))
    td = os.path.join(SCR, e["name"], "tex")
    os.makedirs(td, exist_ok=True)
    if e.get("split_meshes"):
        h = os.path.join(d, e["models"][0])
        fbx = [convert_mesh(h, i, os.path.join(td, "mesh%d_real.fbx" % i)) for i in e["split_meshes"]]
    else:
        fbx = [B.convert_model(os.path.join(d, m), os.path.join(td, os.path.splitext(m)[0] + "_real.fbx"))
               for m in e["models"]]

    def tex(key, out_name):
        return B.dds_as_png(os.path.join(d, e[key]), os.path.join(td, out_name)) if e.get(key) else None

    frames = os.path.join(SCR, e["name"], "frames")
    shutil.rmtree(frames, ignore_errors=True)
    cfg = dict(fbx=fbx, name=e["name"], front="-Y", albedo=tex("albedo", "albedo.png"), mgao=tex("mgao", "mgao.png"),
               normal=tex("normal", "normal.png"), emissive=tex("emissive", "emissive.png"), flat_colour=None,
               turntable=True, frames_dir=frames, n_frames=B.N_FRAMES,
               stills={"front": os.path.join(SCR, e["name"], "front.png")})
    cfg_path = os.path.join(SCR, e["name"] + ".json")
    json.dump(cfg, open(cfg_path, "w"))
    log = os.path.join(SCR, e["name"] + ".log")
    with open(log, "w") as lg:
        subprocess.run([B.BLENDER, "--background", "--factory-startup", "--python", B.RENDER, "--", cfg_path],
                       stdout=lg, stderr=subprocess.STDOUT, check=True)
    B.make_gif(frames, os.path.join(OUT, e["name"] + ".gif"))
    return os.path.join(OUT, e["name"] + ".gif")


if __name__ == "__main__":
    wanted = set(sys.argv[1:])
    failed = []
    for e in BUILDINGS:
        if wanted and e["name"] not in wanted:
            continue
        try:
            print("OK", build(e))
        except Exception as exc:
            failed.append(e["name"])
            print("FAIL", e["name"], "-", exc)
            traceback.print_exc()
    print("FAILED:", failed or "none")
