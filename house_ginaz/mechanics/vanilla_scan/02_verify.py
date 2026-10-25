"""Dump raw data.cdb records behind the claims in VANILLA_MECHANICS_FOR_GINAZ.md (read-only).

    python 02_verify.py > verify_dump.txt
"""
import json
import scan_lib as L

d = L.load()
S = L.sheets(d)
A = L.by_id(S["attribute"])
T = L.by_id(S["trait"])
AB = L.by_id(S["ability"])
EQ = L.by_id(S["equipment"]) if "equipment" in S else {}
U = L.by_id(S["unit"]) if "unit" in S else {}
CH = L.by_id(S["character"])
FA = L.by_id(S["faction"])
BO = L.by_id(S["bonus"])


def show(label, rec):
    print("=== %s ===" % label)
    print(json.dumps(rec, indent=1, ensure_ascii=False)[:2500] if rec else "NOT FOUND")


for i in ["EcazChampion", "LastStandProtocols"]:
    show("ability " + i, AB.get(i))
for i in ["TEcazChampion", "TEcazChampion_Buff_Stack", "TParryingArmguards", "TSoberingMedication", "TVowOfBravery",
          "TVowOfFervor", "TVowOfHeroism", "TVowOfHonor", "TVowOfHonor_Buff", "TLastStandProtocols",
          "TLastStandProtocols_Buff", "Warrior_Trait", "Warrior_Trait_Debuff", "E_Hero_1_Trait", "E_Hero_1_FactionBuff",
          "E_Hero_1_ChampionBuff", "E_Hero_1_Skill", "CB_Ecaz_FactionBonus2", "CB_Ecaz_FactionBonus2_Effect",
          "Corrino_HegemonyBonus2_WarSource", "Corrino_WarEnemy", "Corrino_WarEnemy_MainBase",
          "V_Hero_2_Trait_Buff_Execute", "C_Elite_Trait", "Atreides_NegativeResolution"]:
    show("trait " + i, T.get(i))
for i in ["VowOfBravery", "VowOfFervor", "VowOfHeroism", "VowOfHonor"]:
    show("equipment " + i, EQ.get(i))
show("unit E_Elite", U.get("E_Elite"))
show("unit E_Hero_1", U.get("E_Hero_1"))
show("bonus Ecaz_FactionBonus2", BO.get("Ecaz_FactionBonus2"))
show("bonus Corrino_HegemonyBonus2", BO.get("Corrino_HegemonyBonus2"))
print("\n=== who grants TParryingArmguards / TSoberingMedication ===")
for sn in ("equipment", "unit", "ability", "bonus", "character", "faction", "trait"):
    for rid, r in L.by_id(S[sn]).items() if sn in S else []:
        js = json.dumps(r)
        for k in ("TParryingArmguards", "TSoberingMedication", "TEcazChampion\"", "Corrino_WarEnemy\""):
            if k in js and rid not in ("TParryingArmguards", "TSoberingMedication"):
                print(sn, rid, "->", k.strip('"'))
print("\n=== faction props keys, Ecaz ===")
print(json.dumps(FA.get("Ecaz", {}).get("props", {}), indent=1)[:3000])
