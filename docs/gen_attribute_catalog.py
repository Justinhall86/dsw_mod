"""Regenerate docs/attribute_catalog.md from the vanilla data.cdb.

Run after every game update:  python docs/gen_attribute_catalog.py [path/to/vanilla.cdb]

The "Thorvald / Ginaz example" column comes from, in order of preference:
  1. docs/attribute_examples.json             (hand-written; edit this)
  2. house_ginaz/mechanics/mechanics.json      (Ginaz mechanics already mapped to attributes)
  3. a generated idea (marked "idea:")         (the description with its placeholders filled in)
"""
import collections
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
CDB = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "mod_files", "data_vanilla_2026-10-28.cdb")
OUT = os.path.join(HERE, "attribute_catalog.md")
EXAMPLES = os.path.join(HERE, "attribute_examples.json")
GINAZ = os.path.join(ROOT, "house_ginaz", "mechanics", "mechanics.json")

# ---- themes: first match on the id wins; each gives a house, a design hook and sample targets ----
TH, GI = "Thorvald", "Ginaz"
SKIP = "Not a fit"
THEMES = [
    # other factions' systems: say so instead of inventing a use
    (r"Sietch|Wormrid|Water|Fremen|Militia", SKIP, "a Fremen system (sietches, militia, water)", {}),
    (r"^UH|UWHQ|Underworld|Smuggl|Contraband", SKIP, "a Smugglers system (underworld HQs)", {}),
    (r"Neural|Masterpiece|Crew|Overcharge|Vernius", SKIP, "a Vernius/Ecaz/Harkonnen system", {}),
    (r"^CQ|Conquest|Tuto", SKIP, "Conquest mode or the tutorial", {}),
    (r"Zoom|Wheel|Camera|Selected|Tooltip|Gamepad|IsPaused|IsAtSpeed|PadAction|Window|BlackBoard|Blackboard|^Logic_|^AI_",
     SKIP, "a tutorial, interface, AI or scripted-battle check", {}),
    # ranged before the aura and duelling rules: Ginaz fields no firearms, so ranged goes to Thorvald
    (r"Ranged|Sniper|AttackRange|Bazooka|Flamer|Demo", TH, "the Iron Ranger sniper / Iron Guard bazooka",
     {"unit": "Th_Soldier", "trait": "Th_IronRanger"}),
    (r"ImperialHonor|Sardaukar|Mandate", TH, "a Corrino leftover Thorvald inherited: replace it", {}),
    (r"Champion", GI, "Appointment of a Duelist (the Champion)", {"unit": "G_Elite", "trait": "G_ChampionBuff"}),
    (r"Kanly|Rival", GI, "Kanly Retribution", {"trait": "G_KanlyFury"}),
    # Thorvald economy
    (r"Solari|CHOAM|CMarket|Share|Dividend|Tax|Market|Trade", TH, "the Sovereign Mint / Adjutant Nobru's markets",
     {"resource": "Solari", "building": "Marketplace", "trait": "Th_MintTrait"}),
    (r"ImportCost|Recruit|Manpower|ImportTime|ImportSpeed|Hireling|Temp|Disband|Refund", TH,
     "the Iron Guard (soldiers paid in Solari, not Manpower)",
     {"resource": "Manpower", "unit": "Th_Trooper", "trait": "Th_IronGuard"}),
    (r"Upkeep", TH, "the Iron Guard / Hammer of Wealth upkeep", {"resource": "Solari", "unit": "Th_Elite"}),
    (r"Airfield|Aerial|Air|Flying|Orni|Recon|Frigate|Carryall|Transit|Teleport|FuelCell|Shuttle|Drone|Ship", TH,
     "the Guild Sub-Contract (the air roster)",
     {"resource": "FuelCell", "unit": "Th_Frigate", "building": "Airfield", "trait": "Th_AirContract"}),
    (r"Spice|Harvester|Plascrete|Outpost|Village|Building|Construction|Annex|Slot|District|MainBase|Mainbase|Headquarter",
     TH, "Master Silva's logistics / Hammer of Wealth mining",
     {"resource": "Plascrete", "building": "PlascreteFactory", "unit": "Th_Trooper", "trait": "Th_SilvaLogistics"}),
    (r"Agt|Agent|Mission|Operation|Infiltration|Intel|Spying|Assassin|Detection|Capture|Escape", TH,
     "Lady Haruka's spy network",
     {"resource": "Intel", "mission": "MTh_Hammerfall", "infiltration": "IChoam", "trait": "Th_HarukaNetwork"}),
    (r"Resolution|Vote|Charter|Council|Landsraad|Influence|ResAction|MinorHouse", TH, "Adjutant Nobru's Landsraad politics",
     {"resource": "Influence", "resolution": "CHOAMContracts", "trait": "Th_NobruPatronage"}),
    (r"Standing", GI, "high Landsraad Standing (draft v3)", {"resource": "Standing"}),
    (r"Pillage|Loot|OnDeath|Death", TH, "Political Asylum (gains from deaths and pillage)",
     {"resource": "Manpower", "trait": "Th_PoliticalAsylum"}),
    (r"Treaty|Truce|Peace|CeaseFire|Alliance", TH, "Supply Chain Holdout (the truce operation)",
     {"treaty": "TradeAgreement", "resource": "Solari", "trait": "Th_TradeTerms"}),
    (r"War|Enemy", GI, "Kanly Retribution", {"trait": "G_KanlyFury", "resource": "Hegemony"}),
    (r"Cloak|Camo|Stealth|Hidden|Detect", TH, "Vane Torrver's Camouflage and Ambush Shot", {"trait": "Th_VaneCamo"}),
    (r"AtTRange|AtRange|Nearby|Ally|Allies|Aura", TH, "Karlin Mallenor's Rallying Presence aura",
     {"trait": "Th_KarlinAura", "range": "Medium_Range", "unit": "Th_Trooper"}),
    (r"Supply|DeepDesert|Desert|Sandstorm|Storm|Worm", GI, "Swordmaster Discipline (desert supply)", {"trait": "G_Discipline"}),
    (r"XP|Experience|Level|Training", GI, "Martial Honor (Combat Experience)", {"trait": "G_Mastery"}),
    (r"Hegemony", GI, "the 5K Master Dueling milestone", {"hegemony": "DefeatEnemyArmy"}),
    (r"Melee|Execute|Kill|AttackSpeed|Speed|FightTarget|Engaged|Dodge|Combat|Damage|Attack", GI,
     "School of the Sword / Martial Honor (duelling)", {"unit": "G_Elite", "trait": "G_Riposte", "range": "Short_Range"}),
    (r"Armor|Power|Life|Health|Regen", TH, "the Heavy Vanguard's plate / Overseer Jool's Conscription Buffer",
     {"unit": "Th_Elite", "trait": "Th_ConscriptionBuffer"}),
    (r"Development|Knowledge|Research", TH, "Heighforge industry research", {"development": "ArmyLogistics", "domain": "Economy"}),
    (r"Ability|Cooldown", TH, "a councillor or hero active (e.g. Karlin's Warlord's Shout)", {"ability": "Th_WarlordsShout"}),
]
DEFAULT = (TH, "a Thorvald faction trait", {})

