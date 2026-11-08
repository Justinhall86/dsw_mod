#!/usr/bin/env python3
"""The `Ability_N` key starts the Nth ability button, or cancels it the right-click way."""
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from armoury_lib import _guard, by_name, str_ref, op                 # noqa: E402
from armoury_charge import splice                                        # noqa: E402
from loops_lib import resolve, label                              # noqa: E402
from crashlink.opcodes import opcodes as _OPC                    # noqa: E402
opcodes = _OPC
from crashlink import disasm                                     # noqa: E402
from crashlink.core import VarInt, Reg, fIndex, Bytes as _Bytes  # noqa: E402
from copy import deepcopy                                        # noqa: E402

SLOT_INPUT = "Ability_1"
SLOT_GLOBAL = None            # set by apply_w33; the global holding SLOT_INPUT as a real String
ISPRESSED = "lib.$Input.isPressed"
GETBINDS = "lib.$Input.getBindings"
MAPGET = "haxe.ds.StringMap.get"
DOCLICK = "ui.comp.AbilityButton.doClick"
CANCANCEL = "ui.comp.AbilityButton.canCancel"
SETRIGHT = "ui.comp.BaseButton.set_onRightClick"
BINDUPDATE = "ui.comp.BaseElement.bindUpdate"
BTNCTOR = "ui.comp.$AbilityButton.__constructor__"
BTN = "ui.comp.AbilityButton"
ARRO = "hl.types.ArrayObj"
OBJ = "h2d.Object"


def _int_pool_ref(bc, n):
    """Index of `n` in the int pool, appended if absent: an `Int` op names a POOL SLOT."""
    pool = bc.ints.value if hasattr(bc.ints, "value") else bc.ints
    # each value's first slot, kept on the file and read on only past where it was last read
    seen = bc.__dict__.setdefault("_int_slots", [0, {}])
    for i in range(seen[0], len(pool)):
        seen[1].setdefault(getattr(pool[i], "value", pool[i]), i)
    seen[0] = len(pool)
    if n in seen[1]:
        return seen[1][n]
    ent = deepcopy(pool[0])
    if hasattr(ent, "value"):
        ent.value = n
    else:
        ent = n
    pool.append(ent)
    if getattr(bc, "nints", None) is not None:
        bc.nints.value = len(pool)
    return len(pool) - 1


def _mint_string_global(bc, s, verbose=True):
    """A new global holding a REAL String object, its shape copied from a vanilla string global."""
    tmpl = None
    for c in bc.constants:
        try:
            if disasm.type_name(bc, bc.global_types[c._global.value].resolve(bc)) == "String":
                tmpl = c
                break
        except Exception:
            continue
    _guard(tmpl is not None, "no vanilla string global to copy the shape from")

    obj = bc.global_types[tmpl._global.value].resolve(bc).definition
    flds = obj.resolve_fields(bc)
    _guard(len(flds) == len(tmpl.fields),
           "a string global has %d fields but its type declares %d" % (len(tmpl.fields), len(flds)))
    names = [f.name.resolve(bc) for f in flds]
    _guard("bytes" in names, "no `bytes` field on the String type, only %s" % names)
    ib = names.index("bytes")
    _guard(isinstance(flds[ib].type.resolve(bc).definition, _Bytes),
           "the `bytes` field is not a text field -- the shape is not what this assumes")

    gi = len(bc.global_types)
    bc.global_types.append(deepcopy(bc.global_types[tmpl._global.value]))
    if getattr(bc, "nglobals", None) is not None:
        bc.nglobals.value = len(bc.global_types)

    c = deepcopy(tmpl)
    c._global.value = gi
    c.fields[ib].value = str_ref(bc, s)
    if "length" in names:
        c.fields[names.index("length")].value = _int_pool_ref(bc, len(s))
    bc.constants.append(c)
    if getattr(bc, "nconstants", None) is not None:
        bc.nconstants.value = len(bc.constants)

    _guard(bc.strings.value[c.fields[ib].value] == s,
           "the minted global does not point at %r" % s)
    if "length" in names:
        pool = bc.ints.value if hasattr(bc.ints, "value") else bc.ints
        slot = c.fields[names.index("length")].value
        got = getattr(pool[slot], "value", pool[slot])
        _guard(got == len(s), "the minted global's length reads %s, not %d" % (got, len(s)))
    if verbose:
        print("  minted global g@%d holding %r (copied from g@%d)" % (gi, s, tmpl._global.value))
    return gi


