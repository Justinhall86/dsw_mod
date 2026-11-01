"""Read-only HashLink bytecode explorer for Dune: Spice Wars' hlboot.dat (also works on Northgard / Wartales).

The parser is verified: it consumes the D4X hlboot.dat (HLB v4) exactly to its last byte. It caches a pickle per
(size, mtime) so commands after the first run take a second.

    python hlboot.py info                         header counts + cache path
    python hlboot.py name  <regex>                functions whose Class.method name matches
    python hlboot.py find  <substring>            functions whose code loads a string (literal or const global) containing it
    python hlboot.py dis   <func#> [...] [--raw]  disassemble with names, strings, fields, file:line (--raw keeps Label/NullCheck/casts)
    python hlboot.py callers <func#>              every static call site of that function
    python hlboot.py ints  <n> [...]              functions that load int n (attribute / constant row indexes, flag bits)
    python hlboot.py atb   <cdb attribute id>     where the engine reads that attribute (int index + getAtbApps/hasAttribute)
    python hlboot.py setfield <field>             functions that assign obj.<field> (find where a value is initialised)
    python hlboot.py cdbidx <sheet> <id|index>    data.cdb row index <-> id (the engine indexes attributes/constants by row)
    python hlboot.py floats [n]                   first n entries of the float table (Float [reg, idx] uses it)

Options: --dat <path> (default: the Steam game's hlboot.dat), --cdb <path> (default: mod_files/data.cdb).
"""
import os
import pickle
import re
import struct
import sys

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", ".."))
DEFAULT_DAT = r"C:\Program Files (x86)\Steam\steamapps\common\D4X\hlboot.dat"
DEFAULT_CDB = os.path.join(REPO, "mod_files", "data.cdb")
CACHE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), ".cache")

# Fixed arg counts per opcode (HashLink opcodes.h / hlbc opcodes.rs). -1 = variable (Call*N, Switch, MakeEnum).
NARGS = [2, 2, 2, 2, 2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 1, 1, 2, 3, 4, 5, 6, -1, -1, -1, -1, 2, 3, 3, 2, 2,
         3, 3, 2, 2, 3, 3, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 2, 2, 2, 2, 2, 0, 1, 1, 1, -1, 1, 2, 1, 3, 3, 3, 3,
         3, 3, 3, 3, 1, 2, 2, 2, 2, 2, 2, 2, -1, 2, 2, 4, 3, 0, 2, 3, 0, 3, 3]
OPN = ("Mov Int Float Bool Bytes String Null Add Sub Mul SDiv UDiv SMod UMod Shl SShr UShr And Or Xor Neg Not Incr Decr "
       "Call0 Call1 Call2 Call3 Call4 CallN CallMethod CallThis CallClosure StaticClosure InstanceClosure VirtualClosure "
       "GetGlobal SetGlobal Field SetField GetThis SetThis DynGet DynSet JTrue JFalse JNull JNotNull JSLt JSGte JSGt JSLte "
       "JULt JUGte JNotLt JNotGte JEq JNotEq JAlways ToDyn ToSFloat ToUFloat ToInt SafeCast UnsafeCast ToVirtual Label Ret "
       "Throw Rethrow Switch NullCheck Trap EndTrap GetI8 GetI16 GetMem GetArray SetI8 SetI16 SetMem SetArray New ArraySize "
       "Type GetType GetTID Ref Unref Setref MakeEnum EnumAlloc EnumIndex EnumField SetEnumField Assert RefData RefOffset Nop "
       "Prefetch Asm").split()
NOISE = {"Label", "NullCheck", "SafeCast", "UnsafeCast", "JULt"}
STATIC_CALLS = {"Call0", "Call1", "Call2", "Call3", "Call4", "CallN"}


# ----------------------------------------------------------------------------------------------------------- parsing
class _R:
    def __init__(s, b):
        s.b, s.p = b, 0

    def u8(s):
        v = s.b[s.p]; s.p += 1; return v

    def i32(s):
        v = struct.unpack_from("<i", s.b, s.p)[0]; s.p += 4; return v

    def idx(s):
        b = s.u8()
        if not b & 0x80:
            return b & 0x7F
        if not b & 0x40:
            v = ((b & 0x1F) << 8) | s.u8()
        else:
            c, d, e = s.u8(), s.u8(), s.u8()
            v = ((b & 0x1F) << 24) | (c << 16) | (d << 8) | e
        return -v if b & 0x20 else v


