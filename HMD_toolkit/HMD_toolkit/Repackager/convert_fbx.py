"""
convert_fbx.py -- one-shot pipeline: Blender-exported FBX -> final game HMD.

Chains the toolkit's validated steps without any manual file juggling:
  MODEL:      fbxfix (restore skeleton from rig reference)
              -> local repackager -> final <name>.hmd
  ANIMATION:  animfix (curves/headers/name)
              -> local repackager -> inject events -> final Anim_<rig>_<n>.hmd

All intermediates live in a temporary folder and are deleted; the only thing
left is the finished HMD at the output location (default: next to the input).

Usage:
  python convert_fbx.py model input.fbx --ref <rig.hmd>
                        [--outdir DIR | --out FILE] [--d4x <D4X.exe>]

  python convert_fbx.py anim input.fbx [--ref <original_anim.hmd>]
                        [--name AnimName] [--rig Male01] [--trim N|ref]
                        [--event frame:name ...] [--backup]
                        [--outdir DIR | --out FILE] [--d4x <D4X.exe>]
"""

from __future__ import annotations

import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
TOOLROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(TOOLROOT, "Models"))
sys.path.insert(0, os.path.join(TOOLROOT, "Animations"))
sys.path.insert(0, HERE)

WORK = os.path.join(HERE, "_work")


def fs(p):
    return p.replace("\\", "/")


def arg(name, default=None):
    if name in sys.argv:
        return sys.argv[sys.argv.index(name) + 1]
    return default


def write_prefab(folder, name, hmd_res_path):
    """Base prefab (Heaps hrt.prefab JSON) containing just the model, so the
    finished kit can be referenced in the editor without hand-writing one."""
    p = os.path.join(folder, name + ".prefab")
    content = (
        '{\n'
        '\t"type": "prefab",\n'
        '\t"children": [\n'
        '\t\t{\n'
        '\t\t\t"type": "model",\n'
        f'\t\t\t"name": "{name}",\n'
        f'\t\t\t"source": "{hmd_res_path}"\n'
        '\t\t}\n'
        '\t]\n'
        '}'
    )
    with open(p, "w", encoding="utf-8") as fh:
        fh.write(content)
    return p


def embedded_textures(fbx_path):
    """[(filename, bytes), ...] for images baked into the FBX (Blender's
    'Embed Textures' export option stores them as Video nodes w/ Content)."""
    from fbx_binary import read_fbx
    out = []
    seen = set()
    _v, nodes = read_fbx(fbx_path)
    for n in nodes:
        if n.name != "Objects":
            continue
        for o in n.children:
            if o.name != "Video":
                continue
            fname = None
            content = None
            for ch in o.children:
                if ch.name == "RelativeFilename" and ch.props and \
                        isinstance(ch.props[0], str) and ch.props[0].strip():
                    fname = ch.props[0]
                elif ch.name == "Filename" and fname is None and ch.props \
                        and isinstance(ch.props[0], str) and ch.props[0].strip():
                    fname = ch.props[0]
                elif ch.name == "Content" and ch.props and \
                        isinstance(ch.props[0], (bytes, bytearray)) and \
                        len(ch.props[0]) > 16:
                    content = bytes(ch.props[0])
            if content is None:
                continue
            base = os.path.basename((fname or "texture.png").replace("\\", "/"))
            if base in seen:
                continue
            seen.add(base)
            out.append((base, content))
    return out


