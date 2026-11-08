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
         "02_progress_photos/01_versions/stills/v13_flat_chest_compare.png"]),
    "thorvald/thorvald_ranged": (
        "v2 (R5)", "Iron Ranger: no pauldrons, ochre plate, bicep wrap, Soldier legs, back pouches; library sniper.",
        ["02_progress_photos/04_boots_pouches/Thorvald_Ranged_v2.gif", "02_progress_photos/04_boots_pouches/v2_tq.png",
         "02_progress_photos/04_boots_pouches/v2_front.png", "02_progress_photos/04_boots_pouches/v2_back.png",
         "02_progress_photos/04_boots_pouches/v2_side.png", "02_progress_photos/04_boots_pouches/v2_closeup.png",
         "02_progress_photos/04_boots_pouches/R5_sheet.png"]),
    "thorvald/thorvald_demolition": (
        "v2 (D2)", "Iron Guard: bicep wrap, belt pouches + canisters, copper pauldron rims, armoured shins; library bazooka.",
        ["02_progress_photos/03_d2/Thorvald_Demolition_v2.gif", "02_progress_photos/03_d2/D2_tq.png",
         "02_progress_photos/03_d2/D2_side.png", "02_progress_photos/03_d2/v2_compare.png",
         "02_progress_photos/03_variants/D2_Demolition_front.png", "02_progress_photos/03_variants/D2_Demolition_back.png",
         "02_progress_photos/03_variants/D2_Demolition_head.png"]),
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
    with open(os.path.join(fdir, "README.md"), "w", encoding="utf-8", newline="\n") as fh:
        fh.write("\n".join(lines) + "\n")
print("FINAL_OK" if not DRY else "DRY_OK")
