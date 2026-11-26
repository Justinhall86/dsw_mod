"""Convert the faction-skinned vanilla village buildings (one mesh, one albedo per faction) into real FBX + PNG textures.

    python 30_village_convert.py [Name ...]

These are the Terminal's neighbours in a Corrino or Atreides base, and its donors for the 2026-11-26 appearance pass:
every one of them already carries Shiro's Corrino paint (trim weight, panel value, texel density), so parts cut from
them and re-tinted to Thorvald read as the same family.
Output (regenerable, not committed): ../03_blender/village_donors/<Name>/{<model>_real.fbx, corrino.png, atreides.png,
mga.png, normal.png, info.json}. Pure Python (HMD toolkit + Pillow); runs on Windows or Linux.
"""
import json
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)


def _repo(p=HERE):
    while not os.path.exists(os.path.join(p, "CLAUDE.md")):
        p = os.path.dirname(p)
    return p


REPO = _repo()
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
_argv, sys.argv = sys.argv, sys.argv[:1]
import build_previews as B  # noqa: E402

SB = os.path.join(REPO, "model_inputs", "Structure", "Buildings")
OUT = os.path.join(PROJ, "03_blender", "village_donors")

# name: (folder, [models], corrino albedo, atreides albedo, mga, normal)
VILLAGE = {
    "MilitaryBase": ("MilitaryBase", ["MilitaryBase.fbx"], "MilitaryBase_Corrino_Albedo.png", "MilitaryBase_Atreides_Albedo.png",
                     "MilitaryBase_metallicglossao.png", None),
    "Refinery": ("Refinery", ["Refinery.fbx", "Refinery_Addon.fbx"], "Refinery_Corrino_Albedo.png", "Refinery_Atreides_Albedo.png",
                 "Refinery_MetallicGlossAO.png", "Refinery_Normal.png"),
    "WindTrap": ("WindTrap", ["WindTrap.fbx", "WindTrap_Addon.fbx"], "WindTrap_Corrino_Albedo.png", "WindTrap_Atreides_Albedo.png",
                 "WindTrap_MetallicGlossAO.png", "WindTrap_Normal.png"),
    "SpiceSilo": ("SpiceSilo", ["SpiceSilo.fbx"], "SpiceSilo_Corrino_Albedo.png", "SpiceSilo_Atreides_Albedo.png",
                  "SpiceSilo_MetallicGlossAOEmiss.png", "SpiceSilo_Normal.png"),
    "ResearchHub": ("ResearchHub", ["ResearchHub.fbx", "ResearchHub_Addon.fbx"], "ResearchHub_Corrino_Albedo.png",
                    "ResearchHub_Atreides_Albedo.png", "ResearchHub_MetallicGlossAO.png", "ResearchHub_Normal.png"),
    "SupplyDepot": ("SupplyDepot", ["SupplyDepot.fbx", "SupplyDepot_Addon.fbx"], "SupplyDepot_Corrino_Albedo.png",
                    "SupplyDepot_Atreides_Albedo.png", None, None),
    "MarketPlace": ("MarketPlace", ["MarketPlace.fbx"], "MarketPlace_Corrino_Albedo.png", "MarketPlace_Atreides_Albedo.png", None, None),
    "InvestmentOffice": ("InvestmentOffice", ["InvestmentOffice.fbx"], "InvestmentOffice_Corrino_Albedo.png",
                         "InvestmentOffice_Atreides_Albedo.png", None, None),
    "PlascreteFactory": ("PlascreteFactory", ["PlastcreteFactory.fbx", "PlascreteFactory_Addon.fbx"], "PlascreteFactory_Corrino_Albedo.png",
                         "PlascreteFactory_Atreides_Albedo.png", None, None),
    "ProcessingPlant": ("ProcessingPlant", ["ProcessingPlant.fbx"], "ProcessingPlant_Corrino_Albedo.png",
                        "ProcessingPlant_Atreides_Albedo.png", None, None),
    "FuelCellFactory": ("FuelCellFactory", ["FuelCellFactory.fbx"], "FuelCellFactory_Corrino_Albedo.png",
                        "FuelCellFactory_Atreides_Albedo.png", None, None),
    "CraftWorkshop": ("CraftWorkshop", ["CraftWorkshop.fbx"], "CraftWorkshop_Corrino_Albedo.png", "CraftWorkshop_Atreides_Albedo.png",
                      None, None),
    "DataCenter": ("DataCenter", ["DataCenter.fbx"], "DataCenter_Corrino_Albedo.png", "DataCenter_Atreides_Albedo.png", None, None),
    "RecruitmentOffice": ("RecruitmentOffice", ["RecruitmentOffice.fbx"], "RecruitmentOffice_Corrino_Albedo.png",
                          "RecruitmentOffice_Atreides_Albedo.png", None, None),
    "SurveillanceFacility": ("SurveillanceFacility", ["SurveillanceFacility.fbx"], "SurveillanceFacility_Corrino_Albedo.png",
                             "SurveillanceFacility_Atreides_Albedo.png", None, None),
    "WaterPlant": ("WaterPlant", ["WaterPlant.fbx"], "WaterPlant_Corrino_Albedo.png", "WaterPlant_Atreides_Albedo.png", None, None),
    "ResearchStation": ("ResearchStation", ["ResearchCenter.fbx"], "ResearchCenter_Corrino_Albedo.png",
                        "ResearchCenter_Atreides_Albedo.png", None, None),
    "Airfield": ("Airfield", ["Airfield.fbx", "Airfield_Addon.fbx"], "AirField_Corrino_Albedo.png", "Airfield_Atreides_Albedo.png",
                 None, None),
    "SpacingGuildBranch": ("SpacingGuildBranch", ["SpacingGuildBranch.fbx"], "SpacingGuildBranch_Corrino_Albedo.png",
                           "SpacingGuildBranch_Atreides_Albedo.png", None, None),
    "PropagandaOffice": ("PropagandaOffice", ["PropagandaOffice.fbx"], "PropagandaOffice_Albedo.png", "PropagandaOffice_Albedo.png",
                         None, None),            # Corrino-only building: one albedo
    "DewCollector": ("DewCollector", ["DewCollector.fbx"], "DewCollector_Corrino_Albedo.png", "DewCollector_Atreides_Albedo.png",
                     None, None),
}


