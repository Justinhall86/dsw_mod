# Worked example: the House Ginaz Captain (2026-10-23/24)

Goal (user): a House Ginaz unit "like a matador or naval captain", reference picture `reference.jpg` (wine-red long coat with gold
braided edging, tall stand-up collar, dark beard and hair, leather belt, boots, rapier), "no scarf", never Sardaukar. Then: give it
the tall sword, show animations, put it in the game over the Warden slot, spawn 5 at the start.

Animation GIFs (idle, run, attack 1, attack 2, skill; Duncan's swordmaster clips, 400x400): `gifs/ginaz_captain_1_idle.gif` ... `gifs/ginaz_captain_5_skill.gif`.

Result: `final_neck_collar_angles.png`, `final_collar_front.png`, `recolour_turnaround.png`, `animation_overview.png`.
Installed and confirmed working in game by the user ("Works perfectly").

## Recipe (`recipe_V6b.py` has the exact dict)
| Piece | Source | How |
|---|---|---|
| body | Smuggler Mercenary (leather mantle, sleeves, belt, trousers, boots) | removed 16 islands (blue scarf/cape pieces, pouches, holster, baked sword/scabbard) + every mostly-metal island (`metal=True`) |
| torso | Raider tunic islands (minus scarf/sash/pouch) | `fill`, capped z 1.64, `clip_inside`, weights from the uncut Mercenary |
| coat tails | Gurney islands 9, 10, 22, 23 | `fill keep_comps`, recoloured wine, gold studs + stripe |
| head | Bannerjee (white hair + beard) | donor head + neck tube island 25, hair/beard recoloured black |
| collar | hand-modelled `build_collar` | wine body + gold rim, tallest at the back, hairline front seam |
| neck repair | scripted | `flip_neck_back`, `stitch_nape`, `neck_extend`, `neck_backplate`, `collar_z` bisect |
| weapon | Ecaz `TallSword` | baked to `B_Weapon`, vanilla `WeaponFencer` textures |
| colours | `09_ginaz_recolour.py` RULES/PAL | wine coat (92,32,52), dark-wine tunic, plum gloves, dark trousers, leather boots, gold trim/studs/rim, near-black hair |
| animations | `MilitaryCommon` set (verified also with Duncan's clips) | sword in hand through idle/run/3 attacks/hit |

## Timeline (what each user message changed)
1. "improve this kitbash ... helmet head wrong, it's green, should be black" -> Ravager + Gurney kitbash rebuilt as one body, green recoloured black.
2. "pick other units ... removing some components as well" -> survey of 16 units, 4 then 4 more variants (V1-V8).
3. "for mercenary stripped, remove all the metal pieces, swapping with bare skin or fabric" -> `04_metal_map.py`, `metal=True`, fills (fabric/skin); user picked fabric.
4. "shirt sticking through the shoulders ... the neck does not look good ... high quality" -> the 27-iteration repair loop (clip_inside, weights, neck, nape, culling).
5. "No scarf. House Ginaz, matador / naval captain, here is a reference" -> coat tails, recolour, collar.
6. "still the neck and collar, looks like a tall pencil ... fill that in by hand using the image" -> `build_collar`.
7. "give him the tailsword, show animations, share in this chat" -> weapon mount, clip renders, GIFs sent.
8. "insert into the game, take over the warden slot, spawn about 5" -> HMD conversion, cdb patch, install, launch.
9. "this is the way we make new units - create a skill" -> this skill.

## Decisions worth reusing
- Fabric chest (Raider tunic) over a bare chest: the user chose it on sight of both.
- Recommend one option with a reason, show two when taste decides (V5c vs V5d).
- Keep every intermediate blend (`V5c..V6c`) - the user may go back.
- Ginaz look uses the Atreides-compatible Warden slot because it was already proven, spawn = one squad of 5 at Arrakeen, stats untouched.

## What was NOT done / open
Gold braiding across the chest and gold coat edging (texture paint, items 2-3 of the "still differs from the reference" list),
coat length to mid-shin, front pouch + back holster still on the belt, armpit tunic fold in a hard cross-chest swing,
female-body variant, per-faction recolours.
