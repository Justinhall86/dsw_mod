# Skin-Split Bug & Fix

## The Problem

The shipped character HMD (from the repackager / CharMOD folder) often has **multiple skin splits** — one per material sub-mesh. For example, the Duncan Modified HMD has **2 splits**:

| Split | Joints | Vertices | Bind slots (local) |
|-------|--------|----------|-------------------|
| 0 | 20 (arms/hands) | 1,064 | 0..19 |
| 1 | 18 (spine/legs) | 3,506 | 0..17 |

**Vertex bone indices are LOCAL to each split**, not global. The original `hmd2fbx.py` treated them as global bind slots, so:
- Split 0 vertices used bind slots 0..19 → correct
- Split 1 vertices **also used bind slots 0..17** → collided with split 0, overwrote clusters
- Result: only 20 of 36 clusters survived → giant black spikes on ponytail/legs

## The Fix

Map each vertex to its owning index group (first group that lists it), then translate its local bone index through that split's joint list to the global bind slot.

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

## Files to Patch

| File | Location |
|------|----------|
| `hmd2fbx.py` | `HMD_toolkit/HMD_toolkit/Models/` |
| `hmd2fbx.py` | `HMD_toolkit/HMD_toolkit/Animations/` (same bug in animation exporter) |

## Verification

After fix, all vanilla characters round-trip with correct cluster counts:

| Character | Vertices | Clusters (before) | Clusters (after) |
|-----------|----------|-------------------|------------------|
| Duncan (original) | 4,863 | 36 | 36 |
| Duncan Modified | 4,550 | 20 | **36** |
| Atreide Soldier | ~4,200 | 38 | 38 |
| Gurney | ~3,900 | 36 | 36 |
| Ranger | ~2,400 | 39 | 39 |
| Warden | ~3,600 | 40 | 40 |

## Why This Happens

The game's repackager creates skin splits per material (each sub-mesh gets its own split). The vertex buffer stores bone indices **relative to that split's joint list**. The original converter assumed a single flat bind-slot space, which only works for single-split models (most vanilla units). Multi-split models (repackaged/modded) expose the bug.

## Related

- `dsw-preview-blend` skill — uses the fixed converter for preview builds
- `dsw-model-modding` skill — full pipeline including this converter