def guess(folder, stem_kind):
    """MGAO / normal file of a folder when not listed: the first file whose name ends with the kind."""
    for f in sorted(os.listdir(folder)):
        lf = f.lower()
        if lf.endswith(stem_kind) and "_construction" not in lf and "ground" not in lf:
            return f
    return None


def prefab_scale(folder, models):
    """In-game size factor: product of the scaleX values from the prefab root down to the first listed model node."""
    p = os.path.join(SB, folder, "Prefab_%s.prefab" % folder)
    if not os.path.exists(p):
        return 1.0
    want = models[0].lower()

    def walk(n, s):
        s *= n.get("scaleX", 1.0)
        if n.get("type") == "model" and str(n.get("source", "")).lower().endswith(want):
            return s
        for c in n.get("children", []):
            r = walk(c, s)
            if r:
                return r
        return None
    return walk(json.load(open(p)), 1.0) or 1.0


def convert(name):
    folder, models, cor, atr, mga, nrm = VILLAGE[name]
    d = os.path.join(SB, folder)
    td = os.path.join(OUT, name)
    os.makedirs(td, exist_ok=True)
    fbx = []
    for m in models:
        hmd = os.path.join(d, m)
        data = B.REAL_LOAD(hmd)
        idx = [i for i, mm in enumerate(data.models) if mm.geometry >= 0]
        if len(idx) == 1:
            fbx.append(B.convert_model(hmd, os.path.join(td, os.path.splitext(m)[0] + "_real.fbx")))
            continue
        for i in idx:                                # multi-mesh HMD: one FBX per mesh (same as 20_parts_sheet.py)
            def one(_p, i=i):
                dd = B.REAL_LOAD(hmd)
                dd.models = [dd.models[i]]
                dd.models[0].parent = -1
                return dd
            B.H.load = one
            try:
                out = os.path.join(td, "%s_m%d_real.fbx" % (os.path.splitext(m)[0], i))
                B.hmd2fbx.convert(hmd, out, verbose=False)
                fbx.append(out)
            finally:
                B.H.load = B.REAL_LOAD
    tex = {}
    for key, f in (("corrino", cor), ("atreides", atr), ("mga", mga or guess(d, "metallicglossao.png")),
                   ("normal", nrm or guess(d, "normal.png"))):
        if f and os.path.exists(os.path.join(d, f)):
            tex[key] = B.dds_as_png(os.path.join(d, f), os.path.join(td, key + ".png"))
    info = dict(name=name, fbx=fbx, tex=tex, scale=prefab_scale(folder, models))
    json.dump(info, open(os.path.join(td, "info.json"), "w"), indent=1)
    print("OK", name, len(fbx), "fbx", sorted(tex))
    return info


def current():
    """The installed Terminal (D5) from 06_game_ready, as `_Current`, so lineups show today's look next to the new one."""
    g = os.path.join(PROJ, "06_game_ready", "StructMOD", "ThorvaldConsignmentTerminal")
    td = os.path.join(OUT, "_Current")
    os.makedirs(td, exist_ok=True)
    fbx = B.convert_model(os.path.join(g, "ThorvaldConsignmentTerminal.hmd"), os.path.join(td, "Terminal_real.fbx"))
    tex = {k: B.dds_as_png(os.path.join(g, "ThorvaldConsignmentTerminal_%s.png" % f), os.path.join(td, k + ".png"))
           for k, f in (("corrino", "Albedo"), ("mga", "MetallicGlossAO"))}
    tex["atreides"] = tex["corrino"]
    json.dump(dict(name="_Current", fbx=[fbx], tex=tex, scale=1.0), open(os.path.join(td, "info.json"), "w"), indent=1)
    print("OK _Current")


if __name__ == "__main__":
    current()
    names = [a for a in _argv[1:] if a in VILLAGE] or list(VILLAGE)
    for n in names:
        try:
            convert(n)
        except Exception as exc:                     # keep going: one odd HMD must not stop the survey
            print("FAIL", n, type(exc).__name__, exc)
