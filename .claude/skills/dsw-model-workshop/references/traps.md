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
