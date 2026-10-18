"""
retexture.py -- inspect and rewrite texture paths inside HMD models.

Texture paths are length-prefixed strings in the HMD header, so this tool can
write paths of ANY length (no more matching character counts): the header is
spliced and the data-section offset patched, geometry untouched.

MODES

  Inspect:
    python retexture.py model.hmd
        lists materials and their texture paths

  Replace (substring, applied to all texture paths):
    python retexture.py model.hmd --replace OLD NEW [--replace OLD2 NEW2 ...]
                        [--out new.hmd]
        e.g. --replace AtreideSoldier01 HarkonnenGuard01
             --replace Character/Atreide Character/Harkonnen
        Without --out, writes <model>_retex.hmd next to the input.

  Clone a recolour kit (the whole manual workflow in one step):
    python retexture.py model.hmd --clone OLDBASE NEWBASE [--dir RES/DIR]
        1. copies every file in the model's folder whose name starts with
           OLDBASE to the same name with NEWBASE (catches Albedo, Normal,
           MetallicGlossAO, and convention-found maps like Emissive)
        2. writes a new HMD whose texture paths use NEWBASE (and, with
           --dir, the given resource directory instead of the original)
        e.g. python retexture.py Male01_AtreideSoldier.hmd \\
                 --clone AtreideSoldier01 RedSoldier01 \\
                 --dir Character/Atreide/Unit/RedSoldier
        Then recolour the new PNGs in any image editor.

Model/skin/bone names are never touched (animations and game references
depend on them).
"""

from __future__ import annotations

import io
import os
import shutil
import struct
import sys

import hmd_reader as H


def fs(p: str) -> str:
    """forward slashes everywhere, for consistent display"""
    return p.replace("\\", "/")


def is_hmd_file(p: str) -> bool:
    try:
        with open(p, "rb") as f:
            return f.read(3) == b"HMD"
    except OSError:
        return False


def copy_texture(src: str, dst: str):
    """Copy a companion texture, converting ANY non-PNG image (DDS-in-.png,
    jpg, tga, ...) to real PNG -- the game only supports PNG. Returns
    (message, actual_destination); the destination extension becomes .png
    when a conversion happens. Needs Pillow for conversions."""
    with open(src, "rb") as f:
        magic = f.read(8)
    if magic[:4] == b"\x89PNG":
        shutil.copy2(src, dst)
        return "copied", dst
    try:
        from PIL import Image
        png_dst = os.path.splitext(dst)[0] + ".png"
        Image.open(src).save(png_dst, "PNG")
        return "converted to real PNG", png_dst
    except ImportError:
        shutil.copy2(src, dst)
        return ("WARNING: non-PNG image copied as-is (install Pillow to "
                "auto-convert: pip install pillow)"), dst
    except Exception as e:
        shutil.copy2(src, dst)
        return f"WARNING: PNG conversion failed ({e}); copied as-is", dst


def find_texture_strings(buf: bytes):
    """Walk the header, returning (dataPos_field_offset, [(offset, length,
    value, material_index, slot), ...]) for every texture path string.
    offset = position of the length byte; length = full field size."""
    r = H.Reader(io.BytesIO(buf))
    f = r.f
    assert f.read(3) == b"HMD"
    r.version = f.read(1)[0]
    dp_ofs = f.tell()
    r.i32()  # dataPosition
    r.props()
    for _ in range(r.i32()):  # geometries
        r.props(); r.i32(); r.vformat(); r.i32()
        sub = r.byte()
        if sub == 0xFF:
            sub = r.i32()
        for _ in range(sub):
            r.i32()
        r.i32(); r.bounds()
    found = []

    def grab(mi, slot):
        ofs = f.tell()
        val = r.name()
        found.append((ofs, f.tell() - ofs, val, mi, slot))
        return val

    n_mats = r.i32()
    for mi in range(n_mats):
        mp = r.props()
        r.name()                       # material name (left untouched)
        grab(mi, "diffuse")
        r.byte(); r.byte(); r.f32()    # blend, old culling, old killalpha
        if mp and "HasExtraTextures" in mp:
            grab(mi, "specular")
            grab(mi, "normal")
    return dp_ofs, found


def rewrite(src: str, dst: str, transform) -> list:
    """transform(old_path_or_None) -> new_path_or_None. Returns change list."""
    buf = open(src, "rb").read()
    dp_ofs, found = find_texture_strings(buf)
    data_pos = struct.unpack_from("<i", buf, dp_ofs)[0]
    changes = []
    out = bytearray()
    prev = 0
    for ofs, length, val, mi, slot in found:
        new = transform(val)
        if new == val:
            continue
        out += buf[prev:ofs]
        if new is None:
            out += b"\xff"
        else:
            nb = new.encode("utf-8")
            if len(nb) > 254:
                raise ValueError(f"path too long ({len(nb)} bytes): {new}")
            out += bytes([len(nb)]) + nb
        prev = ofs + length
        changes.append((mi, slot, val, new))
    out += buf[prev:]
    delta = len(out) - len(buf)
    struct.pack_into("<i", out, dp_ofs, data_pos + delta)
    open(dst, "wb").write(bytes(out))
    H.load(dst)  # self-check: result parses
    return changes


