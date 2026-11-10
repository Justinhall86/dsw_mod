"""Give every model we have agreed is good (and want in the game) a Final/ folder with the PNG/GIF renders of its
final version, plus a README naming the version and where each file came from. Files are COPIED, never moved.
Re-run after a final changes (update the MANIFEST below).

    python build_final_folders.py [--dry]
"""
import glob, os, shutil, sys

ROOT = os.path.dirname(os.path.abspath(__file__))
DRY = "--dry" in sys.argv

# project -> (version label, notes, [glob patterns relative to the project, or to model_projects when prefixed "@"])
MANIFEST = {
    "thorvald/thorvald_frigate": (
        "Cruiser, AD7 paint (2026-11-08)",
        "SpaceCruiserWreck hull, levelled and mirrored; 4 shoulder cannons; matte black + charcoal well, burnt-orange "
        "sponsons and flank slopes; Chronos cyan reactor flare. Game files: 06_game_ready/VehMOD/Thorvald_Frigate "
        "(+ Fx/Vehicle/Ships/Thorvald/FX_Thorvald_Reactor.fx).",
        ["02_progress_photos/cruiser_final/*.png", "02_progress_photos/cruiser_final/*.gif",
         "02_progress_photos/cruiser_muzzles_AD7/MUZZLE_STRIP.png", "02_progress_photos/cruiser_muzzles_AD7/*.gif",
         "02_progress_photos/cruiser_export_roundtrip/rt_tq.png", "02_progress_photos/cruiser_export_roundtrip/rt_side.png",
         "02_progress_photos/cruiser_variants/lineup_C3/lineup_tq.png"]),
    "thorvald/thorvald_ship": (
        "v6 (formerly f11)", "Ravager host, Hawk wings and belly, twin chin barrels; Hammer rig 21, scale 1.6.",
        ["thorvald_ship_current.gif", "02_progress_photos/v6_final/*.png"]),
    "thorvald/thorvald_elite": (
        "v2 (E4)", "Heavy Vanguard: plate + lames + rivets, bulkier arms, goggles; tower shield and glaive.",
        ["thorvald_elite_current.gif", "02_progress_photos/v2_final/*.png"]),
    "thorvald/thorvald_trooper": (
        "v13 (T14)", "v11 bulk + flat chest, no lip; library katana.",
        ["02_progress_photos/01_versions/gifs/Thorvald_Trooper_v13.gif", "02_progress_photos/03_variants/T14_Trooper_*.png",
         "02_progress_photos/01_versions/stills/v13_flat_chest_compare.png", "02_progress_photos/game_ready_roundtrip/roundtrip_sheet.png"]),
    "thorvald/thorvald_ranged": (
        "v2 (R5)", "Iron Ranger: no pauldrons, ochre plate, bicep wrap, Soldier legs, back pouches; library sniper.",
        ["02_progress_photos/04_boots_pouches/Thorvald_Ranged_v2.gif", "02_progress_photos/04_boots_pouches/v2_tq.png",
         "02_progress_photos/04_boots_pouches/v2_front.png", "02_progress_photos/04_boots_pouches/v2_back.png",
         "02_progress_photos/04_boots_pouches/v2_side.png", "02_progress_photos/04_boots_pouches/v2_closeup.png",
         "02_progress_photos/04_boots_pouches/R5_sheet.png", "02_progress_photos/game_ready_roundtrip/roundtrip_sheet.png"]),
    "thorvald/thorvald_demolition": (
        "v2 (D2)", "Iron Guard: bicep wrap, belt pouches + canisters, copper pauldron rims, armoured shins; library bazooka.",
        ["02_progress_photos/03_d2/Thorvald_Demolition_v2.gif", "02_progress_photos/03_d2/D2_tq.png",
         "02_progress_photos/03_d2/D2_side.png", "02_progress_photos/03_d2/v2_compare.png",
         "02_progress_photos/03_variants/D2_Demolition_front.png", "02_progress_photos/03_variants/D2_Demolition_back.png",
         "02_progress_photos/03_variants/D2_Demolition_head.png", "02_progress_photos/game_ready_roundtrip/roundtrip_sheet.png"]),
    "thorvald/thorvald_hero_1": (
        "C1 two swords (the look staged for the game)",
        "Karlin (TH_Hero_1). The Round 15 helmet (H1/H2) is still open and not exported, so it is NOT in Final.",
        ["02_progress_photos/10_poc_gifs/B_foundry_warlord_hero_C1_two_swords_*.gif",
         "02_progress_photos/22_game_package/roundtrip_sheet.png"]),
    "ginaz_captain": (
        "polished (showcase_v2)", "G_Elite Ginaz Captain, confirmed working in game.",
        ["02_progress_photos/showcase_v2/*.png", "02_progress_photos/showcase_v2/*.gif"]),
    "ginaz_neophyte": (
        "polished (ginaz_swordmaster showcase_v2)", "G_GinazNeophyte. Polish pass lives in ginaz_swordmaster.",
        ["@ginaz_swordmaster/02_progress_photos/showcase_v2/neophyte_*"]),
    "ginaz_master": (
        "polished (ginaz_swordmaster showcase_v2)", "G_GinazMaster. Polish pass lives in ginaz_swordmaster.",
        ["@ginaz_swordmaster/02_progress_photos/showcase_v2/master_*"]),
}

