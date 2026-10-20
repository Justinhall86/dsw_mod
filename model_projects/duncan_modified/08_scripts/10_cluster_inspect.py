"""Inspect Cluster deformers in source vs exported FBX via the toolkit's fbx_binary reader."""
import sys
sys.path.insert(0, r"C:\Users\justi\OneDrive\Python\dsw_mod\HMD_toolkit\HMD_toolkit\Models")
from fbx_binary import read_fbx

def clusters(path, label):
    version, nodes = read_fbx(path)
    top = {n.name: n for n in nodes}
    objects = top["Objects"]
    conns = [c for c in top["Connections"].children if c.props[0] == "OO"]
    children = {}
    for c in conns:
        children.setdefault(c.props[2], []).append(c.props[1])
    byid = {o.props[0]: o for o in objects.children}
    def name_of(o):
        return o.props[1].split("\x00")[0] if len(o.props) > 1 and isinstance(o.props[1], str) else ""
    limb = {o.props[0]: name_of(o) for o in objects.children if o.name == "Model" and o.props[2] == "LimbNode"}
    cl = [o for o in objects.children if o.name == "Deformer" and o.props[2] == "Cluster"]
    print(f"{label}: {len(limb)} LimbNodes, {len(cl)} Clusters")
    rows = []
    for o in cl:
        bone = None
        for cid in children.get(o.props[0], []):
            if cid in limb: bone = limb[cid]
        # count indices
        nidx = 0
        for ch in o.children:
            if ch.name == "Indexes":
                nidx = len(ch.props[0])
        rows.append((name_of(o), bone, nidx))
    from collections import Counter
    print("  clusters per bone:", Counter(b for _, b, _ in rows))
    empty = [(n, b) for n, b, i in rows if i == 0]
    print("  empty clusters:", empty if empty else "none")

clusters(r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx", "SRC")
clusters(r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified\05_fbx_export\duncan_modified.fbx", "OUT")
