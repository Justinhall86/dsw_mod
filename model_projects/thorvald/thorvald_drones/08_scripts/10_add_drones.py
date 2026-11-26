"""Five test drones for House Thorvald: TH_Drone1 .. TH_Drone5 (data only, vanilla models).

    python 10_add_drones.py --dry      show what would be added
    python 10_add_drones.py            apply (backup: 07_data_cdb/data_BEFORE_drones.cdb)
    python 10_add_drones.py --revert   restore the backup (refuses if data.cdb changed since; --force overrides)

Only adds rows: units (after TH_Drone_Deployed), traits (after Th_Drone_Trait), abilities (after TDroneLeave),
and Unlock_TUnit_Force lines on the test trait Th_TestFreeArmy. No vanilla row is edited.
Design notes: ../README.md."""
import copy, hashlib, json, os, shutil, sys
HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BK = os.path.join(HERE, "..", "07_data_cdb", "data_BEFORE_drones.cdb"); MARK = BK + ".applied_sha"


def dumps(d): return json.dumps(d, indent="\t", ensure_ascii=False).replace("\n", "\r\n").encode("utf-8")
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()[:16]
def sheet(d, n): return next(s for s in d["sheets"] if s["name"] == n)["lines"]
def row(d, n, i): return next(r for r in sheet(d, n) if r["id"] == i)


def atb(ref, val=None, desc="", **kw):
    a = {"target": {}, "target2": {}, "ref": ref}
    if val is not None: a["val"] = val
    if desc: a["desc"] = desc
    a.update(kw)
    return a


def give(ref, trait, rng, desc): return atb(ref, None, desc, target={"trait": trait}, target2={"range": rng})


