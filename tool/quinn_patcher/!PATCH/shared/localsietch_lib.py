#!/usr/bin/env python3
"""The game file's base and folders, and the Local Sietch predicate found by shape; no cdb read."""
import os
import sys

# paths resolve from this file's folder and the project's game folder
HERE = os.path.dirname(os.path.abspath(__file__))


def _find(name):
    # the pristine `hlboot.dat` lives in the parent folder, the real CodeCracker
    for base in (HERE, os.path.join(os.path.dirname(os.path.dirname(HERE)), "game"),):
        p = os.path.join(base, name)
        if os.path.exists(p):
            return p
    # the packaged app has no game folder and never reads this one
    return p


for _cl in (os.path.join(os.path.dirname(os.path.dirname(HERE)), "lib"),):
    if os.path.isdir(os.path.join(_cl, "crashlink")):
        sys.path.insert(0, _cl)
        break

# serialise() recurses once per 15 repeated debug entries, and the game has huge functions
sys.setrecursionlimit(200000)

from crashlink import Bytecode, disasm
from crashlink.opcodes import opcodes
# the opcode schema's operand names map onto these classes (crashlink core.py)
from crashlink.core import Opcode, VarInt, Reg, intRef as RefInt, VarInt as JumpOffset

# the base: `D4X_MERGE_BASE`, or a `_mergebase` text file, else pristine
def _resolve_base():
    env = os.environ.get("D4X_MERGE_BASE")
    named = os.path.join(HERE, "_mergebase.txt")
    if env and os.path.exists(env):
        return env, "D4X_MERGE_BASE"
    parent = os.path.dirname(HERE)
    if os.path.exists(named):
        p = open(named, encoding="utf-8").read().strip()
        # a bare filename, so the same setting works on both machines
        p = p if os.path.isabs(p) else os.path.join(parent, p)
        if p and os.path.exists(p):
            return p, "_mergebase.txt"
    return (_find("hlboot.dat"),
            "PRISTINE -- standalone; the MERGED build is `python _build.py 236 235`")


HLBOOT, _BASE_WHY = _resolve_base()   # never written to
print("base: %s   (%s)" % (os.path.basename(HLBOOT), _BASE_WHY))
OUT = os.path.join(HERE, "hlboot_w15.dat")
_GAMEDIRS = (
    r"C:\Games\Steam\steamapps\common\D4X",
    r"D:\Downloads\Steam\steamapps\common\D4X",
)
# the first that exists wins; only the deploy step needs one, so a dry run works anywhere
GAMEDIR = next((d for d in _GAMEDIRS if os.path.isdir(d)), None) or _GAMEDIRS[0]
SEPARATOR_TITLE = "LocalSietch"


def _guard(cond, msg):
    if not cond:
        raise AssertionError("W15 GUARD: " + msg)


# ----------------------------------------------------------------------------- int pool
def int_ref(bc, value):
    hits = [i for i, v in enumerate(bc.ints) if v.value == value]
    _guard(hits, "no int-pool entry holds %d" % value)
    idx = hits[0]
    _guard(bc.ints[idx].value == value, "int pool #%d is not %d" % (idx, value))
    return idx


# ----------------------------------------------------------------------------- find f@22710
def field_name(bc, fn, op, key="field"):
    """Resolve a Field/SetField's field name off the object register's virtual type."""
    obj = op.df.get("obj")
    fld = op.df.get(key)
    if obj is None or fld is None:
        return None
    try:
        t = fn.regs[obj.value].resolve(bc)
        return t.definition.fields[fld.value].name.resolve(bc)
    except Exception:
        return None


def find_predicate(bc):
    """The localSietch acceptance closure: the only function reading `group` and `notInSietch`."""
    hits = []
    for fn in bc.functions:
        if not (6 <= len(fn.ops) <= 40):
            continue
        names = set()
        for op in fn.ops:
            if op.op == "Field":
                n = field_name(bc, fn, op)
                if n:
                    names.add(n)
        if {"group", "notInSietch"} <= names:
            hits.append(fn)
    _guard(len(hits) == 1,
           "expected exactly ONE function reading both `group` and `notInSietch`, found %d (%s)"
           % (len(hits), [h.findex.value for h in hits]))
    return hits[0]


# ----------------------------------------------------------------------------- emit
def op(name, **df):
    o = Opcode()
    o.op = name
    o.df = df
    return o


def dump_patched(bc, fn, path=None):
    path = path or os.path.join(os.path.dirname(os.path.abspath(__file__)), "_w15_patched.txt")
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("f@%d  %s  nops=%d\n"
                 % (fn.findex.value, disasm.full_func_name_str(bc, fn), len(fn.ops)))
        for i, o in enumerate(fn.ops):
            fh.write("%4d. %s\n" % (i, disasm.fmt_op_compact(bc, fn.regs, o, i, func=fn)))
    print("wrote " + path)


if __name__ == "__main__":
    print("this module is applied by the build (!PATCH/standalone/kept_fixes.py)")
