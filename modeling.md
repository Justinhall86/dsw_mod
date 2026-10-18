# Custom 3D Models in Dune: Spice Wars

Notes on getting custom or edited 3D models (and animations) into DSW. Compiled from
Discord conversations with Peter (author of the HMD Toolkit) and xlamLegendx, the
Heaps FBX docs, and an inspection of `Male01_HouseGuard02_ascii.fbx` in this repo.

---

## 1. Background: why this is hard

- DSW is built on **Heaps** (Haxe engine). Heaps does not load FBX at runtime; it converts
  FBX into its own binary format, **HMD**, which is what ships in the game files.
- Both unit models and animations extracted from the game are HMD. Until the HMD Toolkit
  existed, FBX → HMD was effectively **one-way**: nothing could turn HMD back into
  something Blender could open.
- Recolouring meant hand-editing model files as text to fix texture paths (the old guide
  for that is now mostly obsolete).
- **Animations are tied to the skeleton (armature).** Game animations store per-bone
  *local* transforms. If a new model's skeleton differs from the game rig in any way
  (bone names, hierarchy, rest position, rest orientation, scale), the existing
  animations deform it into garbage. Peter's Feb 2026 screenshots showed exactly that:
  the armature was animating correctly underneath, but the mesh's scale and proportions
  "went haywire."
- 2026-02-17: Peter got a custom model playing an animation in game for the first time,
  proving it can be done. The HMD Toolkit (mid-2026) is what turned that into a
  repeatable workflow.

---

## 2. The three ways to get a model in game

| Option | What it involves | Animations | Effort |
|---|---|---|---|
| **A. Fully new model** | New mesh with its **own skeleton** | You must make or import a **complete animation set** and wire it up in the editor | Highest |
| **B. Extract → edit → re-import** (recommended) | Use the HMD Toolkit to pull a game model out as FBX, change the mesh in Blender, convert it back | **Every existing animation works for free.** No rigging needed | Medium |
| **C. Recolour** | Copy an existing unit and repaint its Albedo texture | Unchanged | Lowest |

Option B is the one that enables paying artists: they "dress up" an existing base body
without touching the base topology, skeleton, or rigging, which keeps the job small and cheap.

---

## 3. HMD Toolkit (Peter's tool)

Download: <https://drive.google.com/file/d/1ltidhjgTKeaIQtDlvZzcqBq6azqXfLIS/view?usp=drive_link>

It's the all-purpose tool for models and animations. It:

- converts HMD (game models) → FBX (editable in Blender)
- converts FBX → **game-ready** HMD, which is normally not easy
- does both for **models and animations**, on separate tabs
- streamlines recolouring

All path fields accept drag-and-drop if the file type is right.

### 3.1 Model → FBX

- **Input:** a model, or a folder of models. Accepts `.hmd`, or `.fbx` files that are
  really HMD with the wrong extension ("fake-fbx").
- **Output directory:** optional. Setting one keeps everything in one place.
- Result: an FBX you can open and edit in Blender.

### 3.2 FBX → Model

Puts an edited FBX back in game so that it **can play the rig's existing animations**.
Blender changes the model on export in ways the tool has to compensate for, so always
run Blender exports through this tool.

| Field | Meaning |
|---|---|
| Input FBX | FBX exported from Blender with the settings in §4 |
| Rig | `Male`, `Female`, or `Custom` (drones, planes, etc.) |
| Resource dir | The tool writes the HMD into `D4XEditor/res/<resourcedir>`. HMDs reference their texture maps (albedo/normal/…) by exact path, so this has to be the final location |
| Output folder | Fills itself in. You can override it; to go back to automatic, clear the field |

- `res/<resourcedir>` lets you preview the model in the **HIDE editor** and check it works
  with the game's animations.
- When it's ready to ship, move `<resourcedir>` into **`res/res`** and repackage.

### 3.3 Animation → FBX

