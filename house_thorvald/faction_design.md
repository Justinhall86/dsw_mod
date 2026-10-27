# Faction design — House Thorvald

Source: [images/faction_screen_thorvald.jpg](images/faction_screen_thorvald.jpg), the house-selection screen. It is a concept
image, so the numbers are **PROPOSED** and the text is not final.

## Identity
- **Title:** "The Industrial Hegemon / The Mercenary Syndicate".
- **Leader:** **Earl Memnon Thorvald**. Grey-streaked black hair and beard, a long black coat with a high collar, a black wrap and
  sash underneath, a cane, and a gear emblem on the chest and on an arm patch.
- **Emblem:** a rust-red gear with a star inside it ([art_direction.md](art_direction.md)).
- **Theme:** an economic power that buys its wars. It mints its own money, hires mercenaries and works the markets.

## Bonuses

| Tier | Name | Effect |
|---|---|---|
| Outset | **The Sovereign Mint** | Can build the "Heighforge Mint" in the Main Base, converting Spice and Plascrete directly into Solari. Max Solari cap +5000, but CHOAM standing -20%. |
| Outset | **The Iron Guard** | Units have **zero Manpower cost** but high initial and upkeep Solari cost. |
| Outset | **Political Asylum** | +5 Manpower and +10 Intel when units die or villages are pillaged nearby. Unlocks the operation **"Supply Chain Holdout"** to force a truce. |
| 5000 Hegemony | **Guild Sub-Contract** | Can buy Fuel Cells directly with Solari. Troops travel instantly between Owned Airfields, with no transit time. |
| 10000 Hegemony | **The Hammer of Wealth** | Mercenary contracts cost -30% Solari upkeep. Mining operations generate +15% more Plascrete. |

"Hegemony" is the milestone track. The screen doesn't say how it is earned.

## What this tells us about the units
- **"Iron Guard" is a faction mechanic, not only a unit name.** Soldiers cost Solari instead of Manpower. That explains the "Iron" in
  Iron Ranger and Iron Guard on the combat sheet, and the unit names are being redone anyway ([units.md](units.md)).
- **Mercenary framing:** the Hammer of Wealth discounts "mercenary contracts", so the house's soldiers are hired, not conscripted.
- **Airfields:** Guild Sub-Contract's instant travel between Owned Airfields makes the air roster (Frigate, Fighter, Drone) a core part of the house.
- **Mining:** the +15% Plascrete bonus fits the tracked claw machine in [images/art_tracked_claw_vehicle.png](images/art_tracked_claw_vehicle.png), a possible mining or utility vehicle.

## Flags
- The mint's name reads "Heighforge" on the screen. It may be a typo for "Highforge". Confirm.
- Terms on the screen (Authority, Influence, Intel, Landsraad Standing, CHOAM, Fuel Cells, Plascrete) need checking against the real
  game attributes before we write any `data.cdb` entries.
- Max Solari +5000 and the Sovereign Mint together are a very strong economy. Check balance when we get to numbers.
- The CHOAM standing penalty is deliberate. Haruka and Nobru, the CHOAM-facing councillors, soften it ([counsellors.md](counsellors.md)).