# a sample id for each target kind, used when the theme gives none
SAMPLE = {"unit": "Th_Trooper", "structure": "Village", "resource": "Solari", "building": "PlascreteFactory",
          "trait": "Th_FactionTrait", "treaty": "TradeAgreement", "mission": "MTh_Hammerfall", "ability": "Th_WarlordsShout",
          "action": "ArmyFight", "domain": "Economy", "raid": "Marauders", "hegemony": "SolariProduction",
          "infiltration": "IChoam", "quest": "GinazSwordmasters", "resaction": "Bounty", "information": "SolarisStock",
          "siegeaction": "Annex", "equipment": "HeavyArmor", "combo": "Generic_Melee", "resolution": "CHOAMContracts",
          "development": "ArmyLogistics", "blackboard": "BattleVar", "faction": "Corrino", "alert": "CombatOngoing",
          "bonus": "Atreides_FactionBonus1", "objective": "TutoM1_Welcome", "input": "Toggle_UI",
          "padaction": "LandsraadWindow", "range": "Medium_Range"}
LOWER_IS_BETTER = r"Cost|Upkeep|DamageReceived|Drain|PreparationTime|Penalty|Loss|Capture|Detection|Price|Time_|Cooldown"


def enum_names(sheet, col):
    c = next(c for c in sheet["columns"] if c["name"] == col)
    return str(c["typeStr"]).split(":", 1)[1].split(",")


