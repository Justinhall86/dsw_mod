"""Bounding box (mesh units, after the armature and prefab rotation, nose turned to -Y) and baked triangle count.
    FRIG_WORK=<scratch> python 06_measure.py <out measure.json>
"""
import sys, os, json; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import ships as SH
res = {}
for s in SH.SHIPS:
    SH.reset()
    objs = SH.load_ship(s)
    mn, mx = SH.bounds(objs); d = mx - mn
    res[s['key']] = dict(size=[round(x, 2) for x in d], tris_baked=SH.tris(objs))
json.dump(res, open(sys.argv[1], 'w'), indent=1)
print(res)
