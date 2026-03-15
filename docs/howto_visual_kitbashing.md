# How-To: Visual Kitbashing for Landsraad Units

## Overview — Engine Architecture: No Paper-Doll Support

> **CRITICAL ENGINE LIMITATION — Read before designing any unit visuals.**

Dune: Spice Wars does **NOT** support "Paper Doll" micro-kitbashing. The 3D models for units
have their weapons, helmets, and heads **permanently baked** into the single character mesh.
There are **no equipment slots, attachment points, or JSON string paths** that can swap an
individual sword, gun, or helmet on an existing body.

**Do not attempt to:**
- Swap a weapon or gun on an existing prefab via a path or JSON field
- Replace a unit's head using a string reference
- Mix the torso of one mesh with the arms of another

These operations are architecturally impossible in this engine without external 3D software
(which is out of scope for this workflow).

Instead, use **The Frankenstein Kitbash Strategy** — the 5 viable methods documented below.
All visual customization for Landsraad units must use only these methods.

> **See also:** [howto_reverse_engineering.md](./howto_reverse_engineering.md) — for examining
> how other mods implement specific visual swaps.

---

## The Frankenstein Kitbash Strategy — 5 Viable Methods

### Method 1: Full Mesh Swapping (Change the Entire Body)

Since individual parts cannot be swapped, the correct approach is to replace the **entire
prefab**. Every unit references a `prefab path` in its `unitGfx` entry pointing to a Unity
prefab. Change that path to switch the complete mesh — body, weapon, head, and all — to a
different unit type.

**To swap a mesh, edit the `"path"` string in the `mesh` block:**

```json
"mesh": [
  {
    "path": "Character/Common/Landsraad/Prefab_LandsraadGuard.prefab"
  }
]
```

Replace the path with any valid prefab path from the game. To find available paths, search
`res/data.cdb` for `.prefab"` — every existing unit's model path is listed there.

**Example — using a Corrino trooper body for a Landsraad Enforcer:**
```json
"mesh": [
  {
    "path": "Character/Imperial/Trooper/Prefab_ImperialTrooper.prefab"
  }
]
```

> **Remember:** The weapon shown on the new mesh is whatever is baked into that prefab.
> You cannot add, remove, or change it. Choose the prefab whose baked loadout best matches
> your unit's intended role.

---

### Method 2: Animation Swapping (Assign a Different Attack Combo)

Even when reusing a vanilla mesh, you can assign a completely different attack animation set
from any other unit. This changes how the unit moves and strikes, creating a distinct
combat feel without needing a unique model.

**Example — making a Landsraad spear-carrier use Sardaukar sword animations:**
In the unit's CDB entry, set the `"animCombo"` (or equivalent attack combo reference) to a
Sardaukar combat combo ID instead of the default spear combo.

Find valid combo IDs by searching `res/data.cdb` for `"animCombo"` entries in existing unit
attack blocks. Copy the ID verbatim from a unit whose animations match your intent.

> **Rig compatibility rule:** The target animation set must use the same `"rigName"` as the
> mesh. `rigName: 0` is the standard humanoid infantry rig. Do not mix infantry animation
> combos with vehicle rigs (`rigName: 1`).

---

### Method 3: VFX and Projectile Swapping (Change Attack Effects)

Attack definitions in the `attacks` block reference VFX (particle/shader effects) and
projectile types by string path. Swapping these changes what a weapon **looks and sounds like**
when it fires — a standard sniper rifle can be made to shoot a Harkonnen rocket or an
artillery shell without touching the mesh.

Find VFX strings by searching `res/data.cdb` for `"fxs"` arrays within attack combo entries.
Common patterns:
- `"FX/Weapons/Melee/FX_MeleeSlash"` — generic melee slash
- `"FX/Weapons/Ranged/FX_LaserBeam"` — energy weapon beam
- `"FX/Weapons/Explosive/FX_RocketTrail"` — missile/rocket

**Example — swapping a guard's baton VFX for an energy strike:**
```json
"fxs": [
  { "path": "FX/Weapons/Melee/FX_EnergyStrike" }
]
```

**Projectile swapping:** If the unit uses a ranged `projectile` reference inside the attack
data, replace the projectile ID with any valid entry from the `projectile` sheet in
`data.cdb`. This is how a standard foot soldier can visually fire a Harkonnen plasma bolt
or an artillery shell without changing its mesh.

---

### Method 4: Scale Manipulation (Physically Enlarge Heroes and Elites)

The `unitGfx` entry for each unit includes a `"scale"` float parameter. Increasing this value
makes the unit physically larger on the battlefield — a key technique for making hero units
visually imposing against standard infantry.

**Reference values:**
- Standard infantry: `1.0`
- Landsraad Guard: `1.2` (already set in `N_LR_Guard` unitGfx entry)
- Heroes / elite units: `1.15` – `1.25` (recommended)
- Above `1.5` risks clipping through terrain and buildings — avoid

**Example — scaling Karlin Mallenor's model:**
```json
{
  "id": "N_KarlinMallenor",
  "scale": 1.45,
  "inherit": "MilitaryLRGuard",
  "mesh": [
    { "path": "Character/Imperial/Commander/Prefab_ImperialCommander.prefab" }
  ]
}
```

