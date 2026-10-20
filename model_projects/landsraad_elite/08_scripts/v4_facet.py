"""v4: turn a soft/noisy sculpt piece into a crisp faceted low-poly shape (run in Blender via the bridge, numpy only).

facet_fit(obj, K, ...):
  1. variational shape approximation: partition the triangles into K planar proxies (Cohen-Steiner style: flood-fill from seeds by
     area-weighted normal error, Lloyd iterations: re-fit proxy normals, re-seed)
  2. snap every vertex to the intersection of the proxy planes of its neighbouring triangles (1 plane -> projection, 2 -> the crease
     line, 3+ -> the corner), regularised so degenerate (near-parallel) cases stay put
The result keeps the original triangulation but its large areas are exactly planar with sharp creases between them, so a
later collapse-decimate removes the interior vertices for free and a crease-angle normal split gives the hand-made low-poly look.
"""
import heapq
import numpy as np


def _tri_data(verts, faces):
    a, b, c = verts[faces[:, 0]], verts[faces[:, 1]], verts[faces[:, 2]]
    cr = np.cross(b - a, c - a)
    area = np.linalg.norm(cr, axis=1) / 2
    nrm = cr / np.maximum(2 * area, 1e-12)[:, None]
    cen = (a + b + c) / 3
    return nrm, area, cen


def _face_neighbors(faces):
    edge = {}
    for fi, (a, b, c) in enumerate(faces):
        for u, v in ((a, b), (b, c), (c, a)):
            edge.setdefault((min(u, v), max(u, v)), []).append(fi)
    nb = [[] for _ in range(len(faces))]
    for fs in edge.values():
        if len(fs) == 2:
            nb[fs[0]].append(fs[1]); nb[fs[1]].append(fs[0])
    return nb


def partition(verts, faces, K, iters=14, seed=1, pos_weight=2.0, init_seeds=None):
    """init_seeds: optional list of triangle indices that are used as the first seeds (designated facets); the remaining K - len
    seeds are added by farthest-point sampling on (normal, position)."""
    nrm, area, cen = _tri_data(verts, faces)
    nb = _face_neighbors(faces)
    F = len(faces)
    rng = np.random.default_rng(seed)
    feat = np.concatenate([nrm, cen * pos_weight], axis=1)
    seeds = list(init_seeds) if init_seeds else [int(rng.integers(F))]
    d = np.full(F, 1e9)
    for s0 in seeds:
        d = np.minimum(d, np.linalg.norm(feat - feat[s0], axis=1))
    while len(seeds) < K:
        s = int(np.argmax(d * np.sqrt(area / area.mean())))
        seeds.append(s); d = np.minimum(d, np.linalg.norm(feat - feat[s], axis=1))
    prox_n = nrm[seeds].copy()
    label = np.full(F, -1)
    for it in range(iters):
        label[:] = -1
        heap = []
        for k, s in enumerate(seeds):
            label[s] = k
        for k, s in enumerate(seeds):
            for t in nb[s]:
                if label[t] < 0:
                    heapq.heappush(heap, (area[t] * float(np.sum((nrm[t] - prox_n[k]) ** 2)), t, k))
        while heap:
            cost, t, k = heapq.heappop(heap)
            if label[t] >= 0:
                continue
            label[t] = k
            for u in nb[t]:
                if label[u] < 0:
                    heapq.heappush(heap, (area[u] * float(np.sum((nrm[u] - prox_n[k]) ** 2)), u, k))
        # unreachable faces (disconnected islands) -> nearest proxy by normal
        for t in np.where(label < 0)[0]:
            label[t] = int(np.argmin(np.sum((prox_n - nrm[t]) ** 2, axis=1)))
        new_n = np.zeros_like(prox_n); new_seeds = list(seeds)
        for k in range(K):
            idx = np.where(label == k)[0]
            if len(idx) == 0:
                new_n[k] = prox_n[k]; continue
            v = (nrm[idx] * area[idx, None]).sum(0); ln = np.linalg.norm(v)
            new_n[k] = v / ln if ln > 1e-12 else prox_n[k]
            err = area[idx] * np.sum((nrm[idx] - new_n[k]) ** 2, axis=1)
            new_seeds[k] = int(idx[np.argmin(err)])
        prox_n, seeds = new_n, new_seeds
    # proxy planes: normal + area-weighted centroid
    plane_p = np.zeros((K, 3))
    for k in range(K):
        idx = np.where(label == k)[0]
        plane_p[k] = (cen[idx] * area[idx, None]).sum(0) / max(area[idx].sum(), 1e-12) if len(idx) else 0
    return label, prox_n, plane_p


def snap(verts, faces, label, prox_n, plane_p, lam=0.08, max_move=0.025, seam_x=None, seam_w=50.0):
    """seam_x: if given, vertices with |x - seam_x| < 1e-6 are additionally pulled (weight seam_w) onto the mirror plane x = seam_x"""
    V = len(verts)
    vlabels = [set() for _ in range(V)]
    for fi, f in enumerate(faces):
        for v in f:
            vlabels[v].add(int(label[fi]))
    out = verts.copy(); moved = []
    for v in range(V):
        ls = list(vlabels[v])
        if not ls:
            continue
        A = lam * np.eye(3); b = lam * verts[v]
        for k in ls:
            n = prox_n[k]; A += np.outer(n, n); b += n * float(n @ plane_p[k])
        if seam_x is not None and abs(verts[v][0] - seam_x) < 1e-6:
            ex = np.array([1.0, 0, 0]); A += seam_w * np.outer(ex, ex); b += seam_w * ex * seam_x
        p = np.linalg.solve(A, b)
        d = p - verts[v]; dn = np.linalg.norm(d)
        if dn > max_move:
            p = verts[v] + d * (max_move / dn)
        out[v] = p; moved.append(np.linalg.norm(p - verts[v]))
    return out, np.array(moved)


def facet_fit(obj, K, iters=14, lam=0.08, max_move=0.025, seed=1):
    me = obj.data
    verts = np.array([v.co[:] for v in me.vertices], dtype=np.float64)
    faces = np.array([p.vertices[:] for p in me.polygons], dtype=np.int64)
    assert faces.shape[1] == 3, "triangulate first"
    label, pn, pp = partition(verts, faces, K, iters=iters, seed=seed)
    new, moved = snap(verts, faces, label, pn, pp, lam=lam, max_move=max_move)
    me.vertices.foreach_set("co", new.astype(np.float32).ravel()); me.update()
    return label, pn, pp, moved