def _strings(r, n):
    size = r.i32(); data = r.b[r.p:r.p + size]; r.p += size
    out, pos = [], 0
    for _ in range(n):
        sz = r.idx(); out.append(data[pos:pos + sz].decode("utf-8", "replace")); pos += sz + 1
    return out


def parse(path, track=()):
    """track: function numbers whose op byte offsets to record (m['offsets'][fn] = [start offset of each op])."""
    track = set(track)
    offsets = {}
    r = _R(open(path, "rb").read())
    if r.b[:3] != b"HLB":
        sys.exit(f"{path} is not HashLink bytecode")
    r.p = 3; ver = r.u8()
    flags = r.idx(); nints = r.idx(); nfloats = r.idx(); nstrings = r.idx()
    nbytes = r.idx() if ver >= 5 else 0
    ntypes, nglobals, nnatives, nfuncs = r.idx(), r.idx(), r.idx(), r.idx()
    nconsts = r.idx() if ver >= 4 else 0
    r.idx()  # entrypoint
    ints = [r.i32() for _ in range(nints)]
    floats = [struct.unpack_from("<d", r.b, r.p + 8 * i)[0] for i in range(nfloats)]; r.p += 8 * nfloats
    strings = _strings(r, nstrings)
    if ver >= 5:
        size = r.i32(); r.p += size
        for _ in range(nbytes): r.idx()
    dfiles = _strings(r, r.idx()) if flags & 1 else []
    types = []
    for _ in range(ntypes):
        k = r.u8(); t = {"k": k}
        if k in (10, 20):
            n = r.u8(); t["args"] = [r.idx() for _ in range(n)]; t["ret"] = r.idx()
        elif k in (11, 21):
            t["name"], t["super"], t["global"] = r.idx(), r.idx(), r.idx()
            nf, np_, nb = r.idx(), r.idx(), r.idx()
            t["fields"] = [(r.idx(), r.idx()) for _ in range(nf)]
            t["protos"] = [(r.idx(), r.idx(), r.idx()) for _ in range(np_)]
            t["bindings"] = [(r.idx(), r.idx()) for _ in range(nb)]
        elif k in (14, 19, 22):
            t["t"] = r.idx()
        elif k == 15:
            t["fields"] = [(r.idx(), r.idx()) for _ in range(r.idx())]
        elif k == 17:
            t["name"] = r.idx()
        elif k == 18:
            t["name"], t["global"] = r.idx(), r.idx()
            t["cons"] = []
            for _ in range(r.idx()):
                nm = r.idx(); t["cons"].append((nm, [r.idx() for _ in range(r.idx())]))
        types.append(t)
    globals_ = [r.idx() for _ in range(nglobals)]
    natives = [(r.idx(), r.idx(), r.idx(), r.idx()) for _ in range(nnatives)]
    funcs = []
    for fn in range(nfuncs):
        ty, fi, nregs, nops = r.idx(), r.idx(), r.idx(), r.idx()
        regs = [r.idx() for _ in range(nregs)]
        ops = []
        offs = offsets.setdefault(fn, []) if fn in track else None
        for _ in range(nops):
            if offs is not None:
                offs.append(r.p)
            op = r.u8(); na = NARGS[op]
            if na >= 0:
                a = [r.idx() for _ in range(na)]
            elif op == 70:  # Switch: reg, n, n offsets, end
                a = [r.idx(), r.idx()]; a += [r.idx() for _ in range(a[1])]; a.append(r.idx())
            else:  # CallN/CallMethod/CallThis/CallClosure/MakeEnum: dst, fn, n(u8), args
                a = [r.idx(), r.idx()]; n = r.u8(); a.append(n); a += [r.idx() for _ in range(n)]
            ops.append((op, a))
        dbg = []
        if flags & 1:
            cf, cl, pos = -1, 0, 0
            while pos < nops:
                c = r.u8()
                if c & 1:
                    c >>= 1; cf = (c << 8) | r.u8()
                elif c & 2:
                    delta, cnt = c >> 6, (c >> 2) & 15
                    for _ in range(cnt): dbg.append((cf, cl)); pos += 1
                    cl += delta
                elif c & 4:
                    cl += c >> 3; dbg.append((cf, cl)); pos += 1
                else:
                    b2, b3 = r.u8(), r.u8(); cl = (c >> 3) | (b2 << 5) | (b3 << 13); dbg.append((cf, cl)); pos += 1
            if ver >= 3:
                for _ in range(r.idx()): r.idx(); r.idx()
        funcs.append({"t": ty, "fi": fi, "regs": regs, "ops": ops, "dbg": dbg})
    consts = {}
    for _ in range(nconsts):
        g = r.idx(); consts[g] = [r.idx() for _ in range(r.idx())]
    if r.p != len(r.b):
        print(f"warning: parser stopped at byte {r.p} of {len(r.b)}; opcode table may be out of date", file=sys.stderr)
    return dict(ver=ver, ints=ints, floats=floats, strings=strings, dfiles=dfiles, types=types, globals=globals_,
                natives=natives, funcs=funcs, consts=consts, offsets=offsets, size=len(r.b))


