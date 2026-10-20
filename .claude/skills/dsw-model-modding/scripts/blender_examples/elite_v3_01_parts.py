"""v3 (vanilla-guard base) step 1: cut the Elite sculpt into the three pieces we keep - the helmet and the two pauldrons -
and build a low-poly version of each. Run in the GUI Blender (bridge); scene = v2_stage2_baked.blend (elite_hi with colour
attributes Col / VW / MG, still in the fitted-to-rig coordinates, so the pieces already sit on the Male01 skeleton).

 parts_hi : the three pieces at full density (source for the bake)
 parts_lo : the same pieces decimated: helmet HELMET_TRIS, each pauldron PAULDRON_TRIS (joined, triangulated)
"""
import numpy as np, bmesh

HELMET_TRIS, PAULDRON_TRIS = 3800, 2300
HELMET_Z = 1.64                                   # everything above this on the main body = helmet (+ its gorget flanges)
hi = bpy.data.objects["elite_hi"]; hi.hide_viewport = False; hi.hide_render = False; hi.hide_set(False)
for nm in ("parts_hi", "parts_lo", "helmet_lo", "padL_lo", "padR_lo"):
    o = bpy.data.objects.get(nm)
    if o: bpy.data.objects.remove(o, do_unlink=True)
me = hi.data
bm = bmesh.new(); bm.from_mesh(me); bm.verts.ensure_lookup_table()
seen = set(); comps = []
for v in bm.verts:
    if v.index in seen: continue
    st = [v]; c = []; seen.add(v.index)
    while st:
        x = st.pop(); c.append(x.index)
        for e in x.link_edges:
            w = e.other_vert(x)
            if w.index not in seen: seen.add(w.index); st.append(w)
    comps.append(c)
bm.free(); comps.sort(key=len, reverse=True)
co = np.array([v.co[:] for v in me.vertices])
pad_idx = {"L": None, "R": None}
for comp in comps[1:]:
    cx, cz = co[comp, 0].mean(), co[comp, 2].mean()
    if abs(cx) > 0.15 and cz > 1.25: pad_idx["L" if cx > 0 else "R"] = set(comp)
main = set(comps[0])
helmet_idx = {i for i in main if co[i, 2] > HELMET_Z and abs(co[i, 0]) < 0.30}
print("pieces (verts): helmet", len(helmet_idx), "| pauldron L", len(pad_idx["L"]), "| pauldron R", len(pad_idx["R"]))


def carve(name, keep):
    """duplicate the sculpt keeping only faces whose vertices are all in `keep` (attributes Col/VW/MG are preserved)."""
    o = hi.copy(); o.data = hi.data.copy(); o.name = name; o.data.name = name
    bpy.context.collection.objects.link(o)
    b = bmesh.new(); b.from_mesh(o.data); b.verts.ensure_lookup_table(); b.faces.ensure_lookup_table()
    bmesh.ops.delete(b, geom=[f for f in b.faces if not all(v.index in keep for v in f.verts)], context="FACES")
    bmesh.ops.delete(b, geom=[v for v in b.verts if not v.link_faces], context="VERTS")
    b.to_mesh(o.data); b.free()
    for p in o.data.polygons: p.use_smooth = True
    return o


pieces = {"helmet": carve("helmet_hi", helmet_idx), "padL": carve("padL_hi", pad_idx["L"]), "padR": carve("padR_hi", pad_idx["R"])}
for k, o in pieces.items(): print(k, "hi tris:", len(o.data.polygons))


def lowpoly(o, target, name):
    lo = o.copy(); lo.data = o.data.copy(); lo.name = name; lo.data.name = name
    bpy.context.collection.objects.link(lo)
    m = lo.modifiers.new("Dec", "DECIMATE"); m.decimate_type = "COLLAPSE"; m.use_collapse_triangulate = True
    m.ratio = min(1.0, target / len(lo.data.polygons))
    bpy.context.view_layer.objects.active = lo
    bpy.ops.object.modifier_apply(modifier="Dec")
    print(name, "->", len(lo.data.polygons), "tris")
    return lo


los = [lowpoly(pieces["helmet"], HELMET_TRIS, "helmet_lo"), lowpoly(pieces["padL"], PAULDRON_TRIS, "padL_lo"), lowpoly(pieces["padR"], PAULDRON_TRIS, "padR_lo")]


def join(objs, name):
    for o in bpy.context.view_layer.objects: o.select_set(False)
    for o in objs: o.hide_set(False); o.select_set(True)
    bpy.context.view_layer.objects.active = objs[0]
    bpy.ops.object.join()
    r = bpy.context.view_layer.objects.active; r.name = name; r.data.name = name
    return r


parts_hi = join([pieces["helmet"], pieces["padL"], pieces["padR"]], "parts_hi")
parts_lo = join(los, "parts_lo")
b = bmesh.new(); b.from_mesh(parts_lo.data)
bmesh.ops.triangulate(b, faces=b.faces[:]); bmesh.ops.recalc_face_normals(b, faces=b.faces[:])
b.to_mesh(parts_lo.data); b.free()
for p in parts_lo.data.polygons: p.use_smooth = True
hi.hide_viewport = True; hi.hide_render = True; hi.hide_set(True)
print("parts_hi:", len(parts_hi.data.polygons), "tris | parts_lo:", len(parts_lo.data.vertices), "verts", len(parts_lo.data.polygons), "tris")
