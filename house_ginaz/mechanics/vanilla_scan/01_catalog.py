"""Catalogue vanilla mechanics from mod_files/data.cdb into markdown (read-only).

    python 01_catalog.py   -> writes catalog_factions.md, catalog_abilities.md, catalog_traits.md,
                              catalog_systems.md next to this script.
"""
import os
import re

import scan_lib as L

HERE = os.path.dirname(os.path.abspath(__file__))
d = L.load()
S = L.sheets(d)
A = L.by_id(S["attribute"])
T = L.by_id(S["trait"])
AB = L.by_id(S["ability"])
CH = L.by_id(S["character"])
FA = L.by_id(S["faction"])


def write(name, lines):
    path = os.path.join(HERE, name)
    open(path, "w", encoding="utf-8").write("\n".join(lines) + "\n")
    print(name, len(lines), "lines")


def trait_block(tid, depth=0):
    """Markdown bullets for one trait: name, description, attribute lines, and sub-traits it applies."""
    t = T.get(tid)
    if not t:
        return ["- `%s` (trait not found)" % tid]
    out = ["- **%s** (`%s`)" % (L.name_of(t) or tid, tid)]
    if L.desc_of(t):
        out.append("  - desc: %s" % L.desc_of(t))
    for line in L.attr_lines(t, A):
        out.append("  - " + line)
    return out


# ---------------------------------------------------------------- factions and leaders
fac = ["# Faction identity traits (vanilla)", "",
       "Each faction's always-on traits, its two Hegemony milestones, and the traits of its leader and councilors.",
       "Source: `faction` sheet (`startingTraits`, `hegemonyBonuses`, `characters`) + `character` sheet (`passiveTrait`).", ""]
for fid, f in FA.items():
    if fid in ("TEST", "NoFaction", "Spectator"):
        continue
    fac.append("## %s" % fid)
    props = f.get("props") or {}
    st = [x.get("trait") for x in props.get("startingTraits", []) if x.get("trait")]
    fac.append("**Always-on traits:** " + (", ".join("`%s`" % s for s in st) or "none"))
    fac.append("")
    fac.append("**Starting traits in detail**")
    for s in st:
        fac.extend(trait_block(s))
    fac.append("")
    hb = [x.get("traitBonus") for x in props.get("hegemonyBonuses", []) if x.get("traitBonus")]
    fac.append("**Hegemony milestones:** " + (", ".join("`%s`" % h for h in hb) or "none"))
    for h in hb:
        fac.extend(trait_block(h))
    fac.append("")
    ch = f.get("characters", {}) or {}
    for role in ("leaders", "councilors", "speaker"):
        items = ch.get(role, []) or []
        if isinstance(items, str):
            items = [items]
        for c in items:
            cid = c if isinstance(c, str) else c.get("id") or c.get("character")
            rec = CH.get(cid, {})
            if not cid or (not rec and len(str(cid)) < 3):
                continue
            fac.append("**%s:** %s (%s)" % (role.capitalize(), L.name_of(rec) or cid, rec.get("title", "")))
            if rec.get("desc"):
                fac.append("  - %s" % L.clean(rec["desc"])[:400])
            pt = rec.get("passiveTrait")
            if pt:
                fac.append("  - passive trait:")
                fac.extend("    " + x for x in trait_block(pt))
    fac.append("")
write("catalog_factions.md", fac)

# ---------------------------------------------------------------- abilities
ab = ["# Abilities (vanilla)", "",
      "The `ability` sheet: active abilities and their cost, cooldown and the traits they apply.", ""]
for aid, a in AB.items():
    name = L.name_of(a) or aid
    cd = a.get("cooldowns") or {}
    cost = []
    props = a.get("props") or {}
    if props.get("cost"):
        cost = ["%s" % (c,) for c in props["cost"]] if isinstance(props["cost"], list) else [str(props["cost"])]
    ab.append("## %s (`%s`)" % (name, aid))
    if L.desc_of(a):
        ab.append("- desc: %s" % L.desc_of(a))
    if cost:
        ab.append("- cost: %s" % "; ".join(cost))
    if cd:
        ab.append("- cooldown: %s" % ", ".join("%s=%s" % kv for kv in cd.items()))
    applied = [x.get("trait") for x in a.get("traits", []) or [] if x.get("trait")]
    for tid in applied:
        ab.extend(trait_block(tid))
    ab.append("")
write("catalog_abilities.md", ab)

# ---------------------------------------------------------------- named traits with interesting keywords
KEYS = re.compile(r"duel|challeng|champion|execut|honou?r|parr|dodg|evasi|riposte|counter|mastery|momentum|"
                  r"stack|combo|bleed|rage|frenzy|fury|berserk|blade|sword|rapier|dagger|knife|dash|charge|"
                  r"aura|rally|kanly|feud|rival|vendetta|sacrific|martyr|revenge|kill|execute|sustain|heal|"
                  r"regen|lifesteal|shield|pillar|discipline|ritual|oath|veteran|elite|conscript|fanatic|worm|"
                  r"deep ?desert|spice|water|sandstorm|fremen|ecaz|smuggl|contraband|infiltrat", re.I)
tr = ["# Traits with interesting mechanics (vanilla)", "",
      "Traits whose id, name or description matches combat-style keywords (duel, parry, stacks, aura, champion, "
      "execute, Kanly, desert, etc.). Full list is in the data; this is a curated view.", ""]
hits = []
for tid, t in T.items():
    text = " ".join([tid, L.name_of(t), L.desc_of(t)] + [A.get(a.get("ref", ""), {}).get("desc", "")
                                                       for a in t.get("attributes", []) or []])
    if KEYS.search(text):
        hits.append(tid)
for tid in sorted(hits):
    tr.extend(trait_block(tid))
    tr.append("")
write("catalog_traits.md", tr)
print("keyword trait hits:", len(hits))

# ---------------------------------------------------------------- systems: resolutions, treaties, bonuses, interactions
sy = ["# Game systems (vanilla): Landsraad resolutions, treaties, bonuses, interactions", ""]
sy.append("## Landsraad resolutions")
for rid, r in L.by_id(S["resolution"]).items():
    sy.append("- **%s** (`%s`) %s" % (L.name_of(r) or rid, rid, ("- " + L.desc_of(r)) if L.desc_of(r) else ""))
sy.append("")
sy.append("## Treaties")
for rid, r in L.by_id(S["treaty"]).items():
    sy.append("- **%s** (`%s`) %s" % (L.name_of(r) or rid, rid, ("- " + L.desc_of(r)) if L.desc_of(r) else ""))
sy.append("")
sy.append("## Bonuses (`bonus` sheet, with descriptions)")
for bid, b in L.by_id(S["bonus"]).items():
    if L.desc_of(b) or L.name_of(b) != bid:
        sy.append("- **%s** (`%s`) %s" % (L.name_of(b) or bid, bid, L.desc_of(b)))
sy.append("")
sy.append("## Interactions (operations and agent actions)")
for iid, it in L.by_id(S["interaction"]).items():
    sy.append("- `%s`: %s" % (iid, L.clean(str((it.get("descriptions") or [{}])[0].get("desc", "") if isinstance(it.get("descriptions"), list) and it.get("descriptions") else ""))))
write("catalog_systems.md", sy)
