"""Step 22 - swap the Commando's bare head for the Atreide trooper helmet.

    blender -b --python 22_head_swap.py --            (all paths default)
    or run inside the visible GUI Blender (MCP bridge) with no args.

    base   05_fbx_export/Commando_NoBackpack_Scarf.fbx   (backpack removed)
    donor  01_input/Male01_AtreideSoldier_TRUE_FBX.fbx   (hmd2fbx conversion)

Method
  1. find the base's head as CONNECTED COMPONENTS whose dominant bone is
     B_HeadJ (two shells, like the backpack removal) and delete them whole
  2. find the donor's helmet the same way and keep only those components
  3. join the helmet into the body - both models are Male01 rigs, so the
     existing B_HeadJ vertex group drives the helmet with no re-skinning
  4. PROVE the removal opened no hole (boundary-edge parity per surviving
     component, keyed by geometry - never by vertex index)
  5. wire BOTH materials: Commando textures for the body, Atreide textures
     for the helmet (two material slots on one mesh)
  6. export the FBX BEFORE any camera/light exists, then save the .blend
     (packed) and render proof images into 02_progress_photos/11_head_swap/
"""
import os
import sys

import bmesh
import bpy
import numpy as np
from mathutils import Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import cfg, connected_components, script_args

argv = script_args()
HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.dirname(cfg("model_projects"))


def arg_or(flag, default):
    return argv[argv.index(flag) + 1] if flag in argv else default


base_path = argv[0] if len(argv) > 0 and not argv[0].startswith("-") else \
    os.path.join(PROJ, "05_fbx_export", "Commando_NoBackpack_Scarf.fbx")
donor_path = argv[1] if len(argv) > 1 and not argv[1].startswith("-") else \
    os.path.join(PROJ, "01_input", "Male01_AtreideSoldier_TRUE_FBX.fbx")
shots = arg_or("--shots", os.path.join(PROJ, "02_progress_photos", "11_head_swap"))
out_blend = arg_or("--out", os.path.join(PROJ, "03_blender", "Commando_HeadSwap.blend"))
work_blend = os.path.join(PROJ, "03_blender", "Commando_HeadSwap_work.blend")
out_fbx = arg_or("--fbx", os.path.join(PROJ, "05_fbx_export", "Commando_HeadSwap.fbx"))
cmdo_tex = os.path.join(PROJ, "01_input")
atre_tex = os.path.join(REPO, "model_inputs", "A_Trooper")

print("STAGE 0  base=%s" % base_path)
print("         donor=%s" % donor_path)


# ---------------------------------------------------------------------------
# helpers (the proven ones from 02_remove_parts.py)
# ---------------------------------------------------------------------------

def comp_index(obj):
    me = obj.data
    order, roots = connected_components(
        len(me.vertices), [list(p.vertices) for p in me.polygons])
    comp_of = {}
    for i, root in enumerate(order):
        for v in roots[root]:
            comp_of[v] = i
    return order, roots, comp_of


def boundary_per_component(obj, comp_of):
    me = obj.data
    bm = bmesh.new()
    bm.from_mesh(me)
    bm.verts.ensure_lookup_table()
    bm.edges.ensure_lookup_table()
    out = {}
    for e in bm.edges:
        if len(e.link_faces) == 1:
            c = comp_of[e.verts[0].index]
            out[c] = out.get(c, 0) + 1
    bm.free()
    return out


def component_key(obj, roots, order, i):
    """(rounded centroid, vertex count) - survives bmesh renumbering."""
    me = obj.data
    mw = obj.matrix_world
    co = np.array([(mw @ me.vertices[v].co)[:] for v in roots[order[i]]])
    c = co.mean(axis=0)
    return (round(float(c[0]), 3), round(float(c[1]), 3),
            round(float(c[2]), 3), len(roots[order[i]]))


def component_dominant(obj, roots, order, dom, i):
    names = [dom[v] for v in roots[order[i]] if v in dom]
    if not names:
        return "NONE"
    return max(set(names), key=names.count)


def component_bbox(obj, roots, order, i):
    me = obj.data
    mw = obj.matrix_world
    co = np.array([(mw @ me.vertices[v].co)[:] for v in roots[order[i]]])
    return co.min(axis=0), co.max(axis=0)


def drop_components(obj, roots, order, ids):
    me = obj.data
    doomed = set()
    for c in ids:
        for v in roots[order[c]]:
            doomed.add(v)
    bm = bmesh.new()
    bm.from_mesh(me)
    bm.verts.ensure_lookup_table()
    bm.faces.ensure_lookup_table()
    removed = 0
    for f in list(bm.faces):
        if any(v.index in doomed for v in f.verts):
            bm.faces.remove(f)
            removed += 1
    loose = [v for v in bm.verts if not v.link_faces]
    for v in loose:
        bm.verts.remove(v)
    bm.to_mesh(me)
    bm.free()
    me.update()
    return removed, len(loose)


