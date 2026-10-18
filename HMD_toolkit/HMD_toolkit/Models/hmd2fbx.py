"""
HMD -> binary FBX 7.4 converter (mesh + fully rigged armature).

Conventions (matched to Heaps' FBX->HMD converter so a round-trip inverts cleanly):
- UV:      Heaps stores v_hmd = 1 - v_fbx  =>  we write v_fbx = 1 - v_hmd
- Winding: Heaps triangulates FBX polygon (v0..vn) as (n, last, n+1), which
           reverses winding  =>  HMD triangle (a,b,c) becomes FBX polygon (a,c,b)
- Matrices: row-vector convention (v' = v @ M), translation in elements 12-14,
           matching both Heaps Position.toMatrix and FBX matrix storage.
- Units:   HMD units assumed meters; GlobalSettings UnitScaleFactor=100 so a
           1.0-unit HMD length imports as 1.0m in Blender.
- Skinning: joint 'transpos' (inverse global bind) -> cluster TransformLink is
           its inverse; vertex 'indexes' reference bind slots, mapped back to
           joints via SkinJoint.bind.

Usage: python hmd2fbx.py input.hmd [output.fbx]
"""

from __future__ import annotations

import math
import sys
from array import array

import numpy as np

import hmd_reader as H
from fbx_binary import Long, Node, fbx_name, write_fbx


# --- math helpers (row-vector convention) -----------------------------------

def quat_to_mat3(qx, qy, qz, qw) -> np.ndarray:
    """3x3 rotation, row-vector convention (matches h3d.Quat.toMatrix)."""
    xx, yy, zz = qx * qx, qy * qy, qz * qz
    xy, xz, yz = qx * qy, qx * qz, qy * qz
    wx, wy, wz = qw * qx, qw * qy, qw * qz
    return np.array([
        [1 - 2 * (yy + zz), 2 * (xy + wz),     2 * (xz - wy)],
        [2 * (xy - wz),     1 - 2 * (xx + zz), 2 * (yz + wx)],
        [2 * (xz + wy),     2 * (yz - wx),     1 - 2 * (xx + yy)],
    ])


def pos_to_mat4(p: H.Position) -> np.ndarray:
    """Position -> 4x4, row-vector convention (Heaps toMatrix, postScale=false):
    scale rows, then translation in last row."""
    m = np.identity(4)
    r = quat_to_mat3(p.qx, p.qy, p.qz, p.qw)
    m[0, :3] = r[0] * p.sx
    m[1, :3] = r[1] * p.sy
    m[2, :3] = r[2] * p.sz
    m[3, :3] = (p.x, p.y, p.z)
    return m


def mat4_to_euler_xyz_deg(m: np.ndarray) -> tuple:
    """Extract FBX 'Lcl Rotation' (XYZ order, degrees) from a row-vector 4x4.
    FBX XYZ order applies X first: v' = v @ Rx @ Ry @ Rz (row convention),
    i.e. column-major M_c = Rz @ Ry @ Rx."""
    # remove scale
    r = m[:3, :3].copy()
    for i in range(3):
        n = np.linalg.norm(r[i])
        if n > 0:
            r[i] /= n
    c = r.T  # column-major
    sy = -c[2, 0]
    sy = max(-1.0, min(1.0, sy))
    y = math.asin(sy)
    if abs(sy) < 0.999999:
        x = math.atan2(c[2, 1], c[2, 2])
        z = math.atan2(c[1, 0], c[0, 0])
    else:  # gimbal lock (y = +/-90deg): x and z are degenerate; set z=0.
        # M_c rows then satisfy c[1,1]=cos(x-+z), -c[1,2]=sin(x-+z) in BOTH
        # cases, so the same extraction applies (with z=0 it yields x).
        z = 0.0
        x = math.atan2(-c[1, 2], c[1, 1])
    return math.degrees(x), math.degrees(y), math.degrees(z)


def get_scale(p: H.Position) -> tuple:
    return (p.sx, p.sy, p.sz)


# --- FBX scene building ------------------------------------------------------

class IdGen:
    def __init__(self):
        self.n = 1000000000

    def __call__(self) -> Long:
        self.n += 1
        return Long(self.n)


def prop70(parent: Node) -> Node:
    return parent.add("Properties70")


