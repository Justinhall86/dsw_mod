#!/usr/bin/env python3
"""Our registers merged where their lives never meet, so no word grows a function's slots."""
from crashlink.opcodes import opcodes

from tools.project import gv

# each function's slot count as the game shipped it, taken before any feature runs
GAME_SLOTS = {}
# a function with these jumps to places we do not follow, so nothing in it is merged
UNFOLLOWED = ("Trap", "Catch", "Asm")
# a register whose address these take is never merged: something reads it through the address
ADDRESSED = {"Ref": ("src",), "RefData": ("src",), "RefOffset": ("reg",)}
# a function gaining fewer than this many slots of ours is left as written
WORTH_IT = 16


def watch(bc):
    """The game's own slot count of every function, before anything of ours is in it."""
    GAME_SLOTS.clear()
    GAME_SLOTS.update({gv(fn.findex): len(fn.regs) for fn in bc.functions})


def _uses(o):
    """(read, written, addressed, every operand object) of one instruction."""
    read, written, addressed, held = [], [], [], []
    for name, kind in opcodes[o.op].items():
        if kind == "Reg":
            held.append(o.df[name])
            r = gv(o.df[name])
            if name in ADDRESSED.get(o.op, ()):
                addressed.append(r)
            if name == "dst" and o.op != "Setref":
                written.append(r)
                if o.op in ("Incr", "Decr"):
                    read.append(r)
            else:
                read.append(r)
        elif kind == "Regs":
            held += list(gv(o.df[name]))
            read += [gv(x) for x in gv(o.df[name])]
    return read, written, addressed, held


def _next(i, o, n):
    """Where control may go after instruction `i`."""
    if o.op in ("Ret", "Throw", "Rethrow"):
        return []
    if o.op == "Switch":
        out = [i + 1 + gv(x) for x in gv(o.df["offsets"])] + [i + 1]
    elif "offset" in o.df:
        out = [i + 1 + gv(o.df["offset"])] + ([] if o.op == "JAlways" else [i + 1])
    else:
        out = [i + 1]
    return [t for t in out if 0 <= t < n]


def _lives(ops, uses):
    """What is live going into and out of each instruction, as bit sets of registers."""
    n = len(ops)
    goes = [_next(i, o, n) for i, o in enumerate(ops)]
    comes = [[] for _ in range(n)]
    for i, there in enumerate(goes):
        for t in there:
            comes[t].append(i)
    use = [sum(1 << r for r in set(u[0])) for u in uses]
    made = [sum(1 << r for r in set(u[1])) for u in uses]
    into, out = [0] * n, [0] * n
    work, waiting = list(range(n)), [True] * n
    while work:
        i = work.pop()
        waiting[i] = False
        after = 0
        for t in goes[i]:
            after |= into[t]
        out[i] = after
        before = use[i] | (after & ~made[i])
        if before != into[i]:
            into[i] = before
            for p in comes[i]:
                if not waiting[p]:
                    waiting[p] = True
                    work.append(p)
    return into, out, made


def _merged(fn, first):
    """Each of our registers onto the lowest one of its kind whose life never meets its own."""
    ops = list(fn.ops)
    uses = [_uses(o) for o in ops]
    into, out, made = _lives(ops, uses)
    kinds = [gv(r) for r in fn.regs]
    addressed = {r for u in uses for r in u[2]}
    # ⛔ ONE READ BEFORE ANY WRITE ON SOME ROAD IN: it holds whatever was there, so it stays alone
    alone = into[0] if ops else 0
    ours = [r for r in range(first, len(kinds)) if r not in addressed and not (alone >> r) & 1]
    mask = sum(1 << r for r in ours)
    meets = {r: 0 for r in ours}
    for i in range(len(ops)):
        written, r = made[i] & mask, 0
        while written:
            if written & 1:
                meets[r] |= (out[i] | made[i]) & ~(1 << r)
            written >>= 1
            r += 1
    for r in ours:
        others, k = meets[r], 0
        while others:
            if others & 1 and k in meets:
                meets[k] |= 1 << r
            others >>= 1
            k += 1
    onto, kept = {}, []
    for r in ours:
        for slot in kept:
            if slot[0] == kinds[r] and not slot[1] & meets[r]:
                slot[1] |= 1 << r
                onto[r] = slot[2]
                break
        else:
            kept.append([kinds[r], 1 << r, r])
    return onto, uses


def _renumbered(fn, onto, uses):
    """Every operand moved to its merged register, and the slots nothing names now dropped."""
    gone = set(onto)
    keep = [r for r in range(len(fn.regs)) if r not in gone]
    now = {r: i for i, r in enumerate(keep)}
    now.update({r: now[slot] for r, slot in onto.items()})
    # ⛔ ONE OBJECT MAY SIT IN TWO INSTRUCTIONS: each is moved once, from what it held before
    seen = {}
    for u in uses:
        for held in u[3]:
            seen.setdefault(id(held), (held, gv(held)))
    for held, was in seen.values():
        held.value = now[was]
    fn.regs[:] = [fn.regs[r] for r in keep]
    if getattr(fn, "nregs", None) is not None:
        fn.nregs.value = len(fn.regs)
    return len(gone)


def merge(bc):
    """Every function of ours, or grown by ours, with its registers merged; what each lost."""
    freed, touched, skipped = 0, [], 0
    for fn in bc.functions:
        game = GAME_SLOTS.get(gv(fn.findex))
        args = len(getattr(getattr(bc.types[gv(fn.type)], "definition", None), "args", None) or [])
        first = max(args, game or 0)
        if len(fn.regs) - first < WORTH_IT:
            continue
        if any(o.op in UNFOLLOWED for o in fn.ops):
            skipped += 1
            continue
        onto, uses = _merged(fn, first)
        if onto:
            lost = _renumbered(fn, onto, uses)
            freed += lost
            touched.append((lost, gv(fn.findex), len(fn.regs)))
    touched.sort(reverse=True)
    return ("REGISTERS: %d slot(s) merged away in %d function(s), %d left alone for a trap; "
            "the most: %s" % (freed, len(touched), skipped, ", ".join(
                "f@%d -%d to %d" % (f, lost, left) for lost, f, left in touched[:4])))