- Attach the animation **and a "dummy" model** of the same rig, so the animation has a
  body in Blender.
- The resulting FBX opens and plays in Blender.

### 3.4 FBX → Animation

Converts an FBX animation to a game-ready one. It can also edit the **events** of an
existing animation (for example, which frame the hit lands on).

- Provide a **reference animation** from the same rig (usually `Male01` or `Female01`)
  so the Events field is prefilled with the right syntax.
- Enter the **rig name**. If there's no reference animation, or this is a new animation,
  fill in **New animation name**.
- Output is named `Anim_<Rig>_<Name>`, which is the exact pattern the game reads.
- **Events** syntax is `frame:event`, e.g. `11:hit` triggers a hit on frame 11. Events
  are visible in the Editor.
- **Hooking it up in the editor:** in the model tab, put the rig name in the model's
  `rigName` column and `<Name>` in the matching `animName` column, with any trailing
  `01`/`02` removed.

### 3.5 Recolour

- Takes any existing model (hmd or fake-fbx) and makes an **independent copy**. By default
  it also makes an **empty prefab**, so you can attach weapons and the like.
- Finds the related images automatically, but **only if they sit next to the input file**,
  and copies them to the new directory.
- **New resource dir must be the final directory the game will read from**, or the HMD
  won't find its maps. The default `CharMOD` produces `.../D4XEditor/res/CharMOD`, which
  you move to `res/res` before repackaging.
- You still have to repaint the **Albedo** map yourself. The old guide covers Krita
  basics.

---

## 4. Blender export settings (FBX → game)

Use these every time, and give them to any artist:

```
Forward = Y, Up = Z
Add Leaf Bones OFF
Animation OFF
Path Mode = Copy (and enable the button next to it - Embed Textures)
```

Other Blender notes from the Feb 2026 testing and the Heaps docs:

- Apply Scaling: **FBX Units Scale** (Main tab).
- Animation → Simplify: **0**, when exporting animations, to avoid jitter and keep the
  armature's scale correct.
- **Triangulate Faces** on.
- Blender 4.2+: Heaps doesn't fully support smooth shading yet.
- Bone axis: primary is **Y**; leave the defaults. Changing the bone axes on export changes
  how the animation moves, or stops it working. To fix which way a model faces, **rotate
  the model in Blender**; don't use axis settings for that.

---

## 5. Brief for hired artists (dressing up a base model)

1. Use the HMD Toolkit to export a model on the right armature (Male01 / Female01) and
   send them the FBX.
2. **Don't touch the armature.** Any change to any bone breaks the animations: renaming,
   moving, rolling, adding, deleting, or applying transforms.
3. Ask them to export from **Blender** with the settings in §4. Exports from other 3D
   software haven't been tested with the toolkit.
4. Constraints worth including (from the Heaps docs and the reference model in §7):
   - **One skinned mesh.** Heaps can't share one skin across several objects, so merge
     everything into a single object. Multiple materials are fine.
   - **Don't parent props to bones.** Weapons, shields, and so on are attached in game
     via prefabs and attachment bones (`B_Weapon`, `B_Shield`, `B_Gun`, `B_Scabbard`).
   - **Triangulated mesh**, with a budget close to the vanilla units (the House Guard is
     about **3.4k verts / 6.3k tris**).
   - **Texture set:** `<Name>_Albedo.png`, `<Name>_Normal.png`,
     `<Name>_MetallicGlossAO.png`, which is the vanilla naming.
   - **Max 3 bone influences per vertex** (Blender *Limit Total* = 3). The game keeps
     only the strongest 3, so anything beyond that deforms differently than in Blender.
5. Tip for artists: when adding clothing or armour to the base body, copy the skin weights
   from the body with Blender's **Data Transfer** modifier (Vertex Data → Vertex Groups)
   and then touch them up. That's most of the "rigging" work and it never moves a bone.

---

## 6. Heaps FBX requirements (official docs)

