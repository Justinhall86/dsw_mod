"""Second verification pass (read-only). python 03_verify2.py > verify_dump2.txt"""
import json
import scan_lib as L

d = L.load()
S = L.sheets(d)
A = L.by_id(S["attribute"])
T = L.by_id(S["trait"])
FA = L.by_id(S["faction"])
BO = L.by_id(S["bonus"])


def show(label, rec, n=1800):
    print("=== %s ===" % label)
    print(json.dumps(rec, indent=1, ensure_ascii=False)[:n] if rec else "NOT FOUND")


def refs(needle, sheets_=None):
    out = []
    for sn, sh in S.items():
        if sheets_ and sn not in sheets_:
            continue
        for r in sh.get("lines", []):
            if needle in json.dumps(r, ensure_ascii=False):
                out.append("%s:%s" % (sn, r.get("id", "?")))
    return out


print("sheet names:", sorted(S.keys())[:80])
print("\n--- Hegemony bonuses per faction (traitBonus) ---")
for fid, f in FA.items():
    hb = [x.get("traitBonus") for x in (f.get("props") or {}).get("hegemonyBonuses", [])]
    if hb:
        print(fid, hb)

for t in ["Ecaz_HegemonyBonus1", "Ecaz_HegemonyBonus2", "Corrino_HegemonyBonus1", "Corrino_HegemonyBonus2",
          "Corrino_HegemonyBonus2_DestroyedMB", "Atreides_HegemonyBonus1", "Atreides_HegemonyBonus2",
          "E_Hero_1_ChampionBuff_PerTrophy", "E_Hero_1_SkillBuff", "Ecaz"]:
    show("trait " + t, T.get(t), 2200)

print("\n--- referencing ids ---")
for n in ["Faction_ExtraEcazChampion_Flat", "Entity_ExecuteTarget_HealthRatio_Flat", "Faction_GiveTTrait_AtWarSinceDays",
          "Faction_EcazChampion_GainTTrait", "Entity_Attacks_IgnoreArmor_MRatio", "TLastStandProtocols\"",
          "Atreides_NegativeResolution", "Entity_TurnDamageModifierIntoDamageReduction", "Entity_GiveTTrait_GroundUnitAtWar_AtTRange2",
          "Unit_EcazChampion", "Entity_ExecuteImmune", "Faction_OnInfantryKill_OtherFactionUnit_SpawnTTraitAgent"]:
    print(n, "->", refs(n)[:25])

for a in ["Faction_ExtraEcazChampion_Flat", "Entity_ExecuteTarget_HealthRatio_Flat", "Unit_EcazChampion",
          "Faction_EcazChampion_GainTTrait", "Faction_GiveTTrait_AtWarSinceDays", "Entity_GiveTTrait_GroundUnitAtWar_AtTRange2",
          "Army_OnEliminateFactionUnit_GainTRes", "Entity_ExecuteImmune"]:
    show("attribute " + a, A.get(a), 900)

print("\n--- bonus sheet shape ---")
types = {}
for b in BO.values():
    k = (b.get("props") or {}).get("type")
    types[k] = types.get(k, 0) + 1
print("bonus count", len(BO), "by props.type", types)
for bid in list(BO)[:6]:
    print(bid, (BO[bid].get("props") or {}).get("onlyForFactions"), BO[bid].get("traits"))
print("Ecaz bonuses:", [b for b in BO if b.startswith("Ecaz")])
for b in ["Ecaz_FactionBonus4", "Ecaz_FactionBonus1", "Ecaz_FactionBonus3"]:
    show("bonus " + b, BO.get(b), 1500)

print("\n--- equipment holders ---")
for e in ["ParryingArmguards", "SoberingMedication", "LastStandProtocols", "VowOfBravery"]:
    print(e, refs('"%s"' % e, ["unit", "equipment", "ability"]))
EQ = L.by_id(S["equipment"])
for e in ["ParryingArmguards", "SoberingMedication"]:
    show("equipment " + e, EQ.get(e), 900)
print("equip with LastStand:", [k for k, v in EQ.items() if "LastStand" in json.dumps(v)])
U = L.by_id(S["unit"])
for u in ["E_Trooper", "A_Elite", "A_Trooper"]:
    r = U.get(u, {})
    print(u, "traits", [x.get("ref") for x in r.get("traits", [])], "equip", [x.get("ref") for x in r.get("equipment", [])],
          "stats", r.get("stats"), "squad", (r.get("props") or {}).get("squadSize"))
