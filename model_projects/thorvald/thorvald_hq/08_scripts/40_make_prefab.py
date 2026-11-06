"""Write the Thorvald citadel prefab (draft; nothing installed).

    python 40_make_prefab.py [H3]     # -> ../06_game_ready/Prefab_ThorvaldCitadel.prefab

Layout follows the vanilla HQ prefabs:
  Destruction    Corrino base damage / destruction FX (same size class as this HQ)
  BaseThorvald   the always-visible core (name used by the model row's hideOnDestruction) + dirt decal
  Districts      District_<group>_<slot> models: the engine looks these names up and shows each one when that
                 district slot is built (StructureModel.hx:80). Thorvald's districtSlots are [3, 2, 1].
                 FX that belong to a district hang under its node, as in Prefab_Arrakeen (smoke on the chimneys).
  FX             lights on the forge tower, antenna props
  RIG_ThorvaldCitadel_Ships   the vanilla Arrakeen shuttle rig, played by our Anim_ThorvaldCitadel_Ships (30_ships_anim.py)
Everything sits under one "Citadel" node so a single rotationZ turns the whole base.
Coordinates: prefab = HMD space = the kitbash's Blender coordinates with X negated (see 30_ships_anim.py).
Game paths: the HMDs go to res/Structure/Base/Thorvald/ (FBX -> HMD with the toolkit at install time).
"""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
A = __import__("30_ships_anim")

GAME_DIR = "Structure/Base/Thorvald/"
ROT = -101.3          # the outpost's own prefab rotation (Prefab_ConquestOutpost)


def hmd(x, y, z):
    return dict(x=round(-x, 3), y=round(y, 3), z=round(z, 3))


def ref(name, source, at, **kw):
    r = dict(type="reference", name=name, source=source, **hmd(*at))
    r.update(kw)
    return r


def model(name, file, **kw):
    m = dict(type="model", name=name, source=GAME_DIR + file)
    m.update(kw)
    return m


def destruction():
    steps = []
    for i, (x, y) in enumerate(((0.845, 1.415),) * 3, 1):
        fx = "Fx/Structure/CorrinoBase/FX_CorrinoBaseDamage_Step0%d" % i
        steps.append(dict(type="object", name="Step_0%d" % i, x=x, y=y, visible=False, children=[
            dict(type="reference", name=fx.split("/")[-1] + "_NoPhotosensitive", source=fx + ".fx",
                 x=-x, y=-y, scaleX=0.1302, scaleY=0.1302, scaleZ=0.1302, rotationZ=150),
            dict(type="reference", name=fx.split("/")[-1] + "_PhotosensitiveOnly", source=fx + "_PhotosensitiveOnly.fx",
                 x=-x, y=-y, scaleX=0.1302, scaleY=0.1302, scaleZ=0.1302, rotationZ=150)]))
    fin = "Fx/Structure/CorrinoBase/FX_CorrinoBaseDestruction"
    steps.append(dict(type="object", name="Final", visible=False, children=[
        dict(type="reference", name="FX_CorrinoBaseDestruction_NoPhotosensitive", source=fin + ".fx",
             scaleX=0.1302, scaleY=0.1302, scaleZ=0.1302, rotationZ=150),
        dict(type="reference", name="FX_CorrinoBaseDestruction_PhotosensitiveOnly",
             source=fin + "_PhotosensitiveOnly.fx", scaleX=0.1302, scaleY=0.1302, scaleZ=0.1302, rotationZ=150)]))
    return dict(type="object", name="Destruction", scaleX=7.68, scaleY=7.68, scaleZ=7.68, children=steps)


def main():
    name = sys.argv[1] if len(sys.argv) > 1 else "H3"
    spec = json.load(open(os.path.join(PROJ, "01_input", name.lower() + ".json")))
    groups = sorted({p["group"] for p in spec["pieces"] if p["group"].startswith("District_")})

    # chimney tops (District_2_2): at + post height (3.2 m) * z scale; smoke rises from each
    chim = [p for p in spec["pieces"] if p["group"] == "District_2_2"]
    smoke = [ref("FX_Smoke", "Fx/Smoke/FX_Smoke_Soft_Grey_2.fx",
                 (p["at"][0], p["at"][1], 3.2 * p["scale"][2]), scaleX=1.2, scaleY=1.2, scaleZ=1.6) for p in chim]
    districts = []
    for g in groups:
        d = model(g, "ThorvaldCitadel_%s.fbx" % g)
        if g == "District_2_2":
            d["children"] = [dict(type="object", name="FX", children=smoke)]
        districts.append(d)

    tower_top = (-13.4, -1.0, 24.9)      # the stacked forge tower in the west bay
    fx = [ref("LightRedBlink03_Sphere", "Fx/Structure/Lights/LightRedBlink03_Sphere.fx", tower_top),
          ref("LightYellow02_Flat", "Fx/Structure/Lights/LightYellow02_Flat.fx", (-0.6, -6.6, 4.2)),
          ref("LightYellow02_Flat", "Fx/Structure/Lights/LightYellow02_Flat.fx", (15.8, 9.7, 0.3)),
          ref("Prefab_Antena_01", "Structure/Village/Tiles/Model/Props/Prefab_Antena_01.prefab",
              (-12.4, -0.2, 24.6), scaleX=2.5, scaleY=2.5, scaleZ=2.5)]

    rig = dict(type="model", name="RIG_ThorvaldCitadel_Ships", source="Structure/Base/Arrakeen/RIG_BaseArrakeen_Ships.fbx",
               animation=GAME_DIR + "Anim_ThorvaldCitadel_Ships.fbx",
               scaleX=A.RIG_SCALE, scaleY=A.RIG_SCALE, scaleZ=A.RIG_SCALE)

    prefab = dict(type="prefab", children=[
        destruction(),
        dict(type="object", name="Citadel", rotationZ=ROT, children=[
            dict(type="object", name="BaseThorvald", children=[
                dict(type="tdecal", name="tdecal", scaleX=96.27, scaleY=96.27, scaleZ=7.59,
                     albedoMap="Structure/Resources/Decals/DirtDecal_1_color.png",
                     normalMap="Structure/Resources/Decals/DirtDecal_1_normal.png"),
                model("ThorvaldCitadel", "ThorvaldCitadel_Base.fbx")]),
            dict(type="object", name="Districts", children=districts),
            dict(type="object", name="FX", children=fx),
            rig])])
    out = os.path.join(PROJ, "06_game_ready", "Prefab_ThorvaldCitadel.prefab")
    json.dump(prefab, open(out, "w"), indent="\t")
    print("WROTE", out, "districts", groups)


if __name__ == "__main__":
    main()
