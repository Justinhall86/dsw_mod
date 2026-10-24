# Worked example: the Commando without a backpack

This is the job the skill was written for. It is kept as a concrete example of
the numbers each step produces, so a new run can be sanity-checked against
it.

Source: `model_inputs/Commando/Male01_Commando_TRUE_FBX.fbx` - the Commando
body of the vanilla **House Legionary** (`unit` sheet `House_Soldier`, faction
`MinorHouses`).

## The job

Two deliverables, in the same project folder:

| Variant | Look |
|---|---|
| `no_backpack` | the original Commando colours, no pack |
| `no_backpack_house` | the same, in the House Ginaz palette (plum + gold) |

## Numbers to expect

| Step | Result |
|---|---|
| Source mesh | 3,299 verts / 5,284 tris / 45 components / 53 bones |
| Backpack components | 4, 5, 6, 7, 41, 42, 43, 44 |
| After removal | 2,855 verts / 4,574 tris (710 faces removed) |
| UV atlas coverage | 57.6% |
| Region map | 0 unknown pixels |
| Grip point | `(-0.687, -0.022, 1.125)` |
| Weapon bbox after placement | x -0.747..-0.628, y -0.753..0.368, z 0.970..1.366 |

## The order it was done in

1. `01_analyse_mesh.py` - the component table, and per-component shots.
2. `02_remove_parts.py --components 4,5,6,7,41,42,43,44` with the proof.
3. `04_classify_regions.py` on the base Commando textures, with the game's
   faction-tint mask.
4. `05_recolour.py` with the House palette.
5. `02_remove_parts.py` again on the recoloured FBX, to bake the House
   textures onto the no-pack mesh.
6. `06_convert_weapon.py` for the Maula rifle.
7. `07_build_blend.py` - the finished `.blend`.
8. `08_verify_blend.py` - `PROBLEMS: none`.
9. `09_showcase.py` - the pictures.

## The House palette

```json
{
  "palette": {
    "plum":        [104, 54, 66],
    "plum_dark":   [42, 26, 33],
    "plum_plate":  [72, 42, 52],
    "gold":        [196, 154, 78],
    "leather":     [92, 48, 38],
    "skin":        [150, 104, 84]
  },
  "recipe": {
    "1": ["skin", 0.0],
    "2": ["plum_dark", 0.0],
    "3": ["leather", 0.15],
    "4": ["plum", 0.0],
    "5": ["plum_plate", 0.0],
    "6": ["gold", 0.0]
  },
  "metallic": {
    "2": [0.60, 0.0],
    "3": [0.70, 0.0],
    "4": [0.30, 0.0],
    "5": [0.55, 0.0],
    "6": [1.00, 60.0]
  }
}
```

The hero colour is the **accent plate** (region 4) - the region the game
already tints per faction, so the recolour lines up with how the game itself
would recolour it.

## The weapon

The **Atreide Maula rifle**, from
`extr/Character/Atreide/Unit/Weapons/Atreide_MaulaRifle.fbx`.

- It is an HMD with an `.fbx` extension - `06_convert_weapon.py` converts it.
- It has two models; the geometry-less one is dropped.
- It carries a `Cube` helper mesh, deleted on import.
- Its textures must be wired explicitly or it renders magenta.
- rotationX **+90**, parented to `B_Gun`.

## What was still open afterwards

- Neither variant had a `data.cdb` entry yet.
- Nothing was built into a pak or tested in game.
- The vanilla-coloured variant shows a plain cream back where the pack was.
