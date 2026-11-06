---
name: dsw-building-audit
description: Find which Dune Spice Wars (D4X) buildings are defined in data.cdb (or have model folders under model_inputs/Structure/Buildings) but cannot actually be built in Skirmish, and make turntable GIFs of them. Use whenever the user asks which buildings are unused / orphaned / dead / unbuildable / Conquest-only, how buildings get unlocked, whether a building (or a new one we add) is reachable in Skirmish, or wants previews of building models. Also read it before adding a new village building to the cdb, because the unlock rules below decide whether it will ever show up.
---

# DSW building audit

Answers: "which buildings are defined but never buildable in Skirmish per data.cdb?", and renders GIFs of them.

```powershell
python .claude\skills\dsw-building-audit\scripts\audit_buildings.py             # newest mod_files/data_vanilla_*.cdb
python .claude\skills\dsw-building-audit\scripts\audit_buildings.py path\to\data.cdb
python .claude\skills\dsw-building-audit\scripts\render_buildings.py            # all GIFs (~30 s each, run in background)
python .claude\skills\dsw-building-audit\scripts\render_buildings.py WaterExtractor
```

Run the audit on a **vanilla** cdb. `mod_files/data.cdb` carries our edits and would hide or invent findings.
After a game update, take a fresh `data_vanilla_<date>.cdb` first (see the cdb-minimal-edits rule).
GIFs land in `model_outputs/unbuildable_buildings_skirmish/`. Rendering reuses `dsw-vehicle-preview`
(HMD to FBX, DDS textures, Blender turntable), so read its `references/gotchas.md` if a render looks wrong.

## How a building becomes buildable (what the data says)

- **Sheet `building`**, ~114 rows. Village buildings carry `visuals.model[].path` (a prefab) and `states[]`
  (cost, upkeep, duration). Main base (`Main_*`), underworld HQ, `MB*` and `SI*` buildings have no model: UI-only.
- The sheet's **separators** group the rows: Mainbase, Outpost, Headquarters, MainBaseHeadquarters, LocalSietch,
  **Dev**, **Obsolete (keep for saves)**, **TestArtist**. The last three are dead rows.
- **Unlock** is an attribute, not a field on the building: `Unlock_TBuilding`, `Unlock_TBuilding_Authorize`,
  `Unlock_TBuilding_Force`, all with `target.building`. They sit on developments (techs), traits, and so on.
  `Block_TBuildingConstruction` / `Unvailable_TBuilding` / `TBuilding_Disable` block it (tutorial, storm, deficit traits).
- **Inference, not verified in-game:** a building with no `Unlock_*` attribute anywhere (Marketplace, Recruitment Office,
  Plascrete Factory, Research Hub, Missile Battery, and the Corrino-only Propaganda Office) is available from the start.
  "Authorize" gates (Refinery on spice areas, Processing Plant on rich mountains) mean "allowed in zones with that trait".
- A trait only counts as an unlock source if something **applies** it in Skirmish:
  - region rows list it in `props.traits`, and that region is in a non-Conquest `mapType.specialsList`;
  - a structure applies it via `zoneTraitOnRecon`;
  - a councillor applies it via `passiveTrait` (character rows);
  - a faction trait applies it with a `*GainTTrait` attribute.

  `CB_*` traits come from `bonus` rows (Conquest bonuses). `territory` rows are Conquest-only. `Tuto*` is the tutorial.
  `General_HegemonyBonus_1/2` have no cdb reference at all; the engine applies them (assumed to work in Skirmish).
- Skirmish is gameMode `Default`. Map types `Default`, `S_*`, `Kanly`, `K_*`, `Volcanic`, `RedPlains`, `AllFactions`
  are Skirmish-side; `C_*` are Conquest; `MapTuto*` are tutorials.

## Findings (vanilla cdb 2026-10-28)

**Not buildable in Skirmish**

| Row | Why |
|---|---|
| WaterExtractor | Only unlocks are `R_Pole` / `CT_NorthPole`. Region `Pole` is only on Conquest map `C_NorthPole`, so it is Conquest-only. |
| SpiceCollectors, FremenProcessingPlant | Separator "Obsolete (keep for saves)", empty `states`. They share the SpiceCollector model with the buildable RecyclingPlant. |
| Masterpiece | Separator "Dev". Placeholder using the Recruitment Office prefab. The real ones are `Masterpiece_Eco/Military/StateCraft` (Ecaz, buildable). |
| CorrinoBasePreview | Separator "Dev"; preview of the Corrino base. |
| ALLBUILDINGS | Separator "TestArtist"; model is the character line-up prefab. No GIF. |
| ClandestineScouts, Main_WeaponsFactory, SupportStation, SpotterCell, Main_Fortifications | Obsolete separator, no model. |

**Model folders in `Structure/Buildings` with no building row**

- IndoctrinationCenter: no cdb reference at all.
- HarvestTent, KulonTent: used only as map-structure models (`F_HarvestTent`, `F_KulonTent`).
- Construction: shared scaffolding (crane drone, construction set), not a building.

**Looks unused but is buildable:** PropagandaOffice (Corrino-only, no gate; AI weight -10, so only a human builds it).
NeuralNode (Vernius) and the three `Masterpiece_*` rows have no unlock gate either.

## Traps hit while building this

- **Resolutions and conditions only read a trait.** Counting every string mention of a trait as "applied" wrongly made
  WaterExtractor look reachable (`Res_WaterSubsidies` just reads `R_Pole`). Only the applier list above counts.
- **Councillor passives.** `LingarPassive` / `BannerjeePassive` unlock WaterNetwork, WaterSeller, LocalGang,
  BackAlleyDoctor. They are applied through the character row's `passiveTrait`, so the audit must look at `character`.
- **Prefab, not folder.** WaterExtractor's prefab uses `Model_IceExtractor.fbx` + `WaterExtractor_Addon.fbx`, not
  `WaterExtractor.fbx`. Check the prefab for the model list.
- **Two-mesh HMD.** `KulonTent.fbx` holds a wind-cloth mesh and a metal frame mesh, which `hmd2fbx` rejects ("expected 1
  model, got 3") and `flatten_multi_model` refuses (2 meshes). `render_buildings.py` converts each mesh separately; that
  is only valid because the parent node is an identity.
- **Building folders have several albedos** per faction (`*_Atreides_Albedo.png` ...). Use the neutral one.
- **CorrinoBase is ~50 m across**, so the fixed ortho framing makes it look small. Fine for a preview.

## Caveats

- The "no gate = available" rule and the hegemony assumption are inferences; a Skirmish game's build menu is the real test.
- Model-less rows (Main_*, HQ, MB*, SI*) were only checked for obsolete separators and empty `states`. Their
  per-faction availability (districts, sietch, underworld HQ) was not audited.
- Gate sources inside `development` are assumed reachable. Developments with a `faction` are only reachable for that
  faction, which matches the buildings' own `onlyForFactions` in every case seen.