Source: <https://heaps.io/documentation/fbx-models.html>

- FBX 2010 / FBX **7.x**. **Binary and ASCII (text) are both supported** by Heaps.
- **Z-up, −Y forward.**
- **BakeAnimation** on, so animations match exactly.
- **Triangulate Faces.**
- 3ds Max / Maya: use the **Game Exporter**, not the standard Export.
- Blender 2.8+: *FBX Units Scale* in Apply Scaling, Simplify = 0.
- Restrictions: no shared skins (merge objects), don't attach objects to skin bones (use
  `follow` in code), and not every animation curve type is supported.
- By default the resource manager converts FBX to HMD and caches the result.

---

## 7. Reference file: `Male01_HouseGuard02_ascii.fbx`

An unused Harkonnen model (referred to in Discord as the "Executioner"). It's an **ASCII
FBX**, and **Blender can't import ASCII FBX**. Earlier attempts to force it into binary
(including a detour through Windows 3D Viewer → glb) didn't work.

What's inside, from inspecting the file:

| Property | Value |
|---|---|
| Origin | Shiro's own source asset: `D:\Projects\d4x\trunk\res\Character\Harkonnen\Unit\HouseGuard\Male01_HouseGuard.fbx` |
| Authoring tool | **Autodesk Maya 2020**, FBX SDK 2020.1.1 |
| Format | FBX 7.1 (7100), ASCII |
| Axes | UpAxis Z (+), FrontAxis −Y, i.e. Heaps' required orientation. Originally Y-up in Maya |
| Units | UnitScaleFactor 100, OriginalUnitScaleFactor 1 (Maya cm) |
| Mesh | one mesh `Harkonnen_HouseGuard`, 3,400 verts, 6,276 tris, about 2 m tall |
| Skeleton | 46 joints (`LimbNode`), 38 with skin weights, one BindPose |
| Animation | none, mesh and rig only |
| Textures | `HouseGuard_Albedo.png`, `HouseGuard_Normal.png`, `HouseGuard_MetallicGlossAO.png` |

**Male01 joint hierarchy** (names as the game expects them):

```
B_ROOTJ
├─ B_Spine01J ─ B_Spine02J ─ B_SpineTopJ
│   ├─ B_Neck01J ─ B_HeadJ
│   ├─ B_lClavicleJ ─ B_lShoulderJ ─ B_lElbowJ ─ B_lForearmJ ─ B_lWristJ ─ B_lPalmJ
│   │     └─ B_lFinger1J1/J2, B_lFinger2J1/J2, B_lThumbJ1/J2, B_Shield
│   ├─ B_rClavicleJ ─ ... (mirror) ─ B_rWristJ ─ B_rPalmJ
│   │     └─ B_rFinger1J1/J2, B_rFinger2J1/J2, B_rThumbJ1/J2, B_Weapon, B_Weapon_Add, B_Gun
│   └─ B_Cape01 ─ B_Cape02 ─ B_Cape03
├─ B_lHipJ ─ B_lKneeJ ─ B_lAnkleJ ─ B_lBallJ
├─ B_rHipJ ─ B_rKneeJ ─ B_rAnkleJ ─ B_rBallJ
└─ B_Scabbard
```
*(The exact parent of each prop/cape bone is inferred from the naming. Confirm it against the
`Connections:` section before relying on it.)*

**Rig details that probably explain the "haywire scaling":**

- `B_ROOTJ` has **`Lcl Scaling = 0.01`** and a **`PreRotation` of (90, 0, 0)**, and the mesh
  node has the same 0.01 scale and +90° X pre-rotation. Vertices are stored in
  **centimetres, Y-up**, and the root joint converts them to metres, Z-up.
- Child joints use Maya **joint orients** (`PreRotation`, e.g. `B_HeadJ` = −90, 18.7, 90).
- Game animations were baked against this rig, so they expect that 0.01 root scale and
  those exact local joint frames.
