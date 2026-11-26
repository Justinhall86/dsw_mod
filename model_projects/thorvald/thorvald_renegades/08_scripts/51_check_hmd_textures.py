"""READ ONLY: every texture path inside every custom HMD that stage_and_pack.py ships must load in game: the exact path in the vanilla pak or
staged tree, or (the engine's fallback) a file of that name beside the HMD. A miss makes the unit throw when it spawns."""
import os, re, subprocess, sys
REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", ".."))
P = os.path.join(REPO, "mod_files", "stage_and_pack.py"); src = open(P, encoding="utf-8").read()
ns = {"__file__": P}; exec(src[:src.index("def sha(p)")], ns)
out = subprocess.run([sys.executable, os.path.join(REPO, ".claude/skills/dsw-model-modding/scripts/pak_extract_one.py"),
                      os.path.join(ns["GAME"], "res.compressed.pak"), "--list"], capture_output=True, text=True).stdout
vanilla = {l.split(" ", 1)[1].strip() for l in out.splitlines() if " " in l}
assert len(vanilla) > 1000, "could not list the vanilla pak"
n = bad = 0
for dst, srcs in ns["SOURCES"].items():
    for s in (srcs if isinstance(srcs, list) else [srcs]):
        for root, dirs, files in os.walk(s):
            dirs[:] = [d for d in dirs if d != "_archive"]
            for f in files:
                if not f.lower().endswith(".hmd"): continue
                n += 1
                for m in sorted(set(re.findall(rb"[A-Za-z0-9_ ./-]+?\.(?:png|dds|tga|jpg)", open(os.path.join(root, f), "rb").read()))):
                    t = re.sub(r"^.*?(?=(?:Vehicle|VehMOD|CharMOD|StructMOD|Character|Structure)/)", "", m.decode())
                    base = t.split("/")[-1]; rel = os.path.relpath(root, s).replace("\\", "/")
                    staged = dst + ("" if rel == "." else "/" + rel) + "/" + base
                    if t in vanilla or staged in vanilla or os.path.exists(os.path.join(root, base)): continue
                    if any(os.path.exists(os.path.join(x, *t.split("/")[len(k.split("/")):])) for k, v in ns["SOURCES"].items() if t.startswith(k + "/") for x in (v if isinstance(v, list) else [v])): continue
                    bad += 1; print("MISSING", dst, f, "->", t)
print(n, "HMDs checked,", bad, "missing textures")