def theme_of(id_):
    for pat, house, hook, samples in THEMES:
        if re.search(pat, id_):
            return house, hook, samples
    return DEFAULT


def sample_val(id_):
    """A plausible val for the id's suffix, and how it reads."""
    better_low = re.search(LOWER_IS_BETTER, id_)
    if id_.endswith("MRatio"):
        v = 0.8 if better_low else 1.2
        return v, "%+d%%" % round((v - 1) * 100)
    if id_.endswith("ARatio") or "Percent" in id_ or "Chance" in id_:
        v = -0.2 if better_low else 0.15
        return v, "%+d%%" % round(v * 100)
    if id_.endswith("Flat") or "_Set" in id_ or id_.endswith("Stack"):
        v = 2 if re.search(r"Armor|Power|Level", id_) else (5 if re.search(r"Res|Gain|Prod", id_) else 1)
        return v, "%+g" % v
    return None, ""


def fill(desc, tgt, tgt2, vtext, v):
    """The vanilla description with every placeholder replaced by a concrete Thorvald/Ginaz value."""
    s = desc or ""
    s = re.sub(r"::target_prod2?::", lambda m: "%s production" % (tgt2 if "2" in m.group() else tgt), s)
    s = re.sub(r"::target_eff\w*?2::|::target_effect_list2::", "the `%s` trait" % (tgt2 or "X"), s)
    s = re.sub(r"::target_e\w*::", "the `%s` trait" % (tgt or "X"), s)
    s = s.replace("::target2::", tgt2 or "X").replace("::target::", tgt or "X")
    s = re.sub(r"::target_stacking_limit::", "3", s)
    s = re.sub(r"::s?inv_\w+::|::s?_?percent\w*::", vtext or "N%", s)
    s = re.sub(r"::s?_?value\w*::", vtext or ("%g" % v if v is not None else "N"), s)
    s = re.sub(r"::[\w()\-]+::", "N", s)
    s = re.sub(r"\[\$my\((\w+)\)(?:-\w+)?\]", r"\1", s)
    s = re.sub(r"\[!?([^\]]+)\]", r"\1", s)
    return re.sub(r"\s+", " ", s.replace("\ufffd", " ")).strip()


def generated(id_, desc, t1, t2, names, cond=False):
    house, hook, samples = theme_of(id_)
    if house == SKIP:
        return "_not a fit:_ %s; neither house needs it." % hook

    def pick(kind):
        if not kind:
            return None
        k = kind.lower()
        return samples.get(k) or SAMPLE.get(k, kind)
    k1 = names[t1] if isinstance(t1, int) else None
    k2 = names[t2] if isinstance(t2, int) else None
    tg1, tg2 = pick(k1), pick(k2)
    if tg2 and tg2 == tg1:
        tg2 += "_Buff"                    # a trait handing on a second trait: give the two different names
    if cond:
        what = fill(desc, tg1, tg2, "N", None) or id_
        kind = "quest step that counts" if id_.startswith(("Me_Track", "Game_Track")) else "quest/objective gate"
        return "_idea:_ %s · %s, %s: \"%s\"" % (house, hook, kind, what)
    v, vtext = sample_val(id_)
    parts = []
    if v is not None:
        parts.append("val `%g`" % v)
    if tg1:
        parts.append("target `%s`" % tg1)
    if tg2:
        parts.append("target2 `%s`" % tg2)
    effect = fill(desc, tg1, tg2, vtext, v) or id_
    drawback = re.search(r"Block|Disable|Cannot|^No[A-Z]", id_) or effect.lower().startswith(("cannot", "blocks"))
    if re.search(r"Penalty|Malus|Debuff", id_):
        lead = "Thorvald · on an enemy, through an operation such as Alloy Embargo"
    elif drawback:
        lead = "%s drawback for %s" % (house, hook)
    else:
        lead = "%s · %s" % (house, hook)
    return "_idea:_ %s: %s → \"%s\"" % (lead, ", ".join(parts) if parts else "a flag", effect)


