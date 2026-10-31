"""v4: (re)build all parts in the live Blender session and export their UV data for the texture builder.
Objects: helm_loft (helmet), padL_new / padR_new (pauldrons, +x / -x).   Needs `helm_src` (v4_helmet_prep.py) and `padL_hi` (the sculpt) in the scene."""
import json, math, bmesh
import numpy as np
SC = "C:/Users/justi/Python/dsw_mod/model_projects/landsraad_elite/08_scripts/"
exec(open(SC + "v4_atlas.py", encoding="utf-8").read(), globals())
exec(open(SC + "v4_helmet_loft.py", encoding="utf-8").read(), globals())
exec(open(SC + "v4_helmet_uv.py", encoding="utf-8").read(), globals())
exec(open(SC + "v4_pauldron.py", encoding="utf-8").read(), globals())

ob, _ = build_helmet(name="helm_loft")
scale_to_design(ob)
assign_uv_islands(ob, SC + "intermediate_data/helm_cells.json")
padL, _ = build_pauldron(name="padL_new", mirror=False)
padR, _ = build_pauldron(name="padR_new", mirror=True)

# ---- export UV data
me = ob.data
bm = bmesh.new(); bm.from_mesh(padL.data); bm.verts.ensure_lookup_table(); bm.edges.ensure_lookup_table(); bm.faces.ensure_lookup_table()
uvp = bm.loops.layers.uv["UVMap"]; grp = bm.faces.layers.int["grp"]
uv = {v.index: [0.0, 0.0] for v in bm.verts}
for f in bm.faces:
    if f[grp] == 6: continue
    for lp in f.loops: uv[lp.vert.index] = list(lp[uvp].uv)
polys = [dict(v=[v.index for v in f.verts], grp=int(f[grp]), n=list(f.normal), area=f.calc_area()) for f in bm.faces]
edges = []
for e in bm.edges:
    if len(e.link_faces) == 2: edges.append(dict(a=e.verts[0].index, b=e.verts[1].index, ang=math.degrees(e.calc_face_angle_signed(0.0)), g0=int(e.link_faces[0][grp]), g1=int(e.link_faces[1][grp])))
    else: edges.append(dict(a=e.verts[0].index, b=e.verts[1].index, ang=0.0, g0=-1, g1=-1))
json.dump(dict(uv=[uv[i] for i in range(len(bm.verts))], polys=polys, edges=edges), open(SC + "intermediate_data/pad_uvdata.json", "w"))
bm.free()
# ---- normals check
cen = np.array([0.0, 0.003, 1.82])
o_ = [float(np.array(p.normal[:]) @ (np.array(p.center[:]) - cen)) > 0 for p in me.polygons]
print("helmet faces outward: %d / %d" % (sum(o_), len(o_)))
pc = np.array(padL.data.polygons[0].center[:])
cenp = np.mean([np.array(p.center[:]) for p in padL.data.polygons], axis=0)
outp = [float(np.array(p.normal[:]) @ (np.array(p.center[:]) - cenp)) > 0 for p in padL.data.polygons]
print("pauldron faces outward: %d / %d" % (sum(outp), len(outp)))
