"""The six assets in this project: where the vanilla files live and which texture each step starts from.

`before` is the albedo used for the vanilla reference render; `source` is the albedo the Thorvald recolour starts from. Buildings
recolour from the Atreides albedo: its green faction stripes become the Thorvald rust accent (the neutral albedo has no accent at all).
"""
import os

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", ".."))
VEH = os.path.join(REPO, "model_inputs", "Vehicle")
EXTR = r"C:\dsw_mod\extr"

ASSETS = {
    "artillery_drone": dict(
        dir=os.path.join(VEH, "Imperial", "DroneI"),
        models=["ImperiumDroneBase.fbx", "ImperiumDroneCanon.fbx"],
        before="ImperiumDrone_Albedo.png", source="ImperiumDrone_Albedo.png",
        mgao="ImperiumDrone_MetallicGlossAO.png", normal="ImperiumDrone_Normal.png",
        front="+X"),
    "hq_outpost": dict(
        dir=os.path.join(EXTR, "Structure", "Base", "ConquestOutpost"),
        models=["ConquestOutpost.fbx"],
        before="ConquestOutpost_Atreides_Albedo.png", source="ConquestOutpost_Atreides_Albedo.png",
        mgao="ConquestOutpost_MetallicGlossAO.png", normal="ConquestOutpost_Normal.png",
        emissive="ConquestOutpost_Emissive.png", front="-Y"),
    "ravager_ship": dict(
        dir=os.path.join(VEH, "Common", "Ravager"),
        models=["Ravager.fbx"],
        before="Ravager_Albedo.png", source="Ravager_Albedo.png",
        mgao="Ravager_MetallicGlossAOEmiss.png", normal="Ravager_Normal.png",
        front="+X"),
    "corrino_harvester": dict(
        dir=os.path.join(VEH, "Imperial", "Harvester"),
        models=["ImperialHarvester.fbx"],
        before="Harvester_Albedo.png", source="Harvester_Albedo.png",
        mgao="Harvester_MetallicGlossAO.png", normal="Harvester_Normal.png",
        front="-X"),
    "ornithopter": dict(
        dir=os.path.join(VEH, "Atreide", "Ornithopter"),
        models=["Vehicle_Ornithopter.fbx"],
        before="Ornithopter_Albedo.png", source="Ornithopter_Albedo.png",
        mgao="Ornithopter_MetallicGlossAO.png", normal="Ornithopter_Normal.png",
        emissive="Ornithopter_Emissive.png", front="+X"),
    "indoctrination_center": dict(
        dir=os.path.join(EXTR, "Structure", "Buildings", "IndoctrinationCenter"),
        models=["IndoctrinationCenter.fbx"],
        before="IndoctrinationCenter_Atreides_Albedo.png", source="IndoctrinationCenter_Atreides_Albedo.png",
        mgao="IndoctrinationCenter_MetallicGlossAOEmiss.png", normal="IndoctrinationCenter_Normal.png",
        emissive="IndoctrinationCenter_Emissive.png", front="-Y"),
}


def input_dir(name):
    return os.path.join(PROJ, "01_input", name)
