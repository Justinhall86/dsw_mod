#!/usr/bin/env python3
"""Where the game files and the tool live, plus the two helpers too small to have a home."""
import os
import sys


def _find_root(start):
    # walk upwards until we reach the folder that holds `_claude/`; that one is the project root
    here = start
    while True:
        if os.path.isdir(os.path.join(here, "_claude")):
            return here
        up = os.path.dirname(here)
        # give up at the top of the drive rather than loop forever
        if up == here:
            # inside the packaged app there is no project: the folder holding `!PATCH` stands in
            packed = os.path.dirname(os.path.dirname(start))
            if os.path.isdir(os.path.join(packed, "!PATCH")):
                return packed
            raise SystemExit("no folder above %s holds `_claude/` -- cannot find the project"
                             % start)
        here = up


# resolved by LOOKING, not by counting `..`, so moving this folder does not break it
ROOT = _find_root(os.path.dirname(os.path.abspath(__file__)))

# the tool that reads and rewrites the game file ships inside the project
sys.path.insert(0, os.path.join(ROOT, "lib"))
# ⚠ past the C stack, so too deep dies without a traceback; `D4X_RECURSION=<n>` lowers it
sys.setrecursionlimit(int(os.environ.get("D4X_RECURSION") or 1_000_000))

# the untouched OpenGL loader; every build starts from this and it is never written to
PRISTINE = os.path.join(ROOT, "game", "hlboot.dat")
# the same untouched loader with `reloadPak` in it, which the dressed base was built from
RELOAD = os.path.join(ROOT, "game", "hlboot_reload.dat")
# one folder per build-tab tick, and the helpers several ticks share
SHARED = os.path.join(ROOT, "!PATCH", "shared")
TICKS = sorted(os.path.join(ROOT, "!PATCH", g, t) for g in ("FIXES", "FEATURES")
               for t in os.listdir(os.path.join(ROOT, "!PATCH", g)))
# the copy of the game we deploy into and test against
GAME_DIR = os.path.join(ROOT, "game", "bench")


def on_path():
    for d in [SHARED] + TICKS:
        if d not in sys.path:
            sys.path.insert(0, d)


def gv(x):
    # numbers in the game file arrive wrapped in a small object; this reads the plain value out
    return getattr(x, "value", x)


def remembered(context):
    """A function worked out once per its arguments and `context()`, which says when to forget."""
    def wrap(asked):
        held = {}

        def answer(*args):
            key = (tuple(tuple(a) if isinstance(a, dict) else a for a in args), context())
            if key not in held:
                held[key] = asked(*args)
            return held[key]
        answer.__doc__, answer.__name__ = asked.__doc__, asked.__name__
        return answer
    return wrap


def guard(ok, message):
    # stop the build the moment the game stops having the shape a change relies on
    if not ok:
        raise RuntimeError("GUARD: " + message)
