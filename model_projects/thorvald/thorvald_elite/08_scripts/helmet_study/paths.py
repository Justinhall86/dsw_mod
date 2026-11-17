"""Shared paths for the Heavy Vanguard helmet studies (House Guard, Warden). Plain Python, also importable inside Blender."""
import os

def _repo(p=os.path.abspath(__file__)):
    while not os.path.exists(os.path.join(p, "CLAUDE.md")):
        p = os.path.dirname(p)
    return p

REPO = _repo().replace("\\", "/")
ELITE = REPO + "/model_projects/thorvald/thorvald_elite"
WORK = ELITE + "/04_textures/helmet_study"                    # masks, recoloured textures (inputs to the builds)
GAL = REPO + "/gallery/helmets_and_heads"                     # sheets and renders (what the owner looks at)
MI = REPO + "/model_inputs/Character"
HG_DIR = MI + "/Imperial/HouseGuard/"
WARDEN_DIR = MI + "/Atreide/Unit/Warden/"
KARLIN_H2F4 = REPO + "/model_projects/thorvald/thorvald_hero_1/03_blender/weapons/B_foundry_warlord_hero_H2f4_two_swords.blend"
SCENE_HELPERS = REPO + "/model_projects/thorvald/thorvald_trooper/08_scripts"   # blender_scene.py
BLENDER = "D:/Blender Foundation/Blender 5.2/blender.exe"
