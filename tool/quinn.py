#!/usr/bin/env python3
"""Run Quinn's patch features from source, without the patcher's exe.

  python tool/quinn.py list
  python tool/quinn.py about resource_trades
  python tool/quinn.py build --base <hlboot.dat> --ticks resource_trades --out <file>
  python tool/quinn.py install --built <file> --game <D4X folder>

`build` only writes --out. It leaves out build.py's test-bench changes, which alter how the game
plays and are not for real installs. `install` is the only command that touches the game folder,
and it keeps a backup first. Run tool/unpack_quinn.py once before anything else.
"""
import argparse
import hashlib
import json
import os
import shutil
import sys
import threading
import time
import traceback
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, "quinn_patcher")
PATCH = os.path.join(ROOT, "!PATCH")
WHEEL = os.path.join(HERE, "crashlink-0.0.9-py3-none-any.whl")


def ticks():
    for group in ("FEATURES", "FIXES"):
        for name in sorted(os.listdir(os.path.join(PATCH, group))):
            yield group, name, os.path.join(PATCH, group, name)


def about(folder):
    path = os.path.join(folder, "feature_description.txt")
    if not os.path.exists(path):
        return ""
    with open(path, encoding="utf-8") as f:
        return f.read().strip()


def cmd_list(_):
    for group, name, folder in ticks():
        line = next((l for l in about(folder).splitlines() if l.startswith("about:")), "about:")
        print("%-9s %-28s %s" % (group, name, line[6:].strip()))


def cmd_about(args):
    for _, name, folder in ticks():
        if name == args.tick:
            print(about(folder))
            return
    raise SystemExit("no tick named %s" % args.tick)


def ensure_lib():
    """crashlink goes where the patch's own project.py looks for it."""
    lib = os.path.join(ROOT, "lib")
    if not os.path.isdir(os.path.join(lib, "crashlink")):
        with zipfile.ZipFile(WHEEL) as z:
            z.extractall(lib)


def run_build(args, result):
    os.chdir(PATCH)
    sys.path.insert(0, PATCH)
    from tools.project import on_path
    on_path()
    from crashlink import Bytecode
    from tools import deploy, ticks as tick_lists

    started = time.time()
    bc = Bytecode.from_path(args.base)
    print("read %s in %.0fs" % (args.base, time.time() - started), flush=True)
    wanted = args.ticks
    for what, apply_to in tick_lists.changes(wanted) + tick_lists.changes(wanted, "LAST"):
        print("  [%s]\n    %s" % (what, apply_to(bc)), flush=True)
    result["bytes"] = deploy.save(bc, args.out)


def cmd_build(args):
    ensure_lib()
    args.base, args.out = os.path.abspath(args.base), os.path.abspath(args.out)
    if os.path.normcase(args.base) == os.path.normcase(args.out):
        raise SystemExit("--out must differ from --base")
    result = {}

    def guarded():
        try:
            run_build(args, result)
        except BaseException:
            result["error"] = traceback.format_exc()

    # reading and writing the game walks deeper than a normal stack allows
    threading.stack_size(255 * 1024 * 1024)  # 256 MB is refused on Windows
    worker = threading.Thread(target=guarded)
    worker.start()
    worker.join()
    if "error" in result:
        print(result["error"], file=sys.stderr)
        raise SystemExit(1)
    print("wrote %d bytes -> %s" % (result["bytes"], args.out))
    with open(args.out + ".base.json", "w", encoding="utf-8") as f:
        json.dump({"file": os.path.basename(args.base), "sha1": sha1(args.base),
                   "ticks": args.ticks}, f, indent=2)


def sha1(path):
    with open(path, "rb") as f:
        return hashlib.sha1(f.read()).hexdigest()


def cmd_install(args):
    with open(args.built + ".base.json", encoding="utf-8") as f:
        base = json.load(f)
    dst = os.path.join(args.game, base["file"])
    if not os.path.exists(dst):
        raise SystemExit("no %s in %s" % (base["file"], args.game))
    # a patch built from another game version must not replace this one's code
    if sha1(dst) != base["sha1"]:
        raise SystemExit("%s in the game is not the file this was built from. The game has been "
                         "updated, or is already patched: rebuild from an unpatched copy."
                         % base["file"])
    keep = os.path.join(HERE, "hlboot_backups")
    os.makedirs(keep, exist_ok=True)
    backup = os.path.join(keep, "hlboot_%s_%s.dat" % (time.strftime("%Y%m%d_%H%M%S"), sha1(dst)[:10]))
    shutil.copy2(dst, backup)
    shutil.copy2(args.built, dst)
    if sha1(args.built) != sha1(dst):
        shutil.copy2(backup, dst)
        raise SystemExit("the installed copy did not match: the original was put back")
    print("backup: %s\ninstalled: %s" % (backup, dst))


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    sub = ap.add_subparsers(dest="command", required=True)
    sub.add_parser("list").set_defaults(run=cmd_list)
    p = sub.add_parser("about")
    p.add_argument("tick")
    p.set_defaults(run=cmd_about)
    p = sub.add_parser("build")
    p.add_argument("--base", required=True, help="an hlboot.dat to start from; it is only read")
    p.add_argument("--ticks", required=True, help="comma-separated tick folders")
    p.add_argument("--out", required=True)
    p.set_defaults(run=cmd_build)
    p = sub.add_parser("install")
    p.add_argument("--built", required=True)
    p.add_argument("--game", required=True)
    p.set_defaults(run=cmd_install)
    args = ap.parse_args()
    args.run(args)


if __name__ == "__main__":
    main()