def build(d):
    new_traits, new_units, new_abils = [], [], []

    def unit_trait(i, name, attrs):
        t = copy.deepcopy(row(d, "trait", "Th_Drone_Trait")); t.update(id=i, name=name, attributes=attrs); new_traits.append(t)
        return t

    def aura_trait(i, name, src, attrs, **props):
        t = copy.deepcopy(row(d, "trait", src)); t.update(id=i, name=name, attributes=attrs, desc="")
        t["props"] = dict(t.get("props") or {}); t["props"].pop("fx", None); t["props"].update(props); new_traits.append(t)

    def unit(i, donor, name, plural, desc, stats, traits, wheel, cost, **props):
        u = copy.deepcopy(row(d, "unit", donor))
        u.update(id=i, faction="Thorvald", traits=[{"ref": t} for t in traits], equipment=[], stats=[stats], aiWeights=[])
        u["texts"] = {"name": name, "desc": desc, "plural": {"name": plural}}
        u["costs"] = {"recruit": [{"qty": cost, "res": "Solari"}],
                      "upkeep": [{"qty": 10, "res": "Solari"}, {"res": "FuelCell", "qty": 3}, {"qty": 3, "res": "CommandPoint"}]}
        p = dict(u.get("props") or {}); p.pop("aiLimit", None)
        if wheel is None: p.pop("wheelPosition", None)
        else: p["wheelPosition"] = {"pos": wheel, "group": 0}
        p.update(props); u["props"] = p
        new_units.append(u); return u

    def deploy_pair(base, dep, install, leave, dep_name, install_desc):
        for i, src, to, frm in ((install, "TDroneInstall", dep, base), (leave, "TDroneLeave", base, dep)):
            a = copy.deepcopy(row(d, "ability", src)); a["id"] = i
            a["cooldowns"]["sharedCooldown"] = leave if i == install else install
            a["otherEffects"] = [{"props": {"unit": to}, "id": "UReplaceWith"}]; a["display"]["whereUnit"] = frm
            a["name"] = ("Deploy: " + dep_name) if i == install else "Pack up"
            a["desc"] = install_desc if i == install else "Packs the [%s] up so it can move again." % base
            new_abils.append(a)

    # 1 Thumper Drone (deploy): calls the worm on whoever stands nearby. Idea: the artillery drone's sand warning, made the point.
    unit_trait("Th_Drone1_Trait", "Thumper", [
        atb("CustomProperty", desc="Deploy to pound the sand: [Sandworm]s are strongly attracted to it"),
        atb("CustomProperty", desc="Cannot attack. Pack up and leave before the worm arrives")])
    unit("TH_Drone1", "H_Drone", "Thumper Drone", "Thumper Drones",
         "A cheap remote thumper. Fly it under an enemy column, deploy it, and let Arrakis do the killing.",
         {"health": 150, "power": 0, "armor": 0, "maxSupply": 200, "range": 25}, ["Th_Drone1_Trait"], 2, 150,
         squadSize=1, deployAbility="ThDrone1Install", deployTime=2)
    u = unit("TH_Drone1_Deployed", "H_Drone", "Thumper Drone", "Thumper Drones", "Deployed: pounding the sand.",
             {"health": 150, "power": 0, "armor": 0, "maxSupply": 200, "range": 0, "speed": 0}, ["Th_Drone1_Trait"], None, 150,
             squadSize=1, undeployAbility="ThDrone1Leave", baseUnit="TH_Drone1", deployTime=2, vibrationsFactor=40)
    u["flags"] = 32; u["attacks"] = {"combos": [{"ref": "Generic_None"}]}
    deploy_pair("TH_Drone1", "TH_Drone1_Deployed", "ThDrone1Install", "ThDrone1Leave", "Thumper",
                "Plants the [TH_Drone1] and starts pounding the sand. It cannot move and attracts [Sandworm]s.")

    # 2 Quartermaster Drone (deploy): a field depot. Idea: the Cronos frigate's "Airfield Configuration" + its Deck Engineers.
    aura_trait("Th_Drone2_Buff", "Field Depot", "Renegade_Drone_Trait_Buff",
               [atb("Army_SupplyGain_Bonus_Flat", 150), atb("SafeRegen_AlwaysActive", desc="Recover [Life] even in enemy territory")])
    unit_trait("Th_Drone2_Trait", "Quartermaster", [atb("CustomProperty", desc="Deploy to open a Field Depot for nearby allies")])
    unit_trait("Th_Drone2_Depot", "Field Depot", [
        give("AllyArmies_AtTRange2_GainTTrait", "Th_Drone2_Buff", "Medium_Range",
             "Other ally Military Units at [Medium_Range] gain ::target_effects::")])
    unit("TH_Drone2", "S_Drone", "Quartermaster Drone", "Quartermaster Drones",
         "A flying stores wagon. Deployed, it becomes a Field Depot that resupplies and patches up the company far from home.",
         {"health": 450, "power": 10, "armor": 4, "maxSupply": 200, "range": 25}, ["Th_Drone2_Trait"], 3, 400,
         deployAbility="ThDrone2Install", deployTime=4)
    u = unit("TH_Drone2_Deployed", "S_Drone", "Field Depot", "Field Depots", "Deployed: resupplying and repairing nearby allies.",
             {"health": 450, "power": 10, "armor": 6, "maxSupply": 200, "range": 0, "speed": 0}, ["Th_Drone2_Trait", "Th_Drone2_Depot"],
             None, 400, undeployAbility="ThDrone2Leave", baseUnit="TH_Drone2", deployTime=4)
    u["flags"] = 32; u["attacks"] = {"combos": [{"ref": "Generic_None"}]}
    deploy_pair("TH_Drone2", "TH_Drone2_Deployed", "ThDrone2Install", "ThDrone2Leave", "Field Depot",
                "Sets the [TH_Drone2] down as a Field Depot: allies at [Medium_Range] are resupplied and recover [Life]. It cannot move.")

    # 3 Spotter Drone: marks targets for the Iron Rangers. Idea: Harkonnen probe + the Cronos frigate's anti-air "Disoriented".
    aura_trait("Th_Drone3_Debuff", "Marked", "C_Frigate_Debuff", [atb("Entity_DamageReceived_ARatio", 0.15)])
    unit_trait("Th_Drone3_Trait", "Target Marking", [
        give("Entity_GiveTTrait_UnitAtWar_AtTRange2", "Th_Drone3_Debuff", "Medium_Range",
             "Enemy units at [Medium_Range] are [Th_Drone3_Debuff]: ::target_effects::"),
        give("Entity_GiveTTrait_AerialUnitAtWar_AtTRange2", "Th_Drone3_Debuff", "Long_Range",
             "Flying enemy units at [Long_Range] are [Th_Drone3_Debuff]")])
    u = unit("TH_Drone3", "Renegades_Drone", "Spotter Drone", "Spotter Drones",
             "It does not shoot. It paints targets, and every Thorvald gun in sight hits them harder.",
             {"health": 250, "power": 6, "armor": 2, "maxSupply": 200, "range": 25}, ["Th_Drone3_Trait"], 4, 250, reconRate=100)
    u["flags"] = 0

    # 4 Signal Drone: two broadcasts, switch at will. Idea: the Ecaz Monument frigate's two songs.
    aura_trait("Th_Drone4_Rally_Buff", "Rallied", "E_Frigate_WarAnthem_Buff", [atb("Unit_Damage_ARatio", 0.15)], stackingLimit=1)
    aura_trait("Th_Drone4_Jam_Debuff", "Jammed", "E_Frigate_Lullaby_Debuff",
               [atb("Entity_AttackSpeed_MRatio", 0.75, "::s_percent:: attack speed")], stackingLimit=1)
    unit_trait("Th_Drone4_Trait", "Signal Mast", [atb("CustomProperty", desc="Broadcasts one of two signals: Rally or Jamming")])
    for t in (unit_trait("Th_Drone4_Rally", "Rally Signal", [
                  give("Entity_GiveTTrait_ATRange2_SelfHumans", "Th_Drone4_Rally_Buff", "Medium_Range",
                       "[Thorvald-adjective] non-mechanical units at [Medium_Range] gain: ::target_effects::"),
                  atb("TAbility_Block", target={"ability": "ThDrone4_Rally"})]),
              unit_trait("Th_Drone4_Jam", "Jamming Signal", [
                  give("Entity_GiveTTrait_AtTRange2_Humans_AtWar", "Th_Drone4_Jam_Debuff", "Medium_Range",
                       "Enemy non-mechanical units at [Medium_Range] suffer: ::target_effects::"),
                  atb("TAbility_Block", target={"ability": "ThDrone4_Jam"})])):
        t["props"] = dict(t["props"], hideBlocked=True)
    unit("TH_Drone4", "V_Drone", "Signal Drone", "Signal Drones",
         "A flying command mast. One signal steadies Thorvald troops; the other fills enemy headsets with noise.",
         {"health": 350, "power": 10, "armor": 3, "range": 25}, ["Th_Drone4_Trait", "Th_Drone4_Rally"], 5, 350)
    for i, src, on, off, nm in (("ThDrone4_Rally", "EFrigate_WarAnthem", "Th_Drone4_Rally", "Th_Drone4_Jam", "Switch to Rally Signal"),
                                ("ThDrone4_Jam", "EFrigate_Lullaby", "Th_Drone4_Jam", "Th_Drone4_Rally", "Switch to Jamming Signal")):
        a = copy.deepcopy(row(d, "ability", src)); a.update(id=i, name=nm)
        a["cooldowns"]["sharedCooldown"] = "ThDrone4_Jam" if i == "ThDrone4_Rally" else "ThDrone4_Rally"
        a["traits"][0]["trait"] = on; a["display"]["whereUnit"] = "TH_Drone4"
        a["otherEffects"] = [{"props": {"trait": off}, "id": "RemoveTraitOnUse"}]
        new_abils.append(a)

    # 5 Smoke-Layer Drone: a slowing cloud, with a burst. Idea: the Smuggler Wraith frigate's gas and Toxic Purge.
    aura_trait("Th_Drone5_Debuff", "Smoke-blind", "S_Frigate_Debuff", [atb("Entity_Speed_MRatio", 0.65)])
    aura_trait("Th_Drone5_Choke", "Choking Smoke", "E_Frigate_Lullaby_Debuff",
               [atb("Entity_AttackSpeed_MRatio", 0.6, "::s_percent:: attack speed")], stackingLimit=1)
    aura_trait("Th_Drone5_Buff", "Smoke Burst", "S_Frigate_Buff", [
        give("Entity_GiveTTrait_AtTRange2_Humans_AtWar", "Th_Drone5_Choke", "Medium_Range",
             "Enemy non-mechanical units at [Medium_Range] suffer: ::target_effects::"),
        atb("Unit_Speed_MRatio", 0.5, "::percent:: [Speed]")])
    unit_trait("Th_Drone5_Trait", "Smoke Screen", [
        give("Entity_GiveTTrait_AtTRange2_Humans_AtWar", "Th_Drone5_Debuff", "Short_Range",
             "Enemy non-mechanical units at [Short_Range] are [Th_Drone5_Debuff]: ::target_effects::"),
        atb("CustomProperty", desc="Can activate [ThDrone5_Burst]", target={"trait": "Th_Drone5_Buff"})])
    unit("TH_Drone5", "A_Drone", "Smoke-Layer Drone", "Smoke-Layer Drones",
         "It trails a heavy screen that slows anyone caught in it. Vent the tanks and the cloud chokes their fire as well.",
         {"health": 300, "power": 8, "armor": 3, "range": 25}, ["Th_Drone5_Trait"], 6, 300)
    a = copy.deepcopy(row(d, "ability", "ToxicPurge"))
    a.update(id="ThDrone5_Burst", name="Smoke Burst",
             desc="Vents the tanks: for a short time enemies at [Medium_Range] also lose attack speed. The drone moves slower while venting.")
    a["traits"][0]["trait"] = "Th_Drone5_Buff"; a["display"]["whereUnit"] = "TH_Drone5"; new_abils.append(a)
    return new_traits, new_units, new_abils


