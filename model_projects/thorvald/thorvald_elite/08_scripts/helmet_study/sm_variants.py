"""Samurai pass (2026-11-15): every Heavy Vanguard helmet variant as a recipe of wd_build.py settings, built and posed for the lineup.
    python sm_variants.py [TAG ...]       (no TAG = all; env JOBS=3 parallel Blender runs, LINEUP=0 skips the posed renders)
Builds 03_blender/helmet_study/wd_<TAG>.blend, renders gallery/helmets_and_heads/warden_study/<TAG>/ and the lineup poses
gallery/helmets_and_heads/warden_study/samurai/lineup/<TAG>_{front,tq,back}.png. Paints come from sm_recolour.py (SM_*.png)."""
import os, sys, subprocess
from concurrent.futures import ThreadPoolExecutor
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P

T = P.WORK + "/warden/"
BASE = dict(FIT_SCALE="1.25", VIEWS="front,tq_right,side_left,back,top")
SH = dict(SHIKORO="1", SH_SCALE="0.7", SH_RIN="0.6", SH_SZ="2.2", SH_TILT="10", SH_FRONT="75", SH_DZ="0.09")
BLADE = dict(ANT_W="2.2", ANT_T="0.6")
V_CROWN = dict(ANT_SCALE="1.05", ANT_ROLL="14", ANT_X="0.055", **BLADE)                       # kuwagata V from the crown
V_FRONT = dict(ANT_SCALE="1.05", ANT_ROLL="12", ANT_X="0.04", ANT_Y="-0.07", ANT_TILT="-15", **BLADE)  # kuwagata V from the brow
CRESCENT = dict(ANT_SCALE="1.1", ANT_W="2.5", ANT_T="0.6", ANT_ROLL="45", ANT_X="0.02", ANT_Y="-0.07", ANT_TILT="-10")
GM, BLK, CU, OX = "3A4247", "1A1C1D", "B87333", "5A1E1E"
LABEL = {}


def V(tag, label, tex, **kw):
    LABEL[tag] = label
    return tag, dict(BASE, TEX=T + "SM_%s.png" % tex, **kw)


VARIANTS = dict([
    V("S01_kabuto_V", "Kuwagata V (flat blades) from the crown, gunmetal; eye slit + copper brow line; kasa shikoro; painted lames",
      "slit_brow_lames", ANT_COLOR=GM, **V_CROWN, **SH),
    V("S02_kabuto_V_front", "Kuwagata V from the top of the brow (bases apart), gunmetal; rest as S01", "slit_brow_lames",
      ANT_COLOR=GM, **V_FRONT, **SH),
    V("S03_crescent", "Wide crescent (mikazuki) crest from the brow, gunmetal; rest as S01", "slit_brow_lames", ANT_COLOR=GM, **CRESCENT, **SH),
    V("S04_crescent_copper", "S03 with a copper crescent", "slit_brow_lames", ANT_COLOR=CU, **CRESCENT, **SH),
    V("S05_crescent_black_oxmask", "Black-lacquer crescent, oxblood mempo (breather), plain crown", "slit_brow_lames_plain",
      ANT_COLOR=BLK, MASK_TINT=OX, MASK_TINT_K="1.3", **CRESCENT, **SH),
    V("S06_tall_horns", "Long thin horns (owner's antennae, 120 %) splayed 18 deg from the crown, gunmetal; rest as S01", "slit_brow_lames",
      ANT_SCALE="1.2", ANT_ROLL="18", ANT_X="0.05", ANT_W="1.3", ANT_T="0.8", ANT_COLOR=GM, **SH),
    V("S07_no_crest", "No horns: plain kabuto (slit, brow, shikoro, lames) for reference", "slit_brow_lames", ANT="0", **SH),
    V("S08_V_no_shikoro", "S01 without the shikoro: what the neck guard adds", "slit_brow_lames", ANT_COLOR=GM, **V_CROWN),
    V("S09_full_visor", "S03 with W5's full smoked visor instead of the slit: what the slit adds", "full_lames", ANT_COLOR=GM, **CRESCENT, **SH),
    V("S10_V_copper", "S01 with copper kuwagata", "slit_brow_lames", ANT_COLOR=CU, **V_CROWN, **SH),
    V("S11_V_oxmask", "S01 with an oxblood mempo", "slit_brow_lames", ANT_COLOR=GM, MASK_TINT=OX, MASK_TINT_K="1.3", **V_CROWN, **SH),
    V("S12_long_thin_copper", "Closest to W5c: thin antennae lengthened to 120 % and splayed, copper; with slit + shikoro", "slit_brow_lames",
      ANT_SCALE="1.2", ANT_ROLL="18", ANT_X="0.05", ANT_COLOR=CU, **SH),
])