def keep_only_components(obj, roots, order, ids):
    """Delete every component EXCEPT the given ids."""
    keep = set()
    for c in ids:
        keep.update(roots[order[c]])
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    bm.faces.ensure_lookup_table()
    for f in list(bm.faces):
        if not all(v.index in keep for v in f.verts):
            bm.faces.remove(f)
    loose = [v for v in bm.verts if not v.link_faces]
    for v in loose:
        bm.verts.remove(v)
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()


def head_components(obj):
    """Component ids whose dominant bone is B_HeadJ AND that sit in the
    head zone (z 1.4..2.1, |x| < 0.3).  The zone guard keeps a stray
    B_HeadJ-weighted piece elsewhere from being swept in."""
    dom = bs.dominant_bone_per_vertex(obj)
    order, roots, _ = comp_index(obj)
    hits = []
    for i in range(len(order)):
        if component_dominant(obj, roots, order, dom, i) != "B_HeadJ":
            continue
        lo, hi = component_bbox(obj, roots, order, i)
        if lo[2] > 1.4 and hi[2] < 2.1 and abs(lo[0]) < 0.3 and abs(hi[0]) < 0.3:
            hits.append(i)
    return hits, order, roots


def ensure_wired(mat, wanted, label):
    """Make every socket in `wanted` actually read its file, creating
    nodes if the FBX brought none.  Returns True when all are wired."""
    if mat is None:
        print("   MATERIAL %s MISSING" % label)
        return False
    mat.use_nodes = True
    tree = mat.node_tree
    bsdf = next((n for n in tree.nodes if n.type == "BSDF_PRINCIPLED"), None)
    if bsdf is None:
        print("   MATERIAL %s has no Principled BSDF" % label)
        return False
    bs.wire_textures(mat, wanted)          # re-point existing tex nodes

    def linked(sock):
        for l in tree.links:
            if l.to_socket.name != sock:
                continue
            if l.from_node.type == "TEX_IMAGE":
                return True
            if sock == "Normal" and l.from_node.type == "NORMAL_MAP":
                for l2 in tree.links:
                    if l2.to_node == l.from_node and l2.from_node.type == "TEX_IMAGE":
                        return True
        return False

    for sock, path in wanted.items():
        if linked(sock):
            continue
        if not os.path.exists(path):
            print("   %s: %s MISSING FILE %s" % (label, sock, path))
            continue
        img = bpy.data.images.load(path, check_existing=True)
        img.name = os.path.basename(path)
        tex = tree.nodes.new("ShaderNodeTexImage")
        tex.image = img
        if sock == "Normal":
            img.colorspace_settings.name = "Non-Color"
            nm = tree.nodes.new("ShaderNodeNormalMap")
            tree.links.new(tex.outputs["Color"], nm.inputs["Color"])
            tree.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
        else:
            img.colorspace_settings.name = \
                "sRGB" if sock == "Base Color" else "Non-Color"
            tree.links.new(tex.outputs["Color"], bsdf.inputs[sock])
        print("   %s: created node for %s <- %s" % (label, sock,
                                                    os.path.basename(path)))
    ok = True
    for sock in wanted:
        if not linked(sock):
            print("   %s: %s STILL NOT WIRED" % (label, sock))
            ok = False
    return ok


# ---------------------------------------------------------------------------
# STAGE 1  load the base, remember how the body looked before
# ---------------------------------------------------------------------------
print("STAGE 1  load base")
bs.reset_scene()
body, rig = bs.import_model(base_path)
bpy.context.view_layer.update()
me = body.data
before_v, before_f = len(me.vertices), len(me.polygons)
order, roots, comp_of = comp_index(body)
bnd_before = boundary_per_component(body, comp_of)
key_before = {i: component_key(body, roots, order, i) for i in range(len(order))}
bnd_key_before = {key_before[i]: bnd_before.get(i, 0) for i in range(len(order))}
print("  base verts %d tris %d components %d rig %s" %
      (before_v, before_f, len(order), rig.name if rig else "NONE"))

head_ids, order, roots = head_components(body)
head_verts = sum(len(roots[order[i]]) for i in head_ids)
print("  head components %s -> %d verts" % (head_ids, head_verts))
if not 550 <= head_verts <= 800:
    raise SystemExit("unexpected head size %d (want 550..800) - aborting"
                     % head_verts)
for i in head_ids:
    lo, hi = component_bbox(body, roots, order, i)
    print("    comp %d verts %d bbox x %.2f..%.2f y %.2f..%.2f z %.2f..%.2f"
          % (i, len(roots[order[i]]), lo[0], hi[0], lo[1], hi[1], lo[2], hi[2]))