def _fields(bc):
    """Every `Field` op in the game by (object type, field name), read in one walk per build."""
    made = bc.__dict__.get("_field_ops")
    if made is not None:
        return made
    made = {}
    for f in bc.functions:
        for i, o in enumerate(f.ops or []):
            if o.op != "Field":
                continue
            m = re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, f.regs, o, i, func=f))
            if m:
                kind = disasm.type_name(bc, f.regs[o.df["obj"].value].resolve(bc))
                made.setdefault((kind, m.group(1)), []).append((f, o))
    bc.__dict__["_field_ops"] = made
    return made


def _fld(bc, name, objtype):
    """A `Field <objtype>.name` template resolved by NAME, guarded to one field index."""
    hits = _fields(bc).get((objtype, name), [])
    _guard(hits, "no `Field <%s>.%s` template anywhere" % (objtype, name))
    idxs = {o.df["field"].value for _f, o in hits}
    _guard(len(idxs) == 1, "`Field <%s>.%s` is ambiguous across %s" % (objtype, name, sorted(idxs)))
    return deepcopy(hits[0][1]), hits[0][0].regs[hits[0][1].df["dst"].value]


def _no_dead_branches(block, label):
    """At BUILD time: no conditional jump we emit may have a zero offset (§6j)."""
    cond = ("JTrue", "JFalse", "JNull", "JNotNull", "JEq", "JNotEq", "JSGte", "JSLt", "JULt")
    for k, o in enumerate(block):
        if o.op in cond and o.df.get("offset") is not None:
            _guard(o.df["offset"].value != 0,
                   "%s: the %s at block op%d jumps to its own fall-through" % (label, o.op, k))


