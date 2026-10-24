# Removing a part from a model

## The two kinds of removal

| Kind | Example | Difficulty |
|---|---|---|
| A **separate shell** sitting on the body | a backpack, a cape, a shoulder pad | easy - delete the component, the body is untouched |
| A part **cut into** the body shell | a face carved into the head mesh | hard - the body must be closed afterwards |

Almost every game model is the first kind. The Commando is 45 separate
connected components (a hard-surface model split into parts), and the
backpack was 8 of them:

| Component | Verts | Extent (world) | What it is |
|---|---|---|---|
| 4, 5 | 107 each | y 0.14..0.46, z 1.11..1.63 | the **pack body**, left and right half |
| 6, 7 | 103 each | y 0.20..0.46, z 1.62..1.82 | the **shoulder straps**, left and right |
| 41-44 | 8, 8, 4, 4 | y 0.44..0.46, z 1.61..1.66 | the tiny **buckle/clip** pieces at the rearmost point of the straps |

## Identifying the part

1. Run `01_analyse_mesh.py` and read the component table.
2. Look at the per-component shots. **Render the part ALONE.**
3. Cross-check the bounding box against where the part visibly is.

A useful heuristic: a part that spans `y` from 0.14 to 0.46 while the body
spans -0.26 to 0.24 is behind the body's centre of mass - a backpack.

## Component ids are stable but their ORDER is not

Components are sorted by size, so the ids are stable **for a given model**,
but the ids **shift** when a component is deleted (the list is re-sorted).
So:

- read the ids from `01_analyse_mesh.py` on the ORIGINAL model, and
- pass those ids to `02_remove_parts.py`.

## The removal itself

```python
bm = bmesh.new()
bm.from_mesh(me)
for f in list(bm.faces):
    if any(v.index in doomed for v in f.verts):
        bm.faces.remove(f)
# drop the now-orphaned vertices
for v in [v for v in bm.verts if not v.link_faces]:
    bm.verts.remove(v)
bm.to_mesh(me)
```

The mesh, the rig, the skin weights and the UVs are otherwise untouched, so
the model keeps playing every existing animation. No rebinding is needed.

## The closure proofs

### 1. Boundary-edge parity, per surviving component

A component with **zero** boundary edges (edges with only one linked face) is
a closed shell. If a component's boundary-edge count is the same before and
after the removal, no hole was opened in it.

**Check every surviving component, not just the biggest.** The key must be
geometric, because `bmesh.to_mesh()` renumbers the vertices:

```python
key = (round(cx, 3), round(cy, 3), round(cz, 3), vert_count)
```

### 2. Ray normal orientation

Cast rays from behind into the volume the removed part occupied. Every hit
must face **outward** - its normal must point back along the ray. An
inside-facing hit means the ray went through a gap and is looking at the
inside of the body.

```python
bvh = BVHTree.FromPolygons(world_verts, polygons, all_triangles=False)
loc, nor, idx, dist = bvh.ray_cast(origin, direction, 4.0)
if nor.dot(direction) > 0:
    inside_facing += 1
```

### 3. Component membership

Render the remaining mesh with each component in a different colour and see
which one owns the newly exposed surface. If it is the body, the exposed
panel is the body's own - the removed part was merely covering it.

The Commando's exposed back is a **cream panel** that belongs to the torso
component. It is the Commando's own back, not a leftover of the pack.

## The result

| | before | after |
|---|---|---|
| verts | 3,299 | 2,855 |
| tris | 5,284 | 4,574 |
| faces removed | | 710 |

## What the removal exposed

Two things are worth knowing before shipping:

- The Commando's own back is a **cream/white panel**, which reads a bit plain
  now that the pack no longer covers it. In a recoloured variant it becomes
  the accent colour; in a vanilla build it stays cream.
- The right shoulder/armpit area has a small gap where the pack used to clip
  the arm. It is present in the vanilla model too (the natural arm-torso
  separation) - the removal just makes it more visible.
