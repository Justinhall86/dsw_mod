"""Where does a ship FX file put its emitters on the hull? Shared maths for 61_fx_fit.py / 62_fx_make.py / 63_fx_preview.py.

An .fx is a Heaps prefab tree: every node has x,y,z, scaleX..Z, rotationX..Z (degrees). The cdb attaches the FX to a bone
(B_Body). anchors(fx) returns each named emitter's position in the FX root frame; to_model() takes it to the HMD's model space
(the space the mesh vertices are stored in) through the bone's bind matrix. The conventions (CONV) were chosen by 61_fx_fit.py:
the combination that puts the vanilla Hammer's and Hawk's reactors closest to their own hulls.
"""
import json
import math
import os
import sys

import numpy as np

REPO = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
import hmd_reader as H  # noqa: E402

CONV = {"order": "xyz", "sign": 1, "flip": "after"}


def rot(axis, deg):
    c, s = math.cos(math.radians(deg)), math.sin(math.radians(deg))
    if axis == "x":
        return np.array([[1, 0, 0], [0, c, -s], [0, s, c]])
    if axis == "y":
        return np.array([[c, 0, s], [0, 1, 0], [-s, 0, c]])
    return np.array([[c, -s, 0], [s, c, 0], [0, 0, 1]])


def local(node, conv):
    """4x4 column-vector matrix of one prefab node."""
    r = np.eye(3)
    for ax in conv["order"]:                              # applied first -> last
        r = rot(ax, conv["sign"] * node.get("rotation" + ax.upper(), 0)) @ r
    m = np.eye(4)
    m[:3, :3] = r @ np.diag([node.get("scaleX", 1), node.get("scaleY", 1), node.get("scaleZ", 1)])
    m[:3, 3] = [node.get("x", 0), node.get("y", 0), node.get("z", 0)]
    return m


def anchors(fx, conv=None, want=("Reactor", "Light", "trails", "Muzzle", "muzzle")):
    conv = conv or CONV
    out = []

    def walk(n, m, path):
        m = m @ local(n, conv)
        name = n.get("name", "")
        if n.get("type") in ("object", "trails", "emitter", "model", "polygon") and name.startswith(want) and path.count("/") <= 3:
            out.append((path + "/" + name, m[:3, 3].copy(), float(np.cbrt(abs(np.linalg.det(m[:3, :3]))))))
        for c in n.get("children", []) or []:
            walk(c, m, path + "/" + name)
    for c in fx.get("children", []) or []:
        walk(c, np.eye(4), "")
    return out


def quat(p):
    x, y, z = p.qx, p.qy, p.qz
    w = math.sqrt(max(0.0, 1 - x * x - y * y - z * z))
    return np.array([[1 - 2 * (y * y + z * z), 2 * (x * y - z * w), 2 * (x * z + y * w)],
                     [2 * (x * y + z * w), 1 - 2 * (x * x + z * z), 2 * (y * z - x * w)],
                     [2 * (x * z - y * w), 2 * (y * z + x * w), 1 - 2 * (x * x + y * y)]])


def bone_matrix(hmd, bone="B_Body", conv=None):
    """Matrix FX frame (attached to `bone`) -> the HMD's stored vertex space.

    A vertex is skinned as boneWorld * inverseBind * v, so in the bone's own frame it sits at inverseBind * v. The HMD stores
    that inverse bind per joint (`transpos`; for every ship here a pure translation, also on the frigate rig whose B_Body
    has a rest rotation). So stored = inverse(transpos) * q, plus one mirror: the FX frame's z runs the other way
    (checked by rendering the vanilla Hawk with its own reactors, 63_fx_preview.py: they land on its nozzles)."""
    d = H.load(hmd) if isinstance(hmd, str) else hmd
    skin = next(m.skin for m in d.models if m.skin)
    j = next(j for j in skin.joints if j.name == bone)
    t = np.eye(4)
    t[:3, :3] = quat(j.transpos)
    t[:3, 3] = [j.transpos.x, j.transpos.y, j.transpos.z]
    return np.diag([1.0, 1.0, -1.0, 1.0]) @ np.linalg.inv(t)


def from_model(p, bm):
    """Stored-space point -> FX frame (the inverse of to_model)."""
    return (np.linalg.inv(bm) @ np.append(p, 1.0))[:3]


def verts(hmd):
    d = H.load(hmd)
    out = []
    for g in d.geometries:
        out += [v["position"] for v in H.decode_vertices(d, g)]
    return np.array(out, dtype=float)


def to_model(q, bm):
    return (bm @ np.append(q, 1.0))[:3]


def load_fx(p):
    return json.load(open(p, encoding="utf-8"))
