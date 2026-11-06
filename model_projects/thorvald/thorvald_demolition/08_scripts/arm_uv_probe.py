"""Do the left and right upper arms (Gurney) share texels?  Prints each side's UV bbox and the overlap of their rasterised UV masks."""
import bpy
import numpy as np
g = bpy.data.objects["Gurney"]
names = {x.index: x.name for x in g.vertex_groups}
dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in g.data.vertices if v.groups}
uv = g.data.uv_layers.active.data
N = 512
masks = {"l": np.zeros((N, N), bool), "r": np.zeros((N, N), bool)}
zs = {"l": [], "r": []}
for f in g.data.polygons:
    bs = [dom.get(i, "") for i in f.vertices]
    b = max(set(bs), key=bs.count)
    for s in ("l", "r"):
        if b in ("B_%sShoulderJ" % s,):
            c = g.matrix_world @ f.center
            zs[s].append(c.z)
            for li in f.loop_indices:
                u, v = uv[li].uv
                masks[s][min(N - 1, int((v % 1) * N)), min(N - 1, int((u % 1) * N))] = True
for s in "lr":
    m = masks[s]
    ys, xs = np.nonzero(m)
    print("ARM %s faces %d  uv u %.3f..%.3f v %.3f..%.3f  z %.2f..%.2f" % (s, len(zs[s]), xs.min() / N, xs.max() / N, ys.min() / N, ys.max() / N, min(zs[s]), max(zs[s])))
print("ARM shared texel samples", int((masks["l"] & masks["r"]).sum()), "of", int(masks["r"].sum()))