- Blender has no joint-orient or pre-rotation concept. On import it bakes these into its
  own bone rest orientations (bone Y-axis along the bone) and moves the unit scale onto
  the armature object. On export it adds an extra `Armature` node and, by default, leaf
  bones. The bone names survive, but the **local frames and root scale no longer match**
  what the animations expect. The HMD Toolkit's FBX → Model step exists to undo these
  changes.

**Opening it in Blender:** convert it to binary with Autodesk's free **FBX Converter
2013** (ASCII → binary, FBX 2013+), or with the FBX SDK / FBX Python bindings. Since Heaps
reads ASCII FBX natively, it may also be possible to feed it straight to the HMD
Toolkit's FBX → Model tab, because it was never round-tripped through Blender.

---

## 8. Workflow checklist (Option B)

1. Extract the base model with HMD Toolkit → *Model → FBX* (pick a Male01 / Female01 unit).
2. Open the FBX in Blender. Edit only the mesh, weights, and textures. Leave the armature alone.
3. Export with the §4 settings.
4. HMD Toolkit → *FBX → Model*: pick the Rig (`Male` / `Female`), set the Resource dir.
5. Preview in the HIDE editor from `D4XEditor/res/<resourcedir>` and check that
   idle, walk, attack, and death animations all look right.
6. Point the unit (or a new unit) at the model in the editor and set up the prefab (weapons).
7. Move `<resourcedir>` into `res/res` and repackage (`repackage.py` / `repackage.ps1`).

---

## 9. Asset sources (from xlamLegendx)

- **Mixamo**: lots of animations, few models (about 108), and only some fit the setting.
  Mixamo rigs **don't** match the game rig, so this means Option A, or retargeting.
- **Unity Asset Store**: probably the best mix of free and paid models.
- **Sketchfab**: buildings and landscape.
- **BlenderKit**: animation assets.
- **ArtStation**: mostly concepts; usually not downloadable.
- FBX is the right interchange format. Avoid Blender ↔ `.max` round-trips, which can be
  off in scale by tens of thousands of times.

---

## 10. Local setup (this machine)

| Thing | Location |
|---|---|
| HMD Toolkit | `HMD_toolkit/HMD_toolkit/` (pure Python + tkinter; launch `HMD_Toolkit.pyw`) |
| Modding dir (D4XEditor) | `C:\dsw_mod\D4XEditor` |
| Game dir | `C:\Program Files (x86)\Steam\steamapps\common\D4X` |
| Extracted game assets | `C:\dsw_mod\extr` (`Character/…`, `Anim/Male01/` has 61 animations) |
| Bundled rigs | `HMD_toolkit/HMD_toolkit/Rigs/Male01.hmd`, `Female01.hmd` |
| Python | 3.12 with numpy 1.26 and Pillow 12, which is all the toolkit needs |
| Blender | 5.2.2 LTS (toolkit validated on 4.5; see below) |

`gui_settings.json` comes with Peter's own paths. Set **Settings → Modding directory**
and **Game directory** to the values above the first time you run it.

**Validated 2026-10-16:**
- `hmd2fbx` on `extr/.../HouseGuard/Male01_HouseGuard.fbx` (a real HMD with the wrong
  extension) → FBX with 46 joints, 6,276 tris, and no warnings.
- Blender **5.2** headless round trip (import with defaults → export with the §4 settings) →
  `fbxfix` against `Rigs/Male01.hmd` → "skeleton restored: 46 bones … no warnings --
  ready for the repackager". So 5.2 passes the toolkit's checks. Animations still need
  checking in the HIDE editor.

## 11. Findings and answered questions

