"""READ ONLY: compare what stage_and_pack.py would stage now with the tree staged for the last pak build
(<editor res>/res). Shows whether a rebuild changes anything besides data.cdb (one experiment per build)."""
import fnmatch, hashlib, os
REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", ".."))
P = os.path.join(REPO, "mod_files", "stage_and_pack.py")
src = open(P, encoding="utf-8").read()
ns = {"__file__": P}; exec(src[:src.index("def sha(p)")], ns)
res = os.path.join(ns["ED"], "res")
h = lambda p: hashlib.sha256(open(p, "rb").read()).hexdigest()
diff, seen = [], set()
for dst, srcs in ns["SOURCES"].items():
    for s in (srcs if isinstance(srcs, list) else [srcs]):
        for root, dirs, files in os.walk(s):
            dirs[:] = [d for d in dirs if d != "_archive"]
            for f in files:
                if fnmatch.fnmatch(f, "*.bak*"): continue
                rel = os.path.normpath(os.path.join(dst.replace("/", os.sep), os.path.relpath(os.path.join(root, f), s)))
                seen.add(rel); t = os.path.join(res, rel)
                if not os.path.exists(t): diff.append(("NEW", rel))
                elif h(t) != h(os.path.join(root, f)): diff.append(("CHANGED", rel))
for root, _, files in os.walk(res):
    for f in files:
        rel = os.path.normpath(os.path.relpath(os.path.join(root, f), res))
        if rel != "data.cdb" and rel not in seen: diff.append(("GONE", rel))
print(len(seen), "source files;", len(diff), "asset differences vs the last staged tree")
for d in diff[:40]: print("  ", *d)
print("data.cdb same as last staged:", h(os.path.join(REPO, "mod_files", "data.cdb")) == h(os.path.join(ns["ED"], "data.cdb")))
print("game pak same as last built:", h(os.path.join(ns["GAME"], "res.compressed1.pak")) == h(os.path.join(ns["ED"], "res.compressed1.pak")))