def ginaz_examples():
    if not os.path.exists(GINAZ):
        return {}
    out = {}
    for m in json.load(open(GINAZ, encoding="utf-8")).get("mechanics", []):
        vals = ", ".join("%s %s" % (k, v) for k, v in (m.get("values") or {}).items())
        for a in m.get("attributes", []):
            out.setdefault(a, "Ginaz · %s %s%s (%s, from mechanics.json)." % (
                m["id"], m["name"], " — " + vals if vals else "", m.get("status", "").lower()))
    return out


def walk(node, parts):
    """Every dict reached by following a cdb nested path; props are dicts, lists are lists."""
    if not parts:
        yield from (node if isinstance(node, list) else [node])
        return
    for item in (node if isinstance(node, list) else [node]):
        if isinstance(item, dict) and parts[0] in item:
            yield from walk(item[parts[0]], parts[1:])


def ref_uses(d, target_sheet):
    """target id -> [(sheet, row id, the referencing dict)], from every column that references target_sheet."""
    sheets = {s["name"]: s for s in d["sheets"]}
    uses = collections.defaultdict(list)
    for s in d["sheets"]:
        for c in s["columns"]:
            if str(c["typeStr"]) != "6:" + target_sheet or "@" not in s["name"]:
                continue
            top, *path = s["name"].split("@")
            for line in sheets[top]["lines"]:
                for row in walk(line, path):
                    if isinstance(row, dict) and row.get(c["name"]):
                        uses[row[c["name"]]].append((top, line.get("id", "?"), row))
    return uses


def vanilla_text(uses, id_):
    if not uses:
        return ""
    # prefer a real faction or unit trait over difficulty, test and conquest rows
    rank = sorted(uses, key=lambda u: bool(re.search(r"Difficulty|TEST|Test|Conquest|CQ_|Tuto", u[1])))
    top, rid, row = rank[0]
    bits = []
    if row.get("val") is not None:
        v = row["val"]
        bits.append("%g" % v if not isinstance(v, (list, dict)) else "…")
    for key in ("target", "target2"):
        t = row.get(key)
        if isinstance(t, dict) and t:
            bits.append("→ `%s`" % next(iter(t.values())))
    where = "" if top == "trait" else top + " "
    more = " (+%d more)" % (len(uses) - 1) if len(uses) > 1 else ""
    return "%s`%s` %s%s" % (where, rid, " ".join(bits), more)


def cell(s):
    return (s or "").replace("|", "\\|").replace("\n", " ").replace("\ufffd", " ")


