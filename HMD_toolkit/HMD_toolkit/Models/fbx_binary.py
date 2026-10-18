"""
Low-level binary FBX 7.4 serializer (and re-parser for validation).

Binary FBX layout:
- Header: b"Kaydara FBX Binary  \\x00\\x1a\\x00" + uint32 version (7400)
- Node record (32-bit form, version < 7500):
    uint32 EndOffset, uint32 NumProperties, uint32 PropertyListLen,
    uint8 NameLen, name bytes, properties, nested nodes, [13-byte null sentinel]
- Property typecodes:
    Y int16, C bool(1 byte), I int32, F float32, D double, L int64
    f/d/i/l/b arrays: uint32 count, uint32 encoding(0=raw,1=zlib), uint32 byteLen, data
    S string / R raw: uint32 len + bytes
- Footer: footer id (16 bytes), 4 zero bytes, pad to 16-byte alignment,
  uint32 version, 120 zero bytes, 16-byte magic.

Python value mapping when writing:
    bool -> C, int -> I (L if outside int32 or IdInt), float -> D, str -> S,
    bytes -> R, array.array('f'/'d'/'i'/'q'/'b') -> f/d/i/l/b
Use Long(v) to force int64 encoding for small ints if needed.
"""

from __future__ import annotations

import struct
import zlib
from array import array

MAGIC = b"Kaydara FBX Binary  \x00\x1a\x00"
FOOT_ID = bytes.fromhex("fabcab09d0c8d466b176fb831cf7267e")
FOOT_MAGIC = bytes.fromhex("f85a8c6adef5d97eece90ce3758f290b")
VERSION = 7400

INT32_MIN, INT32_MAX = -2**31, 2**31 - 1


class Long(int):
    """int that always serializes as FBX 'L' (int64)."""


def fbx_name(name: str, klass: str) -> str:
    return name + "\x00\x01" + klass


class Node:
    __slots__ = ("name", "props", "children")

    def __init__(self, name: str, *props):
        self.name = name
        self.props = list(props)
        self.children: list[Node] = []

    def add(self, name: str, *props) -> "Node":
        n = Node(name, *props)
        self.children.append(n)
        return n


_ARRAY_CODES = {"f": b"f", "d": b"d", "i": b"i", "q": b"l", "b": b"b"}


def _prop_bytes(p) -> bytes:
    if isinstance(p, bool):
        return b"C" + struct.pack("<B", 1 if p else 0)
    if isinstance(p, Long):
        return b"L" + struct.pack("<q", p)
    if isinstance(p, int):
        if INT32_MIN <= p <= INT32_MAX:
            return b"I" + struct.pack("<i", p)
        return b"L" + struct.pack("<q", p)
    if isinstance(p, float):
        return b"D" + struct.pack("<d", p)
    if isinstance(p, str):
        b = p.encode("utf-8")
        return b"S" + struct.pack("<I", len(b)) + b
    if isinstance(p, bytes):
        return b"R" + struct.pack("<I", len(p)) + p
    if isinstance(p, array):
        code = _ARRAY_CODES[p.typecode]
        raw = p.tobytes()
        comp = zlib.compress(raw, 4)
        if len(comp) < len(raw):
            return code + struct.pack("<III", len(p), 1, len(comp)) + comp
        return code + struct.pack("<III", len(p), 0, len(raw)) + raw
    raise TypeError(f"Cannot serialize property of type {type(p)}: {p!r}")


_SENTINEL = b"\x00" * 13


def _write_node(out: bytearray, node: Node) -> None:
    start = len(out)
    out += b"\x00" * 12  # EndOffset, NumProperties, PropertyListLen placeholders
    name = node.name.encode("utf-8")
    out += struct.pack("<B", len(name)) + name
    plen = 0
    for p in node.props:
        b = _prop_bytes(p)
        out += b
        plen += len(b)
    if node.children or not node.props:
        for c in node.children:
            _write_node(out, c)
        out += _SENTINEL
    struct.pack_into("<III", out, start, len(out), len(node.props), plen)


