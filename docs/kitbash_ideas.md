# Kitbash ideas (removal + graft) - handoff for a new session

Written for: an agent picking up the kitbash exploration cold. Nothing here is game-ready; it is all Blender previews.

## Rules from the user
- **Never use Sardaukar** parts, models or inputs (helmet, pauldrons, sword). Other units are fine.
- Every kitbash should **remove** something (backpack, belt, pouches, scarf, cape, weapon) *and* graft something, so the result is not just the average of two units.
- Show progress as images saved in the project folder; the user judges by eye. Give a recommendation, then let them pick.

## What already exists
- `model_projects/ravager_variants/` - Gurney body + Ravager hood/mask head, green recoloured black (`Gurney_Ravager_Helm_Black.blend`, scripts `10_recolour_gurney_black.py`, `11_kitbash_gurney_ravager_helm.py`).
- `model_projects/kitbash_explore/` - the exploration workspace. Read its `SPEC.md` first.
  - `08_scripts/units.py` - registry of 21 units (FBX + texture stem). `01_survey.py` renders front/back of each; `02_gallery.py <Unit>` renders every mesh component alone with its id; `sheet_parts.py` makes a labelled sheet; `03_variants.py` builds variants from a `VARIANTS` dict (base, donor, `remove=[component ids]`).
  - Built so far: **V1** Duncan armour + Marauder turban head, **V2** Commando minus backpack + Feydakin head, **V3** Bannerjee minus scarf + Raider hood head, **V4** Marauder minus scarf/belt/pouches + Otheym head, **V5** Mercenary minus cape/scarf/pouches/sword + Bannerjee head, **V6** Ranger minus rifle/pouches + HeavyWeapon helmet, **V7** Free Company minus scarf/apron + Raider hood, **V8** Warden minus weapon/skirt panels + Otheym head (candidates 1-4 and 6 below are partly done: 1=V7, 3=V5, 4=V6, 5=V8). Renders in `02_progress_photos/03_variants/`, component sheets in `02_progress_photos/02_components/<Unit>_parts.png`.
- Part-level tooling for graft/mirror/recolour/inflate lives in `.claude/skills/dsw-part-kitbash/` (read its `references/lessons.md`).

## How the technique works (so you can reuse it)
- Every Male01 unit shares one skeleton, so any part cut from any body already has valid skin weights for any other Male01 body: parent the donor object to the base armature and point its Armature modifier at it.
- Female01 (FreeCompany, Ranger, Warden) has the same bone names plus extras (`B_Weapon_L`, `B_lThumbJ3`, `B_lToeJ`, `B_rToeJ`, `B_rThumbJ3`), so grafts between Male01 and Female01 should work, but the proportions differ - check the neck/shoulder fit visually.
- "Head" = faces whose vertices are all dominated by `B_HeadJ` (keeps hair, hoods, masks). Delete the same faces from the base. The base neck stays; the donor head must overlap it.
- Components = connected mesh islands ranked by vertex count (`dsw_parts.components`), ids are deterministic per unit. Scarves, straps, pouches and the Commando backpack are separate islands, so they delete cleanly. Small islands (<40 verts) hide leftovers (knots, straps) - list them with `comp_info` if a stray piece remains after a removal.
- Whole-body chest/belt/holster areas are often *inside* one big island (the Commando belt and hip armour are part of the pants island) - removing those needs a face/UV-region cut, not a component delete.

