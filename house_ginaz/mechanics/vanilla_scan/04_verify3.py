"""Third verification pass + widened scan (read-only). python 04_verify3.py > verify_dump3.txt"""
import json
import scan_lib as L

d = L.load()
S = L.sheets(d)
A = L.by_id(S["attribute"])
T = L.by_id(S["trait"])
BO = L.by_id(S["bonus"])
EQ = L.by_id(S["equipment"])
U = L.by_id(S["unit"])
CH = L.by_id(S["character"])


def tb(tid, indent=""):
    t = T.get(tid)
    if not t:
        print(indent + "- %s: (trait not found)" % tid)
        return
    print("%s- %s [%s] %s" % (indent, tid, L.name_of(t), L.desc_of(t)[:160]))
    for ln in L.attr_lines(t, A):
        print(indent + "    " + ln[:230])
    p = t.get("props") or {}
    extra = {k: p[k] for k in ("stackingLimit", "duration", "onlyForFaction") if k in p}
    if extra:
        print(indent + "    props:", extra)


print("##### CLAIM CHECKS")
for t in ["Harkonnen_HegemonyBonus_1", "Atreides_HegemonyBonus_1", "H_Elite_Trait", "H_Elite_Buff", "H_Hero_2_Trait",
          "H_Hero_2_UnitDeath", "S_Elite_Trait", "F_Elite_Trait", "A_Hero_2_Trait", "A_Hero_2_FactionBuff",
          "A_Hero_2_UnitsBuff_1", "A_Hero_1_Trait", "A_Hero_1_Heroism", "A_Hero_1_GholaWisdom", "F_Hero_1_Trait",
          "TBattlefieldFrenzy", "Brainwashed", "WhitmorePassive", "E_Elite_Trait", "E_Trooper_Trait", "TPricklySpear",
          "TPricklySpear_Debuff", "TKnightlyProtector", "TFrontLineTactics", "Ecaz_PerfectRecruit", "Harkonnen_FactionBonus9"]:
    tb(t)
print("\n-- Jessica / councilor passive")
for cid, c in CH.items():
    if "Jessica" in cid or "Jessica" in L.name_of(c):
        print(cid, L.name_of(c), "passive:", c.get("passiveTrait"))
        if c.get("passiveTrait"):
            tb(c["passiveTrait"], "  ")
print("\n-- Equipment names on Ecaz units")
for uid in [u for u in U if u.startswith("E_")]:
    r = U[uid]
    print(uid, L.name_of(r), "stats", r.get("stats"), "equip", [x.get("ref") for x in r.get("equipment", [])],
          "traits", [x.get("ref") for x in r.get("traits", [])], "squad", (r.get("props") or {}).get("squadSize"))
for e in ["KnightlyProtector", "FrontLineTactics", "PricklySpear", "OffensiveMindset", "CoverTactics", "PranaBindu"]:
    r = EQ.get(e)
    if r:
        print("equip", e, L.name_of(r), "|", L.clean(r.get("desc", ""))[:140], "|", [x.get("ref") for x in r.get("traits", [])])
        for x in r.get("traits", []):
            tb(x.get("ref"), "    ")

print("\n##### WIDENED SCAN: all Conquest bonuses (name, factions, one-line effects)")
KEY = ("champion", "duel", "honor", "honour", "standing", "kill", "execute", "armor", "melee", "vow", "knight", "sword",
       "hegemony", "treaty", "peace", "war", "elite", "hero", "xp", "level", "recruit", "feud", "kanly", "mission")
for bid, b in BO.items():
    p = b.get("props") or {}
    facs = [x.get("ref") for x in (p.get("onlyForFactions") or [])]
    txt = []
    for x in b.get("effects", []) or []:
        txt.append(L.clean(x.get("desc", ""))[:150] or x.get("ref", ""))
    for x in b.get("traits", []) or []:
        tr = T.get(x.get("ref"))
        if tr:
            for a in tr.get("attributes", []) or []:
                ad = L.clean(a.get("desc", "")) or L.clean(A.get(a.get("ref", ""), {}).get("desc", ""))
                txt.append("%s=%s %s" % (a.get("ref"), a.get("val", ""), ad[:110]))
    print("%s | %s | facs=%s | type=%s rarity=%s | %s" % (bid, b.get("name"), facs, p.get("type"), p.get("rarity"),
                                                       " ; ".join(txt)[:420]))
