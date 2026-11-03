# Faction design — House Thorvald

Source: [images/faction_screen_thorvald.jpg](images/faction_screen_thorvald.jpg), the house-selection screen. It is a concept
image, so the numbers are **PROPOSED** and the text is not final.

## Identity
- **Title:** "The Industrial Hegemon / The Mercenary Syndicate".
- **Leader:** **Earl Memnon Thorvald**. Grey-streaked black hair and beard, a long black coat with a high collar, a black wrap and
  sash underneath, a cane, and a gear emblem on the chest and on an arm patch.
- **Emblem:** a rust-red gear with a star inside it ([art_direction.md](art_direction.md)).
- **Theme:** an economic power that buys its wars. It owns the exotic-metals trade through **Heighforge**, hires mercenaries and works the markets.
- **Heighforge:** a massive exotic-metals factory, the industrial heart of the house and the source of its wealth. **There is only one, and it is on
  another planet** (not named yet), so it is never on the Arrakis map: it cannot be built, captured or raided there. It is not a mint. Nothing in
  the house prints coin: the wealth comes from selling exotic alloys. Master Silva, the house's master operations manager, runs it
  ([counsellors.md](counsellors.md)).

## Bonuses

| Tier | Name | Effect |
|---|---|---|
| Outset | **The Heighforge Monopoly** | Heighforge, the house's exotic-metals factory on another planet, buys Spice and Plascrete shipped from Arrakis. A Main Base building (the **Consignment Terminal**, proposed name) converts them directly into Solari. Max Solari cap +5000, but CHOAM standing -20%, since CHOAM resents the monopoly. |
| Outset | **The Iron Guard** | Units have **zero Manpower cost** but high initial and upkeep Solari cost. |
| Outset | **Political Asylum** | +5 Manpower and +10 Intel when units die or villages are pillaged nearby. Unlocks the operation **"Supply Chain Holdout"** to force a truce. |
| 5000 Hegemony | **Guild Sub-Contract** | Can buy Fuel Cells directly with Solari. Troops travel instantly between Owned Airfields, with no transit time. |
| 10000 Hegemony | **The Hammer of Wealth** | Mercenary contracts cost -30% Solari upkeep. Mining operations generate +15% more Plascrete. |

"Hegemony" is the milestone track. The screen doesn't say how it is earned.

**Naming note.** The concept screen calls this bonus "The Sovereign Mint" and the building the "Heighforge Mint". Both are superseded: the
house has no mint, and Heighforge is not a building you construct. "The Heighforge Monopoly" is a proposed bonus name (the effect is unchanged). The thing
the player builds on Arrakis is the **Consignment Terminal** (proposed name), the dock that ships to Heighforge.

## In the game data (`data.cdb`)
- **Faction row `Thorvald`** (added next to Ginaz): colour **burnt orange `#CC5500`** (`color` = 13391104), emblem and button icon
  `UI/Faction/ThorvaldEmblem.png`, names, description, initials "TH".
- **It is an inert stub** (house 2 = "Unknown", like the Renegades row): no characters, landmarks, start traits or hegemony bonuses yet, so it
  cannot be picked in the game. Making it a Great House (house 0) means filling those in, using Ginaz as the pattern.
- **The emblem image lives outside `data.cdb`.** `pak_assets/UI/Faction/ThorvaldEmblem.png` has to be copied into the folder the pak builder
  packs, keeping the `UI/Faction/` path. Not tested in the game yet.
- Re-run `cdb/add_thorvald_faction.py` to refresh the row; `cdb/make_emblem.py` redraws the emblem.

Unique building ideas are in [buildings.md](buildings.md).

## What this tells us about the units
- **"Iron Guard" is a faction mechanic, not only a unit name.** Soldiers cost Solari instead of Manpower. That explains the "Iron" in
  Iron Ranger and Iron Guard on the combat sheet, and the unit names are being redone anyway ([units.md](units.md)).
- **Mercenary framing:** the Hammer of Wealth discounts "mercenary contracts", so the house's soldiers are hired, not conscripted.
- **Airfields:** Guild Sub-Contract's instant travel between Owned Airfields makes the air roster (Frigate, Fighter, Drone) a core part of the house.
- **Mining:** the +15% Plascrete bonus fits the tracked claw machine in [images/art_tracked_claw_vehicle.png](images/art_tracked_claw_vehicle.png), a possible mining or utility vehicle.

## Flags
- **Resolved:** "Heighforge" is the canon spelling and the name of the exotic-metals factory: one factory, on another planet. It is not a typo for "Highforge", and there is no mint.
- **Open:** which planet Heighforge is on, and whether the conversion is a building (the Consignment Terminal) or a plain passive trait with no building.
- Terms on the screen (Authority, Influence, Intel, Landsraad Standing, CHOAM, Fuel Cells, Plascrete) need checking against the real
  game attributes before we write any `data.cdb` entries.
- Max Solari +5000 and the Heighforge conversion together are a very strong economy. Check balance when we get to numbers.
- The CHOAM standing penalty is deliberate. Haruka and Nobru, the CHOAM-facing councillors, soften it ([counsellors.md](counsellors.md)).