## Gotchas
- **`model_inputs/` is being reorganised by the user** (e.g. `Bannerjee/` -> `Smuggler/Unit/Bannerjee/`, new `Atreide/Unit/*`). Never hard-code input paths: `kitbash_explore/08_scripts/units.py` now finds files by name under `model_inputs`. Do not "restore" moved/deleted input files (git shows many as deleted on purpose).
- Several units (HeavyWeaponSquad, FreeCompany, Ranger, Warden, Mercenary) are **fragmented into many small islands** (HeavyWeapon: 92 islands, biggest 98 verts). Belts/pouches there are tiny islands below the 40-vert gallery cut-off; use `--min-verts 8` or a bounding-box removal instead of component ids.
- Files named `.fbx` under `model_inputs/Atreide/Unit/*` and `model_inputs/Smuggler/Unit/*` are **HMD files**, not FBX ("Invalid header" in Blender). Convert with `hmd2fbx.convert(hmd, fbx)` from `HMD_toolkit/HMD_toolkit/Models`. Converted copies of Ranger, Warden, HeavyWeaponSquad and Mercenary are in `model_projects/kitbash_explore/05_fbx_export/`.
- Ranger, Warden and Mercenary meshes carry a **second material** (a baked-in weapon/staff under the feet; Mercenary also `Mat_Base`). `wire_textures` currently points every material at the first stem's textures, so those parts look wrong - map materials by name if you keep them, or just delete the weapon island (a free removal).
- Game textures are DDS named `.png`; Blender 5.2 loads them (with a harmless warning), Pillow reads them.
- Relative render paths resolve against the drive root - always pass absolute paths.
- Run Blender with `blender.exe -b --python <script> -- <args>`; a 5-unit gallery run takes more than the 2-minute shell timeout, so background it.

## Candidate kitbashes (none built yet)
Each = base body, what to remove, what to graft. Component ids need a look at the gallery sheet first.

1. **Stripped Free Company mercenary** - base FreeCompany (Female01). Remove the long blue scarf (tail runs down the back), blue apron, belt pouches. Graft the Raider hood-wrap head or the HeavyWeapon visor helmet. Tests a Female01 base with male heads.
2. **Heavy Weapon Squad, no belts** - base HeavyWeapon (Male01, green/brown plate armour). Remove the front belt pack and the rear pouches. Graft Otheym's bearded head (bare-headed heavy) or Raider's hood. Recolour the green to a neutral/black if the user wants (reuse `10_recolour_gurney_black.py`, the hue band logic is generic).
3. **Mercenary, cape off, hood swapped** - base Mercenary (Male01). Remove the big blue cape and the baked-in staff. Graft the Bannerjee head (white hair) or the Marauder turban. The orange/blue Smuggler palette stays.
4. **Ranger without gear** - base Ranger (Female01). Remove the baked-in rifle, hip pouches and the large back pouch. Graft the HeavyWeapon helmet (visor) for a masked scout.
5. **Warden, coat off** - base Warden (Female01, green coat/armour). Remove the baked-in shield/staff and the coat skirt (check whether the skirt is its own island). Graft the Commando head with scarf.
6. **Otheym stripped** - base Otheym (Male01, brown leather, big yellow scarf, shoulder pack and satchel). Remove the scarf, shoulder pack and satchel (see `Otheym_parts.png`, 53 components). Graft the Idualis02 head (curly hair + red mask) for a desert fighter.
7. **Raider as a monk** - base Raider. Remove the big white scarf, the sash and the pouch; keep the vest. Graft Duncan's ponytail head.
8. **Commando, belt and holsters off** - needs a face/UV-region cut because the belt and holsters are inside the pants island. Good test of a region-based removal. Pair with the Bannerjee head.
9. **Part-level (not head) swaps**, using `dsw-part-kitbash`: take pauldrons or forearm guards from one unit onto another after removing the base's own (for example Gurney pads on the HeavyWeapon body without its belts).
10. **Recolour pass on any result** - the user liked the Gurney green -> black result. Most variants still carry their donor/base palette; a recolour to one house palette would make them read as one unit.

## Known rough spots in the built variants (worth fixing first)
- Thin mask ties/straps float beside the ear on V1 and V4.
- Marauder's inner collar reads pale/washed on V4; Marauder textures look slightly washed overall.
- V1 still shows Duncan's green apron.
- No animation stress test has been done on any variant (idle/run/attack); do that before showing any as final (`dsw-part-kitbash/scripts/anim_stress.py`).
