#!/usr/bin/env python3
"""Unpack the patch source from Quinn's Unofficial Patcher without running the exe.

The exe is a Nuitka onefile: a loader plus a 'KAY' + zstd stream of (UTF-16 name, 8-byte size, bytes).
This reads that stream and keeps only the plain-text source: !PATCH and ui. The compiled parts
(main.dll, which holds crashlink, and the bundled libraries) are never written or loaded.

Needs Python 3.14+ (compression.zstd).
Usage: python -I tool/unpack_quinn.py [--out tool/quinn_patcher]
"""
import argparse
import glob
import io
import os
import shutil
import struct
import zipfile
from compression import zstd

HERE = os.path.dirname(os.path.abspath(__file__))
KEEP = ("!PATCH", "ui")
MAGIC = b"KAY\x28\xb5\x2f\xfd"


def stream_of(archive):
    with zipfile.ZipFile(archive) as z:
        exe = z.read(z.namelist()[0])
    at = exe.find(MAGIC)
    if at < 0:
        raise SystemExit("no Nuitka onefile payload found: the patcher's packaging has changed")
    return zstd.ZstdDecompressor().decompress(exe[at + 3:])


def entries(data):
    """Yield (name, bytes) for every file in the payload stream."""
    p = 0
    while p < len(data):
        end = p
        while data[end:end + 2] != b"\0\0":
            end += 2
        name = data[p:end].decode("utf-16le").replace("\\", "/")
        p = end + 2
        if not name:
            return
        size = struct.unpack("<Q", data[p:p + 8])[0]
        p += 8
        yield name, data[p:p + size]
        p += size


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--out", default=os.path.join(HERE, "quinn_patcher"))
    ap.add_argument("--archive", help="the patcher zip (default: the first Quinn*.zip or patcher*.zip in tool/)")
    args = ap.parse_args()
    archive = args.archive or (glob.glob(os.path.join(HERE, "Quinn*.zip")) + glob.glob(os.path.join(HERE, "patcher*.zip")))[0]
    root = os.path.abspath(args.out)
    if os.path.isdir(root):
        shutil.rmtree(root)
    kept = 0
    for name, body in entries(stream_of(archive)):
        parts = name.split("/")
        if parts[0] not in KEEP or "__pycache__" in parts or ".." in parts:
            continue
        path = os.path.join(root, *parts)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with io.open(path, "wb") as out:
            out.write(body)
        kept += 1
    print("unpacked %d files -> %s" % (kept, root))


if __name__ == "__main__":
    main()
