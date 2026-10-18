"""
HMD (Heaps 3D model) reader.

Direct port of hxd/fmt/hmd/Reader.hx (HeapsIO/heaps, supports up to format
version 6; our target files are version 3). All integers/floats little-endian.

Layout reference:
- Header: "HMD" magic, version byte, dataPosition int32.
- Structured header (props, geometries, materials, models, animations,
  [shapes v4+], [colliders]) ends at dataPosition-4.
- At dataPosition-4: int32 = length of raw data section, which starts at
  dataPosition and runs to end of file.
- All DataPosition offsets (vertexPosition, indexPosition, animation
  dataPosition) are relative to the start of the raw data section.
"""

from __future__ import annotations

import struct
import sys
from dataclasses import dataclass, field
from typing import BinaryIO, Optional

MAX_SUPPORTED_VERSION = 6

# hxd.BufferFormat.InputFormat
INPUT_FORMATS = {1: "DFloat", 2: "DVec2", 3: "DVec3", 4: "DVec4",
                 9: "DBytes4", 12: "DMat3x4", 16: "DMat4"}
# component count ("stride" in 4-byte units for F32; DBytes4 = 4 bytes = 1 unit)
INPUT_SIZES = {1: 1, 2: 2, 3: 3, 4: 4, 9: 1, 12: 12, 16: 16}
# hxd.BufferFormat.Precision
PRECISIONS = {0: "F32", 1: "F16", 2: "U8", 3: "S8"}
PRECISION_BYTES = {0: 4, 1: 2, 2: 1, 3: 1}

PROPERTY_NAMES = {0: "CameraFOVY", 2: "HasExtraTextures", 3: "FourBonesByVertex",
                  4: "HasLod", 5: "HasCollider", 6: "HasColliders",
                  7: "HasCustomCollider"}

# h2d.BlendMode enum order (Reader uses Type.allEnums(h2d.BlendMode))
BLEND_MODES = ["None", "Alpha", "Add", "AlphaAdd", "SoftAdd", "Multiply",
               "AlphaMultiply", "Erase", "Screen", "Sub", "Max", "Min"]

ANIMATION_FLAGS = ["HasPosition", "HasRotation", "HasScale", "HasUV",
                   "HasAlpha", "SingleFrame", "HasProps", "Reserved"]


@dataclass
class FormatInput:
    name: str
    type: int        # InputFormat int
    precision: int   # Precision int

    @property
    def type_name(self) -> str:
        return INPUT_FORMATS[self.type]

    @property
    def component_count(self) -> int:
        # number of scalar components (DBytes4 has 4 byte components)
        return 4 if self.type == 9 else INPUT_SIZES[self.type]

    @property
    def stride(self) -> int:
        # in 4-byte units, as BufferFormat.stride counts it
        return INPUT_SIZES[self.type]

    def __repr__(self):
        p = "" if self.precision == 0 else f".{PRECISIONS[self.precision]}"
        return f"{self.name}:{self.type_name}{p}"


@dataclass
class VertexFormat:
    inputs: list[FormatInput]

    @property
    def stride(self) -> int:
        return sum(i.stride for i in self.inputs)

    def input_offset(self, name: str) -> int:
        """Float-unit offset of a named input (F32 assumed)."""
        off = 0
        for i in self.inputs:
            if i.name == name:
                return off
            off += i.stride
        raise KeyError(name)

    def has_input(self, name: str) -> bool:
        return any(i.name == name for i in self.inputs)


@dataclass
class Position:
    x: float; y: float; z: float
    qx: float; qy: float; qz: float
    sx: float = 1.0; sy: float = 1.0; sz: float = 1.0

    @property
    def qw(self) -> float:
        qw = 1.0 - (self.qx**2 + self.qy**2 + self.qz**2)
        return -((-qw) ** 0.5) if qw < 0 else qw ** 0.5


@dataclass
class Geometry:
    props: Optional[list]
    vertexCount: int
    vertexFormat: VertexFormat
    vertexPosition: int
    indexCounts: list[int]
    indexPosition: int
    bounds: tuple  # (xMin,yMin,zMin,xMax,yMax,zMax)

    @property
    def indexCount(self) -> int:
        return sum(self.indexCounts)


@dataclass
class Material:
    props: Optional[list]
    name: Optional[str]
    diffuseTexture: Optional[str]
    blendMode: str
    specularTexture: Optional[str] = None
    normalMap: Optional[str] = None