def main():
    if len(sys.argv) < 3 or sys.argv[1] not in ("model", "anim"):
        print(__doc__)
        return 1
    mode = sys.argv[1]
    fbx = os.path.abspath(sys.argv[2])
    if not os.path.isfile(fbx):
        print(f"ERROR: input not found: {fs(fbx)}")
        return 1
    ref = arg("--ref")
    out = arg("--out")
    outdir = arg("--outdir")
    d4x = arg("--d4x")
    events = []
    argv = list(sys.argv)
    while "--event" in argv:
        i = argv.index("--event")
        events.append(argv[i + 1])
        del argv[i:i + 2]

    import repack as RP

    if os.path.isdir(WORK):
        shutil.rmtree(WORK, ignore_errors=True)
    os.makedirs(WORK, exist_ok=True)
    try:
        # ---- step A: fix the Blender export --------------------------------
        # (run on a copy inside _work so intermediates never litter the
        #  user's folders)
        work_fbx = os.path.join(WORK, os.path.basename(fbx))
        shutil.copy2(fbx, work_fbx)
        print(f"=== [A] fixing Blender export ({mode}) ===")
        if mode == "model":
            if not ref:
                print("ERROR: model mode needs --ref <rig.hmd> "
                      "(skeleton reference)")
                return 1
            import fbxfix
            fixed = fbxfix.fix(work_fbx,
                               os.path.join(WORK, "fixed.fbx"), ref)
            final_name = os.path.splitext(os.path.basename(fbx))[0] + ".hmd"
        else:
            import animfix
            trim = arg("--trim", "0")
            if trim == "ref":
                import hmd_reader as H
                trim = H.load(ref).animations[0].frames
            fixed = animfix.fix_fbx(work_fbx, ref,
                                    arg("--rig", "Male01"), int(trim),
                                    arg("--name"))
            final_name = os.path.splitext(os.path.basename(fixed))[0] + ".hmd"

        # embedded colour maps (model mode): extracted beside the final HMD,
        # which then goes into its own folder at the target directory
        emb = embedded_textures(work_fbx) if mode == "model" else []

        # ---- step B: local repackaging -------------------------------------
        print(f"=== [B] repackaging locally ===")
        if out:
            target = os.path.abspath(out)
        else:
            base = os.path.abspath(outdir) if outdir else os.path.dirname(fbx)
            if emb:
                base = os.path.join(base, os.path.splitext(final_name)[0])
            target = os.path.join(base, final_name)
        RP.repack(fixed, out=target, d4x_source=d4x)
        if emb:
            print(f"=== [B2] extracting {len(emb)} embedded texture(s) ===")
            # the game only supports PNG: convert any non-PNG image data
            def to_png(data):
                if data[:4] == b"\x89PNG":
                    return data, True, None
                try:
                    from PIL import Image
                    import io
                    buf = io.BytesIO()
                    Image.open(io.BytesIO(data)).save(buf, "PNG")
                    return buf.getvalue(), True, "converted to PNG"
                except ImportError:
                    return data, False, ("WARNING: non-PNG kept as-is "
                                         "(pip install pillow to convert)")
                except Exception as e:
                    return data, False, f"WARNING: PNG conversion failed ({e})"
            proc = {}   # original basename (lower) -> (bytes, is_png, note)
            for name, data in emb:
                proc[name.lower()] = to_png(data)
            # canonical names: <name>_Albedo/_MetallicGlossAO/_Normal, mapped
            # via the HMD's material slots, and the HMD rewired to match
            import hmd_reader as H
            import retexture as RT
            stem = os.path.splitext(final_name)[0]
            d = H.load(target)
            slot_map = {}   # original basename (lower) -> canonical filename
            # texture paths are resolved from the game's resource ROOT, so
            # wire them as <resdir>/<name>/<file> matching where the output
            # folder is meant to be placed (res/<resdir>/<name>/)
            resdir = (arg("--resdir", "") or "").replace("\\", "/").strip("/")
            prefix = f"{resdir}/{stem}/" if resdir else ""
            for m in d.materials:
                for attr, suffix in (("diffuseTexture", "Albedo"),
                                     ("specularTexture", "MetallicGlossAO"),
                                     ("normalMap", "Normal")):
                    p = getattr(m, attr)
                    if p:
                        ob = os.path.basename(p.replace("\\", "/"))
                        got = proc.get(ob.lower())
                        ext = ".png" if (got and got[1]) else \
                            (os.path.splitext(ob)[1] or ".png")
                        slot_map.setdefault(ob.lower(),
                                            f"{prefix}{stem}_{suffix}{ext}")
            for name, _orig in emb:
                data, is_png, note = proc[name.lower()]
                new = os.path.basename(slot_map.get(name.lower(), name))
                if is_png and new.lower() == name.lower():
                    new = os.path.splitext(new)[0] + ".png"
                with open(os.path.join(os.path.dirname(target), new),
                          "wb") as fh:
                    fh.write(data)
                print(f"    {name}" +
                      (f" -> {new}" if new != name else "") +
                      f" ({len(data)} bytes)" +
                      (f" [{note}]" if note else ""))

            def tr(p):
                if p is None:
                    return None
                ob = os.path.basename(p.replace("\\", "/")).lower()
                return slot_map.get(ob, p)

            changes = RT.rewrite(target, target, tr)
            if changes:
                print("    HMD texture paths rewired:")
                for _mi, slot, _old, new in changes:
                    print(f"      {slot} -> {new}")
            else:
                print("    (no HMD texture paths matched the embedded "
                      "images -- paths left as authored)")

        if mode == "model" and "--no-prefab" not in sys.argv:
            # base prefab beside the model (path is resource-root-relative,
            # i.e. whatever comes after D4XEditor/res)
            stem = os.path.splitext(final_name)[0]
            resdir = (arg("--resdir", "") or "").replace("\\", "/").strip("/")
            src = (f"{resdir}/{stem}/" if resdir else "") + final_name
            p = write_prefab(os.path.dirname(target), stem, src)
            print(f"=== [B3] base prefab: {fs(p)} (source: {src}) ===")

        # ---- step C: events (animations only) ------------------------------
        if mode == "anim":
            print(f"=== [C] events ===")
            import animfix
            ref_has_events = False
            if ref and not events:
                import hmd_reader as H
                r = H.load(ref)
                ref_has_events = bool(r.animations and r.animations[0].events)
            if events:
                animfix.inject_events(target, None, events,
                                      backup="--backup" in sys.argv)
            elif ref_has_events:
                animfix.inject_events(target, ref, None,
                                      backup="--backup" in sys.argv)
            else:
                print("    (no events to inject)")

        print(f"=== DONE: {fs(target)} ===")
        return 0
    finally:
        shutil.rmtree(WORK, ignore_errors=True)


if __name__ == "__main__":
    sys.exit(main())
