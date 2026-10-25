"""Extract single files from a Heaps .pak (e.g. the game's res.compressed.pak) without unpacking all 5+ GB.

  python pak_extract_one.py <pak> <path inside pak, e.g. data.cdb> <out file>
  python pak_extract_one.py <pak> --list [prefix]

Heaps pak layout (hxd.fmt.pak): "PAK", version byte, header size (int32), data size (int32 v0 / double-ish v1),
then the file tree: name (1-byte length + utf8), flags byte (1 = directory, 2 = 64-bit position);
directory -> int32 count + children; file -> position (int32 or float64 when flag 2), size int32, checksum int32.
File data starts at header size + position (header size already covers the "DATA" marker). Used to read the CURRENT vanilla data.cdb after a
game update.
"""
import struct
import sys


def read_tree(f):
    def entry(prefix):
        n = f.read(1)[0]
        name = f.read(n).decode("utf-8")
        flags = f.read(1)[0]
        path = prefix + "/" + name if prefix else name
        if flags & 1:
            cnt = struct.unpack("<i", f.read(4))[0]
            out = []
            for _ in range(cnt):
                out += entry(path)
            return out
        pos = struct.unpack("<d", f.read(8))[0] if flags & 2 else struct.unpack("<i", f.read(4))[0]
        size, _crc = struct.unpack("<ii", f.read(8))
        return [(path, int(pos), size)]
    return entry


def open_pak(p):
    f = open(p, "rb")
    assert f.read(3) == b"PAK", "not a Heaps pak"
    ver = f.read(1)[0]
    hsize = struct.unpack("<i", f.read(4))[0]
    f.read(8 if ver >= 1 else 4)   # data size
    files = read_tree(f)("")
    return f, hsize, files


def main():
    f, hsize, files = open_pak(sys.argv[1])
    if sys.argv[2] == "--list":
        pre = sys.argv[3] if len(sys.argv) > 3 else ""
        for p, pos, size in files:
            if p.lstrip("/").startswith(pre):
                print(size, p)
        return
    want = sys.argv[2].strip("/")
    hit = [x for x in files if x[0].strip("/").endswith(want)]
    if not hit:
        sys.exit("not found: " + want)
    path, pos, size = min(hit, key=lambda x: len(x[0]))
    f.seek(hsize + pos)
    data = f.read(size)
    open(sys.argv[3], "wb").write(data)
    print("extracted %s (%d bytes) -> %s" % (path, size, sys.argv[3]))


if __name__ == "__main__":
    main()
