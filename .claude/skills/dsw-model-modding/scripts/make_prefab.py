#!/usr/bin/env python3
"""Build a unit prefab: a vanilla prefab with its body model swapped for our HMD.

Vanilla unit prefabs hold the body plus weapons/props constrained to bones, e.g.
  Character/Imperial/Sardaukar/Prefab_ImperialSardaukar.prefab
    body  Male01_ImperialSardaukar (fbx)
    SardaukarSword  constrained to  Male01_ImperialSardaukar.B_ROOTJ....B_rWristJ.B_Weapon
Swapping the first "model" child for our HMD and renaming the constraint targets keeps the weapon
in the hand with no extra work. Hidden alternates ("visible": false) are dropped by default.

Usage:
  python make_prefab.py --template Character/Imperial/Sardaukar/Prefab_ImperialSardaukar.prefab \
      --hmd CharMOD/Male01_GinazSwordmaster/Male01_GinazSwordmaster.hmd \
      --out <editor>/res/res/CharMOD/Male01_GinazSwordmaster/Prefab_GinazSwordmaster.prefab
  (--template is resolved against the extracted vanilla assets, <extr>/...)
  --body-only   just our model, no weapons
"""
import argparse
import copy
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_common import cfg  # noqa: E402


def build(template, hmd_res, keep_hidden=False, body_only=False):
    name = os.path.splitext(os.path.basename(hmd_res))[0]
    body = {"type": "model", "name": name, "source": hmd_res}
    if body_only or not template:
        return {"type": "prefab", "children": [body]}
    t = json.load(open(template, encoding="utf-8"))
    kids = t.get("children", [])
    # the body is the model that the weapon constraints hang off (their target starts with "<body>.B_ROOTJ..."),
    # NOT necessarily the first model: Prefab_LandsraadGuard lists the halberd before the body
    prefixes = [c["target"].split(".")[0] for c in kids if c.get("type") == "constraint" and "." in c.get("target", "")]
    first = None
    if prefixes:
        body_name = max(set(prefixes), key=prefixes.count)
        first = next((i for i, c in enumerate(kids) if c.get("type") == "model" and c.get("name") == body_name), None)
    if first is None:
        first = next((i for i, c in enumerate(kids) if c.get("type") == "model"
                      and c.get("name", "").startswith(("Male", "Female"))), None)
    if first is None:
        first = next((i for i, c in enumerate(kids) if c.get("type") == "model"), None)
    if first is None:
        sys.exit("template has no model child")
    old = kids[first]["name"]
    hidden = {c["name"] for c in kids if c.get("type") == "model" and c.get("visible") is False}
    out = []
    for i, c in enumerate(kids):
        if i == first:
            out.append(body)
            continue
        if not keep_hidden and (c.get("name") in hidden or c.get("object") in hidden):
            continue
        c = copy.deepcopy(c)
        if c.get("type") == "constraint" and c.get("target", "").startswith(old + "."):
            c["target"] = name + c["target"][len(old):]
        out.append(c)
    t = dict(t)
    t["children"] = out
    return t


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--template", help="vanilla prefab, relative to the extracted assets or absolute")
    ap.add_argument("--hmd", required=True, help="resource path of our HMD (CharMOD/<Name>/<Name>.hmd)")
    ap.add_argument("--out", required=True)
    ap.add_argument("--keep-hidden", action="store_true")
    ap.add_argument("--body-only", action="store_true")
    a = ap.parse_args()
    tpl = a.template
    if tpl and not os.path.isabs(tpl):
        tpl = os.path.join(cfg("extr_dir"), tpl)
    p = build(tpl, a.hmd.replace("\\", "/"), a.keep_hidden, a.body_only)
    os.makedirs(os.path.dirname(os.path.abspath(a.out)), exist_ok=True)
    with open(a.out, "w", encoding="utf-8", newline="\n") as f:
        json.dump(p, f, indent="\t")
        f.write("\n")
    print("wrote", a.out)
    for c in p["children"]:
        print("  ", c.get("type"), c.get("name"), c.get("source") or c.get("target", ""))


if __name__ == "__main__":
    main()