- **`Male01_HouseGuard02.hmd` in the game files isn't an HMD.** It's byte-identical to
  `Male01_HouseGuard02_ascii.fbx`: Shiro shipped the raw Maya ASCII FBX under an `.hmd`
  name without converting it. That's why it's unused and why the toolkit rejects it
  ("FBX was not converted to HMD").
  - It has the same triangle count (6,276) as the shipping House Guard, so it's probably
    a **revision of the House Guard** (36 vs 38 skinned bones) rather than a separate
    "Executioner" model. Check that visually.
  - It's the original Maya source, never touched by Blender, so it probably needs no
    `fbxfix`. Feeding it to the game's own converter (`Repackager/repack.py`) as
    `Male01_HouseGuard02.fbx` should produce a working HMD the same way the studio built
    every other unit.
- **Max 3 bone influences per vertex** reach the game (the strongest 3 are kept and
  renormalized). Tell artists to use *Limit Total = 3*.
- Models look **left-right mirrored in Blender** on purpose (the game is left-handed).
- **Blender import settings:** defaults + Animation ON. Manual Orientation OFF,
  Automatic Bone Orientation OFF, Bone Axis Y / X.
- **Animation export:** same as models but Animation ON, **Key All Bones ON**,
  Simplify 0. Set the scene end frame first, or use the toolkit's Trim field.
- **Game supports PNG textures only.** A **magenta model** in game means a texture path
  didn't resolve.
- **New animations** need game-side wiring in `data.cdb` before anything plays them.
- New geometry must be **weight-painted to existing bones**. Hidden geometry (e.g. under a
  helmet) may not exist in the source mesh.

### Worked example: Landsraad Guard + new helmet (2026-10-16)

- Source: `model_outputs/Male01_LandsraadGuard.fbx` (Model → FBX with embedded textures).
  It has 46 bones, 4,112 verts, 6,172 tris, 1 material, 512² textures, and at most 3
  influences per vertex.
- **The head is weighted to `B_SpineTopJ`, not `B_HeadJ`** (`B_Neck01J`/`B_HeadJ` have 0
  verts). The hood moves rigidly with the upper chest. New headgear should take its
  weights from the body (Data Transfer, `POLYINTERP_NEAREST`), not be painted to `B_HeadJ`,
  or it will slide off the hood.
- The helmet (dome + brim + crest, 333 verts) reuses the existing atlas: its UVs are
  pinned to a solid gunmetal texel (0.924, 0.708) and a gold texel (0.286, 0.716), so no
  new textures are needed.
- Checked in Blender against the real `LandsraadGuard_AttackMelee01` animation
  (converted with `hmdanim2fbx.py`): bone rest-pose difference 0.000000 m, and the helmet
  stays seated through the whole attack.
- Output: `model_outputs/Male01_LandsraadGuardHelmet.fbx` (passes `fbxfix` with no
  warnings) and `model_outputs/LandsraadGuard_Helmet.blend` (working file, with the
  attack animation stored for preview).