def P(props: Node, name, ptype, label, flags, *values):
    props.add("P", name, ptype, label, flags, *values)


def add_lcl_transform(props: Node, m: np.ndarray, p: H.Position,
                      heaps_euler: bool = False):
    """heaps_euler: pre-compensate for the game pipeline's euler convention.
    Legacy Heaps parses (x,y,z) as Rx(x)@Ry(-y)@Rz(-z), i.e. FBX-standard XYZ
    with y,z negated (verified numerically against reimported HMDs). Writing
    (x,-y,-z) makes Heaps reconstruct the intended rotation. Used on bones
    only: Blender takes bone rest poses from cluster TransformLink and ignores
    these angles, so both readers see the correct skeleton."""
    t = m[3, :3]
    rx, ry, rz = mat4_to_euler_xyz_deg(m)
    if heaps_euler:
        ry, rz = -ry, -rz
    sx, sy, sz = get_scale(p)
    P(props, "Lcl Translation", "Lcl Translation", "", "A",
      float(t[0]), float(t[1]), float(t[2]))
    P(props, "Lcl Rotation", "Lcl Rotation", "", "A", rx, ry, rz)
    P(props, "Lcl Scaling", "Lcl Scaling", "", "A",
      float(sx), float(sy), float(sz))


def convert(hmd_path: str, fbx_path: str, verbose: bool = True,
            scene_hook=None, embed: bool = False) -> dict:
    """scene_hook(ctx): optional callback invoked after the scene is built and
    before Definitions/write; ctx exposes objects/connections/ids so callers
    (e.g. the animation exporter) can inject additional FBX nodes."""
    d = H.load(hmd_path)
    newid = IdGen()
    log = {"warnings": []}

    if len(d.models) != 1:
        raise NotImplementedError(f"expected 1 model, got {len(d.models)} "
                                  "(multi-model support not implemented yet)")
    model = d.models[0]
    if model.geometry < 0:
        raise ValueError("model has no geometry")
    geom = d.geometries[model.geometry]
    verts = H.decode_vertices(d, geom)
    index_groups = H.decode_indices(d, geom)
    skin = model.skin
    four_bones = bool(geom.props and "FourBonesByVertex" in geom.props) or \
                 bool(d.props and "FourBonesByVertex" in d.props)
    bones_per_vertex = 4 if four_bones else 3

    # ----- root nodes ---------------------------------------------------
    roots: list[Node] = []

    header = Node("FBXHeaderExtension")
    header.add("FBXHeaderVersion", 1003)
    header.add("FBXVersion", 7400)
    ts = header.add("CreationTimeStamp")
    ts.add("Version", 1000)
    for k, v in [("Year", 2026), ("Month", 1), ("Day", 1), ("Hour", 0),
                 ("Minute", 0), ("Second", 0), ("Millisecond", 0)]:
        ts.add(k, v)
    header.add("Creator", "HMDtoFBX converter (hmd2fbx.py)")
    roots.append(header)

    roots.append(Node("FileId", b"\x28\xb3\x2a\xeb\xb6\x24\xcc\xc2\xbf\xc8\xb0\x2a\xa9\x2b\xfc\xf1"))
    roots.append(Node("CreationTime", "1970-01-01 10:00:00:000"))
    roots.append(Node("Creator", "HMDtoFBX converter (hmd2fbx.py)"))

    gs = Node("GlobalSettings")
    gs.add("Version", 1000)
    gsp = prop70(gs)
    # Z-up declaration: honest (geometry is baked to Z-up) and chosen so that
    # BOTH Heaps axis-conversion code paths (legacy: skips when UpAxis!=1;
    # modern: no switch case matches UpAxis=2+FrontAxis=2) inject no PreRotation.
    P(gsp, "UpAxis", "int", "Integer", "", 2)
    P(gsp, "UpAxisSign", "int", "Integer", "", 1)
    P(gsp, "FrontAxis", "int", "Integer", "", 2)
    P(gsp, "FrontAxisSign", "int", "Integer", "", 1)
    P(gsp, "CoordAxis", "int", "Integer", "", 0)
    P(gsp, "CoordAxisSign", "int", "Integer", "", 1)
    P(gsp, "OriginalUpAxis", "int", "Integer", "", 2)
    P(gsp, "OriginalUpAxisSign", "int", "Integer", "", 1)
    P(gsp, "UnitScaleFactor", "double", "Number", "", 100.0)
    P(gsp, "OriginalUnitScaleFactor", "double", "Number", "", 100.0)
    P(gsp, "AmbientColor", "ColorRGB", "Color", "", 0.0, 0.0, 0.0)
    P(gsp, "DefaultCamera", "KString", "", "", "Producer Perspective")
    P(gsp, "TimeMode", "enum", "", "", 11)
    P(gsp, "TimeSpanStart", "KTime", "Time", "", Long(0))
    P(gsp, "TimeSpanStop", "KTime", "Time", "", Long(46186158000))
    P(gsp, "CustomFrameRate", "double", "Number", "", 24.0)
    roots.append(gs)

    docs = Node("Documents")
    docs.add("Count", 1)
    doc = docs.add("Document", newid(), "Scene", "Scene")
    dp = prop70(doc)
    P(dp, "SourceObject", "object", "", "")
    P(dp, "ActiveAnimStackName", "KString", "", "", "")
    doc.add("RootNode", Long(0))
    roots.append(docs)

    roots.append(Node("References"))

    objects = Node("Objects")
    connections = Node("Connections")

    def connect(child, parent):
        connections.add("C", "OO", child, parent)

    def connect_prop(child, parent, pname):
        connections.add("C", "OP", child, parent, pname)

    # ----- Z-up conversion ---------------------------------------------------
    # The original pipeline bakes a Y-up -> Z-up rotation R into root joints'
    # default pose while mesh + bind matrices stay Y-up. We bake R into the
    # mesh data and bind matrices instead, so the whole FBX is uniformly Z-up:
    # the HMD default pose (root rotation kept) then matches bind exactly, the
    # game pipeline adds no PreRotation (UpAxis=2), and original animations
    # (authored in default-pose space) drive the reimported skin correctly.
    R_conv = np.identity(4)
    if skin:
        for j in skin.joints:
            if j.parent < 0 and j.transpos is not None:
                R = pos_to_mat4(j.transpos) @ pos_to_mat4(j.position)
                R[3, :3] = 0  # rotation only (translation is float32 noise)
                if np.allclose(R[:3, :3] @ R[:3, :3].T, np.identity(3), atol=1e-4):
                    R_conv = R
                else:
                    log["warnings"].append("root axis rotation not orthonormal; no Z-up bake")
                break
    R3 = R_conv[:3, :3]
    log["z_up_bake"] = "none" if np.allclose(R_conv, np.identity(4), atol=1e-6) \
        else np.round(R_conv, 4).tolist()

    # ----- left-hand pre-compensation ---------------------------------------
    # The game's pipeline runs Heaps' leftHandConvert: geometry X is negated,
    # every node/bind matrix M becomes D@M@D (rightHandToLeft == conjugation by
    # D = diag(-1,1,1)), and triangle winding is reversed. We pre-apply D to
    # the whole scene so the pipeline's mirror restores the original data.
    D4 = np.diag([-1.0, 1.0, 1.0, 1.0])
    D3 = D4[:3, :3]
    RD3 = R3 @ D3  # mesh-data transform: Z-up bake then X mirror

    # ----- geometry -------------------------------------------------------
    gname = model.name or "mesh"
    geo_id = newid()
    g = objects.add("Geometry", geo_id, fbx_name(gname, "Geometry"), "Mesh")

    positions = array("d")
    for v in verts:
        positions.extend(np.array(v["position"]) @ RD3)
    g.add("Vertices", positions)

    # HMD triangle (a,b,c) -> FBX polygon (a,c,b), last index negated (~b).
    # The pipeline's left-hand path reverses winding (to compensate its own
    # mirror), so we pre-reverse: mirror+reverse on both sides cancels out.
    pvi = array("i")
    poly_order = []  # flat polygon-vertex order for per-polyvertex layers
    tri_materials = []
    for gi, idxs in enumerate(index_groups):
        mat_idx = gi  # local material slot (connection order defines mapping)
        for t in range(0, len(idxs), 3):
            a, b, c = idxs[t], idxs[t + 1], idxs[t + 2]
            pvi.extend((a, c, ~b))
            poly_order.extend((a, c, b))
            tri_materials.append(mat_idx)
    g.add("PolygonVertexIndex", pvi)
    g.add("GeometryVersion", 124)

    if geom.vertexFormat.has_input("normal"):
        ln = g.add("LayerElementNormal", 0)
        ln.add("Version", 101)
        ln.add("Name", "")
        ln.add("MappingInformationType", "ByPolygonVertex")
        ln.add("ReferenceInformationType", "Direct")
        normals = array("d")
        for vi in poly_order:
            normals.extend(np.array(verts[vi]["normal"]) @ RD3)
        ln.add("Normals", normals)

    if geom.vertexFormat.has_input("uv"):
        lu = g.add("LayerElementUV", 0)
        lu.add("Version", 101)
        lu.add("Name", "UVMap")
        lu.add("MappingInformationType", "ByPolygonVertex")
        lu.add("ReferenceInformationType", "IndexToDirect")
        uv = array("d")
        for v in verts:
            u, vv = v["uv"]
            uv.extend((u, 1.0 - vv))  # invert Heaps' V flip
        lu.add("UV", uv)
        lu.add("UVIndex", array("i", poly_order))

    lm = g.add("LayerElementMaterial", 0)
    lm.add("Version", 101)
    lm.add("Name", "")
    if len(index_groups) == 1:
        lm.add("MappingInformationType", "AllSame")
        lm.add("ReferenceInformationType", "IndexToDirect")
        lm.add("Materials", array("i", [0]))
    else:
        lm.add("MappingInformationType", "ByPolygon")
        lm.add("ReferenceInformationType", "IndexToDirect")
        lm.add("Materials", array("i", tri_materials))

    layer = g.add("Layer", 0)
    layer.add("Version", 100)
    for typ in ["LayerElementNormal", "LayerElementUV", "LayerElementMaterial"]:
        le = layer.add("LayerElement")
        le.add("Type", typ)
        le.add("TypedIndex", 0)

    # ----- armature root (Null node) ----------------------------------------
    # Both the bone hierarchy and the skinned mesh live under an explicit Null
    # "Armature" node (the structure Blender's own exporter produces). Without
    # it, Blender's importer grafts a root-level mesh into the armature as a
    # bone child, attaching it to an arbitrary bone.
    arm_root_id = Long(0)
    if skin:
        arm_root_id = newid()
        am = objects.add("Model", arm_root_id, fbx_name("Armature", "Model"), "Null")
        am.add("Version", 232)
        prop70(am)
        naid = newid()
        na = objects.add("NodeAttribute", naid, fbx_name("Armature", "NodeAttribute"), "Null")
        na.add("TypeFlags", "Null")
        connect(naid, arm_root_id)
        connect(arm_root_id, Long(0))

    # ----- mesh model -------------------------------------------------------
    model_id = newid()
    mm = objects.add("Model", model_id, fbx_name(gname, "Model"), "Mesh")
    mm.add("Version", 232)
    mp = prop70(mm)
    model_mat = pos_to_mat4(model.position)
    add_lcl_transform(mp, model_mat, model.position)
    P(mp, "DefaultAttributeIndex", "int", "Integer", "", 0)
    mm.add("Shading", True)
    mm.add("Culling", "CullingOff")
    connect(model_id, arm_root_id)
    connect(geo_id, model_id)

    # ----- materials + textures ---------------------------------------------
    import os as _os
    hmd_dir = _os.path.dirname(_os.path.abspath(hmd_path))
    embed_cache = {}   # image basename (lower) -> Video node id
    embedded, emb_missing = [], []
    for slot, mat_index in enumerate(model.materials or []):
        mat = d.materials[mat_index]
        mat_id = newid()
        mnode = objects.add("Material", mat_id, fbx_name(mat.name or f"mat{slot}", "Material"), "")
        mnode.add("Version", 102)
        mnode.add("ShadingModel", "lambert")
        mnode.add("MultiLayer", 0)
        mpp = prop70(mnode)
        P(mpp, "DiffuseColor", "Color", "", "A", 0.8, 0.8, 0.8)
        connect(mat_id, model_id)  # order = material slot order
        for tex_path, prop_name in [(mat.diffuseTexture, "DiffuseColor"),
                                    (mat.specularTexture, "SpecularColor"),
                                    (mat.normalMap, "NormalMap")]:
            if not tex_path:
                continue
            tex_id = newid()
            tname = tex_path.replace("\\", "/").rsplit("/", 1)[-1]
            t = objects.add("Texture", tex_id, fbx_name(tname, "Texture"), "TextureVideoClip")
            t.add("Type", "TextureVideoClip")
            t.add("Version", 202)
            t.add("TextureName", fbx_name(tname, "Texture"))
            t.add("FileName", tex_path)
            t.add("RelativeFilename", tex_path)
            connect_prop(tex_id, mat_id, prop_name)
            if embed:
                # bake the image into the FBX (Video node with Content) when
                # it can be found beside the HMD; missing images fall back to
                # a plain path reference
                key = tname.lower()
                vid = embed_cache.get(key)
                if vid is None:
                    src_img = _os.path.join(hmd_dir, tname)
                    if _os.path.isfile(src_img):
                        with open(src_img, "rb") as fh:
                            data = fh.read()
                        vid = newid()
                        v = objects.add("Video", vid,
                                        fbx_name(tname, "Video"), "Clip")
                        v.add("Type", "Clip")
                        v.add("Filename", tex_path)
                        v.add("RelativeFilename", tex_path)
                        v.add("Content", data)
                        embed_cache[key] = vid
                        embedded.append(tname)
                    else:
                        embed_cache[key] = 0
                        emb_missing.append(tname)
                if vid:
                    connect(vid, tex_id)
    if embed:
        log["embedded_textures"] = embedded or "none found"
        if emb_missing:
            log["warnings"].append(
                "embed requested but image(s) not found beside the HMD: "
                + ", ".join(sorted(set(emb_missing))))

    # ----- skeleton -----------------------------------------------------------
    bone_ids = []
    bind_to_joint = {}
    globals_ = []
    if skin:
        # Joint locals are exported UNCHANGED from the HMD (root keeps its
        # baked Y-up -> Z-up rotation). With the mesh/bind also baked to Z-up
        # via R_conv, default pose == bind pose in Z-up space.
        for ji, j in enumerate(skin.joints):
            local = pos_to_mat4(j.position)
            g_mat = local @ globals_[j.parent] if j.parent >= 0 else local
            globals_.append(g_mat)
            if j.bind >= 0:
                bind_to_joint[j.bind] = ji

            bid = newid()
            bone_ids.append(bid)
            bm = objects.add("Model", bid, fbx_name(j.name, "Model"), "LimbNode")
            bm.add("Version", 232)
            bp = prop70(bm)
            # D-conjugated local: the pipeline's rightHandToLeft undoes this,
            # reconstructing the intended local exactly (rotation AND translation).
            add_lcl_transform(bp, D4 @ local @ D4, j.position)
            aid = newid()
            attr = objects.add("NodeAttribute", aid, fbx_name(j.name, "NodeAttribute"), "LimbNode")
            attr.add("TypeFlags", "Skeleton")
            ap = prop70(attr)
            P(ap, "Size", "double", "Number", "", 1.0)
            connect(aid, bid)
            connect(bid, bone_ids[j.parent] if j.parent >= 0 else arm_root_id)

        # ----- skin deformer + clusters -----------------------------------
        skin_id = newid()
        sk = objects.add("Deformer", skin_id, fbx_name(skin.name, "Deformer"), "Skin")
        sk.add("Version", 101)
        sk.add("Link_DeformAcuracy", 50.0)
        connect(skin_id, geo_id)

        # gather weights per bind slot
        cluster_data = {}  # bind slot -> ([vertex indices], [weights])
        for vi, v in enumerate(verts):
            ws = list(v["weights"])
            bs = list(v["indexes"])[:bones_per_vertex]
            if bones_per_vertex == 3 and len(ws) == 3:
                pass  # 3 weights for 3 bones
            for w, b in zip(ws, bs):
                if w <= 0:
                    continue
                cluster_data.setdefault(b, ([], []))
                cluster_data[b][0].append(vi)
                cluster_data[b][1].append(w)

        unmapped = sorted(set(cluster_data) - set(bind_to_joint))
        if unmapped:
            raise ValueError(f"vertex bind slots with no joint: {unmapped}")

        for slot, (vidx, wts) in sorted(cluster_data.items()):
            ji = bind_to_joint[slot]
            j = skin.joints[ji]
            cid = newid()
            cl = objects.add("Deformer", cid, fbx_name(j.name, "SubDeformer"), "Cluster")
            cl.add("Version", 100)
            cl.add("UserData", "", "")
            cl.add("Indexes", array("i", vidx))
            cl.add("Weights", array("d", wts))
            # TransformLink = joint global bind in Z-up = inv(transpos) @ R_conv.
            # Transform must satisfy TransformLink @ Transform = mesh_global
            # (FBX SDK convention; Blender derives the mesh's placement from
            # TransformLink @ Transform of the last cluster), i.e. in our
            # row-vector storage: Transform = mesh_global @ inv(TransformLink).
            # Note Transform then equals the HMD transpos re-expressed for the
            # Z-up mesh, which is exactly what HMDOut copies into the HMD.
            if j.transpos is not None:
                link = np.linalg.inv(pos_to_mat4(j.transpos)) @ R_conv
            else:
                link = globals_[ji]
            link_f = D4 @ link @ D4
            tr_f = D4 @ (model_mat @ np.linalg.inv(link)) @ D4
            cl.add("Transform", array("d", tr_f.flatten()))
            cl.add("TransformLink", array("d", link_f.flatten()))
            connect(cid, skin_id)
            connect(bone_ids[ji], cid)

        # ----- bind pose ----------------------------------------------------
        pose_id = newid()
        pose = objects.add("Pose", pose_id, fbx_name(skin.name, "Pose"), "BindPose")
        pose.add("Type", "BindPose")
        pose.add("Version", 100)
        pose.add("NbPoseNodes", 1 + len(skin.joints))
        pn = pose.add("PoseNode")
        pn.add("Node", model_id)
        pn.add("Matrix", array("d", (D4 @ model_mat @ D4).flatten()))
        for ji, j in enumerate(skin.joints):
            if j.transpos is not None:
                g_bind = np.linalg.inv(pos_to_mat4(j.transpos)) @ R_conv
            else:
                g_bind = globals_[ji]
            pn = pose.add("PoseNode")
            pn.add("Node", bone_ids[ji])
            pn.add("Matrix", array("d", (D4 @ g_bind @ D4).flatten()))

        # consistency check: hierarchy globals vs Z-up inverse bind
        max_err = 0.0
        for ji, j in enumerate(skin.joints):
            if j.transpos is None:
                continue
            err = float(np.abs(np.linalg.inv(pos_to_mat4(j.transpos)) @ R_conv - globals_[ji]).max())
            max_err = max(max_err, err)
        log["bind_vs_hierarchy_max_err"] = max_err
        if max_err > 5e-3:  # float32 storage noise is ~1e-3 at this scale
            log["warnings"].append(
                f"bind pose differs from default pose by up to {max_err:.6f} "
                "(TransformLink uses transpos, bone rest pose uses hierarchy)")

    if scene_hook is not None:
        scene_hook({
            "objects": objects, "connections": connections,
            "connect": connect, "connect_prop": connect_prop, "newid": newid,
            "D4": D4, "R_conv": R_conv, "model_id": model_id,
            "arm_root_id": arm_root_id, "bone_ids": bone_ids, "skin": skin,
            "bone_id_by_name": {} if not skin else
                {j.name: bone_ids[ji] for ji, j in enumerate(skin.joints)},
            "log": log,
        })

    # ----- definitions (counts must match objects) ----------------------------
    counts = {}
    for o in objects.children:
        counts[o.name] = counts.get(o.name, 0) + 1
    defs = Node("Definitions")
    defs.add("Version", 100)
    defs.add("Count", sum(counts.values()) + 1)
    ot = defs.add("ObjectType", "GlobalSettings")
    ot.add("Count", 1)
    for name, cnt in counts.items():
        ot = defs.add("ObjectType", name)
        ot.add("Count", cnt)
    roots.append(defs)

    roots.append(objects)
    roots.append(connections)

    takes = Node("Takes")
    takes.add("Current", "")
    roots.append(takes)

    write_fbx(fbx_path, roots)

    log.update(vertices=geom.vertexCount, triangles=geom.indexCount // 3,
               joints=len(skin.joints) if skin else 0,
               clusters=len(bind_to_joint) if skin else 0,
               materials=len(model.materials or []))
    if verbose:
        print(f"{hmd_path} -> {fbx_path}")
        for k, v in log.items():
            print(f"  {k}: {v}")
    return log


