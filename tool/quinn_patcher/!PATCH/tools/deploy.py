#!/usr/bin/env python3
"""Write the built OpenGL game file out, and install it (on the dressed profile when present)."""
import os
import shutil
import threading

from tools.project import ROOT, GAME_DIR


def _name_a_bad_operand(bc):
    """Refuse a file whose instructions carry TEXT where a number belongs, naming the first one."""
    said = []
    for fn in getattr(bc, "functions", None) or []:
        for at, op in enumerate(getattr(fn, "ops", None) or []):
            for name, held in (getattr(op, "df", None) or {}).items():
                value = getattr(held, "value", held)
                if isinstance(value, str):
                    said.append("f@%s op%d `%s` holds the text %r, not a number"
                                % (getattr(getattr(fn, "findex", None), "value",
                                           getattr(fn, "findex", "?")), at, name, value[:60]))
                    if len(said) >= 8:
                        break
            if len(said) >= 8:
                break
        if len(said) >= 8:
            break
    if said:
        raise RuntimeError("THE FILE WOULD NOT SERIALISE -- %d instruction operand(s) hold text:"
                           "\n    " % len(said) + "\n    ".join(said))


def save(bc, path):
    """Write the game code we are holding out to `path`, and return how many bytes that was."""
    _name_a_bad_operand(bc)
    result = {}

    def write_it():
        # the tool spells this either way depending on its build; try both before giving up
        try:
            for name in ("serialise", "serialize"):
                fn = getattr(bc, name, None)
                if callable(fn):
                    result["bytes"] = fn()
                    return
            raise RuntimeError("the tool has neither serialise nor serialize")
        except BaseException as e:
            result["error"] = e

    # writing walks the whole game deeply enough to overflow a normal stack, so give it a big one
    try:
        threading.stack_size(256 * 1024 * 1024)
    except (ValueError, OSError):
        pass
    worker = threading.Thread(target=write_it)
    worker.start()
    worker.join()
    if "error" in result:
        raise result["error"]

    with open(path, "wb") as out:
        out.write(result["bytes"])
    return len(result["bytes"])


def install(src, game_dir=GAME_DIR):
    """Copy a built file over the game's own, so the next launch loads it."""
    if not os.path.isdir(game_dir):
        print("INSTALL SKIPPED -- no game folder at %s" % game_dir)
        return False
    dst = os.path.join(game_dir, "hlboot.dat")
    # keep one copy of whatever was installed the very first time, before we ever wrote there
    first_seen = os.path.join(ROOT, "game", "backup", "hlboot_gamedir_first_seen.dat")
    try:
        os.makedirs(os.path.dirname(first_seen), exist_ok=True)
    except Exception:
        pass
    if os.path.exists(dst) and not os.path.exists(first_seen):
        shutil.copy2(dst, first_seen)
        print("first-run snapshot of the installed file -> %s" % first_seen)
    shutil.copy2(src, dst)
    print("INSTALLED -> %s (%d bytes)" % (dst, os.path.getsize(dst)))
    return True


# the dressed-up versions of the game file, best first; each is tried until one builds
_PROFILE_PLACES = (
    ("modder", ("game/profiles/modder/hlboot.dat", "dist/builds/modder/hlboot.dat")),
    ("general", ("game/profiles/general/hlboot.dat", "dist/builds/general/hlboot.dat")),
)


def profiles():
    """Every dressed-up game file present, as (name, path), best first."""
    found = []
    for name, places in _PROFILE_PLACES:
        for place in places:
            path = os.path.join(ROOT, *place.split("/"))
            if os.path.exists(path):
                found.append((name, path))
                break
    return found