- **Getting it into the game** (done 2026-10-16):
  1. *FBX → Model* (Rig Male, Resource dir `CharMOD`) →
     `D4XEditor/res/CharMOD/Male01_LandsraadGuardHelmet/` (HMD + 3 PNGs + bare prefab).
  2. The toolkit's prefab contains only the body. Units carry their weapon in the prefab,
     so I added `Prefab_LandsraadGuardHelmet.prefab`, a copy of the vanilla
     `Prefab_LandsraadGuard.prefab` with the model `source` and the constraint `target`
     changed to the new model name (`<modelName>.B_ROOTJ.….B_rWristJ.B_Weapon`).
  3. Copied the folder into `D4XEditor/res/res/CharMOD/` (everything in `res/res` goes
     into `res.compressed1.pak`).
  4. In `data.cdb`, added model `N_LR_Guard_Helmet`: a copy of `N_LR_Guard`
     (`inherit: MilitaryLRGuard` keeps all the animations) with `mesh` set to the new
     prefab. Then pointed unit `Landsraad_Soldier` at it:
     `effects.models[0].ref`. To revert, change it back to `N_LR_Guard`.
     `json.dumps(indent='\t', ensure_ascii=False)` reproduces CastleDB's formatting byte
     for byte.
  5. Built the pak with the repackage steps; `hl Build.hl -out DIR -x pak` extracts it
     for checking.
  6. **Making it buildable for Corrino:** I added unit `C_LandsraadGuard` (a clone of
     `LandsraadSoldiers_Chart`, the version trainable through the Judge charter) with
     `faction: Corrino`, no `flags`, a full `effects` block pointing at
     `N_LR_Guard_Helmet`, recruit 20 Manpower, and upkeep 4 Solari + 2 CP.
     `Landsraad_Soldier` went back to `N_LR_Guard`, so only the Corrino unit wears the
     helmet. A unit shows up in a faction's build list when its `faction` matches and it
     doesn't have `NotBuyable`.
     - Also added `C_LandsraadGuard_Regular` (same unit with the vanilla `N_LR_Guard`
       model) so the two can be compared side by side. Both use `trainingTime: 0.1`.
       The game data uses 0.1 for near-instant training, while 0 may mean "use the
       parent's value" (`C_Trooper` sets 0 over its parent's 3).
     - Corrino's basic units have no unlock. Only `C_Elite` is gated, because it
       inherits the **Elite** flag and needs an `Unlock_TUnit` trait.
     - `unit.flags` bits (in order): Military 1, Mechanical 2, NoVision 4, NoControl 8,
       NoSelection 16, NotBuyable 32, Flying 64, NoSupply 128, NoAutoEngage 256, …
     - Don't repurpose `Raider_*` units. They're AI-only (NoControl, no costs, 0 training
       time), and changing them alters raids.
     - A child unit's `effects` replaces the parent's as a whole (see
       `C_Trooper_Aramsham`), so copy sounds and events along with `models`.
  - No new animations were needed, so the toolkit's *FBX → Animation* tab isn't part of
    this.
- **Gotcha:** an armature hidden in the viewport (`hide_viewport`, the monitor icon) is
  silently left out of an export when *Selected Objects* is on. The result has 0 bones and
  fbxfix reports every joint as missing. Unhide the armature before exporting.

### Worked example 2: Ginaz Swordmaster from a turnaround sheet (2026-10-18)

Source `model_inputs/ginaz_swordmaster.fbx`: not a character but a **3-view turnaround sheet**
(front, side, back figures + floor/ceiling slabs; 78k verts, no rig/UVs/colors). Scripts live
in `model_work/` (`ginaz_stage1/2/3.py`), progress images in `model_work/progress/`.

1. **Extract** the front figure (largest piece left of x = -0.03; cut the slabs at z < -0.472 and
   z > 0.46) -> 21.9k verts.
2. **Fit to the Male01 rig:** scale to 1.88 m, shift +0.22 in Y to center on the rig depth. The
   figure's arms hung ~25 deg from vertical but the rig's rest arms are 45 deg, so the arms were
   bent outward 22 deg about the shoulders with a smooth falloff (legs and head already matched).
3. **Color:** the mesh has none, so regions (face, hair, gloves, armor, cape, boots, sash) were
   painted as vertex colors from position/height masks, then baked.
4. **Decimate** to 7,000 tris in two passes (body first, with head/hands protected; then head and
   hands thinned) so face and hands keep guard-level detail. In Blender 5.2 a Decimate vertex
   group acts as an on/off *protect* set: weights don't scale it, and `invert` is needed to
   protect the group.
5. **UV + bake** (Cycles, 1024x1024): albedo, tangent normal map, metal/gloss and AO from the
   high-poly. `MetallicGlossAO` = R metallic, G gloss, B AO (checked against the guard's
   gold trim vs gunmetal). AO was floored at 0.4, since raw AO went black on the cape.
