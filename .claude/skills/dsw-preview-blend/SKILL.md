# DSW Preview Blend Builder

**Purpose:** Build a self-contained, viewable `.blend` of a finished DSW character model — the exact asset the game loads — with shipped textures, prefab weapons, and animation, so you can inspect the final product in Blender without launching the game.

---

## When to Use

- You have a finished character HMD (from the repackager / CharMOD folder) and want a Blender file that shows it **exactly as the game renders it**
- You need to verify mesh edits (part removal, recolour, kitbash) visually before committing to CDB
- You want to share a reviewable asset with artists/designers who don't have the game pipeline

---

## Prerequisites

| Asset | Source |
|-------|--------|
| Final character HMD | `CharMOD/<Name>/<Name>.hmd` (the one the game actually loads) |
| Animation HMD | `extr/Anim/Male01/<Variant>/Anim_Male01_<Anim>.fbx` (HMD with `.fbx` extension) |
| Weapon HMD(s) | `extr/Character/<Faction>/Unit/Weapons/<Weapon>.fbx` (HMD with `.fbx` extension) |
| Prefab JSON | `CharMOD/<Name>/Prefab_<Name>.prefab` (for weapon offsets/rotations/bones) |
| Shipped textures | `CharMOD/<Name>/<Name>_Albedo.png`, `_MetallicGlossAO.png`, `_Normal.png`, `_Emissive.png` |

> **Critical:** The game's textures are **DDS files with a `.png` extension**. Blender cannot read them directly. Convert to real PNG first:
```python
from PIL import Image
Image.open(dds_path).convert('RGBA').save(png_path)
```

---

## Core Reusable Scripts

### 1. HMD → FBX Converter (with skin-split fix)

**File:** `hmd2fbx.py` (in `HMD_toolkit/HMD_toolkit/Models/`)

**Key fix:** The shipped HMD often has **multiple skin splits** (one per material sub-mesh). Vertex bone indices are **local to each split**, not global. The converter must map split-local indices → global bind slots.

```python
# In convert(), after decoding vertices and index_groups:
split = skin.split
group_joints = []
if split:
    for gi in range(len(index_groups)):
        group_joints.append(split[gi].joints if gi < len(split) else None)
else:
    group_joints = [None] * len(index_groups)

# vertex -> owning index group (first group that lists it)
vertex_group = {}
for gi, idxs in enumerate(index_groups):
    for vi in idxs:
        vertex_group.setdefault(vi, gi)

cluster_data = {}
for vi, v in enumerate(verts):
    ws = list(v["weights"])
    bs = list(v["indexes"])[:bones_per_vertex]
    gi = vertex_group.get(vi)
    joints = group_joints[gi] if gi is not None else None
    for w, b in zip(ws, bs):
        if w <= 0: continue
        if joints is None:
            slot = b
        else:
            if b >= len(joints):
                raise ValueError(f"vertex {vi} references local bone slot {b} "
                                 f"but split {gi} only lists {len(joints)} joints")
            ji = joints[b]
            slot = skin.joints[ji].bind
            if slot < 0:
                raise ValueError(f"split {gi} references joint {ji} "
                                 f"({skin.joints[ji].name}) which has no bind slot")
        cluster_data.setdefault(slot, ([], []))
        cluster_data[slot][0].append(vi)
        cluster_data[slot][1].append(w)
```

**Usage:**
```bash
python hmd2fbx.py input.hmd output.fbx
# With animation:
python hmdanim2fbx.py model.hmd anim.hmd output.fbx
```

---

### 2. Preview Blend Builder

