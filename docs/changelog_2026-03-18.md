# Changelog — 2026-03-18

## Summary
Two primary objectives addressed today:
1. Both custom factions (`LandsraadFaction`, `Idualis`) made visible in the game's New Game faction selection screen.
2. `MMaraudersRaid1` (Landsraad exclusive operation) made fully functional.

---

## Changes to `res/data.cdb`

### 1. Faction Visibility — Conquest `playableFactions` whitelist
**What:** Added `LandsraadFaction` and `Idualis` to the `gameMode/Conquest/props/playableFactions` array.  
**Why:** The game engine uses this explicit whitelist to populate the New Game faction selection UI. A faction entry in the `faction` sheet alone is **not** sufficient — it must also appear in this list. This was the root cause of Idualis being invisible despite being fully defined in CDB.  
**Entries added:**
```json
{ "ref": "LandsraadFaction", "availableForAI": false },
{ "ref": "Idualis",          "availableForAI": false }
```

### 2. Landsraad Councillors — New character sheet entries
**What:** Added 4 new entries to the `character` sheet:
- `Landsraad_Jakob` — Guild/Economy domain, title "Guildsman", complexity 1
- `Landsraad_Siora` — Statecraft/Spy domain (female), title "Spymaster", complexity 2
- `Landsraad_Herbert` — Military domain, title "Marshal-General", complexity 0
- `Landsraad_Nier` — Statecraft/Diplomat domain (female), title "Grand Diplomat", complexity 2

**Why:** `LandsraadFaction.characters.councilors` was previously referencing Atreides placeholder characters (Aramsham, SpacingGuild, Jessica, Paul). The faction now has its own distinct councillor set.  
**Portrait images:** All four use placeholder portraits from `councillorsAtreides.png` until custom art is available.  
**Separator added:** "Landsraad" separator added to the character sheet editor view.

### 3. LandsraadFaction — Councillors reference updated
**What:** Changed `LandsraadFaction.characters.councilors` from:
```
[Aramsham, SpacingGuild, Jessica, Paul]
```
to:
```
[Landsraad_Jakob, Landsraad_Siora, Landsraad_Herbert, Landsraad_Nier]
```

### 4. `MaraudersRaid` operation — Enabled
**What:** Changed `"implemented": false` → `"implemented": true` on the `MaraudersRaid` operation entry.  
**Why:** `MMaraudersRaid1` (the quest/mission entry) was already correctly configured:
- `onlyForFactions: [LandsraadFaction]` — faction gate set ✅
- `requiredLevels: [IChoam level 1]` — correct spy track requirement ✅
- `cost: 50 Intel`, `canBeDetected: false` ✅

The `MaraudersRaid` operation it fires was the sole blocker. With `implemented: false`, the engine would silently skip execution. Setting `implemented: true` makes the operation live.

**Effect chain (now active):**
When `MMaraudersRaid1` is executed, the `MaraudersRaid` operation applies trait `TMaraudersRaid` to the target region:
- `Unit_Speed_ARatio +10%` — raider harassment increases unit speed
- `Army_DailySupplyDrain_MRatio +10%` — logistics pressure on enemy armies
- `MilitaryUnits_VibrationGenerationInMovement_MRatio = 0` — silent movement (no sandworm calls)
- `NonHostileActions` blocked — no economic or diplomatic actions in target region during raid

---

## Pattern Documentation — How Faction-Exclusive Missions Work

Researched `MSandCloak` (Fremen-exclusive) as the reference pattern.  
Three parts must all be correct for a faction-exclusive mission to work:

| Component | Field | Example (Fremen) | Landsraad |
|---|---|---|---|
| Quest entry | `props.onlyForFactions` | `[{"faction":"Fremen"}]` | `[{"faction":"LandsraadFaction"}]` |
| Spy track gate | `requiredLevels` | `[{level:1, category:"IField"}]` | `[{level:1, category:"IChoam"}]` |
| Operation execution | `implemented` on the operation row | `true` (SandCloak) | Now `true` (MaraudersRaid) |

**Note:** `MSandCloak` also appears in a `Unity_RelationBonus4` Conquest-mode ability that makes the mission pre-unlocked in Conquest mode. This is **irrelevant** for standard gameplay — the single-player and multiplayer game mode uses only the quest entry gate + spy track requirement.

---

## Changes to `mod/` Design Documents

### `mod/landsraad_operations.yml`
- Added `MMaraudersRaid1` entry at the top of operations list (status: `IN_CDB`)
  - Documents the full effect chain, cost, spy track requirement, and implementation date
- Added **TitheCollection** operation design:
  - CHOAM enforcement; confiscates 20% of target's Spice, converts to Solari at 300:1 rate
  - Cost: 40 Intel + 20 Influence, 50-cycle cooldown
- Added **AssetFreeze** operation design:
  - Blocks target's recruitment, construction, and council ability spending for 12 cycles
  - Cost: 60 Intel + 40 Influence, 70-cycle cooldown
  - Pairs with PunitiveExpedition as a one-two combo

### `mod/landsraad_faction.yml`
- Added **`infiltration_tracks`** section documenting which spy tracks the faction needs:
  - `IChoam` (primary) — required for MMaraudersRaid1, FinancialAudit, TitheCollection, AssetFreeze
  - `IField` — no current requirement; noted for future military-theatre missions
  - `ILandsraad` — needed for ImperialSummons, ImposeSanctions
  - `IGuild` — Jakob should grant this alongside IChoam
- Flagged **IChoam gap** (OPEN): no mechanism currently grants the IChoam infiltration slot to LandsraadFaction. Jakob's passive must include `Agt_InfiltrationSlot_Flat` targeting `IChoam`.
- Added **`design_intents`** section documenting faction archetype, core asymmetries, and balance anchors.

### `mod/landsraad_councillors.yml`
- **Jakob** — added `cdb_notes` entry flagging IChoam + IGuild slot grants as CRITICAL for the mission system to work
- **Siora** — added `cdb_notes` note that she should also contribute an IChoam slot (redundancy)
- **Nier** — added `cdb_notes` note that she should grant ILandsraad slot for political mission access
- Added **COUNCILLOR SYNERGY MAP** at end of file:
  - Jakob → IChoam + IGuild
  - Siora → IChoam (redundancy) or IField
  - Herbert → no infiltration; military buffs only
  - Nier → ILandsraad

---

## Open Items / Next Steps

1. **IChoam infiltration slot** — Must wire `Agt_InfiltrationSlot_Flat` targeting `IChoam` into Jakob's character traits or LandsraadFaction starting traits. Without this, `MMaraudersRaid1` will not appear as accessible in the spy mission UI even though it is now implemented.

2. **Councillor portraits** — All 4 Landsraad councillors use Atreides placeholder portraits. Custom portrait coordinates for `councillorsAtreides.png` or a new texture should be assigned.

3. **LandsraadFaction colour** — CDB has `color: 2500647` (Atreides blue-grey) but the design doc specifies `#D4AF37` (gold, decimal `13938999`). This needs correcting in the faction entry.

4. **New operations in CDB** — TitheCollection, AssetFreeze, ImperialSummons, FinancialAudit, and GuildInformationBroker are all designed in YAML only. None have CDB entries yet.

5. **Unit recruitment costs** — `LandsraadSoldiers_Faufreluches` and `LandsraadRanged_Faufreluches` have empty `costs` and `upkeep` blocks in CDB. Need population.

6. **Custom voices** — All Landsraad units currently use Fremen mercenary voice events as placeholders.