def apply(d):
    nt, nu, na = build(d)
    for n, rows in (("trait", nt), ("unit", nu), ("ability", na)):
        ids = {r["id"] for r in sheet(d, n)}
        for r in rows: assert r["id"] not in ids, r["id"] + " already exists"

    def ins(n, after, rows):
        s = sheet(d, n); i = next(k for k, r in enumerate(s) if r["id"] == after); s[i + 1:i + 1] = rows
    ins("trait", "Th_Drone_Trait", nt); ins("unit", "TH_Drone_Deployed", nu); ins("ability", "TDroneLeave", na)
    test = row(d, "trait", "Th_TestFreeArmy")["attributes"]
    k = max(i for i, a in enumerate(test) if a["ref"] == "Unlock_TUnit_Force")
    test[k + 1:k + 1] = [{"target": {"unit": "TH_Drone%d" % n}, "target2": {}, "ref": "Unlock_TUnit_Force", "displayed": False}
                         for n in range(1, 6)]
    return ["traits: " + ", ".join(r["id"] for r in nt), "units: " + ", ".join(r["id"] for r in nu),
            "abilities: " + ", ".join(r["id"] for r in na), "Th_TestFreeArmy +5 Unlock_TUnit_Force"]


if __name__ == "__main__":
    if "--revert" in sys.argv:
        if sha(CDB) != open(MARK).read().strip() and "--force" not in sys.argv:
            sys.exit("data.cdb changed since the drones were added: look at the change first (--force restores anyway)")
        shutil.copy2(BK, CDB); os.remove(MARK); print("restored from", BK); sys.exit()
    raw = open(CDB, "rb").read(); d = json.loads(raw.decode("utf-8-sig"))
    assert dumps(d) == raw, "data.cdb does not round-trip byte for byte; not editing"
    for line in apply(d): print("  ", line)
    if "--dry" in sys.argv: print("dry run: nothing written"); sys.exit()
    assert not os.path.exists(MARK), "already applied"
    shutil.copy2(CDB, BK); open(CDB, "wb").write(dumps(d)); open(MARK, "w").write(sha(CDB)); print("backup:", BK, "| wrote", sha(CDB))
