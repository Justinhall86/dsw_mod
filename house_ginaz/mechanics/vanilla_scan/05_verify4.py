"""Fourth pass: values behind remaining claims + Ecaz Fencer + every Ginaz/swordmaster mention (read-only).
python 05_verify4.py > verify_dump4.txt"""
import json
import re
import scan_lib as L

d = L.load()
S = L.sheets(d)
A = L.by_id(S["attribute"])
T = L.by_id(S["trait"])
EQ = L.by_id(S["equipment"])
U = L.by_id(S["unit"])
BO = L.by_id(S["bonus"])


def tb(tid, indent=""):
    t = T.get(tid)
    if not t:
        print(indent + "- %s: (trait not found)" % tid)
        return
    print("%s- %s [%s] %s" % (indent, tid, L.name_of(t), L.desc_of(t)[:200]))
    for a in t.get("attributes", []) or []:
        tg = a.get("target") or {}
        tg2 = a.get("target2") or {}
        print(indent + "    %s = %s tgt=%s tgt2=%s | %s" % (a.get("ref"), a.get("val", "-"), tg, tg2,
                                                          L.clean(a.get("desc", "") or A.get(a.get("ref", ""), {}).get("desc", ""))[:150]))
    p = t.get("props") or {}
    ex = {k: p[k] for k in ("stackingLimit", "duration", "range") if k in p}
    if ex:
        print(indent + "    props:", ex)


for t in ["E_Special_Trait", "E_Elite_Trait_Buff", "E_Trooper_Debuff", "S_Elite_Buff", "A_Hero_2_UnitsBuff_1_Melee",
          "A_Hero_2_UnitsBuff_1_Range", "A_Hero_2_UnitsBuff_2", "H_Hero_2_UnitDeath_Buff", "Atreides_PositiveResolution",
          "TKnightlyProtector_Buff", "TFrontLineTactics_Buff", "CB_Ecaz_FactionBonus3", "CB_Ecaz_FactionBonus5",
          "CB_Ecaz_FactionBonus6", "CB_Ecaz_MissionReward4", "CB_Atreides_FactionBonus2", "Hero_Trait", "C_Elite_Buff",
          "E_Hero_2_Trait", "ArmorPenetration_Trait", "TSardaukarCleaver", "F_Hero_1_EnemyDebuff", "F_Hero_1_UnitBuff"]:
    tb(t)

print("\n--- Fencer kit")
for e in ["JumpingBoot", "PersonalMantlet", "ChasingStance"]:
    r = EQ.get(e)
    if r:
        print("equip", e, L.name_of(r), "|", L.clean(r.get("desc", ""))[:160], "| cost", (r.get("props") or {}).get("cost"))
        for x in r.get("traits", []):
            tb(x.get("ref"), "    ")
print("E_Special full desc:", L.clean((U["E_Special"].get("texts") or {}).get("desc", "")))
print("E_Special attacks:", json.dumps(U["E_Special"].get("attacks"))[:300])
print("E_Elite attacks:", json.dumps(U["E_Elite"].get("attacks"))[:300])

print("\n--- every record mentioning Ginaz / swordmaster / duel (id, sheet, snippet)")
pat = re.compile(r"ginaz|swordmaster|duel|kanly|mentat", re.I)
for sn, sh in S.items():
    if "@" in sn:
        continue
    for r in sh.get("lines", []):
        js = json.dumps(r, ensure_ascii=False)
        m = pat.search(js)
        if m and sn not in ("localization",):
            i = m.start()
            print("%s:%s ..%s.." % (sn, r.get("id", "?"), js[max(0, i - 60):i + 110].replace("\n", " ")))