@dataclass
class SkinJoint:
    props: Optional[list]
    name: str
    parent: int          # index into joints, -1 = root
    position: Position   # local (relative to parent) default pose
    bind: int            # bind matrix index, -1 = not a skinning joint
    transpos: Optional[Position]  # inverse bind pose (if bind >= 0)


@dataclass
class SkinSplit:
    materialIndex: int
    joints: list[int]


@dataclass
class Skin:
    name: str
    props: Optional[list]
    joints: list[SkinJoint]
    split: Optional[list[SkinSplit]]


@dataclass
class Model:
    props: Optional[list]
    name: Optional[str]
    parent: int   # index into models, -1 = root
    follow: Optional[str]
    position: Position
    geometry: int  # index into geometries, -1 = none
    materials: Optional[list[int]] = None
    skin: Optional[Skin] = None
    lods: Optional[list[int]] = None
    collider: Optional[int] = None
    colliders: Optional[list[int]] = None


@dataclass
class AnimationObject:
    name: str
    flags: int
    props: Optional[list[str]] = None

    def has(self, flag: str) -> bool:
        return bool(self.flags & (1 << ANIMATION_FLAGS.index(flag)))

    @property
    def flag_names(self) -> list[str]:
        return [f for i, f in enumerate(ANIMATION_FLAGS) if self.flags & (1 << i)]

    def get_stride(self) -> int:
        s = 0
        if self.has("HasPosition"): s += 3
        if self.has("HasRotation"): s += 3
        if self.has("HasScale"): s += 3
        if self.has("HasUV"): s += 2
        if self.has("HasAlpha"): s += 1
        if self.has("HasProps"): s += len(self.props or [])
        return s


@dataclass
class AnimationEvent:
    frame: int
    data: str


@dataclass
class Animation:
    props: Optional[list]
    name: Optional[str]
    frames: int
    sampling: float
    speed: float
    loop: bool
    dataPosition: int
    objects: list[AnimationObject]
    events: Optional[list[AnimationEvent]] = None


@dataclass
class Data:
    version: int = 0
    props: Optional[list] = None
    geometries: list[Geometry] = field(default_factory=list)
    materials: list[Material] = field(default_factory=list)
    models: list[Model] = field(default_factory=list)
    animations: list[Animation] = field(default_factory=list)
    shapes: list = field(default_factory=list)
    colliders: list = field(default_factory=list)
    dataPosition: int = 0
    data: bytes = b""