# ---- round 2 (after the owner's reference pictures: smooth lacquered dome, very long thin black kuwagata in a narrow V from the brow,
#      a dense sunburst of spikes round the back of the head, flat-sided neck guard). Base: the Sworn Sword 2.1 dome, plume off.
DOME_BASE = dict(HELMET="ss", FIT_SCALE="1", VIEWS="front,tq_right,side_left,back,top")
SH2 = dict(SHIKORO="1", SH_SCALE="0.72", SH_RIN="0.6", SH_SZ="2.2", SH_TILT="8", SH_FRONT="70", SH_DZ="0.01")
SH2_STEEP = dict(SH2, SH_SZ="3.2", SH_SCALE="0.66", SH_FRONT="62")
HORN2 = dict(ANT_SCALE="1.55", ANT_W="0.75", ANT_T="0.75", ANT_ROLL="-8", ANT_X="0.034", ANT_Y="-0.10", ANT_TILT="-14")
HALO2 = dict(HALO="35", HALO_LEN="0.075", HALO_R="0.12", HALO_ARC="95", HALO_DY="0.05", HALO_TILT="15")


def D(tag, label, **kw):
    LABEL[tag] = label
    return tag, dict(DOME_BASE, **kw)


VARIANTS.update(dict([
    D("D01_ref_kabuto", "Reference match: Sworn dome (no plume), black kuwagata from the brow, spike halo, kasa shikoro", ANT_COLOR=BLK, **HORN2, **SH2, **HALO2),
    D("D02_no_halo", "D01 without the halo", ANT_COLOR=BLK, **HORN2, **SH2),
    D("D03_no_shikoro", "D01 without the shikoro", ANT_COLOR=BLK, **HORN2, **HALO2),
    D("D04_copper_horns", "D01 with copper kuwagata (halo stays black)", ANT_COLOR=CU, HALO_COLOR=BLK, **HORN2, **SH2, **HALO2),
    D("D05_copper_halo", "D01 with a copper halo (horns black)", ANT_COLOR=BLK, HALO_COLOR=CU, **HORN2, **SH2, **HALO2),
    D("D06_long_straight", "Horns 185 % and straighter (rolled in 12 deg), steep flat-sided shikoro", ANT_COLOR=BLK,
      **dict(HORN2, ANT_SCALE="1.85", ANT_ROLL="-12", ANT_W="0.7", ANT_T="0.7"), **SH2_STEEP, **HALO2),
    D("D07_crescent", "Dome + wide gunmetal crescent (mikazuki) + shikoro, no halo", ANT_COLOR=GM,
      **dict(CRESCENT, ANT_Y="-0.10"), **SH2),
    D("D08_plume_asis", "Owner's question: the Sworn Sword 2.1 helmet unchanged (plume on) on the Vanguard", ANT="0", SS_SOCKET="keep", SS_TAIL="1"),
    D("D09_plume_horns", "Sworn helmet with plume + black kuwagata + shikoro (no halo)", ANT_COLOR=BLK, SS_SOCKET="keep", SS_TAIL="1", **HORN2, **SH2),
    D("D10_full_halo", "D01 with a fuller halo (49 spikes, 120 deg each side, longer)", ANT_COLOR=BLK, **HORN2, **SH2,
      **dict(HALO2, HALO="49", HALO_ARC="120", HALO_LEN="0.09")),
]))