def load(path):
    st = os.stat(path)
    os.makedirs(CACHE_DIR, exist_ok=True)
    cache = os.path.join(CACHE_DIR, f"hl_{st.st_size}_{int(st.st_mtime)}.pkl")
    if os.path.exists(cache):
        return pickle.load(open(cache, "rb")), cache
    m = parse(path)
    pickle.dump(m, open(cache, "wb"))
    return m, cache


# ----------------------------------------------------------------------------------------------------------- naming
class Code:
    def __init__(self, m):
        self.m, self.S, self.T, self.F = m, m["strings"], m["types"], m["funcs"]
        self.fname = {}
        for ti, t in enumerate(self.T):
            if t["k"] in (11, 21):
                cn = self.S[t["name"]]
                for nm, fi, _ in t["protos"]:
                    self.fname[fi] = f"{cn}.{self.S[nm]}"
                flds = self.allfields(ti)
                for fid, fi in t["bindings"]:
                    if fid < len(flds):
                        self.fname.setdefault(fi, f"{cn}.{self.S[flds[fid][0]]}")
        for lib, nm, _, fi in m["natives"]:
            self.fname[fi] = f"native:{self.S[lib]}.{self.S[nm]}"
        self.by_findex = {f["fi"]: i for i, f in enumerate(self.F)}

    def tname(self, ti):
        t = self.T[ti]; k = t["k"]
        if k in (11, 21, 17, 18):
            return self.S[t["name"]]
        return {0: "void", 1: "u8", 2: "u16", 3: "i32", 4: "i64", 5: "f32", 6: "f64", 7: "bool", 8: "bytes", 9: "dyn",
                10: "fun", 12: "array", 13: "type", 14: "ref", 15: "virtual", 16: "dynobj", 19: "null", 20: "method",
                22: "packed"}.get(k, str(k))

    def allfields(self, ti):
        t = self.T[ti]
        if t["k"] == 15:
            return t["fields"]
        if t["k"] not in (11, 21):
            return []
        return (self.allfields(t["super"]) if t["super"] >= 0 else []) + t["fields"]

    def proto(self, ti, pi):
        while ti >= 0 and self.T[ti]["k"] in (11, 21):
            for nm, _, pidx in self.T[ti]["protos"]:
                if pidx == pi:
                    return self.S[nm]
            ti = self.T[ti]["super"]
        return None

    def name(self, fi):
        return self.fname.get(fi, f"f@{fi}")

    def const_string(self, g):
        c = self.m["consts"].get(g)
        if c and self.tname(self.m["globals"][g]) == "String":
            return self.S[c[0]]
        return None

    def field(self, f, reg, fid):
        ti = f["regs"][reg]
        if self.T[ti]["k"] == 19:
            ti = self.T[ti]["t"]
        fl = self.allfields(ti)
        return self.S[fl[fid][0]] if fid < len(fl) else f"?{fid}"

    def fmt(self, f, op, a):
        n, S, M = OPN[op], self.S, self.m
        r = lambda xs: ", ".join(f"r{x}" for x in xs)  # noqa: E731
        try:
            if n == "String": return f'r{a[0]} = "{S[a[1]]}"'
            if n == "Int": return f"r{a[0]} = {M['ints'][a[1]]}"
            if n == "Float": return f"r{a[0]} = {M['floats'][a[1]]}"
            if n in STATIC_CALLS - {"CallN"}: return f"r{a[0]} = {self.name(a[1])}({r(a[2:])})"
            if n == "CallN": return f"r{a[0]} = {self.name(a[1])}({r(a[3:])})"
            if n == "CallMethod":
                ti = f["regs"][a[3]]
                nm = self.proto(ti, a[1])
                if nm is None and self.T[ti]["k"] == 15 and a[1] < len(self.allfields(ti)):
                    nm = S[self.allfields(ti)[a[1]][0]]
                return f"r{a[0]} = r{a[3]}.{nm or 'm%d' % a[1]}({r(a[4:])})"
            if n == "CallThis": return f"r{a[0]} = this.{self.proto(f['regs'][0], a[1]) or 'm%d' % a[1]}({r(a[3:])})"
            if n == "CallClosure": return f"r{a[0]} = r{a[1]}({r(a[3:])})"
            if n == "Field": return f"r{a[0]} = r{a[1]}.{self.field(f, a[1], a[2])}"
            if n == "SetField": return f"r{a[0]}.{self.field(f, a[0], a[1])} = r{a[2]}"
            if n == "GetThis": return f"r{a[0]} = this.{self.field(f, 0, a[1])}"
            if n == "SetThis": return f"this.{self.field(f, 0, a[0])} = r{a[1]}"
            if n == "DynGet": return f"r{a[0]} = r{a[1]}.{S[a[2]]} (dyn)"
            if n == "DynSet": return f"r{a[0]}.{S[a[1]]} = r{a[2]} (dyn)"
            if n == "GetGlobal":
                s = self.const_string(a[1])
                return f'r{a[0]} = "{s}" (const)' if s is not None else f"r{a[0]} = global<{self.tname(M['globals'][a[1]])}>#{a[1]}"
            if n == "SetGlobal": return f"global<{self.tname(M['globals'][a[0]])}>#{a[0]} = r{a[1]}"
            if n == "StaticClosure": return f"r{a[0]} = closure {self.name(a[1])}"
            if n == "InstanceClosure": return f"r{a[0]} = closure {self.name(a[1])} bound r{a[2]}"
            if n == "EnumField": return f"r{a[0]} = r{a[1]}.enum[{a[2]}].{a[3]}"
            if n == "MakeEnum": return f"r{a[0]} = enum<{self.tname(f['regs'][a[0]])}>#{a[1]}({r(a[3:])})"
            if n.startswith("J") and n != "JAlways": return f"{n} {a[:-1]} -> {a[-1]:+d}"
        except (IndexError, KeyError) as e:
            return f"{n} {a} !{e}"
        return f"{n} {a}"

    def loc(self, f, k):
        if k < len(f["dbg"]):
            fi, ln = f["dbg"][k]
            if 0 <= fi < len(self.m["dfiles"]):
                return f"{self.m['dfiles'][fi]}:{ln}"
        return ""

    def head(self, i):
        f = self.F[i]
        return f"#{i} {self.name(f['fi'])}  [{self.loc(f, 0)}, {len(f['ops'])} ops]"

    def dis(self, i, raw=False):
        f = self.F[i]
        args = [self.tname(a) for a in self.T[f["t"]].get("args", [])]
        print(f"===== func #{i} findex {f['fi']} {self.name(f['fi'])}({', '.join(args)})")
        last = None
        for k, (op, a) in enumerate(f["ops"]):
            if not raw and OPN[op] in NOISE:
                continue
            l = self.loc(f, k)
            print(f"  {k:5d} {self.fmt(f, op, a)}" + (f"   // {l}" if l and l != last else ""))
            last = l or last


