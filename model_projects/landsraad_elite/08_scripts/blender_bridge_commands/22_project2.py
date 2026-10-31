from mathutils.bvhtree import BVHTree
from mathutils import Vector
import colorsys
ref = np.load(r"C:\Users\justi\Python\dsw_mod\model_work\elite_ref_rgb.npy").astype(np.float64) / 255.0
H, Wd, _ = ref.shape
o = bpy.data.objects["elite_src"]; me = o.data
bm = bmesh.new(); bm.from_mesh(me); bm.verts.ensure_lookup_table(); bm.normal_update()
tree = BVHTree.FromBMesh(bm)
n = len(bm.verts)
P = np.array([v.co[:] for v in bm.verts]); N = np.array([v.normal[:] for v in bm.verts])
S, BASE = 605.0, 1442.0
views = {"front": (np.array([0, -1.0, 0]), lambda p: 563 + S * p[0]),
         "back":  (np.array([0, +1.0, 0]), lambda p: 1480 - S * p[0]),
         "side":  (np.array([+1.0, 0, 0]), lambda p: 2162 + S * p[1])}
def bad(c):
    mx, mn = c.max(), c.min()
    sat = (mx - mn) / mx if mx > 1e-6 else 0
    if c[0] >= c[1] >= c[2] and c[0] > 0.30 and sat > 0.62: return True        # orange selection outline (and its blends)
    if (mx - mn) < 0.05 and mx > 0.55: return True                               # light neutral grey = bone display shapes
    return False
acc = np.zeros((n, 3)); wsum = np.zeros(n)
for name, (d, ufun) in views.items():
    dv = Vector(d.tolist())
    for i in range(n):
        w = float(N[i] @ d)
        if w < 0.35: continue
        p = P[i]
        if tree.ray_cast(Vector(p) + dv * 2e-3, dv, 5.0)[0] is not None: continue
        u = int(round(ufun(p))); v = int(round(BASE - S * p[2]))
        if not (3 <= u < Wd - 3 and 3 <= v < H - 3): continue
        patch = ref[v-1:v+2, u-1:u+2].reshape(-1, 3)
        good = [c for c in patch if not bad(c)]
        if len(good) < 6: continue
        acc[i] += np.mean(good, axis=0) * w * w; wsum[i] += w * w
known = wsum > 0
print("direct colour:", int(known.sum()), "of", n)
col = np.zeros((n, 3)); col[known] = acc[known] / wsum[known][:, None]
nbrs = [[e.other_vert(v).index for e in v.link_edges] for v in bm.verts]
bm.free()
fixed = known.copy()
for it in range(600):
    unk = np.where(~fixed)[0]
    if len(unk) == 0: break
    new = [(i, col[[j for j in nbrs[i] if fixed[j]]].mean(0)) for i in unk if any(fixed[j] for j in nbrs[i])]
    if not new: break
    for i, c in new: col[i] = c; fixed[i] = True
print("diffusion iterations", it, "unknown left", int((~fixed).sum()))
col[~fixed] = (0.4, 0.4, 0.45)
for _ in range(2):                                   # light smoothing to remove speckle
    new = col.copy()
    for i, nb in enumerate(nbrs):
        if nb: new[i] = 0.5 * col[i] + 0.5 * col[nb].mean(0)
    col = new
np.save(os.path.join(PROG, "..", "elite_proj_srgb.npy"), col)
lin = np.where(col <= 0.04045, col / 12.92, ((col + 0.055) / 1.055) ** 2.4)
ca = me.color_attributes["Col"]
ca.data.foreach_set("color", np.concatenate([lin, np.ones((n, 1))], 1).astype(np.float32).ravel())
print(cshot("09_projected_front", rz=0, scale=2.3, loc=(0,0,1.0), color='VERTEX', light='FLAT'))
print(cshot("09_projected_back", rz=180, scale=2.3, loc=(0,0,1.0), color='VERTEX', light='FLAT'))
