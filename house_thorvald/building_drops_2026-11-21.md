# Dropping real buildings: what the engine allows (2026-11-21)

Owner, 2026-11-21: after the unit drops were removed, "looking to drop some real buildings" (structures, not soldiers).
Nothing here is built or installed. Facts come from the vanilla boot file `pak_archive/hlboot_vanilla_478027b5d76378ea.dat`
(function numbers `#n`) and `mod_files/data.cdb`. *(inference)* marks a reading not yet seen in game.

## What already works

- **Landing a structure where you click.** The installed operations kit (`tool/thorvald_ticks/thorvald_sworn/thsw_ops.py`, ability field
  `thEvent`, or the vanilla `GhostMarket` ability) calls `WorldEventManager.addWorldEvent(structure, clicked region)`. It sets the caster as owner
  and creator. **Iron Landfall A uses this and "works perfectly"** (playtest 2026-11-20): its shuttle `Th_LandfallShuttle` is such a structure.
- **A structure that shoots.** `Structure.hasAttacks` (#10259) is true whenever the structure row has `props.attackCombos`. `Structure.makeAttackComponents`
  (#10261) then gives it an `AutoAttackComponent`, and `Structure.getAttackCombos` (#10262) reads that list. There is no id check. HQs and sietches shoot this way
  (`ImpBase`: `MainBase_Missiles`, power 80, range 80; `SietchHostile`: `Sietch_Missiles`, power 40, range 80).
- **A structure that carries traits.** `Structure.initTraits` (#10286) applies every `props.startingTraits` entry to any structure. The only special cases are for
  Village / VillageFortified.
- **Removing it.** World-event actions: `notForCreator` (enemies), for example "Dismantle" (type 1, a unit on site for N days), and `onlyForCreator`
  (you), for example "Pack up" (type 0, pay a cost, resolves at once). Iron Landfall A's "Disembark" proves a creator action resolves and the event goes away.

So a dropped building that shoots or gives an aura is **data only**: one `structure` row, plus an ability, a mission and a trait, like Iron Landfall A.

## Proposed buildings (pick which to build)

| # | Building | What it does | Verdict | Unknowns to test |
|---|---|---|---|---|
| 1 | **Fire Bastion** (my favourite) | Lands in the clicked region and shoots enemy units in range (copy of the sietch missile combo, tuned to about power 30). Enemies remove it with a 2-day Dismantle. You can Pack Up for a small refund | Data only | Does a world-event structure keep firing (no vanilla example)? Projectile origin on a model that has no muzzle *(inference: falls back to the model centre)* |
| 2 | **Field Hospital / Supply Post** | The Quartermaster idea as a building: allied armies nearby heal and resupply (`AllyArmies_AtTRange2_GainTTrait` in `startingTraits`) | Data only *(inference)* | Range auras are proven on units. On a structure the attribute should apply, but this is not proven |
| 3 | **Listening Post** | Vision over the region, plus Marked on enemies in range (the Spotter's debuff as a building) | Data only *(inference)* | Same aura question. Vision radius may come from the model or region, not data |
| 4 | Real village building (Missile Battery, Military Base) dropped **into a village you own** | A normal building appears finished in a free slot | **Patch** | Village buildings are built through the district or slot code, not `addWorldEvent`. Needs an engine hook that adds a finished building |

Look: vanilla models only, per house rules. Candidates are a world-event or building prefab (for example the Missile Battery turret
for #1), recoloured later. The Consignment Terminal's starport model (`dsw-custom-building` skill) shows a custom static model works.

## Risks

- A world event the owner cannot remove and that never expires is "decoration" (see engine_findings.md, Shuttle drops section).
  Every dropped building needs both an enemy Dismantle action and an owner Pack Up action.
- `health` 0 (as on sietches) means it cannot be shot down, only dismantled. Whether a world event can take damage is not known.
- `raid: true` world-event rewards crash on custom structures. Do not use them.
- The shuttle landing fix (hlboot `42f92959bcb91dc6`, built 2026-11-20) is not installed yet. Install it before any drop test.

## Cheapest test
Build #1 only, with a vanilla turret model, in test mode. Drop it next to a Harkonnen army, then check:
- it lands and stays;
- it fires;
- the enemy can dismantle it;
- you can pack it up;
- `game.log` stays small.