# ---------------------------------------------------------------------------
# STAGE 2  delete the head shells
# ---------------------------------------------------------------------------
print("STAGE 2  delete head components %s" % head_ids)
removed, loose = drop_components(body, roots, order, head_ids)
after_v, after_f = len(body.data.vertices), len(body.data.polygons)
print("  verts %d -> %d  tris %d -> %d  (%d faces, %d loose verts)"
      % (before_v, after_v, before_f, after_f, removed, loose))

# ---- PROOF 1: boundary-edge parity, per surviving component -------------
order2, roots2, comp_of2 = comp_index(body)
bnd_after = boundary_per_component(body, comp_of2)
key_after = {i: component_key(body, roots2, order2, i) for i in range(len(order2))}
bnd_key_after = {key_after[i]: bnd_after.get(i, 0) for i in range(len(order2))}
changed = []
for k, b in bnd_key_before.items():
    if k not in bnd_key_after:
        continue
    if bnd_key_after[k] != b:
        changed.append((k, b, bnd_key_after[k]))
proof1 = not changed
print("  PROOF 1  %d components before, %d after; %d changed -> %s"
      % (len(order), len(order2), len(changed),
         "PASS" if proof1 else "FAIL"))
for k, b, a in changed:
    print("    component %s: %d -> %d boundary edges" % (k, b, a))

# ---------------------------------------------------------------------------
# STAGE 3  load the donor, keep only the helmet
# ---------------------------------------------------------------------------
print("STAGE 3  load donor")
donor, donor_rig = bs.import_model(donor_path)
if donor is body:
    raise SystemExit("donor import picked up the base mesh - aborting")
bpy.context.view_layer.update()

d_head_ids, d_order, d_roots = head_components(donor)
d_head_verts = sum(len(d_roots[d_order[i]]) for i in d_head_ids)
print("  donor head components %s -> %d verts" % (d_head_ids, d_head_verts))
if not 900 <= d_head_verts <= 1600:
    raise SystemExit("unexpected donor helmet size %d (want 900..1600)"
                     % d_head_verts)

# where is it? it must sit where the commando head was.
mw = donor.matrix_world
co = np.array([(mw @ donor.data.vertices[v].co)[:]
               for i in d_head_ids for v in d_roots[d_order[i]]])
lo, hi = co.min(axis=0), co.max(axis=0)
centre = co.mean(axis=0)
print("  helmet bbox x %.3f..%.3f y %.3f..%.3f z %.3f..%.3f centre %s"
      % (lo[0], hi[0], lo[1], hi[1], lo[2], hi[2],
         tuple(round(float(c), 3) for c in centre)))
if not (abs(centre[0]) < 0.05 and abs(centre[1]) < 0.10
        and 1.65 < centre[2] < 1.95):
    raise SystemExit("donor helmet is NOT where the commando head was - "
                     "coordinate mismatch, aborting before the join")

keep_only_components(donor, d_roots, d_order, d_head_ids)
print("  donor trimmed to %d verts / %d tris"
      % (len(donor.data.vertices), len(donor.data.polygons)))

# ---- bone compatibility: helmet weights must name real bones ------------
if rig is None:
    raise SystemExit("base has no armature")
rig_bones = {b.name for b in rig.data.bones}
gname = {g.index: g.name for g in donor.vertex_groups}
missing = {}
for v in donor.data.vertices:
    for g in v.groups:
        n = gname.get(g.group)
        if n is not None and n not in rig_bones:
            missing[n] = missing.get(n, 0.0) + g.weight
if missing:
    print("  WARNING: helmet weights reference bones the base rig lacks: %s"
          % {k: round(v, 2) for k, v in missing.items()})
    head_g = donor.vertex_groups.get("B_HeadJ")
    if head_g is None:
        raise SystemExit("donor has no B_HeadJ group")
    for v in donor.data.vertices:
        for g in list(v.groups):
            n = gname.get(g.group)
            if n is not None and n not in rig_bones:
                w = g.weight
                donor.vertex_groups[g.group].remove([v.index])
                head_g.add([v.index], w, "REPLACE")
    print("  moved those weights onto B_HeadJ")
else:
    print("  every helmet weight names a bone the base rig has -> PASS")

# ---------------------------------------------------------------------------
# STAGE 4  join the helmet into the body
# ---------------------------------------------------------------------------
print("STAGE 4  join")
pre_mats = list(body.data.materials)
for o in bpy.context.selected_objects:
    o.select_set(False)
donor.select_set(True)
body.select_set(True)
bpy.context.view_layer.objects.active = body
bpy.ops.object.join()
if donor_rig is not None and donor_rig.name in bpy.data.objects:
    bpy.data.objects.remove(donor_rig, do_unlink=True)
bpy.context.view_layer.update()