def is_hmd(path: str) -> bool:
    """HMD content check by magic bytes -- game exports use a .fbx extension."""
    try:
        with open(path, "rb") as f:
            return f.read(3) == b"HMD"
    except OSError:
        return False


def collect_inputs(args: list, copy_hmd: bool = False) -> list:
    import hashlib
    import os
    import shutil
    out = []
    for a in args:
        if os.path.isdir(a):
            for base, _dirs, files in os.walk(a):
                for fn in sorted(files):
                    p = os.path.join(base, fn)
                    if is_hmd(p):
                        out.append(p)
        else:
            out.append(a)
    if copy_hmd:
        # game exports are HMD content named .fbx: RENAME them to .hmd (their
        # correct extension). The conversion output (a real FBX) then takes
        # the now-free X.fbx name in the same folder.
        for i, p in enumerate(out):
            stem, _, ext = p.rpartition(".")
            if stem and ext.lower() == "fbx" and is_hmd(p):
                dst = stem + ".hmd"
                os.replace(p, dst)
                print(f"renamed {p} -> {dst}")
                out[i] = dst
    # dedupe identical content (e.g. X.fbx game export + its X.hmd copy),
    # preferring the .hmd-named file
    seen = {}
    for p in sorted(set(out), key=lambda x: (0 if x.lower().endswith(".hmd") else 1, x)):
        try:
            h = hashlib.md5(open(p, "rb").read()).hexdigest()
        except OSError:
            continue
        if h not in seen:
            seen[h] = p
    return sorted(seen.values())