# ---- round 3: refinements of D01 (bases apart, no centre spike) and the RTS-readability question
VARIANTS.update(dict([
    D("E01_kabuto", "D01 refined: horn bases apart (no X), halo gap at the top", ANT_COLOR=BLK, **HORN2, **SH2, **HALO2),
    D("E02_blade_horns", "E01 with flat blade horns (wider face, thinner edge): reads better at RTS zoom", ANT_COLOR=BLK,
      **dict(HORN2, ANT_W="1.5", ANT_T="0.5"), **SH2, **HALO2),
    D("E03_gunmetal", "E01 with gunmetal horns and halo (lighter than black)", ANT_COLOR=GM, **HORN2, **SH2, **HALO2),
    D("E04_crescent_halo", "Narrower black crescent (30 deg) from the brow + halo", ANT_COLOR=BLK,
      **dict(CRESCENT, ANT_Y="-0.10", ANT_ROLL="30", ANT_SCALE="1.25", ANT_W="1.8"), **SH2, **HALO2),
    D("E05_short_halo_tall", "E01 with shorter, tighter halo and 170 % horns", ANT_COLOR=BLK, **dict(HORN2, ANT_SCALE="1.7"), **SH2,
      **dict(HALO2, HALO="41", HALO_LEN="0.06", HALO_R="0.125")),
    D("E06_no_badge", "E01 without the gear badge (horns rise straight from the dome)", ANT_COLOR=BLK, SS_BADGE="0", **HORN2, **SH2, **HALO2),
]))

# ---- round 4: the dome is the Sworn Sword's head size and looks small on the bulky Vanguard -> 12 % bigger hachi (and shikoro)
BIG = dict(FIT_SCALE="1.12")
SH2_BIG = dict(SH2, SH_SCALE="0.8", SH_DZ="0.025")
HALO2_BIG = dict(HALO2, HALO_R="0.135", HALO_LEN="0.085")
VARIANTS.update(dict([
    D("F01_big_kabuto", "E01 with a 12 % bigger dome and shikoro (fits the Vanguard's bulk)", ANT_COLOR=BLK, **BIG, **HORN2, **SH2_BIG, **HALO2_BIG),
    D("F02_big_blade", "F01 with flat blade horns", ANT_COLOR=BLK, **BIG, **dict(HORN2, ANT_W="1.5", ANT_T="0.5"), **SH2_BIG, **HALO2_BIG),
    D("F03_big_no_halo", "F01 without the halo (cleanest game read)", ANT_COLOR=BLK, **BIG, **HORN2, **SH2_BIG),
    D("F04_big_copper_halo", "F01 with a copper halo: the faction's copper ring behind the head", ANT_COLOR=BLK, HALO_COLOR=CU, **BIG, **HORN2, **SH2_BIG, **HALO2_BIG),
]))


def run(tag):
    env = dict(os.environ, TAG=tag, **VARIANTS[tag])
    r = subprocess.run([P.BLENDER, "-b", P.ELITE + "/03_blender/v2_final.blend", "--python", os.path.dirname(os.path.abspath(__file__)) + "/wd_build.py"],
                       env=env, capture_output=True, text=True)
    ok = "DONE" in r.stdout
    if ok and os.environ.get("LINEUP", "1") == "1":
        os.makedirs(P.GAL + "/warden_study/samurai/lineup", exist_ok=True)
        r2 = subprocess.run([P.BLENDER, "-b", P.ELITE + "/03_blender/helmet_study/wd_%s.blend" % tag, "--python",
                             os.path.dirname(os.path.abspath(__file__)) + "/wd_lineup.py", "--", P.GAL + "/warden_study/samurai/lineup/" + tag],
                            capture_output=True, text=True, env=dict(os.environ, LPAD="1.55"))
        ok = "OK" in r2.stdout
    print(tag, "ok" if ok else "FAILED\n" + r.stdout[-1500:] + r.stderr[-800:], flush=True)


def sheet(out, title, tags, cols=None):
    env = dict(os.environ)
    if cols:
        env["COLS"] = cols
    G = P.GAL + "/warden_study/"
    for t in tags:     # posed lineup crops next to the helmet renders
        for v in ("tq", "front"):
            src = G + "samurai/lineup/%s_%s.png" % (t, v)
            if os.path.exists(src):
                import shutil
                shutil.copy(src, G + "%s/lineup_%s.png" % (t, v))
    subprocess.run([sys.executable, os.path.dirname(os.path.abspath(__file__)) + "/sm_sheet.py", out, title] + ["%s=%s" % (t, LABEL[t]) for t in tags], env=env)


if __name__ == "__main__":
    if sys.argv[1:2] == ["--sheet"]:
        out, title = sys.argv[2], sys.argv[3]
        sheet(out, title, sys.argv[4:], "helmet_front,helmet_tq_right,helmet_side_left,helmet_back,lineup_tq,lineup_front,rts_a")
        sys.exit()
    tags = sys.argv[1:] or list(VARIANTS)
    with ThreadPoolExecutor(int(os.environ.get("JOBS", "3"))) as ex:
        list(ex.map(run, tags))