def write_fbx(path: str, root_nodes: list[Node], version: int = VERSION) -> None:
    out = bytearray()
    out += MAGIC
    out += struct.pack("<I", version)
    for n in root_nodes:
        _write_node(out, n)
    out += _SENTINEL
    out += FOOT_ID
    out += b"\x00" * 4
    pad = (16 - len(out) % 16) % 16
    out += b"\x00" * pad
    out += struct.pack("<I", version)
    out += b"\x00" * 120
    out += FOOT_MAGIC
    with open(path, "wb") as f:
        f.write(bytes(out))


# --- reader (for validation) -------------------------------------------------

def _read_prop(buf: bytes, pos: int):
    t = buf[pos:pos + 1]
    pos += 1
    if t == b"Y":
        return struct.unpack_from("<h", buf, pos)[0], pos + 2
    if t == b"C":
        return bool(buf[pos]), pos + 1
    if t == b"I":
        return struct.unpack_from("<i", buf, pos)[0], pos + 4
    if t == b"F":
        return struct.unpack_from("<f", buf, pos)[0], pos + 4
    if t == b"D":
        return struct.unpack_from("<d", buf, pos)[0], pos + 8
    if t == b"L":
        # preserve int64-ness through read->write round-trips (object ids that
        # fit in int32 must not demote to 'I': Blender asserts L,S,S on objects)
        return Long(struct.unpack_from("<q", buf, pos)[0]), pos + 8
    if t in (b"f", b"d", b"i", b"l", b"b"):
        n, enc, blen = struct.unpack_from("<III", buf, pos)
        pos += 12
        data = buf[pos:pos + blen]
        pos += blen
        if enc == 1:
            data = zlib.decompress(data)
        tc = {b"f": "f", b"d": "d", b"i": "i", b"l": "q", b"b": "b"}[t]
        a = array(tc)
        a.frombytes(data)
        assert len(a) == n, f"array len mismatch {len(a)} != {n}"
        return a, pos
    if t in (b"S", b"R"):
        n = struct.unpack_from("<I", buf, pos)[0]
        pos += 4
        data = buf[pos:pos + n]
        if t == b"S":
            try:
                data = data.decode("utf-8")
            except UnicodeDecodeError:
                pass
        return data, pos + n
    raise ValueError(f"unknown property type {t!r} at {pos - 1}")


def _read_node(buf: bytes, pos: int):
    end, nprops, plen = struct.unpack_from("<III", buf, pos)
    if end == 0:  # null sentinel
        return None, pos + 13
    nlen = buf[pos + 12]
    name = buf[pos + 13:pos + 13 + nlen].decode("utf-8")
    p = pos + 13 + nlen
    node = Node(name)
    for _ in range(nprops):
        v, p = _read_prop(buf, p)
        node.props.append(v)
    while p < end:
        child, p = _read_node(buf, p)
        if child is None:
            break
        node.children.append(child)
    assert p == end, f"node {name}: ended at {p}, expected {end}"
    return node, end


def read_fbx(path: str):
    with open(path, "rb") as f:
        buf = f.read()
    if buf[:len(MAGIC)] != MAGIC:
        raise ValueError("not a binary FBX file")
    version = struct.unpack_from("<I", buf, len(MAGIC))[0]
    pos = len(MAGIC) + 4
    nodes = []
    while True:
        node, pos = _read_node(buf, pos)
        if node is None:
            break
        nodes.append(node)
    return version, nodes


def dump_tree(nodes, depth=0, max_arr=6):
    for n in nodes:
        ps = []
        for p in n.props:
            if isinstance(p, array):
                head = ",".join(f"{x:.4g}" if isinstance(x, float) else str(x)
                                for x in p[:max_arr])
                ps.append(f"{p.typecode}[{len(p)}]({head}{'...' if len(p) > max_arr else ''})")
            elif isinstance(p, (bytes,)):
                ps.append(repr(p[:40]))
            else:
                ps.append(repr(p))
        print("  " * depth + n.name + ": " + ", ".join(ps))
        dump_tree(n.children, depth + 1, max_arr)


if __name__ == "__main__":
    import sys
    v, nodes = read_fbx(sys.argv[1])
    print(f"binary FBX version {v}")
    dump_tree(nodes)
