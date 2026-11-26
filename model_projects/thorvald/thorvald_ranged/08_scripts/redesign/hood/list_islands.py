"""List mesh islands above a height: id, verts, centre, bbox, top bones.   python ../bl.py list_islands.py -- <fbx> [zmin]"""
import sys, os, bpy
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), *[".."] * 6, ".claude", "skills", "dsw-part-kitbash", "scripts")))
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), *[".."] * 6, ".claude", "skills", "dsw-new-unit", "scripts")))
import dsw_parts as P, blender_scene as bs
a = sys.argv[sys.argv.index("--") + 1:]
bs.reset_scene(); body, rig = bs.import_model(a[0]); zmin = float(a[1]) if len(a) > 1 else 1.3
comps = P.components(body)
for k, c in enumerate(comps):
    i = P.comp_info(body, c)
    if i["centre"][2] < zmin: continue
    ws = [body.matrix_world @ body.data.vertices[v].co for v in c]
    lo = [min(p[j] for p in ws) for j in range(3)]; hi = [max(p[j] for p in ws) for j in range(3)]
    print("ISL %3d v%5d c(%.2f %.2f %.2f) z[%.2f..%.2f] x[%.2f..%.2f] y[%.2f..%.2f] %s" % (k, len(c), *i["centre"], lo[2], hi[2], lo[0], hi[0], lo[1], hi[1], [b for b, _ in i["bones"][:3]]))