class Reader:
    def __init__(self, f: BinaryIO):
        self.f = f
        self.version = 0

    # --- primitives -------------------------------------------------------
    def byte(self) -> int:
        b = self.f.read(1)
        if len(b) != 1:
            raise EOFError("unexpected EOF")
        return b[0]

    def u16(self) -> int:
        return struct.unpack("<H", self.f.read(2))[0]

    def i32(self) -> int:
        return struct.unpack("<i", self.f.read(4))[0]

    def f32(self) -> float:
        return struct.unpack("<f", self.f.read(4))[0]

    def name(self) -> Optional[str]:
        n = self.byte()
        if n == 0xFF:
            return None
        return self.f.read(n).decode("utf-8")

    # --- structures -------------------------------------------------------
    def props(self) -> Optional[list]:
        if self.version == 1:
            return None
        n = self.byte()
        if n == 0:
            return None
        out = []
        for _ in range(n):
            pid = self.byte()
            if pid == 0:
                out.append(("CameraFOVY", self.f32()))
            elif pid == 1:
                raise ValueError("Obsolete HasMaterialFlags")
            elif pid in PROPERTY_NAMES:
                out.append(PROPERTY_NAMES[pid])
            else:
                raise ValueError(f"Unknown property #{pid}")
        return out

    def position(self, has_scale: bool = True) -> Position:
        v = struct.unpack("<6f", self.f.read(24))
        if has_scale:
            s = struct.unpack("<3f", self.f.read(12))
            return Position(*v, *s)
        return Position(*v)

    def bounds(self) -> tuple:
        return struct.unpack("<6f", self.f.read(24))

    def vformat(self) -> VertexFormat:
        stride = self.byte()
        n = self.byte()
        inputs = []
        for _ in range(n):
            nm = self.name()
            t = self.byte()
            inputs.append(FormatInput(nm, t & 15, t >> 4))
        fmt = VertexFormat(inputs)
        if stride != fmt.stride:
            raise ValueError(f"format stride mismatch: file says {stride}, computed {fmt.stride}")
        return fmt

    def skin(self) -> Optional[Skin]:
        nm = self.name()
        if nm is None:
            return None
        props = self.props()
        joints = []
        for _ in range(self.u16()):
            jprops = self.props()
            jname = self.name()
            pid = self.u16()
            has_scale = bool(pid & 0x8000)
            if has_scale:
                pid &= 0x7FFF
            parent = pid - 1
            pos = self.position(has_scale)
            bind = self.u16() - 1
            transpos = self.position(has_scale) if bind >= 0 else None
            joints.append(SkinJoint(jprops, jname, parent, pos, bind, transpos))
        split = None
        count = self.byte()
        if count > 0:
            split = []
            for _ in range(count):
                mat = self.byte()
                js = [self.u16() for _ in range(self.byte())]
                split.append(SkinSplit(mat, js))
        return Skin(nm, props, joints, split)

    # --- main -------------------------------------------------------------
    def read_header(self) -> Data:
        d = Data()
        magic = self.f.read(3)
        if magic != b"HMD":
            if magic[:1] == b";":
                raise ValueError("FBX was not converted to HMD")
            raise ValueError(f"Invalid HMD header {magic!r}")
        self.version = d.version = self.byte()
        if d.version > MAX_SUPPORTED_VERSION:
            raise ValueError(f"Can't read HMD v{d.version}")
        d.dataPosition = self.i32()
        d.props = self.props()

        for _ in range(self.i32()):
            gprops = self.props()
            vcount = self.i32()
            vfmt = self.vformat()
            vpos = self.i32()
            sub = self.byte()
            if sub == 0xFF:
                sub = self.i32()
            icounts = [self.i32() for _ in range(sub)]
            ipos = self.i32()
            b = self.bounds()
            d.geometries.append(Geometry(gprops, vcount, vfmt, vpos, icounts, ipos, b))

        for _ in range(self.i32()):
            mprops = self.props()
            mname = self.name()
            diff = self.name()
            blend = BLEND_MODES[self.byte()]
            self.byte()   # old culling
            self.f32()    # old killalpha
            m = Material(mprops, mname, diff, blend)
            if mprops and "HasExtraTextures" in mprops:
                m.specularTexture = self.name()
                m.normalMap = self.name()
            d.materials.append(m)

        has_collider = False
        for _ in range(self.i32()):
            mprops = self.props()
            mname = self.name()
            parent = self.i32() - 1
            follow = self.name()
            pos = self.position()
            geom = self.i32() - 1
            m = Model(mprops, mname, parent, follow, pos, geom)
            d.models.append(m)
            if geom < 0:
                continue
            matCount = self.byte()
            if matCount == 0xFF:
                matCount = self.i32()
            m.materials = [self.i32() for _ in range(matCount)]
            m.skin = self.skin()
            if mprops:
                if "HasLod" in mprops:
                    m.lods = [self.i32() for _ in range(self.i32())]
                if "HasCollider" in mprops:
                    m.collider = self.i32()
                    has_collider = True
                if "HasColliders" in mprops:
                    m.colliders = [self.i32() for _ in range(self.i32())]
                    has_collider = True

        for _ in range(self.i32()):
            aprops = self.props()
            aname = self.name()
            frames = self.i32()
            sampling = self.f32()
            speed = self.f32()
            flags = self.byte()
            dpos = self.i32()
            objects = []
            for _ in range(self.i32()):
                oname = self.name()
                oflags = self.byte()
                o = AnimationObject(oname, oflags)
                objects.append(o)
                if o.has("HasProps"):
                    o.props = [self.name() for _ in range(self.byte())]
            a = Animation(aprops, aname, frames, sampling, speed,
                          bool(flags & 1), dpos, objects)
            if flags & 2:
                a.events = [AnimationEvent(self.i32(), self.name())
                            for _ in range(self.i32())]
            d.animations.append(a)

        if d.version >= 4:
            for _ in range(self.i32()):
                raise NotImplementedError("BlendShape reading not implemented (v4+ file)")

        if has_collider:
            raise NotImplementedError("Collider reading not implemented")

        return d

    def read(self) -> Data:
        d = self.read_header()
        header_end = self.f.tell()
        if header_end != d.dataPosition - 4:
            raise ValueError(
                f"header ended at {header_end}, expected {d.dataPosition - 4} "
                f"(dataPosition={d.dataPosition})")
        dlen = self.i32()
        d.data = self.f.read(dlen)
        if len(d.data) != dlen:
            raise ValueError(f"data section truncated: expected {dlen}, got {len(d.data)}")
        return d