joined_v = len(body.data.vertices)
expect = after_v + len(co)
print("  verts %d (base %d + helmet %d)" % (joined_v, after_v, len(co)))
if joined_v != expect:
    raise SystemExit("join lost or gained verts: %d != %d" % (joined_v, expect))
if body.animation_data is None and rig and rig.name in bpy.data.objects:
    pass  # skinning lives in vertex groups + armature modifier, not anim data
mods = [m.type for m in body.modifiers]
if "ARMATURE" not in mods:
    raise SystemExit("body lost its Armature modifier")
print("  armature modifier present -> PASS")

donor_mats = [m for m in body.data.materials if m not in pre_mats]
print("  materials now: %s (donor slots: %s)"
      % ([m.name for m in body.data.materials], [m.name for m in donor_mats]))

# ---------------------------------------------------------------------------
# STAGE 5  wire both materials
# ---------------------------------------------------------------------------
print("STAGE 5  materials")
cmdo_wanted = {
    "Base Color": os.path.join(cmdo_tex, "Commando_Albedo.png"),
    "Specular IOR Level": os.path.join(cmdo_tex, "Commando_MetallicGlossAO.png"),
    "Normal": os.path.join(cmdo_tex, "Commando_Normal.png"),
}
atre_wanted = {
    "Base Color": os.path.join(atre_tex, "AtreideSoldier01_Albedo.png"),
    "Specular IOR Level": os.path.join(atre_tex, "AtreideSoldier01_MetallicGlossAO.png"),
    "Normal": os.path.join(atre_tex, "AtreideSoldier01_Normal.png"),
}
all_ok = True
for m in pre_mats:
    all_ok &= ensure_wired(m, cmdo_wanted, "body/" + (m.name if m else "?"))
for m in donor_mats:
    all_ok &= ensure_wired(m, atre_wanted, "helmet/" + (m.name if m else "?"))
if not all_ok:
    raise SystemExit("material wiring incomplete - not exporting")

# ---------------------------------------------------------------------------
# STAGE 6  export the FBX (clean scene: body + rig only, no lights yet)
# ---------------------------------------------------------------------------
print("STAGE 6  export FBX")
os.makedirs(os.path.dirname(out_fbx), exist_ok=True)
bpy.ops.export_scene.fbx(filepath=out_fbx, use_selection=False, path_mode="COPY",
                         embed_textures=True, add_leaf_bones=False,
                         bake_anim=False, axis_forward="Y", axis_up="Z",
                         global_scale=1.0, use_mesh_modifiers=True)
print("  SAVED %s (%d bytes)" % (out_fbx, os.path.getsize(out_fbx)))

# mid-save for safety (before scene furniture)
try:
    bpy.ops.wm.save_as_mainfile(filepath=work_blend, compress=True)
    print("  SAVED work blend %s" % work_blend)
except Exception as e:
    print("  work blend save failed: %s" % e)

# ---------------------------------------------------------------------------
# STAGE 7  world, lights, camera, pack, final save
# ---------------------------------------------------------------------------
print("STAGE 7  scene + pack + save")
os.makedirs(shots, exist_ok=True)
bs.render_angles(body, shots, prefix="swap_")   # world/lights/camera + 6 angles
packed = bs.pack_all_images()
print("  packed %d images" % packed)
try:
    bpy.ops.wm.save_as_mainfile(filepath=out_blend, compress=True)
    print("  SAVED %s (%.2f MB)" % (out_blend, os.path.getsize(out_blend) / 1e6))
except Exception as e:
    print("  SAVE FAILED: %s" % e)
    raise

# ---- head close-ups ------------------------------------------------------
bs.setup_render(700, 700)
head_c = Vector((0.0, 0.0, 1.85))
cam = bs.setup_camera(target=head_c, ortho_scale=0.55,
                      direction=(0.0, -1.0, 0.05), distance=3.0)
bs.render_to(os.path.join(shots, "head_front.png"), cam)
cam = bs.setup_camera(target=head_c, ortho_scale=0.55,
                      direction=(0.7, -0.7, 0.15), distance=3.0)
bs.render_to(os.path.join(shots, "head_three_quarter.png"), cam)
cam = bs.setup_camera(target=head_c, ortho_scale=0.55,
                      direction=(1.0, 0.0, 0.05), distance=3.0)
bs.render_to(os.path.join(shots, "head_side.png"), cam)

print("\nSUMMARY")
print("  base   %d -> %d verts, %d -> %d tris" %
      (before_v, joined_v, before_f, len(body.data.polygons)))
print("  proof1 %s" % ("PASS" if proof1 else "FAIL"))
print("  shots  %s" % shots)
print("  blend  %s" % out_blend)
if not proof1:
    raise SystemExit("CLOSURE PROOF FAILED")
print("ALL DONE")