6. **Skin** with automatic weights to the 46-bone rig, with these fixes (found by replaying the
   guard's real animations and measuring triangle stretch):
   - **Prop bones** (`B_Weapon`, `B_Weapon_Add`, `B_Gun`, `B_Shield`, `B_Scabbard`) must not
     deform: set `use_deform = False` *before* auto-weighting, or the right forearm gets bound
     to the weapon bone.
   - **Hands:** bind everything beyond the wrist to the palm bone (short blend at the wrist);
     heat weights on claw-like fingers produced long streaks.
   - **Cape** is weighted to the `B_Cape01..03` chain by height (the cape bones animate: up to
     63 deg in Run; they are static in idle/attack).
   - **Cape-to-leg bridge faces** left by decimation (z < 0.95) were deleted: 166 stretched
     triangles in a lunge -> 37.
7. **Export gotchas:**
   - Clear `custom_normal` and `sharp_edge` attributes first. Custom normals left from
     decimation split every vertex: **18,070** exported verts instead of **6,405**. Then
     re-bake the normal map against the clean normals.
   - The material must be wired like the toolkit's own imports (Albedo -> Base Color,
     MetallicGlossAO -> **Specular IOR Level**, Normal -> Normal Map), or `convert_fbx.py`
     can't map and rename the textures.
   - Remove vertex-color attributes before export.
8. **Toolkit:** `python convert_fbx.py model <fbx> --ref Rigs/Male01.hmd --outdir
   D4XEditor/res/CharMOD --resdir CharMOD --d4x <game>/D4X.exe` -> HMD (6,405 verts, 6,814
   tris, 46 joints) + 3 PNGs + base prefab.
9. **Game wiring:** `Prefab_GinazSwordmaster.prefab` = the Sardaukar prefab with our body and
   the `SardaukarSword` constrained to `...B_rWristJ.B_Weapon`. Model `N_Ginaz_Swordmaster` is
   a clone of `C_Elite` (inherits `MilitarySardaukar` -> sword animations; its
   `props.preload.factions` set to Atreides). Unit `A_GinazSwordmaster`: **Atreides**, free
   (0 Manpower, 0 Solari and 0 CP upkeep), `trainingTime` 0.1, wheel slot group 1 / pos 7.
   - **A unit is recruitable by default** when its `faction` matches and it has no `NotBuyable`
     flag; the `Block_TUnitRecruit` / `Unlock_TUnit` effects only gate special cases.
   - **Start-of-game units:** the `structure` sheet has a `startUnits` list per base. Atreides'
     HQ is `Arrakeen` (found via `faction.landmarks.city`; `TESTBase` is a separate test
     faction's base) and its list was `[A_Ornithopter]`. Adding `{"unit": "A_GinazSwordmaster"}`
     is meant to place the unit next to HQ at game start. The relation `bonus` sheet's
     `TUnit_SpawnMB_WithTTrait2` (`trigger: 0`, "Start every game with N units") is a second
     mechanism, but it only applies when that bonus is selected.
   - Atreides units use `maxSupply` 5555 (the Landsraad guard's 100 could starve a unit in the
     field), voices `Voice_A_Trooper_*` and portraits from `UI/console/wheel_units_atreides.png`.
   - The Sardaukar animations carry 10 extra tracks (`B_Bolas*`, `B_Whip*`) that our 46-bone
     skeleton lacks; the toolkit drops them in Blender (in game, unmatched tracks should be ignored).
   - **Not yet verified in game:** normal-map Y orientation, handedness, the sword's grip, the
     recruit-list entry and the start-of-game spawn.

## 12. Open questions

- [ ] Channel layout of `MetallicGlossAO` (probably R = metallic, G = gloss, B = AO).
      Some units also have `_Emissive` and `_MetallicGlossAOEmiss` variants.
- [ ] Does repackaging `Male01_HouseGuard02` directly produce a working unit?
- [ ] Does a Blender 5.2 export animate correctly in HIDE (not just pass `fbxfix`)?