---

### Method 5: Color Masking (Apply Faction Colors to Vanilla Models)

The game applies faction colors to mesh materials via color mask channels. Meshes that support
faction coloring have two paintable channels:
- **Primary color** — applied to main armor/clothing
- **Secondary color** — applied to trim, accessories, highlights

These are defined in the **faction sheet** under color values, not in the unit entry itself.
Any mesh that uses the standard faction shader will **automatically** pick up the faction's
colors. This means a vanilla mercenary or renegade mesh will display Landsraad Gold and Purple
when assigned to `LandsraadFaction` — no texture editing required.

**For LandsraadFaction, target colors (verify in `faction` sheet before finalizing):**
- Primary: Landsraad Gold (approx. `#D4AF37` — confirm in `faction` sheet entry)
- Secondary: Imperial Purple (approx. `#4B0082` — confirm in `faction` sheet entry)

**To apply faction colors to a kitbashed Corrino/Atreides model:**
1. Verify the source prefab uses the standard faction shader (most `Prefab_Imperial*` and
   `Prefab_Atreides*` meshes do)
2. Set `"faction": "LandsraadFaction"` in the unit's CDB entry
3. The engine will automatically apply LandsraadFaction's primary/secondary colors to the mesh

> **If a mesh uses a hardcoded texture** instead of the faction shader, color masking will
> not work — the model will display its original faction colors regardless. In that case,
> choose a different base prefab (Method 1).

---

## GFX Icon Configuration

Every unit needs a UI icon (the small portrait shown in the unit wheel and selection panel).
This is set in the `"gfx"` block of the unit entry — it references a sprite sheet and an x/y
grid position:

```json
"gfx": {
  "file": "UI/Faction/unitsSmall_Common.png",
  "size": 80,
  "x": 0,
  "y": 3
}
```

The existing Landsraad units use `unitsSmall_Common.png`. Use the same sprite sheet and find
an unoccupied grid cell, or reuse the closest matching vanilla icon for prototyping.

For the wheel portrait (larger icon in the command wheel):
```json
"images": {
  "wheelPortrait": {
    "file": "UI/console/wheel_units_misc.png",
    "size": 358,
    "x": 7,
    "y": 0
  }
}
```

---

## Landsraad Unit Visual Plans

Based on the faction theme (gold armor, imperial authority, punitive force):

| Unit                       | Suggested Base Mesh            | Scale | Methods Used                         |
|----------------------------|-------------------------------|-------|--------------------------------------|
| Landsraad Guard            | `Prefab_LandsraadGuard`       | 1.2   | Already in CDB — use as-is         |
| Landsraad Judge (ranged)   | `Prefab_LandsraadGuard_Gun`   | 1.2   | Already in CDB — use as-is         |
| Landsraad Punisher         | `Prefab_LandsraadGuard_Bazooka` | 1.2 | Already in CDB — use as-is         |
| Karlin Mallenor (leader)   | Imperial Commander prefab      | 1.45  | Methods 1+4+5 — swap + scale + color |
| Vane Torvver (hero)        | Imperial Ranger/Enforcer       | 1.35  | Methods 1+2+5 — swap + anim + color  |
| Landsraad Enforcer (elite) | Corrino Elite / Sardaukar      | 1.3   | Methods 1+5 — faction colors apply   |
| Auditor Drone              | Existing drone/ornithopter     | 0.8   | Method 1 — smaller support unit feel |

---

## Rig Compatibility

When swapping prefab paths (Method 1) or animation combos (Method 2), the `"rigName"` field
must be compatible with the target mesh's skeleton. Mismatched rigs cause T-pose bugs.

The Landsraad Guard uses `"rigName": 0` (standard humanoid rig). Most infantry prefabs share
this rig. Vehicles, ornithopters, and sandworms use different rig IDs and **cannot** be
cross-swapped with infantry meshes.

Check `"rigName"` in the source template before swapping prefab paths or animation combos:
```json
"rigName": 0   // humanoid infantry
"rigName": 1   // vehicle/ornithopter (do not mix with infantry)
```

---

## Troubleshooting Visual Issues

| Symptom                        | Likely Cause                              | Fix                                      |
|-------------------------------|-------------------------------------------|------------------------------------------|
| Unit shows wrong faction color | Mesh uses hardcoded texture, not shader   | Choose a different base prefab           |
| T-pose / broken animation      | rigName mismatch between mesh and entry   | Match rigName to source prefab's value   |
| Unit invisible on battlefield  | Invalid / missing prefab path             | Verify path exists in another CDB entry  |
| Weapon effect missing          | VFX path string typo or missing asset     | Copy VFX string verbatim from vanilla    |
| Unit clipping through terrain  | Scale too high (above ~1.5)               | Reduce scale to 1.15–1.25                                            |
| Wrong weapon appears on unit   | Weapon is permanently baked into mesh     | Use Method 1: swap the entire prefab to one with the correct loadout |

---

## Cross-References

- **CastleDB field structure** for gfx/mesh entries → [howto_castledb_workflow.md](./howto_castledb_workflow.md)
- **Finding paths in other mods** for kitbash inspiration → [howto_reverse_engineering.md](./howto_reverse_engineering.md)
