# Animation testing and weapons

## Where clips live
`C:\dsw_mod\extr\Anim\<Male01|Female01>\...`: generic clips directly in `Anim/Male01/` (Idle, FightIdle, Run, FightRun,
AttackMelee01-03, AttackRange, FightHit*, FightDeath*, Death01...), per-set folders (`Duncan/`, `Rifle/`, `Shield/`, `Knight/`,
`DualSwords/`, `Gurney/`...). The clips are HMD files named `.fbx`; convert onto YOUR body (bone names match every Male01
variant; "tracks: 53/53 matched" is the success line, whip joints without tracks are harmless):
```
cd HMD_toolkit/HMD_toolkit/Animations
python hmdanim2fbx.py <body HMD .fbx> /c/dsw_mod/extr/Anim/Male01/Anim_Male01_AttackMelee01.fbx <proj>/05_fbx_export/anim/Common_AttackMelee01.fbx
```
The body argument must be an HMD (e.g. `model_inputs/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx`), not a Blender FBX.

## Which animation set a unit uses
`model.<id>.inherit` in data.cdb names an anim-set model entry. `MilitaryCommon` = the full generic Male01 set (25 states: Idle,
Run, AttackMelee, FightIdle, FightHit*, FightDeath, ...) used by the Atreides Trooper: safest for a regular unit. `Duncan` is a sparse
override (11 entries: Duncan_Run, Duncan_AttackMelee, Skill that THROWS the sword and brings it back...) meant for a hero. `MilitaryShield`
= shield stance (Warden). Preview with the clips of the set you will inherit, not just the ones you like: the sword mount
was validated against BOTH Duncan's and the Common clips.

## Mounting a weapon (what actually worked)
- On the Male01 rig `B_Weapon` RESTS at the feet and the clips carry it to the hand. A weapon parented to it therefore sits at the
  feet in rest pose and is in the hand in every clip. Place it where the vanilla baked sword sits: for the TallSword, grip at world
  (0, 0.03, 0.12) in rest pose, blade pointing world -Z (`11_sword_anim.py`).
- Do NOT use another unit's prefab offsets blindly: the Ecaz Fencer prefab offsets are for Female01 Fencer clips and float the
  sword off the hand in Male01 clips.
- For the game, BAKE the weapon into the body mesh (vertices at the rest placement, 100 % weight on `B_Weapon`, own material with
  the vanilla weapon texture): it behaves exactly like the vanilla baked swords and needs no prefab constraint (`12_assemble_export.py`).
- When rendering clips: remove cameras from the file first, one sword only (opening a file that already has the sword and running
  the script again adds a SECOND sword - looks like a model bug, is a test artefact).

## Rendering clips: `11_sword_anim.py`
`-- <out_dir> [--clips Name ...] [--step 2] [--check] [--save f.blend]`. `--check` renders one frame per clip (fast sanity pass).
Output `<out>/<clip>/fNNN.png`. Camera follows the pelvis, orthographic 3.3 so leaps and overhead swings stay in frame.
Make GIFs with PIL: resize frames to 400x400, convert each to a 128-colour palette image, `save_all=True, duration=66, loop=0`.
Send the 5 GIFs (idle, run, attack1, attack2, skill) to the user with SendUserFile and an overview contact sheet for yourself.

## What to look for
tearing at the shoulder/armpit on arm swings; collar/coat vs head intersections on a head turn; coat tails clipping legs in Run;
weapon staying in the hand through every clip incl. leaps; mesh popping when a clip starts. Compare with the vanilla unit in the same
frame to separate "inherent to the rig" from "our fault".

## The Blender 5 trap
`rig.animation_data.action = action` is NOT enough for layered actions; also set `rig.animation_data.action_slot = action.slots[0]`.
Without it every frame renders in rest pose. Symptom: all frames of a sheet look identical.
