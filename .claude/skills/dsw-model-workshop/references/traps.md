# Traps, and why each one happens

Every item here cost a debugging round-trip. Each is a **silent** failure: the
script reports success and the picture is wrong.

## Blender

### `bpy.ops.wm.open_mainfile` cannot open an FBX

It raises "File format is not supported". `open_mainfile` loads a .blend; use
`bpy.ops.import_scene.fbx(filepath=...)` for an FBX.

### A packed image keeps its OLD pixels when re-pointed

```python
node.image.filepath = new_path
node.image.reload()          # WRONG - the old packed pixels stay
```

The packed data is still in the datablock. Replace the datablock instead:

```python
img = bpy.data.images.load(path, check_existing=False)
node.image = img
```

### `bpy.ops.wm.save_as_mainfile` fails on OneDrive paths

"Unable to make version backup". Wrap the save in a try/except and keep
going, or disable the version counter.

### Node identity is not stable between file loads

Compare nodes **by name**, never by `is` or by object identity.

### `scene.render.engine` is `BLENDER_EEVEE`

Blender 5.2 has no `BLENDER_EEVEE_NEXT`. Setting the wrong one fails
silently.

### `mesh.vertex_groups`, not `me.vertex_groups`

The vertex groups live on the **object**, the vertices on the **mesh**.

### `bmesh.to_mesh()` renumbers the vertices

Any code that identifies a component by a vertex index across a mesh edit is
broken. Use a geometric key (a rounded centroid plus a vertex count) instead.

### The splash screen blocks every screenshot

`bpy.ops.wm.splash_close` does not exist and SendKeys `{ESC}` did not close
it. What works: `user32.SetForegroundWindow` + `Cursor.Position` to a point
clearly left of the splash + `mouse_event` DOWN/UP - a real click outside the
splash.

### `execute_blender_code` needs `result` to be a dict

A trailing `result = "ok"` raises **after** the operators already ran, so
the scene is changed even though the call "failed".

## Weapons

### A weapon FBX is an HMD in disguise

The game stores weapons as HMD files with an `.fbx` extension. Blender cannot
open them. `hmd2fbx` converts them, but it only handles a single-model HMD:

```
NotImplementedError: expected 1 model, got 2
```

A weapon HMD usually holds two models: the mesh and a **geometry-less
helper** (`geometry == -1`). Drop the helper.

`hmd2fbx.convert()` re-loads the file itself, so the **loader** has to be
patched, not the loaded data:

```python
_orig = hmd2fbx.H.load
def _filtered(path, *a, **kw):
    data = _orig(path, *a, **kw)
    data.models = [data.models[keep]]
    data.models[0].parent = -1
    return data
hmd2fbx.H.load = _filtered
```

### The `Cube` helper mesh

Every weapon FBX carries a mesh named `Cube` - a 2x2x2 m bounds reference.
Left in the scene it renders as a giant slab over the character. **Delete it
on import.**

### A weapon renders MAGENTA

The weapon FBX names its textures with a **game-relative path**
(`Character/Atreide/Unit/Weapons/MaulaRifle_Albedo.png`). Blender only
resolves that if the FBX still lives inside the extracted game tree. Anywhere
else the texture is missing and the weapon renders bright magenta.

Wire the weapon's textures explicitly, or copy the PNGs next to the FBX.

### `07_build_blend.py` mis-wires a multi-variant unit

Two silent traps in the stock build script when a folder holds several
variants (e.g. `IdualisTrooper01/02/03`):

1. It picks the **first** `*_Albedo.png` alphabetically from `--textures` and
   wires that ONE stem onto every body - variants 02 and 03 render with
   variant 01's textures (looks plausible, wrong colours).
2. `--weapon` hardcodes `MaulaRifle_*.png` names - any other weapon gets
   `wired == 0` and renders MAGENTA (it does warn, but only after the fact).

For multi-variant units use `07b_build_lineup.py` (same folder): it takes a
per-variant `(fbx, texture stem, slot x, weapon list)` table, wires each body
from its own stem, and wires weapon textures by the actual stem found
(`WeaponTrooper_*`). It also renders lineup shots of the whole group.

### The grip point is not the bone

`B_Gun` sits at the armature **origin** in the rest pose, so its rest
transform is not a usable placement hint.

Derive the grip from the mesh instead - the centroid of the vertices whose
strongest weight is the wrist bone:

```python
centroid of { v : max weight group == B_rWristJ and weight > 0.5 }
```

For the Commando that is `(-0.687, -0.022, 1.125)`.

### The barrel axis

For the Maula rifle the long axis is its local **+Z** and the character faces
**-Y**, so:

| rotationX | barrel points |
|---|---|
| **+90** | **forward (-Y)** - correct |
| -90 | backwards (+Y) - this is what the game's own prefab uses |

