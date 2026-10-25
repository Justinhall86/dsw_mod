"""Fifth pass: Plot threat direction, Warrior_Trait holders, a few attribute descriptions (read-only)."""
import json, scan_lib as L
d=L.load(); S=L.sheets(d); A=L.by_id(S["attribute"]); T=L.by_id(S["trait"]); BO=L.by_id(S["bonus"]); U=L.by_id(S["unit"])
for b in ["Plot_Assassination_1","Plot_Assassination_2","Harkonnen_FactionBonus9"]:
    r=BO[b]; print("==",b,r.get("name"),"props",r.get("props"))
    for x in r.get("traits",[]):
        t=T.get(x["ref"]); print("  trait",x["ref"],json.dumps(t.get("attributes"),ensure_ascii=False)[:600] if t else None, "| desc:",L.desc_of(t) if t else "")
    print("  effects",json.dumps(r.get("effects"),ensure_ascii=False)[:500])
t=T["H_Elite_Trait"]; print("H_Elite_Trait raw attrs:",json.dumps(t["attributes"],ensure_ascii=False)[:500])
print("Warrior_Trait holders:",[u for u,r in U.items() if any(x.get("ref")=="Warrior_Trait" for x in r.get("traits",[]))])
for a in ["Entity_DamageReceived_FromTarget_MRatio","Entity_DamageReceived_InMelee_MRatio","Army_ExperienceGain_ARatio","Army_XPLevel_Effects_ARatio","Entity_KnightInTRange2_GainTTrait"]:
    print(a,"|",A.get(a,{}).get("desc"))
