"""Donor/base units for the removal-kitbash exploration (Sardaukar excluded on purpose)."""
import os

MI = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))), "model_inputs")

EX = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "05_fbx_export") + os.sep

# key -> (fbx relative to model_inputs, texture stem, texture dir relative to model_inputs)
UNITS = {
    "Commando":  ("Common/Commando/Male01_Commando_TRUE_FBX.fbx", "Commando", "Common/Commando"),
    "Marauder":  ("Common/Marauder/Male01_Marauder_TRUE_FBX.fbx", "Marauder", "Common/Marauder"),
    "Militia":   ("Common/Militia/Male01_Militia01_TRUE_FBX.fbx", "Militia01", "Common/Militia"),
    "Raider":    ("Common/Raider/Male01_Raider_TRUE_FBX.fbx", "Raider", "Common/Raider"),
    "Duncan":    ("Duncan/Male01_AtreidesDuncan_TRUE_FBX.fbx", "Duncan", "Duncan"),
    "Feydakin":  ("Feydakin/Male01_Feydakin_TRUE_FBX.fbx", "Fremen_Feydakin", "Feydakin"),
    "Gurney":    ("Gurney/Male01_AtreidesGurney_TRUE_FBX.fbx", "Gurney", "Gurney"),
    "Idualis01": ("Idualis_Trooper/Male01_IdualisTrooper01_TRUE_FBX.fbx", "IdualisTrooper01", "Idualis_Trooper"),
    "Idualis02": ("Idualis_Trooper/Male01_IdualisTrooper02_TRUE_FBX.fbx", "IdualisTrooper02", "Idualis_Trooper"),
    "Aramsham":  ("Imperial/Aramsham/Male01_ImperialAramsham_TRUE_FBX.fbx", "Aramsham", "Imperial/Aramsham"),
    "FlameThrower": ("Imperial/FlameThrower/Male01_ImperialFlameThrower_TRUE_FBX.fbx", "FlameThrower_Unit", "Imperial/FlameThrower"),
    "HouseGuard": ("Imperial/HouseGuard/Male01_HouseGuard_TRUE_FBX.fbx", "HouseGuard", "Imperial/HouseGuard"),
    "ImperialTrooper": ("Imperial/Trooper/Male01_ImperialTrooper_TRUE_FBX.fbx", "ImperialTrooper", "Imperial/Trooper"),
    "Otheym":    ("Otheym/Male01_FremenOtheym_TRUE_FBX.fbx", "Otheym", "Otheym"),
    "Bannerjee": ("Bannerjee/male01_SmugglerBannerjee_TRUE_FBX.fbx", "Bannerjee", "Bannerjee"),
    "FreeCompany": ("FreeCompany/Female01_FreeCompany_TRUE_FBX.fbx", "Smuggler_FreeCompany", "FreeCompany"),
    "Ranger":    (EX + "Female01_AtreideRanger_TRUE_FBX.fbx", "AtreideRanger", "Atreide/Unit/Ranger"),
    "Warden":    (EX + "Female01_AtreideWarden_TRUE_FBX.fbx", "AtreideWarden", "Atreide/Unit/Warden"),
    "HeavyWeapon": (EX + "Male01_HeavyWeaponSquad_TRUE_FBX.fbx", "HeavyWeaponSquad", "Atreide/Unit/HeavyWeaponSquad"),
    "Mercenary": (EX + "Male01_SmugglerMercenary_TRUE_FBX.fbx", "Smuggler_Mercenary", "Smuggler/Unit/Mercenary"),
    "AtreidesSoldier": ("A_Trooper/Soldier/Male01_AtreideSoldier_TRUE_FBX.fbx", "AtreideSoldier01", "A_Trooper/Soldier"),
}


_INDEX = {}


def find(filename, near=None):
    """Locate a file under model_inputs by NAME (the user reorganises the folders, e.g. Bannerjee ->
    Smuggler/Unit/Bannerjee), preferring the copy in `near`. Returns None if not found."""
    if not _INDEX:
        for root, _dirs, files in os.walk(MI):
            for f in files:
                _INDEX.setdefault(f.lower(), []).append(os.path.join(root, f))
    hits = _INDEX.get(filename.lower(), [])
    if near:
        for h in hits:
            if os.path.dirname(h) == near:
                return h
    return hits[0] if hits else None


def _tex(stem, near):
    out = {}
    for sock, suf in (("Base Color", "_Albedo.png"), ("Specular IOR Level", "_MetallicGlossAO.png"),
                      ("Normal", "_Normal.png")):
        out[sock] = find(stem + suf, near) or os.path.join(MI, "MISSING_" + stem + suf)
    return out


def paths(key):
    fbx, stem, d = UNITS[key]
    if os.path.isabs(fbx):
        path = fbx
    else:
        path = os.path.join(MI, fbx)
        if not os.path.exists(path):
            path = find(os.path.basename(fbx)) or path
    return path, _tex(stem, os.path.dirname(path))


# materials that use a DIFFERENT texture set than the unit's main one: unit -> {material name: (stem, dir)}
EXTRA = {
    "Mercenary": {"Mat_Base": ("Smuggler_Base", "Smuggler/Unit/Mercenary")},
    # Ranger/Warden: their 2nd material (Mat_AtreideSoldier) renders correctly with the unit's OWN textures
    # (using AtreideSoldier01 turned the Warden coat black), so no override.
}


def material_paths(key, mat_name):
    """Texture paths for one material (falls back to the unit's main set)."""
    if mat_name in EXTRA.get(key, {}):
        stem, _d = EXTRA[key][mat_name]
        return _tex(stem, None)
    return paths(key)[1]
