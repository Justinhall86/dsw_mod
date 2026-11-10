"""Build (and optionally install) the game's hlboot.dat from a vanilla copy: our Renegades patches + chosen engine features.

  py -3.14 mod_files/hlboot_build.py                      # build only; features = whatever the cdb needs (hlboot_builds.json)
  py -3.14 mod_files/hlboot_build.py --features resource_trades,keybinds
  py -3.14 mod_files/hlboot_build.py --install            # also copy it into the game (backs the old file up to pak_archive/)

Steps: vanilla copy -> 30 drop timer -> 31 keep-first-threshold -> features from tool/quinn.py (ticks from Quinn's patcher source)
-> sha256 recorded in mod_files/hlboot_builds.json. Writes only mod_files/hlboot_build_out/ unless --install.
The base must be a registered vanilla build (or a registered patched one, whose vanilla is read from pak_archive/).
Pass --allow-unregistered for a game update that has no registry line yet: the patches still look functions up by name and
refuse a layout they do not recognise. Needs Python 3.14 (tool/unpack_quinn.py has run once: `py -3.14 tool/unpack_quinn.py`).
"""
import argparse
import hashlib
import json
import os
import shutil
import subprocess
import sys
import time

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REG = os.path.join(REPO, "mod_files", "hlboot_builds.json")
OUT = os.path.join(REPO, "mod_files", "hlboot_build_out")
ARCHIVE = os.path.join(REPO, "pak_archive")
RENEG = os.path.join(REPO, "model_projects", "thorvald", "thorvald_renegades", "08_scripts")
PATCHES = ("30_patch_hlboot_drop_timer.py", "31_patch_hlboot_keep_first_threshold.py")
CDB = os.path.join(REPO, "mod_files", "data.cdb")


def game_dir():
    for g in (os.environ.get("D4X_GAME"), r"C:\Program Files (x86)\Steam\steamapps\common\D4X", r"D:\Steam\steamapps\common\D4X"):
        if g and os.path.exists(os.path.join(g, "hlboot.dat")):
            return g
    sys.exit("game folder not found: set D4X_GAME or pass --game")


def sha(p):
    with open(p, "rb") as f:
        return hashlib.sha256(f.read()).hexdigest()[:16]


def run(cmd, env=None):
    print("  $", " ".join(os.path.basename(c) if os.path.exists(c) else c for c in cmd), flush=True)
    r = subprocess.run(cmd, env=env, text=True, capture_output=True)
    sys.stdout.write("".join("    " + l + "\n" for l in (r.stdout + r.stderr).splitlines() if "it/s" not in l))
    return r.returncode


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--game")
    ap.add_argument("--base", help="vanilla hlboot.dat to start from (default: the game's, or its registered vanilla)")
    ap.add_argument("--features", help="comma-separated Quinn ticks (default: what data.cdb needs)")
    ap.add_argument("--no-renegades", action="store_true", help="skip patches 30 and 31")
    ap.add_argument("--allow-unregistered", action="store_true")
    ap.add_argument("--install", action="store_true", help="copy the result into the game folder")
    a = ap.parse_args()
    if sys.version_info < (3, 14):
        sys.exit("run with Python 3.14: py -3.14 mod_files/hlboot_build.py ...")

    game = a.game or game_dir()
    reg = json.load(open(REG, encoding="utf-8"))
    base = a.base or os.path.join(game, "hlboot.dat")
    h = sha(base)
    known = reg["builds"].get(h)
    if known and known["role"] == "patched":
        van = os.path.join(ARCHIVE, "hlboot_vanilla_%s.dat" % known["from"])
        if not os.path.exists(van):
            sys.exit("%s is patched (%s) and its vanilla %s is not in pak_archive/" % (base, known["desc"], van))
        print("base %s is a registered patched build; starting from its vanilla %s" % (h, known["from"]))
        base, h = van, known["from"]
    elif known is None and not a.allow_unregistered:
        sys.exit("hlboot sha %s is not in mod_files/hlboot_builds.json. A new game build? Check it is unpatched, then add\n"
                 "it as role=vanilla or pass --allow-unregistered." % h)
    print("base: %s  sha %s  %s" % (base, h, (reg["builds"].get(h) or {}).get("desc", "unregistered")))

    # default: what data.cdb needs (needs_patch) + the registry's "always" list (features with no cdb trigger, e.g.
    # faction_styles, which reads UI/Styles/factions/<id>.css for Thorvald's select card and banners)
    feats = a.features.split(",") if a.features else sorted(
        {t for k, t in reg["needs_patch"].items() if k in open(CDB, encoding="utf-8").read()} | set(reg.get("always", [])))
    print("features:", feats or "none", "| renegades patches:", "no" if a.no_renegades else "yes")

    os.makedirs(OUT, exist_ok=True)
    work = os.path.join(OUT, "hlboot.dat")
    shutil.copy2(base, work)
    env = dict(os.environ, HLBOOT_DAT=work)
    if not a.no_renegades:
        for p in PATCHES:
            if run([sys.executable, os.path.join(RENEG, p), "--apply"], env) != 0:
                sys.exit("patch %s failed; nothing installed" % p)
    if feats:
        tmp = os.path.join(OUT, "with_features.dat")
        if run([sys.executable, os.path.join(REPO, "tool", "quinn.py"), "build", "--base", work, "--ticks", ",".join(feats), "--out", tmp]) != 0:
            sys.exit("feature build failed; nothing installed")
        shutil.move(tmp, work)
        for ext in (".base.json",):
            if os.path.exists(tmp + ext):
                os.remove(tmp + ext)
    out = sha(work)
    reg["builds"][out] = {"role": "patched", "from": h, "features": feats, "renegades": not a.no_renegades,
                          "built": time.strftime("%Y-%m-%d"), "desc": "built by hlboot_build.py"}
    json.dump(reg, open(REG, "w", encoding="utf-8"), indent=2)
    print("built %s  sha %s  -> registered" % (work, out))

    if not a.install:
        print("not installed (add --install)")
        return
    dst = os.path.join(game, "hlboot.dat")
    cur = sha(dst)
    if cur != h and cur not in reg["builds"]:
        sys.exit("the game's hlboot (%s) is neither the base nor a registered build; refusing to overwrite it" % cur)
    os.makedirs(ARCHIVE, exist_ok=True)
    bk = os.path.join(ARCHIVE, "hlboot_game_%s.dat" % cur)
    if not os.path.exists(bk):
        shutil.copy2(dst, bk)
    shutil.copy2(work, dst)
    assert sha(dst) == out
    print("installed %s (previous kept as %s)" % (dst, bk))


if __name__ == "__main__":
    main()