def report(changes, dst):
    if not changes:
        print("no texture paths matched -- nothing changed")
        return
    print(f"wrote {fs(dst)}:")
    for mi, slot, old, new in changes:
        print(f"  material {mi} {slot}:")
        print(f"    {old}")
        print(f"    -> {new}")


def main():
    args = sys.argv[1:]
    if not args:
        print(__doc__)
        return 1
    # accept HMD content regardless of extension (game exports are often
    # HMD data named .fbx); reject genuine FBX with a clear message
    hmds = [a for a in args if not a.startswith("--")
            and os.path.isfile(a) and is_hmd_file(a)]
    if not hmds:
        for a in args:
            if os.path.isfile(a) and open(a, "rb").read(3) == b"Kay":
                print(f"{a} is a GENUINE FBX (Kaydara binary), not an HMD -- "
                      "this tool works on HMD models")
                return 1
        print("need an HMD model file (.hmd, or a game export named .fbx)")
        return 1
    src = hmds[0]

    # --clone OLDBASE NEWBASE [--dir NEWDIR]
    if "--clone" in args:
        i = args.index("--clone")
        oldbase, newbase = args[i + 1], args[i + 2]
        newdir = None
        if "--dir" in args:
            newdir = args[args.index("--dir") + 1].replace("\\", "/").strip("/")
        folder = os.path.dirname(os.path.abspath(src))
        # destination: --outdir, or a <newbase> folder next to the source
        if "--outdir" in args:
            outdir = args[args.index("--outdir") + 1]
        else:
            outdir = os.path.join(folder, newbase)
        os.makedirs(outdir, exist_ok=True)
        copied = 0
        for fn in sorted(os.listdir(folder)):
            if not fn.startswith(oldbase):
                continue
            p = os.path.join(folder, fn)
            if fn.lower().endswith(".hmd") or is_hmd_file(p):
                continue  # models, not textures
            dst_fn = newbase + fn[len(oldbase):]
            dst_p = os.path.join(outdir, dst_fn)
            if not os.path.exists(dst_p):
                how, dst_p = copy_texture(p, dst_p)
                print(f"{how}: {fn} -> {fs(dst_p)}")
                copied += 1
        if not copied:
            print(f"note: no companion files starting with {oldbase!r} found "
                  "(or copies already exist)")

        def tr(p):
            if p is None:
                return None
            d, _, fn = p.replace("\\", "/").rpartition("/")
            fn = fn.replace(oldbase, newbase)
            d2 = newdir if newdir is not None else d
            return (d2 + "/" + fn) if d2 else fn

        dst = os.path.join(outdir, newbase + ".hmd")
        changes = rewrite(src, dst, tr)
        report(changes, fs(dst))
        # base prefab beside the kit; the model's resource-root-relative
        # location = the folder its rewritten texture paths live in
        if "--no-prefab" not in args:
            if newdir is not None:
                res_loc = newdir
            else:
                first = next((n for _m, _s, _o, n in changes if n), None) or \
                    (H.load(dst).materials[0].diffuseTexture or "")
                res_loc = first.replace("\\", "/").rpartition("/")[0]
            pref_src = (res_loc + "/" if res_loc else "") + newbase + ".hmd"
            pp = os.path.join(outdir, newbase + ".prefab")
            with open(pp, "w", encoding="utf-8") as fh:
                fh.write('{\n\t"type": "prefab",\n\t"children": [\n\t\t{\n'
                         '\t\t\t"type": "model",\n'
                         f'\t\t\t"name": "{newbase}",\n'
                         f'\t\t\t"source": "{pref_src}"\n'
                         '\t\t}\n\t]\n}')
            print(f"base prefab: {fs(pp)} (source: {pref_src})")
        print(f"recolour kit ready in {fs(outdir)}/ -- edit the new PNGs "
              "in an image editor")
        return 0

    # --replace OLD NEW pairs
    pairs = []
    rest = list(args)
    while "--replace" in rest:
        i = rest.index("--replace")
        pairs.append((rest[i + 1], rest[i + 2]))
        del rest[i:i + 3]
    if pairs:
        out = None
        if "--out" in rest:
            out = rest[rest.index("--out") + 1]
        if out is None:
            out = os.path.splitext(src)[0] + "_retex.hmd"

        def tr(p):
            if p is None:
                return None
            for a, b in pairs:
                p = p.replace(a, b)
            return p

        report(rewrite(src, out, tr), out)
        return 0

    # inspect
    d = H.load(src)
    print(f"{src}: v{d.version}, {len(d.materials)} material(s)")
    for i, m in enumerate(d.materials):
        print(f"[material {i}] name={m.name!r}")
        print(f"   diffuse : {m.diffuseTexture}")
        print(f"   specular: {m.specularTexture}")
        print(f"   normal  : {m.normalMap}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