### The blade axis is NOT always +Z - measure it first

The +Z rule above is **Maula-rifle-specific**. The Idualis weapons
(DoubleKnife, LongKnife, MetalBar) have their blade along local **-Y**:
applying the learned `rotationX = -90` lifted every blade **straight up**
(silently - the script reported success and the parent transform looked
fine). Measure the weapon's local bounding box before choosing a rotation:

```python
xs = [c[0] for c in w.bound_box]; ys = [c[1] for c in w.bound_box]; zs = [c[2] for c in w.bound_box]
long_axis = max((max(xs)-min(xs), 'X'), (max(ys)-min(ys), 'Y'), (max(zs)-min(zs)), key=lambda t: t[0])
```

Then rotate so that axis maps to world **-Y** (forward). For a -Y blade that
is **identity** rotation; for a +Z barrel it is Rx(+90). Check the shipped
`weapon bbox` print: a blade along -Y spans ~0.8-1.4 m in **Y**, not in Z -
a z-span equal to the blade length means it points up.

### A grip computed from raw vertices lies when the armature is POSED

`hand_centroid()` reads `mesh.data.vertices` - the **rest pose**. If the FBX
arrives with its armature posed (Idualis Trooper 01 ships crouched; all 56
pose bones modified), the rest-pose wrist sits ~1.5 m from the displayed one
and the weapon floats outside the body - while every log line looks correct
(compare: evaluated `(-2.095, 0.136, 0.658)` vs rest `(-0.705, 0.741, 1.027)`).

Read weights from the original vertices and positions from the **evaluated**
(deformed) ones - the armature modifier never changes vertex order or count:

```python
dg = bpy.context.evaluated_depsgraph_get()
me = body.evaluated_get(dg).to_mesh()
# weights from body.data.vertices[i].groups, position from me.vertices[i].co
```

Always compute the grip AFTER the body is placed (layout shifts), and print
both the evaluated and the rest-pose value so a mismatch is visible.

### Bone parenting uses the bone's TAIL

Blender's bone parenting uses the bone's **tail** as the origin. Setting
`matrix_parent_inverse = bone_world.inverted()` by hand puts the weapon
**0.67 m too high** (z 1.638..2.033 instead of 0.970..1.366).

Use the operator, and set the active bone first:

```python
for o in bpy.context.view_layer.objects:
    o.select_set(False)
weapon.select_set(True)
rig.select_set(True)
bpy.context.view_layer.objects.active = rig
rig.data.bones.active = rig.data.bones["B_Gun"]
bpy.ops.object.parent_set(type="BONE", keep_transform=True)
```

## Kitbashing (grafting a whole donor object on)

### Reparenting only the donor's MESH leaves its armature behind

Importing a donor FBX and reparenting `[o for o in new_objects if o.type ==
"MESH"]` under a new empty looks complete but isn't: if the donor has its own
armature (most HMD-derived FBX exports do, even static-looking vehicles),
the mesh's parent is that armature, not the scene root - `m.parent is None`
is false, so the mesh is silently skipped. The armature itself stays
unparented at the world origin, dragging the (unscaled) mesh along with it.
Result: the grafted part renders at full size, buried inside the host, miles
from the intended mount point - and nothing errors.

Fix: snapshot the object set **before** the import, then reparent every
object the import created that has no parent (`o.parent is None`), not just
the meshes:

```python
pre_existing = set(bpy.context.scene.objects)
bpy.ops.import_scene.fbx(filepath=donor_fbx)
donor_new = [o for o in bpy.context.scene.objects if o not in pre_existing]
for o in donor_new:
    if o.parent is None:
        o.parent = donor_root        # catches the armature too
```

### Placing a grafted part: world-space mount point, parent-local `.location`

`obj.location` is always in the **parent's local space**, not world space.
If the host root itself has a nonzero translation (e.g. it was recentred to
the origin by setting `host_root.location = -host_center`), computing a
mount point in world coordinates and assigning it straight to
`donor_root.location` is off by the host root's own offset - the donor lands
near the right place but shifted, which on a thin hull reads as "half
buried in the surface" rather than obviously wrong.

Fix: subtract the parent's own translation before assigning:

```python
local_mount = world_mount - host_root.location   # host_root is parent of donor_root
donor_root.location = local_mount - Vector(donor_center) * scale
```

Both of these were hit (and fixed) grafting a `DroneA` drone onto the
`Renegade_Frigate` hull as a sensor pod - see `model_projects/sentinal/SPEC.md`.

### A whole donor mounted on top reads as a toy glued to a toy

Grafting a complete, lightly-scaled-down donor ship onto a host (the
technique above) works mechanically but looks wrong for hard-surface
kitbashing: a miniature second vehicle perched on the hull reads as a prop
placement, not a built-in part. Real kitbashing cuts a CHUNK out of the
donor (a wing, a turret-top, a hatch) and embeds it into the host surface so
only the donor's clean outer face shows and the ragged cut edge is buried
inside the host. See "Cutting a real chunk out of a donor" below.