def apply_w33(bc, verbose=True, emit=True):
    """Resolve and publish the handles; `emit=False` splices nothing (abilitywalk emits)."""
    global W33
    pressed_fn = by_name(bc, ISPRESSED)
    click_fn = by_name(bc, DOCLICK)
    cancel_test = by_name(bc, CANCANCEL)
    setright = by_name(bc, SETRIGHT)
    bind_fn = by_name(bc, BINDUPDATE)
    ctor = by_name(bc, BTNCTOR)

    # --- the per-frame closure this button installs through bindUpdate -------------------------
    def _installed_by(setter):
        """(index of the InstanceClosure, its target) for each closure handed to `setter`."""
        outs = []
        for i, o in enumerate(ctor.ops):
            if o.op == "Call2" and getattr(o.df.get("fun"), "value", None) == setter.findex.value:
                j = i - 1
                while j >= 0 and ctor.ops[j].op != "InstanceClosure":
                    j -= 1
                _guard(j >= 0, "no InstanceClosure before the setter at op%d" % i)
                outs.append((j, ctor.ops[j].df["fun"].value))
        return outs

    def _ctx_ops(ic):
        """The EnumAlloc + SetEnumField run that builds the context for the closure made at `ic`."""
        sets = []
        k2 = ic - 1
        while k2 >= 0 and ctor.ops[k2].op == "SetEnumField":
            sets.append(k2)
            k2 -= 1
        _guard(ctor.ops[k2].op == "EnumAlloc",
               "no EnumAlloc before the closure at op%d, found %s" % (ic, ctor.ops[k2].op))
        sets.reverse()
        return k2, sets

    cands = _installed_by(bind_fn)
    _guard(len(cands) == 1,
           "expected exactly ONE per-frame closure on the button, found %s" % cands)
    IC_OUR = cands[0][0]
    fn = next(f for f in bc.functions if f.findex.value == cands[0][1])

    # --- the RIGHT-CLICK road, resolved through the setter and never by a raw index -------------
    rc = _installed_by(setright)
    _guard(len(rc) == 1, "expected exactly ONE right-click handler on the button, found %s" % rc)
    IC, rclick_fi = rc[0]
    rclick_fn = next(f for f in bc.functions if f.findex.value == rclick_fi)
    # its own first act is the same test we gate on -- proof we are not inventing the contract
    _guard(any(o.op == "Call1"
               and getattr(o.df.get("fun"), "value", None) == cancel_test.findex.value
               for o in rclick_fn.ops[:6]),
           "the right-click handler does not begin by asking whether it can cancel -- the road "
           "this build copies has changed shape")

    ALLOC, SET_RC = _ctx_ops(IC)
    _guard(len(SET_RC) == 2,
           "the right-click context has %d fields, expected 2 (the abilities and the button)"
           % len(SET_RC))
    t_alloc = deepcopy(ctor.ops[ALLOC])
    t_setf = [deepcopy(ctor.ops[i]) for i in SET_RC]
    r_ctx = ctor.regs[t_alloc.df["dst"].value]
    # which of the two carries the button, and which the abilities list
    ctx_types = [disasm.type_name(bc, ctor.regs[o.df["src"].value].resolve(bc)) for o in t_setf]
    _guard(ctx_types.count(BTN) == 1 and ctx_types.count(ARRO) == 1,
           "the right-click context is not (an abilities list, a button) but %s" % ctx_types)
    I_ARR, I_BTN = ctx_types.index(ARRO), ctx_types.index(BTN)

    # OUR CONTEXT CARRIES TWO LISTS: pick ours by the register the right-click context fills from
    ALLOC_OUR, SET_OUR = _ctx_ops(IC_OUR)
    R = ctor.ops[SET_RC[I_ARR]].df["src"].value
    lo, hi = min(SET_OUR + SET_RC), max(SET_OUR + SET_RC)
    for i in range(lo, hi + 1):
        o = ctor.ops[i]
        d = o.df.get("dst")
        _guard(not (o.op != "SetEnumField" and d is not None and getattr(d, "value", None) == R),
               "the register the two contexts share is rewritten at constructor op%d (%s), so "
               "matching them by it is unsafe" % (i, o.op))
    mine = [ctor.ops[i] for i in SET_OUR if ctor.ops[i].df["src"].value == R]
    _guard(len(mine) == 1,
           "our context takes the right-click road's list %d times, expected exactly once"
           % len(mine))
    ARRFIELD = mine[0].df["field"].value

    # THE VANILLA ABILITY KEY, IN THIS SAME CLOSURE -- every op of the start road comes from it
    v_press = [i for i, o in enumerate(fn.ops)
               if o.op == "Call1"
               and getattr(o.df.get("fun"), "value", None) == pressed_fn.findex.value]
    v_click = [i for i, o in enumerate(fn.ops)
               if o.op == "Call2"
               and getattr(o.df.get("fun"), "value", None) == click_fn.findex.value]
    _guard(len(v_press) == 1 and len(v_click) == 1,
           "expected exactly one vanilla key question and one vanilla activation in the closure, "
           "found %s and %s -- the template this build copies has moved" % (v_press, v_click))
    P, C_ = v_press[0], v_click[0]
    _guard(fn.ops[P - 1].op == "GetGlobal",
           "the vanilla key question is not fed by a GetGlobal -- the whole premise of this fix")
    _guard(fn.ops[C_ - 1].op == "Null", "the vanilla activation is not preceded by a Null callback")
    t_getglob = deepcopy(fn.ops[P - 1])
    t_press = deepcopy(fn.ops[P])
    t_nullfun = deepcopy(fn.ops[C_ - 1])
    t_click = deepcopy(fn.ops[C_])
    r_str = fn.regs[t_getglob.df["dst"].value]
    r_bool = fn.regs[t_press.df["dst"].value]
    r_fun = fn.regs[t_nullfun.df["dst"].value]
    r_void = fn.regs[t_click.df["dst"].value]
    _guard(disasm.type_name(bc, r_str.resolve(bc)) == "String",
           "the vanilla key name is not a String")
    _guard(disasm.type_name(bc, r_void.resolve(bc)) == "Void",
           "the vanilla activation writes into a %s" % disasm.type_name(bc, r_void.resolve(bc)))

    # --- our own context: the button at one field, the abilities list at another ----------------
    ev = [o for o in fn.ops if o.op == "EnumField"
          and disasm.type_name(bc, fn.regs[o.df["dst"].value].resolve(bc)) == BTN]
    _guard(ev, "the per-frame closure does not carry the button in its context")
    _guard(len({o.df["field"].value for o in ev}) == 1, "more than one button field in the context")
    t_enum = deepcopy(ev[0])
    r_btn = fn.regs[ev[0].df["dst"].value]

    ea = [o for o in fn.ops if o.op == "EnumField"
          and disasm.type_name(bc, fn.regs[o.df["dst"].value].resolve(bc)) == ARRO
          and o.df["field"].value == ARRFIELD]
    _guard(ea, "the closure never reads field %d of its own context as an abilities list -- that "
               "is the field the right-click road wants" % ARRFIELD)
    t_enum_arr = deepcopy(ea[0])
    r_arr = fn.regs[ea[0].df["dst"].value]

    # --- the walk to "am I the first button" ----------------------------------------------------
    t_parent, r_obj = _fld(bc, "parent", OBJ)
    t_children, r_arr2 = _fld(bc, "children", OBJ)
    t_len, r_i32 = _fld(bc, "length", ARRO)
    t_raw, r_raw = _fld(bc, "array", ARRO)
    r_dyn = next(r for f in bc.functions for r in f.regs
                 if disasm.type_name(bc, r.resolve(bc)) == "Dyn")

    # --- the bindings guard ---------------------------------------------------------------------
    gb = by_name(bc, GETBINDS)
    mapget = by_name(bc, MAPGET)
    _gg = next((i for i, o in enumerate(gb.ops)
                if o.op == "Field" and re.search(r'"defaultBinds"',
                    disasm.fmt_op_compact(bc, gb.regs, o, i, func=gb))), None)
    _guard(_gg is not None and gb.ops[_gg - 1].op == "GetGlobal",
           "cannot find the `$Input.defaultBinds` read to clone")
    t_inputglob = deepcopy(gb.ops[_gg - 1])
    t_defbinds = deepcopy(gb.ops[_gg])
    r_inputglob = gb.regs[t_inputglob.df["dst"].value]
    r_map = gb.regs[t_defbinds.df["dst"].value]
    _guard(disasm.type_name(bc, r_map.resolve(bc)) == "haxe.ds.StringMap",
           "defaultBinds is not a StringMap")

    NAMES = [SLOT_INPUT]   # every other `Ability_N` row is read off `input` in game, by abilitywalk
    GLOBALS = [_mint_string_global(bc, s, verbose) for s in NAMES]
    GSLOT = GLOBALS[0]
    global SLOT_GLOBAL
    SLOT_GLOBAL = GSLOT      # capturecancel reuses the SAME name rather than minting a second one

    base = len(fn.regs)
    for r in (r_str, r_bool, r_btn, r_obj, r_obj, r_arr2, r_i32, r_raw, r_dyn, r_btn, r_fun,
              r_void, r_inputglob, r_map, r_dyn, r_i32, r_bool, r_arr, r_ctx):
        fn.regs.append(deepcopy(r))
    (S_ID, S_OK, S_BTN, S_SELF, S_PAR, S_CH, S_LEN, S_RAW, S_DYN, S_FIRST, S_FUN, S_VOID,
     S_IGLOB, S_MAP, S_BIND, S_ZERO, S_CAN, S_ARR, S_CTX) = range(base, base + 19)
    fn.nregs = VarInt(len(fn.regs))
    _guard(disasm.type_name(bc, fn.regs[S_SELF].resolve(bc)) == OBJ, "S_SELF is not an h2d.Object")
    _guard(disasm.type_name(bc, fn.regs[S_ID].resolve(bc)) == "String", "S_ID is not a String")
    _guard(disasm.type_name(bc, fn.regs[S_ARR].resolve(bc)) == ARRO,
           "S_ARR is not an abilities list")

    def clone(t, **kw):
        o = deepcopy(t)
        for k2, v in kw.items():
            o.df[k2] = Reg(v)
        return o

    zero = next(o for o in fn.ops if o.op == "Int")

    def _int(n):
        o = deepcopy(zero)
        o.df["ptr"] = type(zero.df["ptr"])(_int_pool_ref(bc, n))
        o.df["dst"] = Reg(S_ZERO)
        return o

    def _gslot(g):
        o = deepcopy(t_getglob)
        o.df["dst"] = Reg(S_ID)
        o.df["global"] = type(t_getglob.df["global"])(g)
        return o

    # `SetEnumField` names the enum register `value`, NOT `dst`; a `dst` would pass silently
    _guard("value" in t_setf[0].df and "dst" not in t_setf[0].df,
           "SetEnumField's operands are not (value, field, src) but %s" % sorted(t_setf[0].df))
    C = 1     # a block at op0 has no predecessor; the closure's op0 is a harmless `Null <Fun>`

    # ONE BLOCK PER SLOT; a bail in slot k goes to slot k+1, the last slot's to the vanilla body
    block = []
    for k, sname in enumerate(NAMES):
        last = (k == len(NAMES) - 1)
        nxt = "OUT" if last else "SLOT%d" % (k + 1)
        setf = [None, None]
        setf[I_ARR] = clone(t_setf[I_ARR], value=S_CTX, src=S_ARR)
        setf[I_BTN] = clone(t_setf[I_BTN], value=S_CTX, src=S_BTN)
        _guard(all(o.df["value"].value == S_CTX for o in setf),
               "the two fills do not target our context")
        if k:
            block.append(label("SLOT%d" % k))
        block += [
            clone(t_enum, dst=S_BTN),
            op("JNull", reg=Reg(S_BTN), offset=nxt),
            op("UnsafeCast", dst=Reg(S_SELF), src=Reg(S_BTN)),
            clone(t_parent, dst=S_PAR, obj=S_SELF),
            op("JNull", reg=Reg(S_PAR), offset=nxt),
            clone(t_children, dst=S_CH, obj=S_PAR),
            op("JNull", reg=Reg(S_CH), offset=nxt),
            clone(t_len, dst=S_LEN, obj=S_CH),
            _int(k),                       # the slot index -- Ability_1 is the button at 0
            op("JSGte", a=Reg(S_ZERO), b=Reg(S_LEN), offset=nxt),
            clone(t_raw, dst=S_RAW, obj=S_CH),
            op("GetArray", dst=Reg(S_DYN), array=Reg(S_RAW), index=Reg(S_ZERO)),
            op("UnsafeCast", dst=Reg(S_FIRST), src=Reg(S_DYN)),
            op("JNotEq", a=Reg(S_FIRST), b=Reg(S_BTN), offset=nxt),   # not my slot -> try the next
            _gslot(GLOBALS[k]),
            clone(t_inputglob, dst=S_IGLOB),
            clone(t_defbinds, dst=S_MAP, obj=S_IGLOB),
            op("JNull", reg=Reg(S_MAP), offset=nxt),
            op("Call2", dst=Reg(S_BIND), fun=fIndex(mapget.findex.value),
               arg0=Reg(S_MAP), arg1=Reg(S_ID)),
            op("JNull", reg=Reg(S_BIND), offset=nxt),
            clone(t_press, dst=S_OK, arg0=S_ID),                      # the keyboard
            op("JFalse", cond=Reg(S_OK), offset=nxt),
            op("Call1", dst=Reg(S_CAN), fun=fIndex(cancel_test.findex.value),
               arg0=Reg(S_BTN)),                                      # already running?
            op("JFalse", cond=Reg(S_CAN), offset="START%d" % k),
            clone(t_enum_arr, dst=S_ARR),
            clone(t_alloc, dst=S_CTX),
            setf[0],
            setf[1],
            op("Call1", dst=Reg(S_VOID), fun=fIndex(rclick_fi), arg0=Reg(S_CTX)),   # CANCEL
            op("JAlways", offset="OUT"),
            label("START%d" % k),
            clone(t_nullfun, dst=S_FUN),
            clone(t_click, dst=S_VOID, arg0=S_BTN, arg1=S_FUN),                     # ACTIVATE
        ]
        # after acting, skip the next slots; the LAST slot has no jump, it would decide nothing
        if not last:
            block.append(op("JAlways", offset="OUT"))

    if not emit:
        W33 = dict(fn=fn, t_enum=t_enum, t_enum_arr=t_enum_arr, t_alloc=t_alloc, t_setf=t_setf,
                   I_ARR=I_ARR, I_BTN=I_BTN, t_press=deepcopy(t_press),
                   t_getglob=deepcopy(t_getglob),
                   t_nullfun=deepcopy(t_nullfun), t_click=deepcopy(t_click),
                   t_parent=t_parent, t_children=t_children, t_len=t_len, t_raw=t_raw,
                   rclick_fi=rclick_fi, click_fi=click_fn.findex.value,
                   cancel_fi=cancel_test.findex.value, pressed_fi=pressed_fn.findex.value,
                   r_ctx=r_ctx, r_arr=r_arr, r_btn=r_btn, r_str=r_str, r_bool=r_bool,
                   r_fun=r_fun, r_void=r_void, r_obj=r_obj, r_arr2=r_arr2, r_i32=r_i32,
                   r_raw=r_raw, r_dyn=r_dyn, K=0, C=0, NAMES=NAMES, GLOBALS=GLOBALS)
        if verbose:
            print("W33: RESOLVED ONLY, nothing emitted -- the walk in abilitywalk carries it")
        return fn
    block = resolve(block, "W33 ability slots")
    K = len(block)
    _no_dead_branches(block, "W33")
    _guard(sum(1 for o in block if o.op == "Label") == 0,
           "no slot needs a loop header -- a `Label` here means a back-edge crept in")

    n, preds = splice(fn, C, block, "W33 ability slots")
    _guard(n == K, "block length changed")
    # SHAPE-DERIVED, NOT INDEX-PINNED: assert relations the block must satisfy, not positions
    seg = fn.ops[C:C + K]
    N = len(NAMES)
    starts = [i for i, o in enumerate(seg)
              if o.op == "Call2"
              and getattr(o.df.get("fun"), "value", None) == click_fn.findex.value]
    cancels = [i for i, o in enumerate(seg)
               if o.op == "Call1" and getattr(o.df.get("fun"), "value", None) == rclick_fi]
    names_read = [o.df["global"].value for o in seg
                  if o.op == "GetGlobal" and o.df["global"].value in GLOBALS]
    _guard(len(starts) == N, "expected one start road per slot (%d), found %d" % (N, len(starts)))
    _guard(len(cancels) == N,
           "expected one cancel road per slot (%d), found %d" % (N, len(cancels)))
    _guard(names_read == GLOBALS,
           "the slots do not read their own names in order: %s vs %s" % (names_read, GLOBALS))
    _guard(all(c < s for c, s in zip(cancels, starts)),
           "a slot's cancel road does not come before its start road")
    # every jump in the block still lands inside it or on the vanilla body immediately after
    for i, o in enumerate(seg):
        for nm2, pt in opcodes.get(o.op or "", {}).items():
            if pt != "JumpOffset" or o.df.get(nm2) is None:
                continue
            t = i + 1 + o.df[nm2].value
            _guard(0 < t <= K, "block op%d jumps to %d, outside the block (0..%d)" % (i, t, K))
    if verbose:
        print("W33: %d ops at op%d of f@%d (now %d) -- %d slot(s), preds %s"
              % (K, C, fn.findex.value, len(fn.ops), N, preds))
        print("     %s -> buttons 1..%d in displayed order; cancel via f@%d, start via f@%d"
              % (", ".join(NAMES), N, rclick_fi, click_fn.findex.value))
        print("     gate f@%d (canCancel); context cloned from constructor ops %d..%d"
              % (cancel_test.findex.value, ALLOC, IC - 1))
    # published for the unified walk, so it clones the SAME templates; emits nothing
    W33 = dict(fn=fn, t_enum=t_enum, t_enum_arr=t_enum_arr, t_alloc=t_alloc, t_setf=t_setf,
               I_ARR=I_ARR, I_BTN=I_BTN, t_press=deepcopy(t_press), t_getglob=deepcopy(t_getglob),
               t_nullfun=deepcopy(t_nullfun), t_click=deepcopy(t_click),
               rclick_fi=rclick_fi, click_fi=click_fn.findex.value,
               cancel_fi=cancel_test.findex.value, pressed_fi=pressed_fn.findex.value,
               r_ctx=r_ctx, r_arr=r_arr, r_btn=r_btn, r_str=r_str, r_bool=r_bool,
               r_fun=r_fun, r_void=r_void, K=K, C=C)
    return fn


W33 = None      # set by apply_w33; `keycancel` refuses to run before it
