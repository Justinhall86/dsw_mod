# Art direction — House Thorvald

## Rule zero
The sheet below is the look target for House Thorvald's ground infantry, and it is reference only until confirmed. Where it
disagrees with the decisions on this page, this page wins. It is 1024×572 JPEG, so small details (the emblem, the hem pattern)
are soft. Ask for a larger version before we design from them.

The sheet carries the Dune: Spice Wars and Shiro Games logos and a © Legendary line. Keep it in this project for reference; do not
publish it with the mod.

## Source sheet
[images/art_combat_units_sheet.jpg](images/art_combat_units_sheet.jpg) — "House Thorvald / Combat Units", four soldiers standing
side by side on a warm backdrop. Origin not stated in the message that supplied it.

## The four units
| Unit | Weapon in hand | Role read | Notes |
|---|---|---|---|
| **Trooper** | none visible; a sword in a scabbard on the hip | base line infantry | The only unit with no weapon in hand. Decide what it fights with before modelling, since a game unit needs a weapon model. |
| **Iron Ranger** | long rifle across the body, long barrel and a sight | ranged marksman | The rifle makes a long diagonal, so the silhouette reads from the side. |
| **Iron Guard (Bazooka)** | shoulder-fired rocket launcher, flared muzzle | heavy anti-armour | The launcher is the largest prop on the sheet. |
| **Heavy Vanguard** | large round-cornered shield, curved blade with orange fire along its edge | frontline melee tank | The only unit with a flame. The glow can be carried by the emissive texture, the same channel the Sentinal pipeline uses. A real fire effect would be a separate game effect. |

## Shared costume (all four)
- **Wide conical hat** (kasa-like), dark, with a thin rust-orange band along the brim line.
- **Faceless.** The face is covered by a black mask or hood up to the eyes, with a high collar. No face shows on any unit.
- **Layered dark armour:** shoulder plates with raised rivets, a chest plate, overlapping lamellar-style plates on the torso, a belt with a buckle.
- **Copper gear-and-star medallion** on the chest and shoulders, and the shield carries the same emblem. This is the strongest
  candidate for a house sigil. It is not canon yet.
- **Rust-brown cloth:** wraps on the upper arms, and a knee-length rust-brown skirt or apron with a patterned hem band over dark trousers.
- **Tall black boots** with rust-tinted edges.

## Palette
Read from the sheet by eye, with rough sampling for the armour, skirt and backdrop. Treat these as a starting point.

| Role | Approx. value | Used for | Against the Sentinal palette |
|---|---|---|---|
| Gunmetal black | `#23201C` to `#2B2721` | armour, hat, mask | darker than Sentinal `ironhull` (`#322E2C`) |
| Rust-brown | `#48241A` | skirt, arm wraps | redder and darker than Sentinal `rust_plate` (`#7A4C34`) |
| Copper-bronze | by eye | gear emblem, shield trim | — |
| Ember orange | by eye, hot | blade fire, hat pinstripe | hotter than Sentinal `trim_amber` (`#D68C3A`) |
| Gold edging | by eye | collar and shoulder trim on Jool and Nobru, and the screen borders. The soldiers use rust and orange instead. | not in the Sentinal palette |
| Backdrop | `#744326` | concept background only, never a model colour | — |

The family matches the Sentinal palette (dark metal, rust, warm trim). That means one house identity can cover both the Frigate and
the infantry, if the rust and the trim are aligned. The sheet's trim is hotter and redder than Sentinal's amber, so pick one trim colour for the house.

## Leaders and councillors
- **Earl Memnon Thorvald:** a long black coat with a high collar, a black wrap and sash, a cane, a small gear emblem on the chest and an arm patch.
- **Councillors** ([counsellors.md](counsellors.md)): a mixed cast, with dark armour, leather and rust trim.
  - Overseer Jool: dark plate, crossed rust-leather straps, a gold-lined collar.
  - Master Silva: copper pauldron, quilted brown leather.
  - Lady Haruka: a hooded rust-trimmed cloak.
  - Adjutant Nobru: a long black coat with gold-trimmed shoulders and a holstered pistol.
- The portrait screens use a near-black navy background with a rust-red banner and copper and gold borders.

## Emblem (canon)
- A copper gear ring with a star inside it, shown on a rust-red pennant banner with a pointed bottom. It appears on the councillor banner, the Codex, the
  faction icon (rust-red), the leader's coat and the infantry's chest, shoulders and shield.
- It must not look like Ginaz's crossed rapiers. Ginaz's emblem rules say the house emblem is crossed rapiers over waves.
- On models, keep it a small embroidered or stamped patch, not a large print. The same motif can go on the Frigate's hull as a decal.

## Silhouette and readability
- The conical hat is the most readable shape at RTS distance. It must survive the squint test at small size.
- The Ranger and Iron Guard carry long diagonals, so their silhouettes are the most distinct from the side.
- **Contrast risk:** the cast is almost entirely near-black. Against dark terrain at RTS distance, the only things that carry the read are the
  hat's orange pinstripe, the copper emblem and the blade's fire. Test these at game scale before building the rest.

## Cultural read (decision needed)
The soldiers' costume borrows East Asian forms: the conical kasa hat, the masked face, lamellar plates and the hakama-like skirt. The
councillors and the leader are a mixed cast in coats, leather and plate. So the hat and mask may be the **mercenary uniform** and not
the whole house's culture ("The Mercenary Syndicate"). Ginaz reads as European gentry (wine coats, rapiers). Confirm the lore, since it
decides how the rest of the house should look.

## Naming pattern
"Iron Guard" is now a faction mechanic: soldiers cost Solari instead of Manpower ([faction_design.md](faction_design.md)). That
explains the "Iron" in Iron Ranger and Iron Guard, but the unit names are being redone, so treat the current ones as placeholders.

## Open questions
1. Is the East Asian costume the mercenary uniform only, or the house's culture?
2. What does the Trooper fight with?
3. New names for the four infantry units.
4. **Overseer Jool** clashes with Ginaz's Commander Jool. Rename one.
5. Which of the supplied images are approved as final, and which are starting points to redesign from?

## Build notes (not started)
- **Hat:** the key silhouette. Model it early. I haven't checked the vanilla library for a conical-hat donor.
- **Mask / faceless head:** either a hood mesh or a face texture on a vanilla body. Decide before texturing.
- **Heavy Vanguard shield and flame blade:** the costliest new models. Check for shield and melee donors before modelling from scratch.
- **Trooper weapon:** see question 2. It is blocked until this is answered.
- **Infantry roster:** this sheet adds four ground units. [units.md](units.md) still says ground infantry are not drafted, so update it when the user confirms.
