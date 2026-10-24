---
name: dsw-model-workshop
description: '**WORKFLOW SKILL** — Edit and repaint an existing Dune Spice Wars (D4X) 3D character model in Blender and produce a self-contained .blend that shows the finished result. Covers: removing a part (backpack, cape, hood) with a three-way proof that no hole was left, repainting the albedo in a house/faction colour design (hue replacement + value compression + region classification), placing a weapon in the hand and parenting it to a bone, building and verifying a portable .blend with packed textures, and rendering showcase angles. Use this whenever the user mentions editing an existing DSW/D4X character model, removing a backpack/cape/piece, recolouring or repainting a Commando or other vanilla unit, adding a weapon to a model, making a .blend preview, or wants to SEE the finished model. NOT for building a new unit from scratch or getting a model into the game - use dsw-model-modding for that.'
---

# DSW Model Workshop

Edit an **existing** game model: take a vanilla character, change its shape and
its colours, and deliver a `.blend` the user can open to see the finished
product.

For getting a model **into the game** (data.cdb, prefabs, paks, launching the
game) use the `dsw-model-modding` skill instead. The two overlap on the
FBX/HMD conversion step.

## The rule that matters most

> **Prove the edit, don't assume it.** Every change to a model has a way to go
> silently wrong, and the failure is invisible in a screenshot. So each script
> here prints evidence, and refuses to write a broken result.

Specifically:

- **Removing a part** can tear a hole in the body. Three independent proofs
  are run before the output is written (see below).
- **Repainting** can turn plum into pink, or leave green camo patches behind.
  The recolour is value-compressed and hue-snapped for exactly this reason.
- **A weapon can render magenta** because its texture did not resolve. The
  build script wires weapon textures explicitly and warns if it cannot.

## Pipeline

Scripts live in `scripts/`. They are numbered in the order they run.

| # | Script | Runs in | What it does |
|---|---|---|---|
| 00 | `00_new_project.py` | python | Creates the numbered project folder and a SPEC.md skeleton. |
| 01 | `01_analyse_mesh.py` | Blender | Lists every connected component with its size, bounds, dominant bone and boundary-edge count. Renders each component **alone** so it can be identified. |
| 02 | `02_remove_parts.py` | Blender | Deletes components, then **proves** no hole was left. Writes the FBX. |
| 03 | `03_uv_region_map.py` | Blender | Rasterises a world-position + normal map per UV pixel. |
| 04 | `04_classify_regions.py` | python | Splits the albedo into material regions (skin / fabric / leather / accent / armour / trim). |
| 05 | `05_recolour.py` | python | Repaints the albedo with a palette file. |
| 06 | `06_convert_weapon.py` | python | Converts a game weapon file (an HMD in disguise) into a real FBX. |
| 07 | `07_build_blend.py` | Blender | Builds the finished `.blend`: body + textures + weapon + lights + camera, everything packed. |
| 07b | `07b_build_lineup.py` | Blender | Like 07 but for a **multi-variant unit**: several bodies side by side, each wired to its OWN texture stem (07 wires the first `*_Albedo.png` onto every body), per-variant weapons from the prefabs, lineup renders. |
| 08 | `08_verify_blend.py` | Blender | Opens a saved `.blend`, reports everything, flags problems. |
| 09 | `09_showcase.py` | Blender | Renders showcase angles straight from a saved `.blend`. |

Shared code: `scripts/dsw_core.py` (paths, component maths, colour maths,
region classification and the region presets) and `scripts/blender_scene.py`
(scene setup, material wiring, lighting, camera, bone parenting).

Run `python scripts/dsw_core.py --selftest` first - it checks every tool path.

## Step by step

### 0. Start a project folder

```powershell
python scripts/00_new_project.py -- commando_no_backpack --title "Commando - No Backpack"
```

Creates `model_projects/<name>/` with the numbered subfolders, a SPEC.md
skeleton, and a copy of the scripts used. One folder per model - the work of
one model must never mix with another's.

### 1. Find the part to remove

```powershell
& "C:\Program Files\Blender Foundation\Blender 5.2\blender.exe" -b `
  --python scripts/01_analyse_mesh.py -- <model.fbx> --shots <dir>
