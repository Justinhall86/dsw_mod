# Buildings defined but not buildable in Skirmish

Source: vanilla `mod_files/data_vanilla_2026-10-28.cdb`, game mode `Default` (Skirmish).
Reproduce with `python .claude/skills/dsw-building-audit/scripts/audit_buildings.py`.
Full rules and pitfalls are in the skill: `.claude/skills/dsw-building-audit/SKILL.md`.

## Summary

Of the ~114 rows in the `building` sheet, these cannot be built in a Skirmish game:

| Row | Model | Why |
|---|---|---|
| WaterExtractor | `Buildings/WaterExtractor` | Only unlocks are traits `R_Pole` and `CT_NorthPole`. Region `Pole` appears only on the Conquest map `C_NorthPole`, so this is a Conquest-only building. |
| SpiceCollectors | `Buildings/SpiceCollector` | Separator "Obsolete (keep for saves)"; empty `states` (no cost or duration). |
| FremenProcessingPlant | `Buildings/SpiceCollector` | Same as SpiceCollectors. |
| Masterpiece | `Buildings/RecruitmentOffice` | Separator "Dev". A placeholder; the real ones are `Masterpiece_Eco`, `Masterpiece_Military`, `Masterpiece_StateCraft` (Ecaz, buildable). |
| CorrinoBasePreview | `Base/Corrino` | Separator "Dev"; a preview of the Corrino base. |
| ALLBUILDINGS | character line-up prefab | Separator "TestArtist". Not a building model. |
| ClandestineScouts | none | Obsolete separator, empty `states`. |
| Main_WeaponsFactory | none | Obsolete separator, empty `states`. |
| SupportStation | none | Obsolete separator. |
| SpotterCell | none | Obsolete separator. |
| Main_Fortifications | none | Obsolete separator. |

## Model folders with no building row

Folders in `model_inputs/Structure/Buildings` that no `building` row points at:

| Folder | Status |
|---|---|
| IndoctrinationCenter | No reference anywhere in data.cdb. |
| HarvestTent | Used only as a map-structure model (`F_HarvestTent`). |
| KulonTent | Used only as a map-structure model (`F_KulonTent`). |
| Construction | Shared scaffolding (crane drone, construction set), not a building. |

## Turntable GIFs

In `model_outputs/unbuildable_buildings_skirmish/` (36 frames, 480 px):

| GIF | Covers |
|---|---|
| `WaterExtractor.gif` | WaterExtractor (prefab uses `Model_IceExtractor` plus `WaterExtractor_Addon`) |
| `IndoctrinationCenter.gif` | IndoctrinationCenter |
| `HarvestTent.gif` | HarvestTent |
| `KulonTent.gif` | KulonTent (wind cloth and metal frame meshes rendered together) |
| `CorrinoBasePreview.gif` | CorrinoBasePreview |
| `Masterpiece_(RecruitmentOffice_model).gif` | Masterpiece |
| `SpiceCollectors_FremenProcessingPlant_(SpiceCollector_model).gif` | SpiceCollectors, FremenProcessingPlant |

ALLBUILDINGS and the five model-less rows have no GIF because there is no building model to render.

## Looks unused but is buildable

- **PropagandaOffice**: Corrino-only with no unlock gate, so a human Corrino player can build it. Its AI weight is -10, so the AI never does.
- **NeuralNode** (Vernius) and **Masterpiece_Eco / _Military / _StateCraft** (Ecaz): no unlock gate, buildable.
- **WaterNetwork, WaterSeller, LocalGang, BackAlleyDoctor**: unlocked by councillor passive traits (`LingarPassive`, `BannerjeePassive`), applied through the character row's `passiveTrait`. A naive search for who applies those traits finds nothing, but they are reachable.

## How availability is decided

- Unlocking is an attribute (`Unlock_TBuilding`, `Unlock_TBuilding_Authorize`, `Unlock_TBuilding_Force`, with `target.building`) on developments, traits and similar rows, not a field on the building row.
- A trait counts as an unlock source only if something applies it in Skirmish: a region on a Skirmish map, a structure's `zoneTraitOnRecon`, a councillor's `passiveTrait`, or a faction trait with a `*GainTTrait` attribute.
- Conquest-only sources: `CB_*` traits (from `bonus` rows) and `territory` rows. `Tuto*` traits are the tutorial.
- Skirmish map types: `Default`, `S_*`, `Kanly`, `K_*`, `Volcanic`, `RedPlains`, `AllFactions`. Conquest: `C_*`. Tutorial: `MapTuto*`.

## Caveats

- **Unverified inference:** a building with no `Unlock_*` attribute anywhere (Marketplace, Recruitment Office, Plascrete Factory, Research Hub, Missile Battery, PropagandaOffice) is treated as available from the start. The cdb has no explicit flag for this. A Skirmish game's build menu is the real test.
- **Assumed:** `General_HegemonyBonus_1/2` unlock the major buildings (Experimental Alloy Furnace, Military Factory, Nuclear Silo, Research Station, Spacing Guild Branch, Shai-Hulud Temple, Recycling Plant). Nothing in the cdb references those traits by id, so the engine must apply them. I assumed it does so in Skirmish.
- **Assumed:** developments that unlock a building are reachable by the factions that can build it.
- **Not audited:** per-faction availability of the model-less rows (Main_*, HQ, MB*, SI*). They were only checked for obsolete separators and empty `states`.
- The data is a snapshot of the 2026-10-28 vanilla cdb. Re-run the audit on a fresh vanilla copy after a game update.
