"""Texture sheets of vanilla buildings (pure Python + Pillow, no bpy).

A village building's HMD can use several materials: its own sheet (`SupplyDepot_Albedo.png`), shared prop sheets
(`VillageMisc_Neutral`, swapped per faction to `VillageMisc_<Faction>_Albedo.png`), another building's sheet
(the Water Plant uses `FuelCellFactory`), `ConstructionAsset` and ground decals. Each sheet has faction albedos
`<Prefix>_<Faction>_Albedo.png` next to it when it is faction-skinned.

sheet_name(image_file) -> 'SupplyDepot' / 'VillageMisc_Neutral' / ...
sheet(name) -> {'corrino', 'atreides', 'mga', 'normal'} PNG paths (converted from the game's DDS-behind-.png once,
               cached in ../03_blender/sheets/<name>/; regenerable, not committed). Missing maps are None.
"""
import os
import re

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
CACHE = os.path.join(PROJ, "03_blender", "sheets")


def _repo(p=HERE):
    while not os.path.exists(os.path.join(p, "CLAUDE.md")):
        p = os.path.dirname(p)
    return p


STRUCT = os.path.join(_repo(), "model_inputs", "Structure")
_index = None


def _files():
    global _index
    if _index is None:
        _index = {}
        for root, _d, fs in os.walk(STRUCT):
            for f in fs:
                if f.lower().endswith(".png"):
                    _index.setdefault(f.lower(), os.path.join(root, f))
    return _index


def sheet_name(image_file):
    b = os.path.basename(image_file)
    return re.sub(r"_(albedo|basecolor)\.png$", "", b, flags=re.I)


def _find(*names):
    idx = _files()
    for n in names:
        if n and n.lower() in idx:
            return idx[n.lower()]
    return None


def sheet(name):
    out = os.path.join(CACHE, name)
    res = {}
    prefix = re.sub(r"_Neutral$", "", name, flags=re.I)
    alt = {"Airfield": "AirField", "ResearchStation": "ResearchCenter"}.get(prefix, prefix)
    src = {
        "corrino": _find(prefix + "_Corrino_Albedo.png", alt + "_Corrino_Albedo.png", name + "_Albedo.png", name + "_basecolor.png"),
        "atreides": _find(prefix + "_Atreides_Albedo.png", alt + "_Atreides_Albedo.png", name + "_Albedo.png", name + "_basecolor.png"),
        "mga": _find(name + "_MetallicGlossAO.png", prefix + "_MetallicGlossAO.png", name + "_MetallicGlossAOEmiss.png",
                     name + "_metallicglossao.png"),
        "normal": _find(name + "_Normal.png", prefix + "_Normal.png"),
    }
    os.makedirs(out, exist_ok=True)
    for k, p in src.items():
        if not p:
            res[k] = None
            continue
        dst = os.path.join(out, k + ".png")
        if not os.path.exists(dst) or os.path.getmtime(dst) < os.path.getmtime(p):
            Image.open(p).convert("RGB").save(dst)
        res[k] = dst
    return res