```

The component ids are stable: they are sorted by size, largest first, so
component 0 is the biggest. Print the table, then look at the per-component
shots.

> **Render the part ALONE.** Hiding a component and rendering the rest is
> not enough - the rest of the model still occludes the view, and the shot
> will mislead you. `01_analyse_mesh.py` removes every other component for
> each shot, which is the only reliable way to identify a piece.

### 2. Remove it, with proof

```powershell
& "...\blender.exe" -b --python scripts/02_remove_parts.py -- `
  <in.fbx> <out.fbx> --components 4,5,6,7 `
  --probe "-0.18,0.18,0.10,0.46,1.11,1.63" --shots <dir>
```

`--probe` is the world-space box the removed part occupied
(`x0,x1,y0,y1,z0,z1`). The script then runs three proofs:

| Proof | What it checks | Fails when |
|---|---|---|
| 1 | **Boundary-edge parity, per surviving component.** A component with zero boundary edges is a closed shell, so an unchanged count means no hole was opened. | any surviving component's count changed |
| 2 | **Ray normal orientation.** Rays are cast from behind into the removed volume; every hit must face outward. | an inside-facing hit (we are seeing through the body) |
| 3 | **Component membership.** Which component owns the newly exposed surface? | the exposed panel is not the body's own |

> **Proof 1 is per component, not just the biggest one.** Checking only the
> largest component can pass while a smaller piece was torn open. The
> component key is a rounded centroid plus a vertex count - **never a vertex
> index**, because `bmesh.to_mesh()` renumbers the survivors.

If a proof fails the script writes the FBX but **exits non-zero** - read the
output, do not trust the exit code alone.

### 3. Repaint the albedo

Classify the regions first, then recolour:

```powershell
python scripts/04_classify_regions.py -- <albedo.png> <mg.png> <out_dir> `
  --tint <tint_mask.npy> --preset humanoid
python scripts/05_recolour.py -- <albedo.png> <mg.png> <normal.png> `
  <out_dir>\region_ids.npy <out_dir> --palette assets\house_palette.json `
  --prefix MyHouse
```

`--preset` chooses the rule set:

| preset | for |
|---|---|
| `humanoid` (default) | soldiers - skin, cloth, leather, painted armour, metal trim |
| `creature` | hide/fur instead of cloth and leather |
| `vehicle` | painted panels and bare metal, no skin or leather |

The region IDs never change between presets, so a palette always means the
same thing. To add a preset, copy the `humanoid` entry in `dsw_core.PRESETS`
and adjust its post-rules.

The palette file format is in [references/recolour.md](references/recolour.md). The
full method - why hue replacement, how value compression works, how the
regions are classified - is in the same file.

**Why the recolour works.** The base texture already carries the painted
shading, so the recolour replaces **hue and saturation** and keeps **value**.
Every crease, shadow and highlight survives for free. Three corrections make
it look right rather than like a flat sticker:

- **Value compression** - the base's value range inside a region is far wider
  than the target colour allows (a cream plate at 250 would turn plum into
  pink), so the region's robust range (3rd..97th percentile) is compressed
  onto a band around the target brightness.
- **Residual hue snap** - mottled camo patches would keep their old colour, so
  any pixel more than 18 degrees from its target hue is snapped onto it.
- **Metallic override** - each region gets its own metallic multiplier, or
  the new colours read as the wrong material.

> **Classify by COLOUR, not by UV island.** The UV rasteriser only covers
> ~58% of the atlas, so an island-based classifier leaves large unclassified
> areas. Classifying the whole texture by colour and then flooding the
> leftovers gives **zero** unknown pixels.
>
> **Split metal by connected-component SIZE.** The big armour plates and the
> small trim are the same colour in the base texture. A large blob is armour,
> a small one is trim - and gold must stay a thin accent, or the model turns
> into a gold statue.

### 4. Convert a weapon

```powershell
python scripts/06_convert_weapon.py -- <weapon.fbx> <out.fbx>
```

The game stores weapons as **HMD files with an `.fbx` extension**, and
`hmd2fbx` only handles a single-model HMD. A weapon HMD usually holds two
models - the mesh and a geometry-less helper - so the helper is dropped
first.

### 5. Build the .blend

```powershell
& "...\blender.exe" -b --python scripts/07_build_blend.py -- `
  --body <body.fbx> --textures <dir> --out <out.blend> `
  --weapon <weapon.fbx> --title Commando
```

