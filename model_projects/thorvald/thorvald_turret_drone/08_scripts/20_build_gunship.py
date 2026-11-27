"""Build a Thorvald turret gunship variant on the Renegade drone rig (Ravager_Drone, rig 25, clips /Anim/DroneR).

    blender -b --factory-startup --python 20_build_gunship.py -- <spec.json> [variant ...]
    (cloud session: python 20_build_gunship.py -- ...   with the pip `bpy` module)

Output: 03_blender/variants/<name>_geo.blend (armature + skinned mesh ThDrone_Body) and 04_textures/<name>/_geo.npz.

The host is ONE HMD on 7 joints: B_ROOT, B_Body (hull), Wing (the hanging fin), B_CanonR/L (cannon pivots) with
B_CanonR/L_Shoot. The DroneR clips never deploy: Idle/Run bob B_Body, AttackRange rolls each cannon about the forward axis
and kicks its _Shoot bone back. So: hull and turret are skinned to B_Body (fixed turret: the whole unit turns to aim, as
every DSW unit does), barrels to B_CanonR/L running straight forward THROUGH the pivots, so the roll leaves a round barrel
visually still. The attack combo fires from prefab objects MuzzleA/B, which 60_write_gunship.py puts at the barrel mouths.

Same helpers and spaces as the artillery drone's 20_build_drone.py (imported): build space = R @ data, the bind pose in
Blender world, Z up, front toward -X. Extra placement frame here:
  frame "axis": sides [R, L]; origin = that cannon pivot (bind), u = -X (forward), w = +Z, v = outward;
                at [u, v, w] from the pivot; anchor rear|centre|front on u; skin "B_Canon{S}".
"""
import importlib.util
import json
import os
import sys

import bpy  # noqa: I001
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
ART = os.path.join(REPO, "model_projects", "thorvald", "thorvald_artillery_drone", "08_scripts")
sys.path.insert(0, ART)
_sp = importlib.util.spec_from_file_location("bd", os.path.join(ART, "20_build_drone.py"))
bd = importlib.util.module_from_spec(_sp)
_sp.loader.exec_module(bd)
ds, B = bd.ds, bd.B
bd.TEX_CACHE = os.path.join(PROJ, "01_input", "donor_textures")
R, RI = bd.R, bd.RI
HOST = os.path.join(ds.VEH, "Common", "Ravager_Drone", "preview_textures", "Ravager_Drone_real.fbx")
# donors whose file name differs from their folder name (the auto lookup needs <Folder>/preview_textures/<Folder>_real.fbx)
B.DONORS.update({
    "harvestera": ("Atreide/Harvester/preview_textures/Vehicule_Harvester_real.fbx", "Atreide/Harvester/Vehicule_Harvester"),
})


def log(*a):
    print("[gunship]", *a)


def load_host():
    new = ds.import_fbx(HOST)
    arm = next(o for o in new if o.type == "ARMATURE")
    me = next(o for o in new if o.type == "MESH")
    arm.name = "Arm_Body"
    me.name = me.data.name = "ThDrone_Body"
    tex = os.path.join(ds.VEH, "Common", "Ravager_Drone", "preview_textures")
    me.data.materials.clear()
    me.data.materials.append(ds.pbr_mat("Mat_ThDrone_Ravager_Drone", *[os.path.join(tex, f) for f in ("albedo.png", "mgao.png", "normal.png")]))
    if me.data.uv_layers:
        me.data.uv_layers[0].name = "UVMap"
    att = me.data.attributes.new("hmd_vid", "INT", "POINT")
    att.data.foreach_set("value", list(range(1, len(me.data.vertices) + 1)))
    return {"body": (me, arm)}


def pivot(arm, side):
    """Bind-pose head of B_Canon<side> in build space (this armature's rest is the data frame)."""
    return R @ (arm.matrix_world @ arm.data.bones["B_Canon%s" % side].head_local)


def place_axis(g, ch, arm):
    out = []
    for side in g.get("sides", ["R", "L"]):
        cl = B.clone_objs([ch])[0]
        o = pivot(arm, side)
        u, w = Vector((-1, 0, 0)), Vector((0, 0, 1))
        v = w.cross(u)
        if v.y * o.y < 0:
            v = -v
            bd.flip_y(cl)                   # keep the chunk's +Y outward on both sides
        mn, mx = B.bounds([cl])
        anchor = g.get("anchor", "rear")
        ax = mn.x if anchor == "rear" else mx.x if anchor == "front" else (mn.x + mx.x) / 2
        a = g.get("at", [0, 0, 0])
        M = Matrix((u, v, w)).transposed()
        for vt in cl.data.vertices:
            loc = Vector((vt.co.x - ax, vt.co.y - (mn.y + mx.y) / 2, vt.co.z - (mn.z + mx.z) / 2)) + Vector(a)
            vt.co = o + M @ loc
        cl.data.update()
        if M.determinant() < 0:
            B.recalc_normals([cl])
        out.append((cl, {i: g["skin"].replace("{S}", side) for i in range(len(cl.data.vertices))}))
    return out


def build(v):
    ds.reset()
    parts = load_host()
    me, arm = parts["body"]
    for r in v.get("remove_bones", []):
        log("remove_bones %s: %d faces" % (r["bones"], bd.remove_faces(me, bones=set(r["bones"]), mode=r.get("mode", "all"))))
    for i, g in enumerate(v.get("grafts", [])):
        ch = bd.cut_chunk(g, i)
        copies = place_axis(g, ch, arm) if g.get("frame") == "axis" else bd.place_copies(g, ch, None)
        for cl, bones in copies:
            bd.join_into(me, cl, bones)
        bpy.data.objects.remove(ch, do_unlink=True)
    # drop the host material slot if nothing uses it any more
    used = {p.material_index for p in me.data.polygons}
    for idx in reversed(range(len(me.data.materials))):
        if idx not in used:
            me.data.materials.pop(index=idx)      # Blender remaps the faces' material indices itself
    me.data.validate()
    log("%s: %d verts %d faces, materials %s" % (me.name, len(me.data.vertices), len(me.data.polygons), [m.name for m in me.data.materials]))
    out_blend = os.path.join(PROJ, "03_blender", "variants", v["name"] + "_geo.blend")
    os.makedirs(os.path.dirname(out_blend), exist_ok=True)
    for o in list(bpy.data.objects):
        if o not in (me, arm):
            bpy.data.objects.remove(o, do_unlink=True)
    bpy.ops.wm.save_as_mainfile(filepath=out_blend)
    log("SAVED", out_blend)
    bd.dump_geo(parts, os.path.join(PROJ, "04_textures", v["name"], "_geo.npz"))


def main():
    argv = sys.argv[sys.argv.index("--") + 1:]
    spec = json.load(open(argv[0]))
    variants = bd.resolve(spec["variants"], spec.get("_shared", {}))
    only = [a for a in argv[1:] if not a.startswith("--")]
    for v in variants:
        if only and v["name"] not in only:
            continue
        log("=" * 60)
        log("BUILDING", v["name"])
        build(v)


if __name__ == "__main__":
    main()