### Cutting a real chunk out of a donor: normalise scale FIRST, then box-cut

To cut a kitbash-quality chunk (not a toy-scale accessory):

1. Scale the WHOLE donor to the HOST's own size (`host_size / donor_size`),
   not to some small decorative fraction - a chunk cut from a normalised
   donor already reads at the host's own panel density.
2. THEN box-select and keep only the faces inside a fractional region of the
   normalised donor's half-extent (same spatial technique as the unwelded-
   mesh removal note in `part-removal.md`, just KEEP-inside instead of
   delete-inside).
3. Place the result by pushing the mount point INTO the host surface by a
   fraction of the chunk's own size ("embed"), not hovering it above with a
   gap - the raw cut face ends up hidden inside the host, and the result
   reads like a glued model-kit part (overlapping mass, no attempt at a
   seam), which is exactly how real kitbashing looks.

Iterate the box bounds by rendering the chunk ALONE from a few angles before
committing to a full host+graft render - guessing the bounds blind wastes
far more time than a 4-angle test render costs. A clean cut has no floating
disconnected debris and no hollow cross-section facing the "front" camera
angle; both are signs the box needs to move or shrink.

### A donor's BASE mesh data can be in bind-pose space, not its visual shape

Per-face operations (the box-cut above) read `obj.data.vertices` /
`bmesh.from_mesh(obj.data)` directly - and for an HMD-converted mesh with an
Armature modifier, that can be **completely wrong**, even for a "static"
vehicle prop that never animates. Confirmed on a `DroneS` donor: raw
`mesh.data.vertices` y-range was `1.88..3.32`, while the SAME mesh's
`object.bound_box` / evaluated-mesh range was `-0.84..0.84` - not merely
offset, unusable. The Armature modifier only deforms the base (bind-pose)
data into the correct shape at evaluation/render time.

This never breaks whole-object placement (which only ever reads
`object.bound_box`, already correct), so it was invisible through all of the
work above - it only shows up the first time something reads individual
face positions. Fix: bake the evaluated mesh into the base mesh before any
per-face read, then drop the Armature modifier (or it deforms the
now-already-correct data a second time):

```python
dg = bpy.context.evaluated_depsgraph_get()
eval_mesh = obj.evaluated_get(dg).to_mesh()
for i, v in enumerate(obj.data.vertices):
    v.co = eval_mesh.vertices[i].co
obj.evaluated_get(dg).to_mesh_clear()
for mod in list(obj.modifiers):
    if mod.type == 'ARMATURE':
        obj.modifiers.remove(mod)
```

**Re-parent to where the armature WAS parented, not to `None`.** The mesh's
parent is the Armature; clearing `obj.parent` outright detaches it from
whatever root empty the armature itself was attached to, so the root's
later `.scale` silently stops reaching the mesh at all - normalising "the
whole donor" to the host's size becomes a no-op, and every downstream
measurement reports the pre-normalise numbers with no error raised. This
cost two misleading symptoms in a row (`CHUNK size 0.0`, then correctly-
proportioned-looking half-extents that turned out to be unscaled) before the
root cause showed up as a re-parenting bug, not a math bug:

```python
if obj.parent is not None and obj.parent.type == 'ARMATURE':
    new_parent = obj.parent.parent        # wherever the armature was attached
    if new_parent is not None:
        obj.matrix_parent_inverse = new_parent.matrix_world.inverted()
    obj.parent = new_parent
```

## Textures

### Game textures are DDS files with a `.png` extension

`Commando_Albedo.png` is really a DXT DDS (`b'DDS '` magic). PIL reads them
fine; `view_image` does not. Convert for viewing with:

```python
Image.open(p).convert("RGBA").save(out)
```

### The TRUE_FBX already carries the texture wiring

A converted HMD holds both an absolute `FileName` (a game path that does not
exist locally) and a bare `RelativeFilename`. Blender tries the absolute path,
fails, then resolves the relative one next to the FBX - so dropping the three
vanilla PNGs beside the FBX is enough.

**Inspect the links, do not trust the node list:**

```python
for l in mat.node_tree.links:
    if l.from_node.type == "TEX_IMAGE":
        print(l.from_node.name, "->", l.to_socket.name)
```

A working material is:
`Image Texture.Color -> Principled BSDF.Base Color`,
`Image Texture.001.Color -> Principled BSDF.Specular IOR Level`,
`Image Texture.002.Color -> Normal Map.Color`, `Normal Map.Normal -> ...Normal`.

Harmless red herrings: a duplicate albedo node linked to `Alpha` (alpha is
1.0 everywhere), and `image.has_data == False` on lazily-loaded images.