# --- buffer decoding --------------------------------------------------------

def decode_vertices(d: Data, g: Geometry) -> list[dict]:
    """Decode a geometry's vertex buffer into a list of dicts
    {input_name: tuple_of_components}. F32 and DBytes4 supported."""
    out = []
    pos = g.vertexPosition
    buf = d.data
    for _ in range(g.vertexCount):
        v = {}
        for inp in g.vertexFormat.inputs:
            if inp.precision != 0:
                raise NotImplementedError(f"precision {PRECISIONS[inp.precision]} not supported")
            if inp.type == 9:  # DBytes4
                v[inp.name] = tuple(buf[pos:pos + 4])
                pos += 4
            else:
                n = inp.component_count
                v[inp.name] = struct.unpack_from(f"<{n}f", buf, pos)
                pos += 4 * n
        out.append(v)
    return out


def decode_indices(d: Data, g: Geometry) -> list[list[int]]:
    """Decode index buffer, one list per material sub-group.
    16-bit unless vertexCount > 0x10000 (per hxd.fmt.hmd.Library)."""
    is32 = g.vertexCount > 0x10000
    size, fmt = (4, "<i") if is32 else (2, "<H")
    pos = g.indexPosition
    out = []
    for count in g.indexCounts:
        idx = list(struct.unpack_from(f"<{count}{fmt[1]}", d.data, pos))
        pos += count * size
        out.append(idx)
    return out


def load(path: str) -> Data:
    with open(path, "rb") as f:
        return Reader(f).read()


# --- CLI dump ---------------------------------------------------------------

def dump(path: str) -> None:
    d = load(path)
    print(f"=== {path} ===")
    print(f"version: {d.version}, props: {d.props}, data section: {len(d.data)} bytes")
    for i, g in enumerate(d.geometries):
        print(f"[geometry {i}] vertices={g.vertexCount} format={g.vertexFormat.inputs} "
              f"stride={g.vertexFormat.stride} indexCounts={g.indexCounts} "
              f"vpos={g.vertexPosition} ipos={g.indexPosition}")
        print(f"  bounds min={g.bounds[:3]} max={g.bounds[3:]}")
    for i, m in enumerate(d.materials):
        print(f"[material {i}] name={m.name!r} diffuse={m.diffuseTexture!r} "
              f"blend={m.blendMode} specular={m.specularTexture!r} normal={m.normalMap!r}")
    for i, m in enumerate(d.models):
        p = m.position
        print(f"[model {i}] name={m.name!r} parent={m.parent} geometry={m.geometry} "
              f"materials={m.materials} follow={m.follow!r}")
        print(f"  pos=({p.x:.4g},{p.y:.4g},{p.z:.4g}) quat=({p.qx:.4g},{p.qy:.4g},{p.qz:.4g},"
              f"{p.qw:.4g}) scale=({p.sx:.4g},{p.sy:.4g},{p.sz:.4g})")
        if m.skin:
            s = m.skin
            nbind = sum(1 for j in s.joints if j.bind >= 0)
            print(f"  skin {s.name!r}: {len(s.joints)} joints ({nbind} bound), "
                  f"split={None if s.split is None else len(s.split)}, props={s.props}")
            for ji, j in enumerate(s.joints):
                jp = j.position
                print(f"    [{ji:3}] {j.name!r} parent={j.parent} bind={j.bind} "
                      f"pos=({jp.x:.4g},{jp.y:.4g},{jp.z:.4g})")
    for i, a in enumerate(d.animations):
        print(f"[animation {i}] name={a.name!r} frames={a.frames} sampling={a.sampling} "
              f"speed={a.speed} loop={a.loop} dataPos={a.dataPosition} "
              f"objects={len(a.objects)} events={None if a.events is None else len(a.events)}")
        total_stride = sum(o.get_stride() for o in a.objects)
        print(f"  total stride/frame = {total_stride} floats "
              f"-> {a.frames * total_stride * 4} bytes expected")
        for o in a.objects:
            print(f"    {o.name!r} flags={o.flag_names}")


if __name__ == "__main__":
    for p in sys.argv[1:]:
            dump(p)