**File:** `13_make_preview_blend.py` (in your project's `08_scripts/`)

**Template — copy and adapt paths:**
```python
"""Build a viewable .blend of the finished character."""
import math, os, subprocess, sys
import bpy
from mathutils import Matrix, Vector

PROJ = r"C:\path\to\model_projects\YourCharacter"
BLEND_DIR = os.path.join(PROJ, "03_blender")
TEX_DIR = os.path.join(PROJ, "04_textures")      # real PNG conversions
PHOTOS = os.path.join(PROJ, "02_progress_photos", "03_final")
WORK = r"C:\path\to\model_work\preview"

HMD = os.path.join(PROJ, "06_game_ready", "CharName", "CharName.hmd")
SWORD_HMD = r"C:\dsw_mod\extr\Character\Faction\Unit\Weapons\Weapon.fbx"
ANIM_HMD = r"C:\dsw_mod\extr\Anim\Male01\Variant\Anim_Male01_Anim.fbx"
SWORD_TEX = TEX_DIR

TOOLKIT = r"C:\path\to\HMD_toolkit\HMD_toolkit"
BODY_FBX = os.path.join(WORK, "preview_body.fbx")
SWORD_FBX = os.path.join(WORK, "preview_sword.fbx")
ANIM_FBX = os.path.join(WORK, "preview_body_anim.fbx")
OUT_BLEND = os.path.join(BLEND_DIR, "character_preview.blend")

# 1. HMD -> FBX (toolkit)
def ensure_fbx(hmd, out_fbx, anim_hmd=None):
    if anim_hmd:
        subprocess.run([sys.executable, "hmdanim2fbx.py", hmd, anim_hmd, out_fbx],
                       cwd=os.path.join(TOOLKIT, "Animations"), check=True)
    else:
        subprocess.run([sys.executable, "hmd2fbx.py", hmd, out_fbx],
                       cwd=os.path.join(TOOLKIT, "Models"), check=True)

ensure_fbx(HMD, BODY_FBX, anim_hmd=ANIM_HMD)
ensure_fbx(SWORD_HMD, SWORD_FBX)

# 2. Build scene
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=BODY_FBX)
body = [o for o in bpy.context.scene.objects if o.type=="MESH" and len(o.data.vertices)>100][0]
rig = next(o for o in bpy.context.scene.objects if o.type=="ARMATURE")

# Wire shipped textures (albedo->Base Color, MGAO->Specular IOR Level, normal->Normal Map, emissive->Emission)
def wire_material(mesh_obj, mat_name, maps):
    mat = bpy.data.materials.get(mat_name) or bpy.data.materials.new(mat_name)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes): nt.nodes.remove(n)
    def tex(path, label, loc):
        nd = nt.nodes.new("ShaderNodeTexImage")
        img = bpy.data.images.load(path, check_existing=False)
        img.name = os.path.basename(path); img.pack()
        nd.image = img; nd.label = label; nd.location = loc
        return nd
    alb = tex(maps["albedo"], "Albedo", (-700, 300))
    mga = tex(maps["mgao"], "MetallicGlossAO", (-700, 0))
    nrm = tex(maps["normal"], "Normal", (-700, -300))
    emi = tex(maps["emissive"], "Emissive", (-700, -600))
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); bsdf.location = (-200, 0)
    out = nt.nodes.new("ShaderNodeOutputMaterial"); out.location = (200, 0)
    nmap = nt.nodes.new("ShaderNodeNormalMap"); nmap.location = (-400, -300)
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    nt.links.new(emi.outputs["Color"], bsdf.inputs["Emission Color"])
    bsdf.inputs["Emission Strength"].default_value = 1.0
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    mga.image.colorspace_settings.name = "Non-Color"
    nrm.image.colorspace_settings.name = "Non-Color"
    emi.image.colorspace_settings.name = "Non-Color"
    mesh_obj.data.materials.clear()
    mesh_obj.data.materials.append(mat)

wire_material(body, "Mat_Character", {
    "albedo": os.path.join(TEX_DIR, "CharName_Albedo.png"),
    "mgao": os.path.join(TEX_DIR, "CharName_MetallicGlossAO.png"),
    "normal": os.path.join(TEX_DIR, "CharName_Normal.png"),
    "emissive": os.path.join(TEX_DIR, "CharName_Emissive.png"),
})

# 3. Attach prefab weapons (D-conjugation NOT needed — preview is in Blender's right-handed space)
def place_in_bone(obj, rig, bone_name, offset, rot_deg, anchor_y=0.0):
    """Bone-parent to the bone HEAD; prefab transform goes ON TOP of the imported basis."""
    pb = rig.pose.bones[bone_name]
    obj.parent = rig; obj.parent_type = "BONE"; obj.parent_bone = bone_name
    obj.matrix_parent_inverse = Matrix.Translation((0.0, -pb.bone.length, 0.0))  # tail -> head, still follows the pose
    rot = (Matrix.Rotation(math.radians(rot_deg[0]), 4, "X")
           @ Matrix.Rotation(math.radians(rot_deg[1]), 4, "Y")
           @ Matrix.Rotation(math.radians(rot_deg[2]), 4, "Z"))
    obj.matrix_basis = (Matrix.Translation((0.0, anchor_y, 0.0)) @ Matrix.Translation(offset)
                        @ rot @ obj.matrix_basis)   # keep the weapon's imported model-node transform
    bpy.context.view_layer.update()

# Example from prefab:
#   "Atreide_Sword_01"  y -0.16362  z 0.05084  rotX -90   -> B_Weapon
#   "Atreide_Sword_02"  x -0.16553  y -0.03469  z 0.26002  rotY -179.5 rotZ -84.8 -> B_lWristJ
for idx, (bone, offset, rot, anchor_y) in enumerate((
        ("B_Weapon", (-0.0, -0.16362, 0.05084), (-90.0, 0.0, 0.0), 0.019),
        ("B_lWristJ", (-0.16553, -0.03469, 0.26002), (0.0, -179.5, -84.8), 0.019),
), start=1):
    bpy.ops.import_scene.fbx(filepath=SWORD_FBX)
    sw = [o for o in bpy.context.scene.objects if o.type=="MESH" and len(o.data.vertices)>50][0]
    sw.name = f"Weapon_{idx:02d}"
    wire_material(sw, "Mat_Weapon", sword_maps)
    place_in_bone(sw, rig, bone, offset, rot, anchor_y)

# 4. World, lights, cameras, render, save
# ... (see full script in repo)
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
```

---

### 3. Sword Placement Calibration (find `anchor_y`)

The sword's local origin ≠ grip. Sweep `anchor_y` to slide the sword along its local +Y until the grip lands on the hand bone.

```python
# In Blender Python console or scratch script:
GRIP_LOCAL = Vector((0.0, -0.095, 0.0))  # center of grip band (local y)
for anchor in [0.0, 0.05, 0.10, 0.15, 0.20]:
    basis = Matrix.Translation(Vector((0.0, anchor, 0.0))) @ prefab
    sw.matrix_basis = basis
    bpy.context.view_layer.update()
    grip = sw.matrix_world @ GRIP_LOCAL
    dist = (grip - hand).length
    print(f"anchor {anchor:+.2f}  grip {grip}  dist {dist:.3f}")
```

**Typical result for Atreide sword:** `anchor_y ≈ 0.019` (grip at local y ≈ -0.095).

---

## Common Pitfalls & Fixes

| Symptom | Cause | Fix |
|---------|-------|-----|
| Body has giant black spikes / stretched limbs | Only 20/36 skin clusters imported | Apply **skin-split fix** in `hmd2fbx.py` (see above) |
| Textures show magenta / "DDS image failed to load" | Game textures are DDS with `.png` extension | Convert with PIL: `Image.open(p).convert('RGBA').save(out)` |
| Sword floats far from hand | Wrong `anchor_y` or D-conjugation applied incorrectly | Sweep `anchor_y`; **do not D-conjugate** prefab transform in preview |
| Weapon at the feet / pointing down / not following the hand | Imported basis replaced, or `matrix_parent_inverse` = inverse of the whole bone matrix (freezes it) | `parent_inverse = T(0,-bone_length,0)` and `basis = prefab @ imported_basis` (worked for halberd, rifle, bazooka on the Landsraad Guard) |
| `.blend` carries unpacked, 0-user texture stubs | FBX importer creates images/materials we then replace | Remove `users == 0` images/materials before saving |
| Animation turns character 90° | Root bone has baked Y-up→Z-up rotation in animation | Use `hmdanim2fbx.py` which matches the model's Z-up bake |
| Weapon textures missing | Weapon HMD references textures in `extr/Character/...` | Copy those textures to `04_textures/` and point `sword_maps` there |

---

## File Layout for a Preview Project

```
model_projects/YourCharacter/
├── 01_input/              # raw extracted assets (HMD, textures, prefab)
├── 03_blender/
│   ├── character_preview.blend   # <-- OUTPUT
│   └── source.fbx                # intermediate
├── 04_textures/           # real PNG conversions of shipped maps
├── 06_game_ready/
│   └── CharName/
│       ├── CharName.hmd
│       ├── CharName_Albedo.png
│       ├── CharName_MetallicGlossAO.png
│       ├── CharName_Normal.png
│       ├── CharName_Emissive.png
│       └── Prefab_CharName.prefab
├── 08_scripts/
│   └── 13_make_preview_blend.py  # <-- main builder
└── index.md               # document the preview blend here
```

---

## Verification Checklist

After building, open the `.blend` and confirm:

- [ ] Body renders with correct colours (no magenta, no black spikes)
- [ ] All 36 vertex groups present (`Object Data Properties > Vertex Groups`)
- [ ] Animation plays on frames 1–40 (`Dope Sheet` / `Timeline`)
- [ ] Swords follow hands through animation (scrub timeline)
- [ ] Cameras on numpad 1/3/7/9 show front/right/back/left
- [ ] Material Preview shading shows textures correctly

---

## Related Skills

- `dsw-model-modding` — full pipeline: Blender edit → HMD Toolkit → CDB → pak → Steam install
- `dsw-model-workshop` — Blender-only mesh edit/recolour/weapon attach → portable `.blend`
- `sync-unit-from-cdb` — sync YAML unit stats with CDB

---

## Version History

| Date | Change |
|------|--------|
| 2026-10-22 | Initial version — captured skin-split fix, preview builder, sword calibration |