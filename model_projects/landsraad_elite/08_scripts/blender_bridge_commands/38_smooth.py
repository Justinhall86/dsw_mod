exec(open(r"C:\Users\justi\AppData\Local\Temp\claude\c--Users-justi-OneDrive-Python-dsw-mod\bcfd5601-f811-4ebb-8e18-d846ff537b3d\scratchpad\scripts\elite_measure.py", encoding="utf-8").read(), globals())
lo = bpy.data.objects["elite_lo"]; me = lo.data; n = len(me.vertices)
names = [g.name for g in lo.vertex_groups]; idx = {g.index: k for k, g in enumerate(lo.vertex_groups)}
W = np.zeros((n, len(names)))
for v in me.vertices:
    for g in v.groups: W[v.index, idx[g.group]] = g.weight
nb = [[] for _ in range(n)]
for e in me.edges:
    a, b = e.vertices; nb[a].append(b); nb[b].append(a)
pad = set()
for c in range(n):
    pass
# pauldron vertices (clavicle-bound) stay as they are
clav = [names.index(f"B_{s}ClavicleJ") for s in "lr"]
padmask = np.array([W[i, clav].sum() > 0.8 for i in range(n)])
print("pauldron verts kept:", int(padmask.sum()))
for it in range(5):
    Wn = W.copy()
    for i in range(n):
        if padmask[i] or not nb[i]: continue
        Wn[i] = 0.5 * W[i] + 0.5 * W[nb[i]].mean(0)
    W = Wn
# keep the top 3 per vertex, renormalise
top = np.argsort(-W, axis=1)[:, :3]
Wk = np.zeros_like(W)
for i in range(n):
    for k in top[i]: Wk[i, k] = W[i, k]
Wk /= np.maximum(Wk.sum(1, keepdims=True), 1e-9)
for g in lo.vertex_groups: g.remove(list(range(n)))
for k, g in enumerate(lo.vertex_groups):
    for i in np.where(Wk[:, k] > 1e-4)[0]: g.add([int(i)], float(Wk[i, k]), "REPLACE")
inf = [len([g for g in v.groups if g.weight > 1e-4]) for v in me.vertices]
print("max influences", max(inf))
measure(do_shots=True, tag="13")
bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_work\elite_stage3.blend")
