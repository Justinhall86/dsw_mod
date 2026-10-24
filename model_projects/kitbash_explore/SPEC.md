# Kitbash explore - removals + head swaps (no Sardaukar)

Exploration of kitbashes that REMOVE parts (backpack, scarf, belt, pouches) as well as graft a donor head,
so results are not just the average of two units. All bodies are Male01 on the shared rig.

| Variant | Base body | Removed (base component ids) | Donor head |
|---|---|---|---|
| V1_DuncanTurban | Duncan | scarf, scarf tail, strap, 2 pouches, ponytail pieces | Marauder (turban + face wrap) |
| V2_CommandoNoPack | Commando | backpack (4 big + 4 small comps) | Feydakin (hair + breather mask) |
| V3_BannerjeeHooded | Bannerjee | blue scarf + knots/strip | Raider (hood wrap + mask) |
| V4_MarauderBare | Marauder | red scarf, belt strap, 2 pouches | Otheym (hair + beard) |
| V5_MercenaryStripped | Mercenary | cape, scarf, pouches, strap, baked-in sword | Bannerjee (white hair) |
| V6_RangerMasked | Ranger (Female01) | baked-in rifle, hip pouches | HeavyWeaponSquad helmet |
| V7_FreeCompanyHooded | Free Company (Female01) | scarf + long tail, blue apron | Raider hood wrap + mask |
| V8_WardenUnmasked | Warden (Female01) | baked-in weapon, green skirt panels | Otheym (hair + beard) |

- Survey of 16 units: `02_progress_photos/01_survey/` (front/back sheets). Component galleries (id, verts, bone):
  `02_progress_photos/02_components/<Unit>_parts.png`. Variant renders + sheets: `02_progress_photos/03_variants/`.
- `.blend` per variant in `03_blender/`.
- Scripts: `08_scripts/01_survey.py`, `02_gallery.py`, `03_variants.py` (edit the VARIANTS dict), `units.py`.
- Head = faces whose vertices are all dominated by `B_HeadJ`; component ids come from `dsw_parts.components` (rank by vertex count).
- Baked-in weapons (bone `B_Weapon` / `B_Scabbard`) are removed automatically by `03_variants.py`.
- `units.py` locates files by NAME under `model_inputs` (the user reorganises those folders); Ranger/Warden/HeavyWeapon/Mercenary
  are HMD files named `.fbx`, converted copies are in `05_fbx_export/`.
- Rough spots: V5 keeps a small blue shard on the chest; V7 keeps the belt pouches and a grey knob at the hip; V8's coat is
  black where the green skirt panels were removed (inner layer shows).
- Other rough spots: thin mask ties/straps float beside the ear on V1/V4; Marauder's inner collar reads pale.
- Not game-ready (no HMD/data.cdb). Sardaukar parts are deliberately never used.

## Duncan x Commando (no pack, no neck wrap): `03_blender/Duncan_Commando.blend`

Commando body with Duncan's head, and BOTH scarves gone. `08_scripts/05_duncan_commando.py` (`--cut 1.62 --drop 0.065`).

- Commando backpack: 8 components removed (gallery ids 4-7, 41-44).
- Commando's "scarf" is three things: the cowl (top of the vest component, cut above z 1.62), the face mask +
  neck collar (its `B_HeadJ` faces, gone with the head swap) and a small ring of SpineTop/Neck01-weighted pieces that
  stays attached to the head until the head is cut (found by size/height AFTER the head cut, 83 verts).
- Duncan donor: only his `B_HeadJ` faces + his Neck01 ring (the dark undershirt collar); his scarf (a separate
  component) is never imported. The head+neck is seated 6.5 cm lower so the neck sits in the vest opening.
- Renders: `02_progress_photos/05_duncan_commando/` (`full.png`, `neck.png`); probe of the cowl cut heights in `04_scarf_probe/`.
- Rough spots: Duncan's dark neck collar reads brown against the Commando's black; vest top edge is a straight cut.

### Neck fill: collar donors (`--collar gurney|houseguard|aramsham --cdrop 0.035 --cscale 0.96`)

With the scarf gone the neck was an open hole, so a rigid collar from another unit was grafted on (own material, own
skin weights, same rig). Candidates were found with `06_collar_probe.py` (renders every neck-height component of 12 units
alone: `02_progress_photos/06_collar_probe/collars.png`).
- **houseguard** (kept): HouseGuard's grey-silver gorget (comps 16/17). Matches the Commando's silver trim; `03_blender/Duncan_Commando_houseguard.blend`.
- gurney: dark collar with a grey plate; still carries Gurney's green + gold gems (needs the black recolour), `..._gurney.blend`.
- aramsham: tall gold collar; too big and gold for this palette, `..._aramsham.blend`.
- The Imperial Trooper's gold-rimmed collar was probed but not built. Scarf-type neck pieces (Duncan, Marauder, Feydakin, Otheym, Raider, Militia, Bannerjee) were skipped on purpose.
