"""HMD (Heaps model, format v3) writer: the exact inverse of the toolkit's hmd_reader.Reader.

    python hmd_writer.py --selftest <file.hmd> [...]     read -> write -> must be byte-identical

Used by 60_write_hmd.py to put new geometry and materials into the vanilla drone HMDs while every joint, bind pose and
model transform is copied from the vanilla file unchanged. Covers what the drone needs (geometries, materials, models
with skins and splits, no animations, shapes or colliders); anything else raises.
"""
import io
import os
import struct
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
import hmd_reader as H  # noqa: E402

PROP_IDS = {v: k for k, v in H.PROPERTY_NAMES.items()}
LEGACY_CULLING = 1        # the byte after the blend mode (Heaps' old culling field); the vanilla drone writes 1
LEGACY_KILLALPHA = 1.0


class W:
    def __init__(self, version):
        self.b = io.BytesIO()
        self.version = version

    def byte(self, v):
        self.b.write(struct.pack("<B", v))

    def u16(self, v):
        self.b.write(struct.pack("<H", v))

    def i32(self, v):
        self.b.write(struct.pack("<i", v))

    def f32(self, v):
        self.b.write(struct.pack("<f", v))

    def name(self, s):
        if s is None:
            self.byte(0xFF)
            return
        e = s.encode("utf-8")
        if len(e) >= 0xFF:
            raise ValueError("name too long: %r" % s)
        self.byte(len(e))
        self.b.write(e)

    def props(self, props):
        if self.version == 1:
            return
        if not props:
            self.byte(0)
            return
        self.byte(len(props))
        for p in props:
            if isinstance(p, tuple) and p[0] == "CameraFOVY":
                self.byte(0)
                self.f32(p[1])
            else:
                self.byte(PROP_IDS[p])

    def position(self, p, has_scale=True):
        self.b.write(struct.pack("<6f", p.x, p.y, p.z, p.qx, p.qy, p.qz))
        if has_scale:
            self.b.write(struct.pack("<3f", p.sx, p.sy, p.sz))

    def vformat(self, f):
        self.byte(f.stride)
        self.byte(len(f.inputs))
        for i in f.inputs:
            self.name(i.name)
            self.byte(i.type | (i.precision << 4))


class R(H.Reader):
    """The toolkit reader, plus what it parses but drops: each joint's has-scale flag (set even when the scale is 1)."""

    def skin(self):
        nm = self.name()
        if nm is None:
            return None
        props = self.props()
        joints = []
        for _ in range(self.u16()):
            jprops = self.props()
            jname = self.name()
            pid = self.u16()
            hs = bool(pid & 0x8000)
            parent = (pid & 0x7FFF) - 1
            pos = self.position(hs)
            bind = self.u16() - 1
            transpos = self.position(hs) if bind >= 0 else None
            j = H.SkinJoint(jprops, jname, parent, pos, bind, transpos)
            j._has_scale = hs
            joints.append(j)
        split = None
        count = self.byte()
        if count > 0:
            split = []
            for _ in range(count):
                mat = self.byte()
                js = [self.u16() for _ in range(self.byte())]
                split.append(H.SkinSplit(mat, js))
        return H.Skin(nm, props, joints, split)


def load(path):
    with open(path, "rb") as f:
        return R(f).read()


def _has_scale(j):
    if hasattr(j, "_has_scale"):
        return j._has_scale
    ps = [j.position] + ([j.transpos] if j.transpos is not None else [])
    return any((p.sx, p.sy, p.sz) != (1.0, 1.0, 1.0) for p in ps)


def to_bytes(d):
    w = W(d.version)
    w.props(d.props)
    w.i32(len(d.geometries))
    for g in d.geometries:
        w.props(g.props)
        w.i32(g.vertexCount)
        w.vformat(g.vertexFormat)
        w.i32(g.vertexPosition)
        if len(g.indexCounts) >= 0xFF:
            w.byte(0xFF)
            w.i32(len(g.indexCounts))
        else:
            w.byte(len(g.indexCounts))
        for c in g.indexCounts:
            w.i32(c)
        w.i32(g.indexPosition)
        w.b.write(struct.pack("<6f", *g.bounds))
    w.i32(len(d.materials))
    for m in d.materials:
        w.props(m.props)
        w.name(m.name)
        w.name(m.diffuseTexture)
        w.byte(H.BLEND_MODES.index(m.blendMode))
        w.byte(getattr(m, "_culling", LEGACY_CULLING))
        w.f32(getattr(m, "_killalpha", LEGACY_KILLALPHA))
        if m.props and "HasExtraTextures" in m.props:
            w.name(m.specularTexture)
            w.name(m.normalMap)
    w.i32(len(d.models))
    for m in d.models:
        w.props(m.props)
        w.name(m.name)
        w.i32(m.parent + 1)
        w.name(m.follow)
        w.position(m.position)
        w.i32(m.geometry + 1)
        if m.geometry < 0:
            continue
        if len(m.materials) >= 0xFF:
            w.byte(0xFF)
            w.i32(len(m.materials))
        else:
            w.byte(len(m.materials))
        for i in m.materials:
            w.i32(i)
        s = m.skin
        if s is None:
            w.name(None)
        else:
            w.name(s.name)
            w.props(s.props)
            w.u16(len(s.joints))
            for j in s.joints:
                hs = _has_scale(j)
                w.props(j.props)
                w.name(j.name)
                w.u16((j.parent + 1) | (0x8000 if hs else 0))
                w.position(j.position, hs)
                w.u16(j.bind + 1)
                if j.bind >= 0:
                    w.position(j.transpos, hs)
            if s.split:
                w.byte(len(s.split))
                for sp in s.split:
                    w.byte(sp.materialIndex)
                    w.byte(len(sp.joints))
                    for k in sp.joints:
                        w.u16(k)
            else:
                w.byte(0)
        if m.props and any(p in m.props for p in ("HasLod", "HasCollider", "HasColliders")):
            raise NotImplementedError("LODs/colliders are not written")
    w.i32(len(d.animations))
    if d.animations:
        raise NotImplementedError("animations are not written")
    if d.version >= 4:
        w.i32(0)
    body = w.b.getvalue()
    head_len = 3 + 1 + 4 + len(body)
    out = io.BytesIO()
    out.write(b"HMD")
    out.write(struct.pack("<B", d.version))
    out.write(struct.pack("<i", head_len + 4))
    out.write(body)
    out.write(struct.pack("<i", len(d.data)))
    out.write(d.data)
    return out.getvalue()


def write(d, path):
    raw = to_bytes(d)
    with open(path, "wb") as f:
        f.write(raw)
    return len(raw)


def selftest(path):
    raw = open(path, "rb").read()
    d = load(path)
    out = to_bytes(d)
    same = out == raw
    print("%s %s (%d bytes)" % ("IDENTICAL" if same else "DIFFERENT", path, len(raw)))
    if not same:
        n = next((i for i in range(min(len(out), len(raw))) if out[i] != raw[i]), min(len(out), len(raw)))
        print("   first difference at byte", n, "lengths", len(out), len(raw))
    return same


if __name__ == "__main__":
    if sys.argv[1] == "--selftest":
        ok = all([selftest(p) for p in sys.argv[2:]])
        sys.exit(0 if ok else 1)