The result contains the body, the three textures **packed** into the file, a
weapon held in the right hand and parented to `B_Gun`, plus a camera, a sun,
a fill light and a world, so **F12 renders immediately**.

### 6. Verify and show

```powershell
& "...\blender.exe" -b --python scripts/08_verify_blend.py -- <out.blend> <png>
& "...\blender.exe" -b --python scripts/09_showcase.py -- <out.blend> <dir> tag
```

`08_verify_blend.py` prints `PROBLEMS: none` when everything is right. It
checks the object list, the material wiring, the image packing, the triangle
count, the rig, and the weapon's parent bone.

## The traps (each one cost a debugging round-trip)

| Symptom | Cause | Fix |
|---|---|---|
| Weapon renders **magenta** | the weapon FBX names its textures with a game-relative path that only resolves inside the extracted game tree | wire the weapon textures explicitly (`07_build_blend.py` does this automatically) |
| A giant slab over the character | the weapon FBX carries a helper mesh named `Cube` (2x2x2 m) | delete it on import |
| Weapon floats 0.67 m too high | `matrix_parent_inverse` used for bone parenting - Blender's bone parenting uses the bone's **TAIL** as the origin | use `bpy.ops.object.parent_set(type='BONE', keep_transform=True)` with the active bone set first |
| Weapon points backwards | the barrel axis is local +Z and the character faces -Y, so `rotationX = -90` points it backwards | `rotationX = +90` |
| Weapon points **straight up** | the +Z-barrel rule is per-weapon - Idualis weapons have the blade on local **-Y**, so the learned rotation lifts it vertical | measure the weapon's local bbox first; a -Y blade wants **identity** rotation (see traps.md "The blade axis is NOT always +Z") |
| Weapon floats off a **posed** body | the grip came from raw (rest-pose) vertices but the FBX arrived with its armature posed (e.g. a crouch) - rest wrist can be ~1.5 m from the displayed one | read weights from `body.data.vertices`, positions from the **evaluated** mesh (`evaluated_get(depsgraph).to_mesh()`) |
| Variant 02/03 wears variant 01's textures | `07_build_blend.py` wires the FIRST `*_Albedo.png` in the folder onto every body, and hardcodes MaulaRifle weapon textures | use `07b_build_lineup.py` for multi-variant units |
| Weapon grip is in the wrong place | `B_Gun` sits at the armature **origin** in the rest pose - not a usable hint | derive the grip from the mesh: centroid of the vertices weighted to `B_rWristJ` |
| Textures unchanged after re-pointing a packed image | setting `node.image.filepath` + `reload()` keeps the OLD packed pixels | replace the datablock: `img = bpy.data.images.load(p, check_existing=False); node.image = img` |
| `bpy.ops.wm.open_mainfile` refuses an FBX | it is not an FBX | use `bpy.ops.import_scene.fbx(filepath=...)` |
| HMD->FBX raises `expected 1 model, got 2` | the HMD has a geometry-less helper model | drop it (see `06_convert_weapon.py`) |
| Recolour looks pink | value was not compressed | compress the region's robust value range onto a band |
| Green patches survive the recolour | residual hue was not snapped | snap hues more than 18 degrees from the target |

Full detail, with the reasoning: [references/traps.md](references/traps.md).

## Further reading

| File | What is in it |
|---|---|
| [references/recolour.md](references/recolour.md) | the recolour method, the palette format, how the regions are classified |
| [references/part-removal.md](references/part-removal.md) | removing a part, the three closure proofs, what the removal exposes |
| [references/traps.md](references/traps.md) | every silent failure, and why it happens |
| [references/worked-example.md](references/worked-example.md) | the Commando job end to end, with the numbers each step produces |
| [assets/house_palette.json](assets/house_palette.json) | a ready-made palette |

## Quality bar

Before calling a task done:

1. `08_verify_blend.py` prints `PROBLEMS: none`.
2. The showcase renders are **looked at**. A magenta weapon, a backwards
   barrel or a hole in the back all look fine in a log and terrible in a
   picture.
3. The triangle count matches the expected value.
4. `SPEC.md` in the project folder says what was done and what is unfinished.
5. The game-facing assets (HMD, prefab) are re-verified with `check_hmd.py`
   - **the .blend is a deliverable for the user, not a replacement for the
   shipped assets.**