def output_name(src: str) -> str:
    import os
    stem, _, ext = src.rpartition(".")
    if not stem:
        stem = src
    # a .fbx-named source (mislabeled game export, not renamed) must not be
    # overwritten by its own conversion; same if a true-HMD sibling holds
    # the .fbx name. Otherwise output is simply <name>.fbx alongside.
    if ext.lower() == "fbx":
        return stem + "_converted.fbx"
    dst = stem + ".fbx"
    if os.path.exists(dst) and is_hmd(dst):
        return stem + "_converted.fbx"
    return dst


if __name__ == "__main__":
    args = sys.argv[1:]
    if not args:
        print("usage: python hmd2fbx.py input.hmd [output.fbx]\n"
              "   or: python hmd2fbx.py file1 file2 ... folder ...  (or drag & drop)\n"
              "Folders are searched recursively; HMD files are detected by content,\n"
              "so game exports named .fbx work too (output: name_converted.fbx).")
        sys.exit(1)
    copy_hmd = False
    if "--copy-hmd" in args:
        copy_hmd = True
        args.remove("--copy-hmd")
    embed = False
    if "--embed" in args:
        embed = True
        args.remove("--embed")
    outdir = None
    if "--outdir" in args:
        import os
        i = args.index("--outdir")
        outdir = args[i + 1]
        del args[i:i + 2]
        os.makedirs(outdir, exist_ok=True)
    if len(args) == 2 and args[1].lower().endswith(".fbx") and not is_hmd(args[1]):
        convert(args[0], args[1], embed=embed)
        sys.exit(0)
    inputs = collect_inputs(args, copy_hmd)
    ok, failed = 0, []
    for src in inputs:
        if not is_hmd(src):
            failed.append((src, "not an HMD file (bad magic)"))
            continue
        try:
            if outdir is not None:
                import os
                stem = os.path.splitext(os.path.basename(src))[0]
                dst = os.path.join(outdir, stem + ".fbx")
            else:
                dst = output_name(src)
            convert(src, dst, embed=embed)
            ok += 1
        except Exception as e:
            failed.append((src, str(e)))
            print(f"ERROR converting {src}: {e}")
    print(f"\n=== batch done: {ok} converted, {len(failed)} failed/skipped ===")
    for src, why in failed:
        print(f"  FAILED {src}: {why}")
    if failed:
        sys.exit(1)