### Resolving a texture node's socket by name

A texture that feeds a **Normal Map** node reports its socket as `Color`, but
the useful answer is `Normal`. Walk one hop:

```python
def socket_of(node, tree):
    for l in tree.links:
        if l.from_node.name == node.name:
            sock = l.to_socket.name
            if sock == "Color" and l.to_node.type == "NORMAL_MAP":
                for l2 in tree.links:
                    if l2.from_node.name == l.to_node.name:
                        return "Normal"
            return sock
    return None
```

## Geometry

### A removal can open a hole

Three proofs, all run by `02_remove_parts.py`:

1. **Boundary-edge parity, per surviving component.** A component with zero
   boundary edges is a closed shell. An unchanged count means no hole.
   Check **every** component - checking only the biggest can pass while a
   smaller piece was torn open.
2. **Ray normal orientation.** Cast rays from behind into the removed volume.
   Every hit must face outward. An inside-facing hit means we are looking at
   the inside of the body through a gap.
3. **Component membership.** The newly exposed surface should belong to the
   body. If it is a leftover of the removed part, the removal was incomplete.

### A UV rasteriser only covers part of the atlas

The position map covers ~58% of a 512x512 Commando atlas. A region
classifier built on it alone leaves large unclassified areas - which showed
up as a grey thigh pouch that stayed grey. Classify by **colour over the
whole texture** and flood the leftovers.

### Rendering a part alone

Hiding a component and rendering the rest is misleading - the rest of the
model still occludes the view. **Remove** every other component for the shot.

## Rendering

### Workbench `TEXTURE` shows no texture

Use EEVEE with a sun light and a bright world.

### Render through a camera, not the viewport

`bpy.ops.render.opengl(view_context=True)` and `screenshot_area` show the
**previous** view, because the viewport only redraws between commands - and
the user can rotate the object by accident. Use an ortho camera and
`bpy.ops.render.render(write_still=True)`.

### A reset between iterations

Keep the original mesh in the scene between iterations and the renders lie to
you. `reset_scene()` (`read_factory_settings(use_empty=True)`) before each
one.

## Cached transforms: measure and parent only after an update

`Object.bound_box` and `Object.matrix_world` are **cached**. Right after you
edit mesh data or create an object they still return the *pre-edit* values,
and there is no exception - you just get confident, wrong numbers. Two ways
this bit:

* **A bounding box that never changed.** After squashing a hull to half its
  span the reported bbox was still the stock 10.2 x 9.35 x 2.59, so the
  camera framed the wrong size and two variants rendered cropped. Fix: wrap
  every measurement in
  `bpy.context.view_layer.update()` + `dg = evaluated_depsgraph_get(); dg.update()`
  and read from `obj.evaluated_get(dg).bound_box` / `.matrix_world`.
* **A new part silently teleported to the origin.** `finish_parts()` copied
  `ob.matrix_world` (still identity - stale) *after* setting `ob.location`
  and `ob.rotation_euler`, then wrote that identity back: the location and
  the 90-degree axis rotation were both erased, and a sensor boom that was
  supposed to lie along the wing ended up a 3.4 m mast in the middle of the
  ship. Fix: `view_layer.update()` **before** reading `matrix_world`, or
  simply re-assign `location`/`rotation_euler`/`scale` instead of the matrix.

Rule: any time a script reads a transform to copy it, or reads bounds to
frame a shot, force an update on the line above. Renderers re-evaluate
themselves, so renders looked correct while every *measurement* was stale -
which is exactly the trap.

## Framing a contact sheet by the CURRENT box

When variants are deliberately longer/wider/shorter than the source model,
a camera framed on the original size will crop the big ones and shrink the
small ones. Frame the turntable and the per-variant views by the **current**
world bbox (and aim at its centre, since a one-sided shear moves it); only
the comparison contact sheet should keep one fixed camera for everything.

## No Pillow inside Blender

Blender's bundled python has **no PIL/Pillow** (`import PIL` fails), while
the system python usually does. Keep the image work in a separate script
that Blender shells out to with `subprocess.run([shutil.which("python"), ...])`
- masks travel as `.npy` files and the op list as JSON, so the child
process needs no `bpy`. Trying to `from PIL import Image` inside a
`--background --python` script dies at the *first* texture op, after the
model has already loaded, which looks like a texture bug rather than a
missing module.

## Purge the FBX's own textures before saving

An FBX import leaves its `*_Albedo.png` image datablocks behind even after
you rewire the material to your own packed textures. They keep a dangling
external path in the .blend ("missing file" warnings for anyone else who
opens it). Before `save_as_mainfile`, loop 2-3 times over
`bpy.data.images` / `materials` / `meshes` and remove anything with
`users == 0` (skip `Render Result`).
