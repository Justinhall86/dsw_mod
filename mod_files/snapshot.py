"""Working-tree snapshots, so no session can lose another session's uncommitted edits.

Each snapshot is a git commit stored under a hidden ref (refs/snapshots/<time>). It never touches HEAD, the branch,
the index or any file, and it is not pushed (git push only sends branches and tags unless asked). Run automatically
by the Claude Code Stop hook (.claude/settings.json) after every turn; skipped when nothing changed.

What goes in: every tracked file as committed, plus modified/untracked files that hold hand work: text and data
(.py .md .json .fx .prefab .props .cdb ...) and textures under 04_textures/ or 06_game_ready/ (not _archive/,
variants/). Left out: renders, .blend/.fbx/.pak, anything over 20 MB, gitignored files.

    python mod_files/snapshot.py                 take a snapshot (quiet unless something was saved)
    python mod_files/snapshot.py --min-interval 300   same, but only if the newest snapshot is over 300 s old (Stop hook)
    python mod_files/snapshot.py --list [N]      newest snapshots, with the files that changed in each
    python mod_files/snapshot.py --log <file>    every snapshot that holds a different version of <file>
    python mod_files/snapshot.py --get <snap> <file> [out]   write that version to <out> (default <file>.from_<snap>)
    python mod_files/snapshot.py --prune [keep]  delete all but the newest <keep> refs (default 300)
"""
import datetime, os, subprocess, sys, tempfile

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PREFIX = "refs/snapshots/"
TEXT = (".py", ".md", ".json", ".fx", ".prefab", ".props", ".cdb", ".txt", ".css", ".hx", ".yaml", ".yml", ".toml",
        ".js", ".ps1", ".sh", ".bat", ".csv", ".xml", ".ini", ".gitattributes", ".gitignore")
TEX = (".png", ".dds", ".jpg", ".tga")
MAX = 20e6


def git(*a, env=None, inp=None):
    r = subprocess.run(["git", "-c", "core.safecrlf=false", *a], cwd=REPO, env=env, input=inp,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode:
        raise RuntimeError("git %s: %s" % (" ".join(a), r.stderr.strip()[:500]))
    return r.stdout


def wanted(p):
    full = os.path.join(REPO, p)
    if not os.path.isfile(full) or os.path.getsize(full) > MAX:
        return False
    q = "/" + p.replace("\\", "/")
    if q.endswith(TEXT):
        return True
    return q.endswith(TEX) and ("/04_textures/" in q or "/06_game_ready/" in q) and "/_archive/" not in q \
        and "/variants/" not in q


def lfs_paths(paths):
    """paths routed through the LFS filter: skip them (their content lives outside git)."""
    if not paths:
        return set()
    out = git("check-attr", "filter", "--stdin", inp="\n".join(paths) + "\n")
    return {l.split(": filter: ")[0] for l in out.splitlines() if l.endswith(": filter: lfs")}


def refs():
    out = git("for-each-ref", "--sort=-refname", "--format=%(refname) %(objectname) %(tree)", PREFIX)
    return [l.split() for l in out.splitlines() if l.strip()]


def take():
    head = git("rev-parse", "HEAD").strip()
    changed = [p for p in git("ls-files", "-m", "-o", "--exclude-standard", "-z").split("\0") if p]
    keep = [p for p in changed if wanted(p)]
    keep = sorted(set(keep) - lfs_paths(keep))
    deleted = [p for p in git("ls-files", "-d", "-z").split("\0") if p]
    with tempfile.TemporaryDirectory() as td:
        env = dict(os.environ, GIT_INDEX_FILE=os.path.join(td, "index"))
        git("read-tree", "HEAD", env=env)
        for i in range(0, len(keep), 200):
            git("add", "-f", "--", *keep[i:i + 200], env=env)
        for i in range(0, len(deleted), 200):
            git("rm", "--cached", "-q", "--ignore-unmatch", "--", *deleted[i:i + 200], env=env)
        tree = git("write-tree", env=env).strip()
    last = refs()
    if last and last[0][2] == tree:
        return None                                     # nothing new since the last snapshot
    if tree == git("rev-parse", "HEAD^{tree}").strip():
        return None                                     # clean working tree
    stamp = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    msg = "snapshot %s (%d changed files)" % (stamp, len(keep))
    parents = ["-p", last[0][1]] if last else []
    c = git("commit-tree", tree, "-p", head, *parents, "-m", msg).strip()
    git("update-ref", PREFIX + stamp, c)
    return stamp, len(keep)


def files_in(ref, parent_tree):
    out = git("diff", "--name-only", parent_tree, ref)
    return [l for l in out.splitlines() if l]


def main():
    a = sys.argv[1:]
    if not a or a[0] == "--min-interval":
        if a:                                            # throttle: skip if the newest snapshot is younger than N s
            rs = refs()
            if rs:
                t = datetime.datetime.strptime(rs[0][0][len(PREFIX):], "%Y%m%d-%H%M%S")
                if (datetime.datetime.now() - t).total_seconds() < float(a[1]):
                    return
        try:
            r = take()
        except Exception as e:                           # a hook must never block the session
            print("snapshot failed:", e, file=sys.stderr); return
        if r:
            print("snapshot %s saved (%d changed files)" % r)
        return
    if a[0] == "--list":
        n = int(a[1]) if len(a) > 1 else 10
        rs = refs()
        for i, (ref, c, tree) in enumerate(rs[:n]):
            prev = rs[i + 1][2] if i + 1 < len(rs) else "HEAD"
            fs = files_in(c, prev)
            print("%s  %d files: %s" % (ref[len(PREFIX):], len(fs), ", ".join(fs[:6]) + (" ..." if len(fs) > 6 else "")))
    elif a[0] == "--log":
        f = a[1].replace("\\", "/"); seen = None
        for ref, c, _ in refs():
            try:
                blob = git("rev-parse", "%s:%s" % (c, f)).strip()
            except RuntimeError:
                continue
            if blob != seen:
                print(ref[len(PREFIX):], blob[:12]); seen = blob
    elif a[0] == "--get":
        snap, f = a[1], a[2].replace("\\", "/")
        out = a[3] if len(a) > 3 else f + ".from_" + snap
        r = subprocess.run(["git", "show", "%s%s:%s" % (PREFIX, snap, f)], cwd=REPO, capture_output=True)
        if r.returncode:
            sys.exit(r.stderr.decode(errors="replace"))
        open(os.path.join(REPO, out), "wb").write(r.stdout)
        print("wrote", out)
    elif a[0] == "--prune":
        keep = int(a[1]) if len(a) > 1 else 300
        for ref, _, _ in refs()[keep:]:
            git("update-ref", "-d", ref)
        print("kept", min(keep, len(refs())))


if __name__ == "__main__":
    main()
