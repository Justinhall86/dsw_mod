"""Copy the vanilla rig's joint bind poses (inverse bind, `transpos`) into a converted vehicle HMD.

    python 53_fix_bind.py <target.hmd> <vanilla_ref.hmd|.fbx>

Why: our meshes are written in the vanilla rig's raw data frame (50_export_fbx.py), so the vanilla bind is the
right one. The toolkit conversion restores the joints from the reference but keeps Blender's bind ROTATION
(B_Body q = -90 deg about X for the Hammer, (-.5,-.5,-.5) for the Renegade), which would pitch/roll the whole
ship in game. A bind is 6 (or 9) little-endian floats; each is patched in place by unique byte match.
"""
import os
import shutil
import struct
import sys

SK = r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-model-modding\scripts"
sys.path.insert(0, SK)
from dsw_common import cfg  # noqa: E402
sys.path.insert(0, os.path.join(cfg("toolkit_dir"), "Models"))
import hmd_reader as H  # noqa: E402


def binds(path):
    d = H.load(path)
    out = {}
    for m in d.models:
        if getattr(m, "skin", None):
            for j in m.skin.joints:
                if j.transpos is not None:
                    out[j.name] = j.transpos
    return out


def pack(p):
    return struct.pack("<6f", p.x, p.y, p.z, p.qx, p.qy, p.qz)


target, ref = sys.argv[1], sys.argv[2]
want, have = binds(ref), binds(target)
raw = bytearray(open(target, "rb").read())
changed = 0
for name, p in have.items():
    q = want[name]
    old, new = pack(p), pack(q)
    if old == new:
        print("  %-8s already matches" % name)
        continue
    assert raw.count(old) == 1, "bind bytes for %s not unique" % name
    i = raw.find(old)
    raw[i:i + 24] = new
    changed += 1
    print("  %-8s q (%.3f %.3f %.3f) -> (%.3f %.3f %.3f)" % (name, p.qx, p.qy, p.qz, q.qx, q.qy, q.qz))
if changed:
    bak = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "07_data_cdb", "bind_backups")
    os.makedirs(bak, exist_ok=True)                  # outside the editor res tree, so it never gets packed
    shutil.copyfile(target, os.path.join(bak, os.path.basename(target) + ".bak_bind"))
    open(target, "wb").write(raw)
after = binds(target)
assert all(pack(after[n]) == pack(want[n]) for n in after), "verify failed"
print("OK", target, "binds now match", os.path.basename(ref))
