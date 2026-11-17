"""Overwrite guard for generator scripts: never silently replace a hand edit made by another session.

Every file a generator writes through this module gets its sha256 recorded in mod_files/generated_files.json.
Before the next overwrite the file on disk is checked:
  * unchanged since we wrote it            -> overwrite (after a timestamped backup)
  * changed (someone edited it by hand)    -> STOP with a message naming the file, unless --force / FORCE=1
  * never recorded and git says modified   -> STOP too (uncommitted work of unknown origin)
  * never recorded, clean or new           -> overwrite, then record
Backups go to mod_files/backups/generated/<path with __>.<time> (gitignored; never packed into the game).

Use in a generator:
    sys.path.insert(0, <repo>/mod_files); import safe_write as SW
    SW.write_text(path, text)            # or SW.write_bytes(path, data) / SW.write_json(path, obj, indent="\t")
    SW.check(path); <your own writer>; SW.record(path)     # when a library writes the file itself
    SW.check_dir(folder)                 # before a script empties a whole output folder
Command line:
    python mod_files/safe_write.py --status [path ...]   which recorded files were edited since they were generated
    python mod_files/safe_write.py --accept <path>        record the current file as the generator's (after a review)
"""
import datetime, hashlib, json, os, shutil, subprocess, sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REG = os.path.join(REPO, "mod_files", "generated_files.json")
BK = os.path.join(REPO, "mod_files", "backups", "generated")
FORCE = "--force" in sys.argv or os.environ.get("FORCE") == "1"


class HandEditError(RuntimeError):
    pass


def _rel(path):
    return os.path.relpath(os.path.abspath(path), REPO).replace("\\", "/")


def _sha(path):
    return hashlib.sha256(open(path, "rb").read()).hexdigest()


def _load():
    try:
        return json.load(open(REG, encoding="utf-8"))
    except (OSError, ValueError):
        return {}


def _save(reg):
    tmp = REG + ".tmp"
    with open(tmp, "w", encoding="utf-8", newline="\n") as f:
        json.dump(dict(sorted(reg.items())), f, indent=1)
    os.replace(tmp, REG)


def _git_modified(rel):
    try:
        out = subprocess.run(["git", "status", "--porcelain", "--", rel], cwd=REPO, capture_output=True, text=True)
        return out.stdout.strip().startswith(("M", " M", "MM", "AM"))
    except OSError:
        return False


def check(path, force=None):
    """Raise HandEditError if <path> holds an edit we did not write. Backs the file up when it will be replaced."""
    force = FORCE if force is None else force
    if not os.path.isfile(path):
        return
    rel, reg = _rel(path), _load()
    cur = _sha(path)
    rec = reg.get(rel, {}).get("sha256")
    if rec is not None and rec != cur:
        why = "it was edited after the generator last wrote it (%s)" % reg[rel].get("time", "?")
    elif rec is None and _git_modified(rel):
        why = "it has uncommitted changes and no generator record"
    else:
        why = None
    if why and not force:
        raise HandEditError(
            "REFUSING to overwrite %s: %s.\n  Look at the change (git diff / python mod_files/snapshot.py --log %s),"
            " move it into the generator script, then rerun with --force (or FORCE=1), or run\n"
            "  python mod_files/safe_write.py --accept %s   if the current file is fine to replace." % (rel, why, rel, rel))
    os.makedirs(BK, exist_ok=True)
    stamp = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    shutil.copy2(path, os.path.join(BK, rel.replace("/", "__") + "." + stamp))
    if why:
        print("safe_write: --force given, replacing hand-edited %s (backup in mod_files/backups/generated/)" % rel)


def record(path, by=None):
    reg = _load()
    reg[_rel(path)] = {"sha256": _sha(path), "time": datetime.datetime.now().isoformat(timespec="seconds"),
                       "by": by or os.path.basename(sys.argv[0])}
    _save(reg)


def check_dir(folder, force=None):
    """check() every file in <folder> (recursively) before a script deletes or rewrites the folder."""
    if not os.path.isdir(folder):
        return
    errors = []
    for root, _, files in os.walk(folder):
        for f in files:
            try:
                check(os.path.join(root, f), force)
            except HandEditError as e:
                errors.append(str(e).splitlines()[0])
    if errors:
        raise HandEditError("\n".join(errors) + "\n  (rerun with --force / FORCE=1 to replace them; backups are kept)")


def record_dir(folder, by=None):
    for root, _, files in os.walk(folder):
        for f in files:
            record(os.path.join(root, f), by)


def write_bytes(path, data, force=None, by=None):
    check(path, force)
    os.makedirs(os.path.dirname(os.path.abspath(path)), exist_ok=True)
    with open(path, "wb") as f:
        f.write(data)
    record(path, by)


def write_text(path, text, force=None, by=None, newline="\n"):
    write_bytes(path, text.replace("\n", newline).encode("utf-8"), force, by)


def write_json(path, obj, force=None, by=None, **kw):
    write_text(path, json.dumps(obj, **kw) + "\n", force, by)


if __name__ == "__main__":
    a = sys.argv[1:]
    reg = _load()
    if a and a[0] == "--accept":
        for p in a[1:]:
            record(p, "accepted by hand"); print("recorded", _rel(p))
    else:
        want = {_rel(p) for p in a[1:]} if len(a) > 1 else None
        n = 0
        for rel, r in sorted(reg.items()):
            if want and rel not in want:
                continue
            full = os.path.join(REPO, rel)
            state = "missing" if not os.path.isfile(full) else ("ok" if _sha(full) == r["sha256"] else "EDITED")
            if state != "ok" or want:
                print("%-7s %s  (generated %s by %s)" % (state, rel, r.get("time"), r.get("by"))); n += 1
        print("%d recorded files, %d shown" % (len(reg), n))