# ----------------------------------------------------------------------------------------------------------- cdb
def cdb_sheet(path, sheet):
    import json
    d = json.load(open(path, encoding="utf-8-sig"))
    s = next((s for s in d["sheets"] if s["name"] == sheet), None)
    if s is None:
        sys.exit(f"no sheet {sheet}")
    return s["lines"]


# ----------------------------------------------------------------------------------------------------------- commands
def main(argv):
    def opt(name, default):
        if name in argv:
            i = argv.index(name); v = argv[i + 1]; del argv[i:i + 2]; return v
        return default
    dat, cdb = opt("--dat", DEFAULT_DAT), opt("--cdb", DEFAULT_CDB)
    raw = "--raw" in argv
    argv = [a for a in argv if a != "--raw"]
    if not argv:
        print(__doc__); return
    cmd, rest = argv[0], argv[1:]

    if cmd == "cdbidx":
        lines = cdb_sheet(cdb, rest[0])
        key = rest[1]
        if key.lstrip("-").isdigit():
            print(rest[0], key, "->", lines[int(key)].get("id"))
        else:
            hits = [i for i, l in enumerate(lines) if l.get("id") == key]
            print(rest[0], key, "->", hits or "not found")
        return

    m, cache = load(dat)
    c = Code(m)
    if cmd == "info":
        print(f"HLB v{m['ver']}: {len(m['strings'])} strings, {len(m['types'])} types, {len(m['funcs'])} functions, "
              f"{len(m['globals'])} globals, {len(m['consts'])} constant globals\ncache: {cache}")
    elif cmd == "name":
        rx = re.compile(rest[0])
        for i, f in enumerate(c.F):
            if rx.search(c.name(f["fi"])):
                print(c.head(i))
    elif cmd == "find":
        sids = {i for i, s in enumerate(c.S) if rest[0] in s}
        for i, f in enumerate(c.F):
            for op, a in f["ops"]:
                n = OPN[op]
                if (n == "String" and a[1] in sids) or (n == "DynGet" and a[2] in sids) or \
                        (n == "GetGlobal" and a[1] in m["consts"] and m["consts"][a[1]][0] in sids and c.const_string(a[1]) is not None):
                    print(c.head(i)); break
    elif cmd == "dis":
        for x in rest:
            c.dis(int(x), raw)
    elif cmd == "callers":
        target = c.F[int(rest[0])]["fi"]
        for i, f in enumerate(c.F):
            for k, (op, a) in enumerate(f["ops"]):
                if OPN[op] in STATIC_CALLS and a[1] == target:
                    print(f"#{i} {c.name(f['fi'])} op {k}  {c.loc(f, k)}")
    elif cmd in ("ints", "atb"):
        if cmd == "atb":
            lines = cdb_sheet(cdb, "attribute")
            want = {i for i, l in enumerate(lines) if l.get("id") == rest[0]}
            if not want:
                sys.exit(f"attribute {rest[0]} not in {cdb}")
            print(f"attribute {rest[0]} = row {sorted(want)}")
        else:
            want = {int(x) for x in rest}
        for i, f in enumerate(c.F):
            ops = f["ops"]
            for k, (op, a) in enumerate(ops):
                if OPN[op] == "Int" and m["ints"][a[1]] in want:
                    call = next((c.name(aa[1]) for o, aa in ops[k + 1:k + 8] if OPN[o] in STATIC_CALLS), "")
                    if cmd == "atb" and not re.search(r"ttribute|Atb", call):
                        continue
                    print(f"{m['ints'][a[1]]}: #{i} {c.name(f['fi'])} op {k} -> {call}  {c.loc(f, k)}")
    elif cmd == "setfield":
        for i, f in enumerate(c.F):
            for k, (op, a) in enumerate(f["ops"]):
                if OPN[op] in ("SetField", "SetThis", "DynSet"):
                    s = c.fmt(f, op, a)
                    if re.search(rf"\.{re.escape(rest[0])} = ", s):
                        prev = c.fmt(f, *f["ops"][k - 1]) if k else ""
                        print(f"#{i} {c.name(f['fi'])} op {k}: {s}   <- {prev}")
    elif cmd == "floats":
        n = int(rest[0]) if rest else 80
        print(list(enumerate(m["floats"][:n])))
    else:
        print(__doc__)


if __name__ == "__main__":
    main(sys.argv[1:])