# project -> the final 3D model and its game files, copied into Final/ so the folder is self-contained:
#   Final/model/       the final .blend (re-saved with every texture PACKED, so it opens anywhere) + the export FBX
#   Final/game_files/  the converted game files laid out like the pak's res tree (copy its contents into <editor>/res/res/)
# "units": (unit rows, model rows) in data.cdb; "mesh": the cdb mesh path; "rebuild": how the game files were made.
MODELS = {
    "thorvald/thorvald_frigate": dict(
        unit="TH_Frigate", name="Thorvald frigate (cruiser)", models="Th_Frigate, A_Frigate",
        blends=["03_blender/cruiser_export.blend"], fbx=["05_fbx_export/Thorvald_Frigate.fbx"],
        game=[("06_game_ready/VehMOD/Thorvald_Frigate", "VehMOD/Thorvald_Frigate"),
              ("06_game_ready/Fx/Vehicle/Ships/Thorvald", "Fx/Vehicle/Ships/Thorvald")],
        mesh="VehMOD/Thorvald_Frigate/Prefab_Thorvald_Frigate.prefab",
        rebuild="08_scripts 80_export_cruiser -> 81_convert_cruiser -> 82_roundtrip -> 83_reactor_fx -> 84_cdb_cruiser (reactor FX row)"),
    "thorvald/thorvald_ship": dict(
        unit="TH_Ship", name="Thorvald fighter", models="Th_Ship",
        blends=["03_blender/v6_final_tex.blend"], fbx=["05_fbx_export/Thorvald_Ship.fbx"],
        game=[("06_game_ready/VehMOD/Thorvald_Ship", "VehMOD/Thorvald_Ship")],
        mesh="VehMOD/Thorvald_Ship/Prefab_Thorvald_Ship.prefab",
        rebuild="08_scripts 50_export_fbx -> 51_convert_vehicle -> 53_fix_bind (required) -> 52_cdb_edit"),
    "thorvald/thorvald_trooper": dict(
        unit="TH_Trooper", name="Thorvald Trooper", models="Th_Trooper, A_Trooper",
        blends=["03_blender/Thorvald_Trooper_v13.blend"], fbx=["05_fbx_export/Male01_ThorvaldTrooper.fbx"],
        game=[("06_game_ready/CharMOD/Male01_ThorvaldTrooper", "CharMOD/Male01_ThorvaldTrooper")],
        mesh="CharMOD/Male01_ThorvaldTrooper/Prefab_ThorvaldTrooper.prefab",
        rebuild="08_scripts 90_export_game_fbx (Blender) -> 91_package_game -> 93_roundtrip trooper (converted 2026-11-08 on the D: PC)"),
    "thorvald/thorvald_ranged": dict(
        unit="TH_Soldier", name="Thorvald Ranged (Iron Ranger)", models="Th_Soldier, A_Soldier",
        blends=["03_blender/Thorvald_Ranged_v2.blend"], fbx=["05_fbx_export/Male01_ThorvaldRanged.fbx"],
        game=[("06_game_ready/CharMOD/Male01_ThorvaldRanged", "CharMOD/Male01_ThorvaldRanged")],
        mesh="CharMOD/Male01_ThorvaldRanged/Prefab_ThorvaldRanged.prefab",
        rebuild="08_scripts 90_export_game_fbx (Blender) -> 91_package_game (props.json from the Smuggler Scout: Sniper clips) -> 93_roundtrip ranged"),
    "thorvald/thorvald_demolition": dict(
        unit="TH_Special", name="Thorvald Demolition (Iron Guard)", models="Th_Special, A_Demo",
        blends=["03_blender/Thorvald_Demolition_v2.blend"], fbx=["05_fbx_export/Male01_ThorvaldDemolition.fbx"],
        game=[("06_game_ready/CharMOD/Male01_ThorvaldDemolition", "CharMOD/Male01_ThorvaldDemolition")],
        mesh="CharMOD/Male01_ThorvaldDemolition/Prefab_ThorvaldDemolition.prefab",
        rebuild="08_scripts 90_export_game_fbx (Blender) -> 91_package_game (props.json from the Landsraad: bazooka clips) -> 93_roundtrip demolition"),
    "thorvald/thorvald_elite": dict(
        unit="TH_Elite (+ TH_Elite2/3, Blood1/2)", name="Thorvald Elite (Heavy Vanguard)",
        models="Th_Elite, Th_Elite2, Th_Elite3, Th_Elite_Blood1, Th_Elite_Blood2, A_Elite",
        blends=["03_blender/v2_final.blend"], fbx=[],
        game=[("06_game_ready/Male01_ThorvaldElite", "CharMOD/Male01_ThorvaldElite")],
        mesh="CharMOD/Male01_ThorvaldElite/Prefab_ThorvaldElite.prefab",
        rebuild="08_scripts 12_assemble_export -> 14_make_game_package (made on the other PC; 06_game_ready is a copy of what was installed)"),
    "thorvald/thorvald_hero_1": dict(
        unit="TH_Hero_1", name="Karlin Thorvald (hero)",
        models="Th_Hero_2 (the Corrino clone swapped the two hero model ids: unit TH_Hero_1 uses model row Th_Hero_2) + anim set ThorvaldKarlin",
        blends=["06_game_ready/Male01_ThorvaldKarlin_export.blend"], fbx=["06_game_ready/Male01_ThorvaldKarlin.fbx"],
        game=[("06_game_ready/Male01_ThorvaldKarlin", "CharMOD/Male01_ThorvaldKarlin")],
        mesh="CharMOD/Male01_ThorvaldKarlin/Prefab_ThorvaldKarlin.prefab",
        rebuild="08_scripts 50_assemble_export -> 51 -> 52_roundtrip_render; cdb 40_cdb_karlin.py"),
}
BLENDER = next((p for p in (os.environ.get("DSW_BLENDER", ""), r"D:\Blender Foundation\Blender 5.2\blender.exe",
                            r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe") if p and os.path.exists(p)), None)
STAGE = sys.argv[sys.argv.index("--stage") + 1] if "--stage" in sys.argv else None


def fresh(src, dst):
    return os.path.exists(dst) and os.path.getmtime(dst) >= os.path.getmtime(src)


def copy_models(proj, spec):
    import subprocess
    pdir = os.path.join(ROOT, *proj.split("/"))
    mdir, gdir = os.path.join(pdir, "Final", "model"), os.path.join(pdir, "Final", "game_files")
    os.makedirs(mdir, exist_ok=True)
    for rel in spec["blends"]:
        src, dst = os.path.join(pdir, rel), os.path.join(mdir, os.path.basename(rel))
        if not os.path.exists(src):
            print("  !! missing blend", rel)
        elif not fresh(src, dst):
            r = subprocess.run([BLENDER, "-b", src, "--python", os.path.join(ROOT, "_pack_blend_copy.py"), "--", dst],
                               capture_output=True, text=True)
            print("  " + (next((l for l in r.stdout.splitlines() if l.startswith("PACKED_COPY")), None) or "!! pack failed " + rel))
    for rel in spec["fbx"]:
        src = os.path.join(pdir, rel)
        if os.path.exists(src) and not fresh(src, os.path.join(mdir, os.path.basename(rel))):
            shutil.copy2(src, mdir)
    for src_rel, res_rel in spec["game"]:
        src, dst = os.path.join(pdir, src_rel), os.path.join(gdir, *res_rel.split("/"))
        if not os.path.isdir(src):
            print("  !! missing game folder", src_rel)
            continue
        if os.path.isdir(dst):
            shutil.rmtree(dst)                        # Final/game_files is always a fresh copy of 06_game_ready
        shutil.copytree(src, dst, ignore=shutil.ignore_patterns("_archive", "*.bak"))
        if STAGE:                                     # also drop it into a res tree (e.g. C:\dsw_mod\D4XEditor\res\res)
            shutil.copytree(src, os.path.join(STAGE, *res_rel.split("/")), dirs_exist_ok=True,
                            ignore=shutil.ignore_patterns("_archive", "*.bak"))
            print("  staged ->", os.path.join(STAGE, *res_rel.split("/")))


def size_mb(path):
    return sum(os.path.getsize(os.path.join(r, f)) for r, _, fs in os.walk(path) for f in fs) / 1e6 if os.path.isdir(path) else 0


def write_registry():
    reg = os.path.join(os.path.dirname(ROOT), "house_thorvald", "MODEL_REGISTRY.md")
    L = ["# House Thorvald: model registry", "",
         "Where every agreed final Thorvald model lives. Generated by `model_projects/build_final_folders.py` "
         "(edit its MANIFEST / MODELS and re-run; do not edit this file by hand).", "",
         "Each unit's `Final/` folder is self-contained:", "",
         "- `Final/*.png|gif`: renders of the final version",
         "- `Final/model/`: the final `.blend` (all textures packed in) and the FBX that was converted",
         "- `Final/game_files/`: the converted game files, laid out like the pak's res tree", "",
         "## Units", "",
         "| Unit (data.cdb) | Model rows | Version | Final folder | Game path (cdb mesh) |", "|---|---|---|---|---|"]
    for proj, s in MODELS.items():
        ver = MANIFEST.get(proj, ("?",))[0]
        L.append("| `%s` %s | %s | %s | [`%s/Final`](../model_projects/%s/Final) | `%s` |" % (
            s["unit"], s["name"], s["models"], ver, proj, proj, s["mesh"]))
    L += ["", "## Files per unit", ""]
    for proj, s in MODELS.items():
        f = os.path.join(ROOT, *proj.split("/"), "Final")
        L += ["### %s (`%s`)" % (s["name"], s["unit"]), "",
              "- Final: `model_projects/%s/Final/` (model %.0f MB, game files %.1f MB)" % (
                  proj, size_mb(os.path.join(f, "model")), size_mb(os.path.join(f, "game_files"))),
              "- Source blend: " + ", ".join("`%s/%s`" % (proj, b) for b in s["blends"]),
              "- Working game folder: " + ", ".join("`%s/%s` -> res `%s`" % (proj, a, b) for a, b in s["game"]),
              "- Rebuild: " + s["rebuild"], ""]
    L += ["## Putting them in the game", "",
          "The data.cdb model rows already point at the game paths above. On a PC with the editor res tree:", "",
          "1. `python model_projects/build_final_folders.py --stage C:\\dsw_mod\\D4XEditor\\res\\res` "
          "(copies every unit's game files into the res tree)",
          "2. `python .claude/skills/dsw-model-modding/scripts/cdb_validate.py --vanilla mod_files/data_vanilla_2026-10-28.cdb` (0 NEW)",
          "3. `python .claude/skills/dsw-hlboot-reverse/scripts/engine_preflight.py` (0 FAIL)",
          "4. `python C:\\dsw_mod\\D4XEditor\\res\\repackage.py --quiet --no-launch`", "",
          "None of the Thorvald units has been seen in game yet.", ""]
    with open(reg, "w", encoding="utf-8", newline="\n") as fh:
        fh.write("\n".join(L))
    print("registry ->", reg)


for proj, (ver, notes, pats) in MANIFEST.items():
    pdir = os.path.join(ROOT, *proj.split("/"))
    fdir = os.path.join(pdir, "Final")
    files = []
    for pat in pats:
        base = ROOT if pat.startswith("@") else pdir
        found = sorted(glob.glob(os.path.join(base, *pat.lstrip("@").split("/"))))
        if not found:
            print("  !! nothing for", proj, pat)
        files += [f for f in found if f.lower().endswith((".png", ".gif"))]
    print("%-32s %-45s %d files" % (proj, ver, len(files)))
    if DRY:
        continue
    os.makedirs(fdir, exist_ok=True)
    lines = ["# %s: final" % os.path.basename(proj), "", "Version: **%s**" % ver, "", notes, "",
             "Copies of the final renders (originals stay where they are):", ""]
    for f in files:
        dst = os.path.join(fdir, os.path.basename(f))
        if os.path.exists(dst) and os.path.basename(f) in [os.path.basename(x) for x in files if x != f]:
            dst = os.path.join(fdir, os.path.basename(os.path.dirname(f)) + "_" + os.path.basename(f))
        shutil.copy2(f, dst)
        lines.append("- `%s` <- `%s`" % (os.path.basename(dst), os.path.relpath(f, ROOT).replace("\\", "/")))
    if proj in MODELS:
        s = MODELS[proj]
        copy_models(proj, s)
        lines += ["", "## The model", "",
                  "- `model/`: " + ", ".join("`%s` (textures packed)" % os.path.basename(b) for b in s["blends"])
                  + "".join(", `%s` (the FBX that was converted)" % os.path.basename(x) for x in s["fbx"]),
                  "- `game_files/`: " + ", ".join("`%s`" % b for _, b in s["game"])
                  + " (copy the contents of `game_files/` into `<editor>/res/res/`)",
                  "- data.cdb: unit `%s`, model rows %s, mesh `%s`" % (s["unit"], s["models"], s["mesh"]),
                  "- Rebuild: " + s["rebuild"], "",
                  "Registry of all Thorvald models: `house_thorvald/MODEL_REGISTRY.md`."]
    with open(os.path.join(fdir, "README.md"), "w", encoding="utf-8", newline="\n") as fh:
        fh.write("\n".join(lines) + "\n")
if not DRY:
    write_registry()
print("FINAL_OK" if not DRY else "DRY_OK")