def main():
    d = json.load(open(CDB, encoding="utf-8"))
    sheets = {s["name"]: s for s in d["sheets"]}
    attr, cond = sheets["attribute"], sheets["condition"]
    a_targets, stacks = enum_names(attr, "target"), enum_names(attr, "stack")
    c_targets, c_types = enum_names(cond, "target"), enum_names(cond, "type")

    curated = json.load(open(EXAMPLES, encoding="utf-8"))
    cur_a, cur_c = curated.get("attributes", {}), curated.get("conditions", {})
    gin = ginaz_examples()
    a_ids = {a["id"] for a in attr["lines"]}
    c_ids = {c["id"] for c in cond["lines"]}
    for name, keys, ids in (("attribute", cur_a, a_ids), ("condition", cur_c, c_ids), ("mechanics.json", gin, a_ids | c_ids)):
        unknown = sorted(k for k in keys if k not in ids)
        if unknown:
            print("WARNING: %s examples name ids not in this cdb: %s" % (name, ", ".join(unknown)))

    a_uses, c_uses = ref_uses(d, "attribute"), ref_uses(d, "condition")
    trait_used = collections.Counter(at.get("ref") for t in sheets["trait"]["lines"] for at in t.get("attributes", []))

    def tname(names, v):
        return names[v] if isinstance(v, int) else ""

    counts = collections.Counter()
    rows_a = []
    for a in attr["lines"]:
        i = a["id"]
        if i in cur_a:
            ex, src = cur_a[i], "hand"
        elif i in gin:
            ex, src = gin[i], "ginaz"
        else:
            ex, src = generated(i, a.get("desc"), a.get("target"), a.get("target2"), a_targets), "idea"
        counts["a_" + src] += 1
        rows_a.append("| `%s` | %s | %s | %s | %d | %s | %s | %s | %s |" % (
            i, tname(a_targets, a.get("target")), tname(a_targets, a.get("target2")),
            tname(stacks, a.get("stack")) or "Additive", trait_used.get(i, 0),
            "yes" if a.get("implemented") else "**no**", cell(a.get("desc")), cell(ex),
            cell(vanilla_text(a_uses.get(i), i))))
    rows_c = []
    for c in cond["lines"]:
        i = c["id"]
        if i in cur_c:
            ex, src = cur_c[i], "hand"
        elif i in gin:
            ex, src = gin[i], "ginaz"
        else:
            ex, src = generated(i, c.get("desc"), c.get("target"), c.get("target2"), c_targets, cond=True), "idea"
        counts["c_" + src] += 1
        rows_c.append("| `%s` | %s | %s | %s | %s | %s | %s | %s |" % (
            i, tname(c_types, c.get("type")), tname(c_targets, c.get("target")),
            tname(c_targets, c.get("target2")), "yes" if c.get("implemented") else "**no**",
            cell(c.get("desc")), cell(ex), cell(vanilla_text(c_uses.get(i), i))))

    lines = [
        "# Attribute & condition catalog (vanilla data.cdb)", "",
        "Generated by `docs/gen_attribute_catalog.py` from `%s` - do not edit by hand. "
        "How to read it: [reference_cdb_attributes_traits.md](reference_cdb_attributes_traits.md)." % os.path.relpath(CDB, ROOT).replace("\\", "/"), "",
        "- **used** = how many vanilla trait rows use it (a high count = proven). **impl** = the cdb's own `implemented` flag; avoid `no`.",
        "- **Thorvald / Ginaz example**: plain text = hand-written from the house design docs ([attribute_examples.json](attribute_examples.json), "
        "edit it there); \"from mechanics.json\" = the Ginaz mechanics mapping; _idea:_ = generated from the id and description, "
        "a starting point to check, not a design decision; _not a fit_ = another faction's system.",
        "- **Vanilla use** = a real vanilla row that uses it, with its val and targets: open it in the cdb and copy its shape.",
        "- Values: `_Flat` adds the number; `_ARatio` adds a fraction (0.15 = +15%%); `_MRatio` multiplies (0.8 = -20%%, 0 = none).",
        "- Example ids starting `Th_`/`G_` other than our units (`Th_Trooper`, `Th_Soldier`, `Th_Special`, `Th_Elite`, `Th_Frigate`, `Th_Ship`, `G_Elite` ...) "
        "are traits, abilities or missions still to be written.", "",
        "Examples: attributes %d hand-written, %d from mechanics.json, %d generated; conditions %d hand-written, %d from mechanics.json, %d generated." % (
            counts["a_hand"], counts["a_ginaz"], counts["a_idea"], counts["c_hand"], counts["c_ginaz"], counts["c_idea"]), "",
        "## Attributes (%d)" % len(attr["lines"]), "",
        "| id | target | target2 | stack | used | impl | desc | Thorvald / Ginaz example | Vanilla use |",
        "|---|---|---|---|---|---|---|---|---|", *rows_a, "",
        "## Conditions (%d)" % len(cond["lines"]), "",
        "Conditions gate quests, objectives, resolutions, victory conditions, achievements and infiltration traits "
        "(`quest@conditions`, `objective@steps@conditions`, `resolution@conditions@*`, ...). `Tracker` counts from when the quest starts; `State` checks now.", "",
        "| id | type | target | target2 | impl | desc | Thorvald / Ginaz example | Vanilla use |",
        "|---|---|---|---|---|---|---|---|", *rows_c]
    open(OUT, "w", encoding="utf-8").write("\n".join(lines) + "\n")
    print("wrote %s (%d attributes, %d conditions); %s" % (OUT, len(attr["lines"]), len(cond["lines"]), dict(counts)))


if __name__ == "__main__":
    main()
