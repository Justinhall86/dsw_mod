#!/usr/bin/env python3
"""Named ability binds (superseded by `abilitywalk`) and the live village capture cancel."""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import abilitykeys                                                   # noqa: E402
import capturecancel                                                   # noqa: E402
from abilitykeys import _fld, _mint_string_global, _int_pool_ref, _no_dead_branches  # noqa: E402
from armoury_lib import _guard, by_name, str_ref, op                 # noqa: E402
from armoury_charge import splice                                        # noqa: E402
from loops_lib import resolve, label, header                      # noqa: E402
from crashlink import disasm                                     # noqa: E402
from crashlink.opcodes import opcodes                            # noqa: E402
from crashlink.core import VarInt, Reg, strRef, fIndex           # noqa: E402
from copy import deepcopy                                        # noqa: E402
import re                                                        # noqa: E402

ABILITY_COLUMN = "ability"          # the cdb column, and the only row-facing string we mint

HASANNEX = "ent.comp.CaptureComponent.hasPeacefullyAnnexCapture"
BLOCKING = "ui.BaseUI.anyBlockingHightPriorityInputsWindow"
# the gate every gameplay key sits behind; it is the one that covers a confirm dialog
BLOCKING2 = "ui.GameUI.anyBlockingWindow"
INPUT_INIT = "ui.comp.InputBindings.init"
COSTFN = "$HUnit.getEquipmentCost"
COMPARE = "String.__compare"
MAPGET = "haxe.ds.StringMap.get"
ARRO = "hl.types.ArrayObj"
BTN = "ui.comp.AbilityButton"

# probe switches, all off; a list column needs SafeCast, never UnsafeCast
PROBE_SKIP_MATCH = False    # drop the ability-id comparison
PROBE_SKIP_LIST = False     # drop the walk over the row's `ability` list
ENABLE_CANCEL = True        # emit apply_w37cap at all

# staged probe: each numbered key tests a different stage of the cancel road
PROBE_CANCEL_STAGES = False

# probe: each numbered key tests one step down the panel's ability bar chain
PROBE_WHICH_LIST = False
LASTREGS = None             # the register-name map of the last emitted block


# every hand-built op's operand names are checked against crashlink's table before emitting
def _check_operands():
    want = {
        "GetArray": {"dst", "array", "index"},
        "UnsafeCast": {"dst", "src"},
        "SafeCast": {"dst", "src"},
        "ToVirtual": {"dst", "src"},
        "Incr": {"dst"},
        "JNull": {"reg", "offset"},
        "JFalse": {"cond", "offset"},
        "JSGte": {"a", "b", "offset"},
        "JNotEq": {"a", "b", "offset"},
        "JAlways": {"offset"},
        "Call1": {"dst", "fun", "arg0"},
        "Call2": {"dst", "fun", "arg0", "arg1"},
    }
    for name, keys in want.items():
        have = set(opcodes.get(name, {}))
        _guard(have == keys, "opcode %s has operands %s, not %s -- every op built by hand here "
                             "would carry the wrong names" % (name, sorted(have), sorted(keys)))


_FLDC = {}


def fld(bc, name, objtype):
    """`abilitykeys._fld`, memoised: each call formats every `Field` op in the file."""
    k = (id(bc), name, objtype)
    if k not in _FLDC:
        _FLDC[k] = _fld(bc, name, objtype)
    o, r = _FLDC[k]
    return deepcopy(o), r


def _fname(bc, host, o, i=0):
    m = re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, host.regs, o, i, func=host))
    return m.group(1) if m else None


def _reg_of(bc, tname):
    r = next((r for f in bc.functions for r in f.regs
              if disasm.type_name(bc, r.resolve(bc)) == tname), None)
    _guard(r is not None, "no register of type %r anywhere in the file" % tname)
    return deepcopy(r)


def _input_walk_templates(bc):
    """The game's own walk over `$Data.input.all`, by shape out of `InputBindings.init`."""
    ib = by_name(bc, INPUT_INIT)
    i = next((i for i, o in enumerate(ib.ops)
              if o.op == "Field" and _fname(bc, ib, o, i) == "input"
              and i and ib.ops[i - 1].op == "GetGlobal"), None)
    _guard(i is not None,
           "%s does not read `$Data.input` -- the walk this clones has moved" % INPUT_INIT)
    j = next((j for j in range(i + 1, len(ib.ops))
              if ib.ops[j].op == "Field" and _fname(bc, ib, ib.ops[j], j) == "all"), None)
    _guard(j is not None, "no `.all` read after `$Data.input` in %s" % INPUT_INIT)
    k = next((k for k in range(j + 1, len(ib.ops)) if ib.ops[k].op == "SafeCast"), None)
    _guard(k is not None, "no cast of `.all` to a walkable array in %s" % INPUT_INIT)
    v = next((v for v in range(k + 1, len(ib.ops)) if ib.ops[v].op == "ToVirtual"), None)
    _guard(v is not None, "no `ToVirtual` producing an input row in %s" % INPUT_INIT)
    _guard(disasm.type_name(bc, ib.regs[ib.ops[k].df["dst"].value].resolve(bc)) == ARRO,
           "the cast in %s does not produce an %s" % (INPUT_INIT, ARRO))
    rowt = disasm.type_name(bc, ib.regs[ib.ops[v].df["dst"].value].resolve(bc))
    _guard(rowt.startswith("Virtual[") and "bindings" in rowt and "id" in rowt,
           "the row this walk produces is not an input row but %r" % rowt)
    return (deepcopy(ib.ops[i - 1]), deepcopy(ib.ops[i]), deepcopy(ib.ops[j]),
            deepcopy(ib.ops[k]), deepcopy(ib.ops[v]),
            deepcopy(ib.regs[ib.ops[i - 1].df["dst"].value]),
            deepcopy(ib.regs[ib.ops[i].df["dst"].value]),
            deepcopy(ib.regs[ib.ops[j].df["dst"].value]),
            deepcopy(ib.regs[ib.ops[k].df["dst"].value]),
            deepcopy(ib.regs[ib.ops[v].df["dst"].value]), rowt)


def _list_walk_proof(bc):
    """Prove from the game's code that a cdb list column walks as an ArrayObj."""
    f = by_name(bc, COSTFN)
    lab = next((i for i, o in enumerate(f.ops) if o.op == "Label"), None)
    _guard(lab is not None, "%s has no loop over its list column" % COSTFN)
    seg = f.ops[lab:lab + 12]
    names = [_fname(bc, f, o, lab + n) for n, o in enumerate(seg) if o.op == "Field"]
    _guard("length" in names and "array" in names,
           "%s's list walk does not read `length` and `array` (%s)" % (COSTFN, names))
    _guard(any(o.op == "GetArray" for o in seg), "%s's list walk has no GetArray" % COSTFN)
    return lab


class _Blk(object):
    """A block builder that owns its op list, so it cannot emit into the wrong function."""

    def __init__(self, bc, fn, zero_tpl, dg_tpl):
        self.bc, self.fn, self.zero, self.dg = bc, fn, zero_tpl, dg_tpl
        self.ops = []

    def add(self, *o):
        self.ops.extend(o)
        return self

    def clone(self, t, **kw):
        o = deepcopy(t)
        for k, v in kw.items():
            o.df[k] = Reg(v)
        self.ops.append(o)
        return o

    def const(self, dst, n):
        o = deepcopy(self.zero)
        o.df["ptr"] = type(self.zero.df["ptr"])(_int_pool_ref(self.bc, n))
        o.df["dst"] = Reg(dst)
        self.ops.append(o)
        return o

    def dynget(self, dst, obj, name):
        o = deepcopy(self.dg)
        o.df["dst"] = Reg(dst)
        o.df["obj"] = Reg(obj)
        o.df["field"] = strRef(str_ref(self.bc, name))
        self.ops.append(o)
        return o

    def walk(self, arr, idx, out, tag, t_len, t_raw, dyn):
        """Loop header over ArrayObj `arr`, loading each entry into `dyn`; bails to `out`."""
        self.ops.append(header(tag))
        self.clone(t_len, dst=self._len, obj=arr)
        self.add(op("JSGte", a=Reg(idx), b=Reg(self._len), offset=out))
        self.clone(t_raw, dst=self._raw, obj=arr)
        self.add(op("GetArray", dst=Reg(dyn), array=Reg(self._raw), index=Reg(idx)),
                 op("Incr", dst=Reg(idx)),
                 op("JNull", reg=Reg(dyn), offset=tag))
        return self


# =================================================================================================
def apply_w37(bc, verbose=True):
    """NAMED BINDS on the ability button's per-frame routine."""
    _check_operands()
    _guard(abilitykeys.W33 is not None,
           "apply_w33 has not run -- the named binds clone its templates and must follow it")
    W = abilitykeys.W33
    fn = W["fn"]
    _list_walk_proof(bc)

    cmp_fn = by_name(bc, COMPARE)
    (t_data, t_input, t_all, t_cast, t_tovirt,
     r_data, r_idx, r_alld, r_all, r_row, ROWT) = _input_walk_templates(bc)

    t_inf, r_inf = fld(bc, "inf", BTN)
    ABT = disasm.type_name(bc, r_inf.resolve(bc))
    _guard(ABT.startswith("Virtual[") and "otherEffects" in ABT,
           "the ability button's `inf` is not an ability row but %r" % ABT)
    t_abid, r_str = fld(bc, "id", ABT)
    t_rowid, _ = fld(bc, "id", ROWT)
    t_len, r_i32 = fld(bc, "length", ARRO)
    t_raw, r_raw = fld(bc, "array", ARRO)
    r_dyn = _reg_of(bc, "Dyn")
    r_arro = _reg_of(bc, ARRO)
    dg = next(o for f in bc.functions for o in f.ops if o.op == "DynGet")
    zero = next(o for o in fn.ops if o.op == "Int")

    base = len(fn.regs)
    for r in (deepcopy(W["r_btn"]), deepcopy(r_inf), deepcopy(r_str), r_data, r_idx, r_alld, r_all,
              deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_raw),
              deepcopy(r_dyn), deepcopy(r_row), deepcopy(r_dyn), deepcopy(r_arro), deepcopy(r_dyn),
              deepcopy(r_str), deepcopy(r_str), deepcopy(r_i32), deepcopy(W["r_bool"]),
              deepcopy(W["r_bool"]), deepcopy(W["r_fun"]), deepcopy(W["r_void"]),
              deepcopy(W["r_arr"]), deepcopy(W["r_ctx"])):
        fn.regs.append(r)
    (S_BTN, S_INF, S_MYID, S_DATA, S_IDX, S_ALLD, S_ALL, S_I, S_J, S_LEN, S_ZI, S_RAW,
     S_DYN, S_ROW, S_LISTD, S_LIST, S_EID, S_ES, S_ROWID, S_CMP, S_OK, S_CAN, S_FUN,
     S_VOID, S_ARR, S_CTX) = range(base, base + 26)
    fn.nregs = VarInt(len(fn.regs))
    for nm, s, want in (("S_MYID", S_MYID, "String"), ("S_ES", S_ES, "String"),
                        ("S_ALL", S_ALL, ARRO), ("S_LIST", S_LIST, ARRO),
                        ("S_ROW", S_ROW, ROWT), ("S_INF", S_INF, ABT), ("S_BTN", S_BTN, BTN)):
        got = disasm.type_name(bc, fn.regs[s].resolve(bc))
        _guard(got == want, "%s is typed %r, expected %r" % (nm, got, want))

    b = _Blk(bc, fn, zero, dg)
    b._len, b._raw = S_LEN, S_RAW
    b.clone(W["t_enum"], dst=S_BTN)
    b.add(op("JNull", reg=Reg(S_BTN), offset="OUT"))
    b.clone(t_inf, dst=S_INF, obj=S_BTN)
    b.add(op("JNull", reg=Reg(S_INF), offset="OUT"))
    b.clone(t_abid, dst=S_MYID, obj=S_INF)
    b.add(op("JNull", reg=Reg(S_MYID), offset="OUT"))
    b.clone(t_data, dst=S_DATA)
    b.add(op("JNull", reg=Reg(S_DATA), offset="OUT"))
    b.clone(t_input, dst=S_IDX, obj=S_DATA)
    b.add(op("JNull", reg=Reg(S_IDX), offset="OUT"))
    b.clone(t_all, dst=S_ALLD, obj=S_IDX)
    b.add(op("JNull", reg=Reg(S_ALLD), offset="OUT"),
          op("SafeCast", dst=Reg(S_ALL), src=Reg(S_ALLD)),
          op("JNull", reg=Reg(S_ALL), offset="OUT"))
    b.const(S_ZI, 0)
    b.const(S_I, 0)
    b.walk(S_ALL, S_I, "OUT", "ROWTOP", t_len, t_raw, S_DYN)
    b.add(op("ToVirtual", dst=Reg(S_ROW), src=Reg(S_DYN)),
          op("JNull", reg=Reg(S_ROW), offset="ROWTOP"))
    b.dynget(S_LISTD, S_ROW, ABILITY_COLUMN)
    b.add(op("JNull", reg=Reg(S_LISTD), offset="ROWTOP"),
          op("SafeCast", dst=Reg(S_LIST), src=Reg(S_LISTD)),
          op("JNull", reg=Reg(S_LIST), offset="ROWTOP"))
    b.clone(t_rowid, dst=S_ROWID, obj=S_ROW)
    b.add(op("JNull", reg=Reg(S_ROWID), offset="ROWTOP"))
    b.clone(W["t_press"], dst=S_OK, arg0=S_ROWID)
    b.add(op("JFalse", cond=Reg(S_OK), offset="ROWTOP"))
    if not PROBE_SKIP_LIST:
        b.const(S_J, 0)
        b.walk(S_LIST, S_J, "ROWTOP", "ABTOP", t_len, t_raw, S_DYN)
        b.dynget(S_EID, S_DYN, ABILITY_COLUMN)
        b.add(op("JNull", reg=Reg(S_EID), offset="ABTOP"),
              op("UnsafeCast", dst=Reg(S_ES), src=Reg(S_EID)),
              op("JNull", reg=Reg(S_ES), offset="ABTOP"))
    # ⚠ PROBE_SKIP_MATCH drops the comparison: ANY named row's key then fires ANY button
    if not PROBE_SKIP_MATCH:
        b.add(op("Call2", dst=Reg(S_CMP), fun=fIndex(cmp_fn.findex.value),
                 arg0=Reg(S_ES), arg1=Reg(S_MYID)),
              op("JNotEq", a=Reg(S_CMP), b=Reg(S_ZI), offset="ABTOP"))
    b.add(  # --- a hit: the same two roads the positional slot takes ---------------------------
          op("Call1", dst=Reg(S_CAN), fun=fIndex(W["cancel_fi"]), arg0=Reg(S_BTN)),
          op("JFalse", cond=Reg(S_CAN), offset="START"))
    b.clone(W["t_enum_arr"], dst=S_ARR)
    b.clone(W["t_alloc"], dst=S_CTX)
    setf = [None, None]
    setf[W["I_ARR"]] = deepcopy(W["t_setf"][W["I_ARR"]])
    setf[W["I_BTN"]] = deepcopy(W["t_setf"][W["I_BTN"]])
    setf[W["I_ARR"]].df["value"], setf[W["I_ARR"]].df["src"] = Reg(S_CTX), Reg(S_ARR)
    setf[W["I_BTN"]].df["value"], setf[W["I_BTN"]].df["src"] = Reg(S_CTX), Reg(S_BTN)
    _guard(all(o.df["value"].value == S_CTX for o in setf), "the two fills miss our context")
    b.add(setf[0], setf[1],
          op("Call1", dst=Reg(S_VOID), fun=fIndex(W["rclick_fi"]), arg0=Reg(S_CTX)),
          op("JAlways", offset="OUT"))
    b.ops.append(label("START"))
    b.clone(W["t_nullfun"], dst=S_FUN)
    b.clone(W["t_click"], dst=S_VOID, arg0=S_BTN, arg1=S_FUN)

    block = resolve(b.ops, "W37 named ability binds")
    K = len(block)
    _no_dead_branches(block, "W37")
    _guard(sum(1 for o in block if o.op == "Label") == (1 if PROBE_SKIP_LIST else 2),
           "the loop headers do not match the probe switches")
    C = 1
    n, preds = splice(fn, C, block, "W37 named ability binds")
    _guard(n == K, "block length changed")
    seg = fn.ops[C:C + K]
    _guard(sum(1 for o in seg if o.op == "DynGet") == (1 if PROBE_SKIP_LIST else 2),
           "the cdb reads do not match the probe switches")
    _guard(sum(1 for o in seg if o.op == "Call2"
               and getattr(o.df.get("fun"), "value", None) == cmp_fn.findex.value)
           == (0 if PROBE_SKIP_MATCH else 1),
           "the ability ids are not compared by VALUE exactly as the probe switch says")
    _guard(sum(1 for o in seg if o.op.startswith("Call")
               and getattr(o.df.get("fun"), "value", None) == W["click_fi"]) == 1,
           "expected exactly one activation road")
    _guard(sum(1 for o in seg if o.op.startswith("Call")
               and getattr(o.df.get("fun"), "value", None) == W["rclick_fi"]) == 1,
           "expected exactly one cancel road")
    for i, o in enumerate(seg):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt != "JumpOffset" or o.df.get(nm) is None:
                continue
            t = i + 1 + o.df[nm].value
            _guard(0 <= t <= K, "block op%d jumps to %d, outside the block (0..%d)" % (i, t, K))
    if verbose:
        print("W37: %d ops at op%d of f@%d (now %d), preds %s"
              % (K, C, fn.findex.value, len(fn.ops), preds))
        print("     a row's %r list is read with DynGet and matched by value against the button's "
              "own ability; NO row name is minted, so rows are free" % ABILITY_COLUMN)
    return fn


# =================================================================================================
def apply_w37cap(bc, verbose=True):
    """The pressed key ALSO CANCELS a running capture -- whichever key would have STARTED it."""
    _check_operands()
    _guard(capturecancel.W33CAP is not None,
           "apply_w33cap has not run -- this block clones its handles and must follow it")
    P = capturecancel.W33CAP
    fn = P["fn"]
    import abilitywalk          # local: abilitywalk imports from this module, so not at the top
    _guard(abilitywalk.FAMILY_GLOBAL is not None,
           "apply_w38 must run first -- the cancel reuses the SAME prepared family token")
    SC = abilitywalk._string_calls(bc)
    t_idxof, r_i32c = SC["String.indexOf"]
    t_ccat, r_nullv = SC["String.charCodeAt"]

    cmp_fn = by_name(bc, COMPARE)
    mapget = by_name(bc, MAPGET)
    (t_data, t_input, t_all, t_cast, t_tovirt,
     r_data, r_idx, r_alld, r_all, r_row, ROWT) = _input_walk_templates(bc)
    t_rowid, r_str = fld(bc, "id", ROWT)
    t_slen, _rl = abilitywalk.field_from_type(bc, "String", "length", t_rowid)
    t_len, r_i32 = fld(bc, "length", ARRO)
    t_raw, r_raw = fld(bc, "array", ARRO)
    # ---- THE RUNNING CAPTURE: its `kind` IS the ability row id, so the cancel asks for exactly it
    hpa = by_name(bc, HASANNEX)
    CAPT = disasm.type_name(bc, hpa.regs[2].resolve(bc))
    _guard("kind" in CAPT and "sunkNoRefund" in CAPT,
           "%s's capture record is %r -- not the shape this walk clones" % (HASANNEX, CAPT))
    # THE INDICATOR'S `capture` HOLDS THE RUNNING CAPTURE; the PANEL's `capture` holds the indicator
    t_crec, r_crec = abilitywalk.field_by_either(bc, "capture", capturecancel.IND, t_rowid)
    CRECT = disasm.type_name(bc, r_crec.resolve(bc))
    _guard(CRECT == CAPT, "%s.capture holds a %r, not the capture record %r"
           % (capturecancel.IND, CRECT, CAPT))
    # and the read-derived index must agree with the declaration -- the check this detour earned
    _t2, _r2 = abilitywalk.field_from_type(bc, capturecancel.IND, "capture", t_rowid)
    _guard(_t2.df["field"].value == t_crec.df["field"].value,
           "%s.capture is declared at %d but read at %d -- one of the two is not the field this "
           "means" % (capturecancel.IND, _t2.df["field"].value, t_crec.df["field"].value))
    t_kind, r_kind = fld(bc, "kind", CAPT)
    _guard(disasm.type_name(bc, r_kind.resolve(bc)) == "String",
           "a capture's `kind` is not a String but %r" % disasm.type_name(bc, r_kind.resolve(bc)))
    r_capv = deepcopy(hpa.regs[2])
    r_dyn = _reg_of(bc, "Dyn")
    r_arro = _reg_of(bc, ARRO)
    # ---- THE ABILITY BAR, off the panel; indices from the TYPE DECLARATION, never a reader census
    t_disp, r_disp = abilitywalk.field_from_type(bc, capturecancel.HOST, "abilities", t_rowid)
    DISPT = disasm.type_name(bc, r_disp.resolve(bc))
    _guard(DISPT.endswith("AbilitiesDisplayer"),
           "%s.abilities is a %r, not the ability bar" % (capturecancel.HOST, DISPT))
    # `abilityButtons` STAYS EMPTY AT RUN TIME: walk the DISPLAY CHILDREN, cloned from `abilitywalk`
    t_btns = deepcopy(abilitykeys.W33["t_children"])
    r_btns = deepcopy(abilitykeys.W33["r_arr2"])
    _guard(disasm.type_name(bc, r_btns.resolve(bc)) == ARRO,
           "the children list the ability walk uses is not a walkable list but %r"
           % disasm.type_name(bc, r_btns.resolve(bc)))
    t_abils, r_abils = abilitywalk.field_from_type(bc, DISPT, "abilities", t_rowid)
    # THE OPEN-WINDOW LIST: a confirm prompt sits in `ui.BaseUI.windows`, which no named gate counts
    t_wins, r_wins = abilitywalk.field_from_type(bc, "ui.GameUI", "windows", t_rowid)
    _guard(disasm.type_name(bc, r_wins.resolve(bc)) == ARRO,
           "`ui.GameUI.windows` is not a list but %r" % disasm.type_name(bc, r_wins.resolve(bc)))
    t_vis, r_vis = abilitywalk.field_from_type(bc, "h2d.Object", "visible", t_rowid)
    _guard(disasm.type_name(bc, r_vis.resolve(bc)) == "Bool",
           "`h2d.Object.visible` is not a Bool but %r" % disasm.type_name(bc, r_vis.resolve(bc)))
    t_occ, r_occ = abilitywalk.field_from_type(bc, capturecancel.HOST, "occupationActions", t_rowid)
    OCCT = disasm.type_name(bc, r_occ.resolve(bc))
    t_actbtns, r_actbtns = abilitywalk.field_from_type(bc, OCCT, "actionButtons", t_rowid)
    OCBT = "ui.hud.OccupationActionButton"
    t_arow, r_arow = abilitywalk.field_from_type(bc, OCBT, "a", t_rowid)
    ACTT = disasm.type_name(bc, r_arow.resolve(bc))
    _guard(ACTT.startswith("Virtual[") and "id" in ACTT,
           "%s.a is not an action row but %r" % (OCBT, ACTT))
    t_actid, r_actid = fld(bc, "id", ACTT)
    r_ocbtn = _reg_of(bc, OCBT)
    ABILT = disasm.type_name(bc, r_abils.resolve(bc))
    r_abil = _reg_of(bc, "logic.faction.Ability")
    t_ainf, r_ainf = fld(bc, "inf", "logic.faction.Ability")
    AINFT = disasm.type_name(bc, r_ainf.resolve(bc))
    t_aid, r_aid = fld(bc, "id", AINFT)
    _guard(disasm.type_name(bc, r_aid.resolve(bc)) == "String",
           "an ability's id is not a String but %r" % disasm.type_name(bc, r_aid.resolve(bc)))
    t_pkids, r_pkids = abilitywalk.field_from_type(bc, capturecancel.HOST, "children", t_rowid)
    # ---- VANILLA'S KEY GATE: a block outside `Game.updateKeys` must carry that gate itself ----
    blockfn = by_name(bc, BLOCKING)
    blockfn2 = by_name(bc, BLOCKING2)
    _guard(disasm.type_name(bc, blockfn.regs[blockfn.ops[-1].df["ret"].value].resolve(bc)) == "Bool"
           if blockfn.ops and blockfn.ops[-1].op == "Ret" else True,
           "%s does not answer with a Bool" % BLOCKING)
    _ind_init = by_name(bc, capturecancel.IND_INIT)
    _gg_i = next((i for i, o in enumerate(_ind_init.ops)
                  if o.op == "Call1" and getattr(o.df.get("fun"), "value", None) is not None
                  and disasm.full_func_name_str(
                      bc, next(g for g in bc.functions
                               if g.findex.value == o.df["fun"].value)).endswith(".get_game")),
                 None)
    _guard(_gg_i is not None, "%s does not ask for the Game -- the gate cannot be cloned"
           % capturecancel.IND_INIT)
    t_getgame = deepcopy(_ind_init.ops[_gg_i])
    r_game = deepcopy(_ind_init.regs[t_getgame.df["dst"].value])
    _guard(disasm.type_name(bc, r_game.resolve(bc)) == "Game", "that call does not return the Game")
    t_gameui, r_ui = abilitywalk.field_from_type(bc, "Game", "ui", t_rowid)
    _guard(disasm.type_name(bc, r_ui.resolve(bc)) == "ui.GameUI", "`Game.ui` is not the interface")
    r_blk = deepcopy(capturecancel.W33CAP["r_bool"])
    _kids, _ = abilitywalk.field_from_type(bc, DISPT, "children", t_rowid)
    _guard(_kids.df["field"].value == t_btns.df["field"].value,
           "%s.children is declared at %d but the ability walk reads children at %d -- the two "
           "sides would count different lists" % (DISPT, _kids.df["field"].value,
                                                  t_btns.df["field"].value))
    t_inf, r_inf = fld(bc, "inf", BTN)
    ABT = disasm.type_name(bc, r_inf.resolve(bc))
    t_abid, r_bstr = fld(bc, "id", ABT)
    _guard(disasm.type_name(bc, r_bstr.resolve(bc)) == "String",
           "a button's ability id is not a String but %r"
           % disasm.type_name(bc, r_bstr.resolve(bc)))
    # F13: prove the type with the GAME's own test before reading a field off a cast.
    t_cls, t_check, r_cls, r_cand, r_chkok, chk_fi = abilitywalk._typetest(bc)
    g_btncls = abilitywalk._class_global(bc, "ui.comp.$" + BTN.split(".")[-1])
    g_hold = abilitywalk.string_global(bc, abilitywalk.HOLD)     # VANILLA's own, not a copy we mint
    r_btn = _reg_of(bc, BTN)
    for k2, want in (("Mul", {"dst", "a", "b"}), ("Add", {"dst", "a", "b"}),
                     ("Sub", {"dst", "a", "b"}), ("Mov", {"dst", "src"}),
                     ("JEq", {"a", "b", "offset"}), ("JSGt", {"a", "b", "offset"}),
                     ("JSLt", {"a", "b", "offset"}), ("Null", {"dst"})):
        _guard(set(opcodes.get(k2, {})) == want,
               "opcode %s has operands %s, not %s"
               % (k2, sorted(opcodes.get(k2, {})), sorted(want)))
    dg = next(o for f in bc.functions for o in f.ops if o.op == "DynGet")
    zero = next((o for o in fn.ops if o.op == "Int"), None)
    if zero is None:
        zero = next(o for f in bc.functions for o in f.ops if o.op == "Int")
    # nothing is minted here: the only minted string is `abilitywalk`'s family token

    # ---- REGISTERS, AS A NAMED TABLE: a duplicate name is one assertion, not a silent rebind ----
    SPEC = [("S_HOST", P["r_host"]), ("S_CAP", P["r_cap"]), ("S_ELEM", P["r_elem"]),
            ("S_RET", P["r_ret"]), ("S_DATA", r_data), ("S_INPUT", r_idx),
            ("S_ALLD", r_alld), ("S_ALL", r_all),
            ("S_I", r_i32), ("S_J", r_i32), ("S_K", r_i32), ("S_LEN", r_i32), ("S_ZI", r_i32),
            ("S_RAW", r_raw), ("S_DYN", r_dyn), ("S_ROW", r_row),
            ("S_LISTD", r_dyn), ("S_LIST", r_arro), ("S_EID", r_dyn), ("S_ES", r_str),
            ("S_ROWID", r_str), ("S_CMP", r_i32), ("S_OK", P["r_bool"]),
            ("S_FAM", r_str), ("S_SIDX", r_i32c), ("S_FLEN", r_i32), ("S_RLEN", r_i32),
            ("S_ONE", r_i32), ("S_CC", r_nullv), ("S_V", r_i32), ("S_NULLA", r_nullv),
            ("S_CAPV", r_capv), ("S_OS", r_kind),
            # --- the numbered road, KEYBINDS.md 17 ---
            ("S_ROAD", r_i32), ("S_NUM", r_i32), ("S_TEN", r_i32), ("S_C48", r_i32),
            ("S_C57", r_i32), ("S_J2", r_i32), ("S_POS", r_i32), ("S_TWO", r_i32),
            ("S_THREE", r_i32), ("S_ALT", r_arro),
            ("S_WRAP", abilitykeys.W33["r_obj"]), ("S_INNER", r_arro), ("S_T", r_i32),
            ("S_ABIL", r_abil), ("S_AINF", r_ainf), ("S_AID", r_aid),
            ("S_OCC", r_occ), ("S_OCBTN", r_ocbtn), ("S_AROW", r_arow),
            ("S_SELFO", abilitykeys.W33["r_obj"]), ("S_PAR", abilitykeys.W33["r_obj"]),
            ("S_VIS", r_vis),
            ("S_GAME", r_game), ("S_UI", r_ui), ("S_BLK", r_blk),
            ("S_DISP", r_disp), ("S_BTNS", r_btns), ("S_N", r_i32), ("S_S", r_i32),
            ("S_BDYN", r_dyn), ("S_CAND", r_cand), ("S_CLS", r_cls), ("S_ISBTN", r_chkok),
            ("S_SIB", r_btn), ("S_SINF", r_inf), ("S_SID", r_bstr), ("S_HOLD", r_str),
            ("S_P", r_i32), ("S_PDYN", r_dyn), ("S_PROW", r_row), ("S_PLD", r_dyn),
            ("S_PLIST", r_arro), ("S_Q", r_i32), ("S_QID", r_dyn), ("S_QS", r_str)]
    _names = [nm for nm, _ in SPEC]
    _guard(len(set(_names)) == len(_names),
           "a register name is used twice: %s"
           % sorted({n for n in _names if _names.count(n) > 1}))
    base = len(fn.regs)
    for _nm, _r in SPEC:
        fn.regs.append(deepcopy(_r))
    S = dict((nm, base + i) for i, (nm, _) in enumerate(SPEC))
    global LASTREGS
    LASTREGS = dict(S)          # so the dump can print names instead of numbers
    (S_HOST, S_CAP, S_ELEM, S_RET, S_DATA, S_INPUT, S_ALLD, S_ALL) = (
        S["S_HOST"], S["S_CAP"], S["S_ELEM"], S["S_RET"], S["S_DATA"], S["S_INPUT"],
        S["S_ALLD"], S["S_ALL"])
    (S_I, S_J, S_K, S_LEN, S_ZI, S_RAW, S_DYN, S_ROW) = (
        S["S_I"], S["S_J"], S["S_K"], S["S_LEN"], S["S_ZI"], S["S_RAW"], S["S_DYN"], S["S_ROW"])
    (S_LISTD, S_LIST, S_EID, S_ES, S_ROWID, S_CMP, S_OK) = (
        S["S_LISTD"], S["S_LIST"], S["S_EID"], S["S_ES"], S["S_ROWID"],
        S["S_CMP"], S["S_OK"])
    (S_FAM, S_SIDX, S_FLEN, S_RLEN, S_ONE, S_CC, S_V, S_NULLA) = (
        S["S_FAM"], S["S_SIDX"], S["S_FLEN"], S["S_RLEN"], S["S_ONE"], S["S_CC"],
        S["S_V"], S["S_NULLA"])
    (S_CAPV, S_OS) = (S["S_CAPV"], S["S_OS"])
    (S_ROAD, S_NUM, S_TEN, S_C48, S_C57, S_J2, S_POS) = (
        S["S_ROAD"], S["S_NUM"], S["S_TEN"], S["S_C48"], S["S_C57"], S["S_J2"], S["S_POS"])
    (S_TWO, S_THREE, S_ALT) = (S["S_TWO"], S["S_THREE"], S["S_ALT"])
    (S_WRAP, S_INNER, S_T, S_GAME, S_UI, S_BLK) = (
        S["S_WRAP"], S["S_INNER"], S["S_T"], S["S_GAME"], S["S_UI"], S["S_BLK"])
    (S_ABIL, S_AINF, S_AID) = (S["S_ABIL"], S["S_AINF"], S["S_AID"])
    (S_OCC, S_OCBTN, S_AROW) = (S["S_OCC"], S["S_OCBTN"], S["S_AROW"])
    (S_SELFO, S_PAR) = (S["S_SELFO"], S["S_PAR"])
    S_VIS = S["S_VIS"]
    (S_DISP, S_BTNS, S_N, S_S, S_BDYN, S_CAND, S_CLS, S_ISBTN) = (
        S["S_DISP"], S["S_BTNS"], S["S_N"], S["S_S"], S["S_BDYN"], S["S_CAND"],
        S["S_CLS"], S["S_ISBTN"])
    (S_SIB, S_SINF, S_SID, S_HOLD, S_P, S_PDYN, S_PROW, S_PLD, S_PLIST, S_Q, S_QID, S_QS) = (
        S["S_SIB"], S["S_SINF"], S["S_SID"], S["S_HOLD"], S["S_P"], S["S_PDYN"], S["S_PROW"],
        S["S_PLD"], S["S_PLIST"], S["S_Q"], S["S_QID"], S["S_QS"])
    fn.nregs = VarInt(len(fn.regs))
    for nm, s, want in (("S_ROW", S_ROW, ROWT), ("S_ALL", S_ALL, ARRO), ("S_LIST", S_LIST, ARRO),
                        ("S_ES", S_ES, "String"),
                        ("S_OS", S_OS, "String"), ("S_CAPV", S_CAPV, CAPT),
                        ("S_ELEM", S_ELEM, P["elemt"]),
                        ("S_PROW", S_PROW, ROWT), ("S_PLIST", S_PLIST, ARRO),
                        ("S_BTNS", S_BTNS, ARRO), ("S_SIB", S_SIB, BTN),
                        ("S_SID", S_SID, "String"), ("S_HOLD", S_HOLD, "String"),
                        ("S_QS", S_QS, "String"), ("S_DISP", S_DISP, DISPT)):
        got = disasm.type_name(bc, fn.regs[s].resolve(bc))
        _guard(got == want, "%s is typed %r, expected %r" % (nm, got, want))

    b = _Blk(bc, fn, zero, dg)
    b._len, b._raw = S_LEN, S_RAW

    def gg(tpl, dst, g):
        o = deepcopy(tpl)
        o.df["dst"] = Reg(dst)
        o.df["global"] = type(tpl.df["global"])(g)
        b.ops.append(o)
        return o

    if P["t_self"] is not None:
        b.clone(P["t_self"], dst=S_HOST)
    else:
        b.add(op("Mov", dst=Reg(S_HOST), src=Reg(0)))
    b.add(op("JNull", reg=Reg(S_HOST), offset="OUT"),
          # the indicator, straight off the panel -- and the CHEAP gate: no capture, no walk
          op("Field", dst=Reg(S_CAP), obj=Reg(S_HOST), field=deepcopy(P["capfield"])),
          op("JNull", reg=Reg(S_CAP), offset="OUT"))
    # THE CONSTANTS COME FIRST: HashLink does not zero registers, and the window gate reads S_ZI
    b.const(S_ZI, 0)
    b.const(S_ONE, 1)
    # VANILLA'S KEYBOARD GATE, off during a probe so that a probe varies ONE thing
    if not PROBE_WHICH_LIST:
        b.clone(t_getgame, dst=S_GAME, arg0=S_CAP)
        b.add(op("JNull", reg=Reg(S_GAME), offset="OUT"))
        b.clone(t_gameui, dst=S_UI, obj=S_GAME)
        b.add(op("JNull", reg=Reg(S_UI), offset="OUT"),
              op("Call1", dst=Reg(S_BLK), fun=fIndex(blockfn.findex.value), arg0=Reg(S_UI)),
              op("JTrue", cond=Reg(S_BLK), offset="OUT"),
              # ...the broader one every gameplay key sits behind (chat, pause and the like)...
              op("Call1", dst=Reg(S_BLK), fun=fIndex(blockfn2.findex.value), arg0=Reg(S_UI)),
              op("JTrue", cond=Reg(S_BLK), offset="OUT"))
    # ...AND THE ONE THAT STOPS THE REFUND SPAM: refuse the key while ANY window is open
    b.clone(t_wins, dst=S_ALT, obj=S_UI)
    b.add(op("JNull", reg=Reg(S_ALT), offset="NOWIN"))
    b.clone(t_len, dst=S_LEN, obj=S_ALT)
    b.add(op("JSGte", a=Reg(S_ZI), b=Reg(S_LEN), offset="NOWIN"),
          op("JAlways", offset="OUT"))
    b.ops.append(label("NOWIN"))
    b.clone(t_data, dst=S_DATA)
    b.add(op("JNull", reg=Reg(S_DATA), offset="OUT"))
    b.clone(t_input, dst=S_INPUT, obj=S_DATA)
    b.add(op("JNull", reg=Reg(S_INPUT), offset="OUT"))
    b.clone(t_all, dst=S_ALLD, obj=S_INPUT)
    b.add(op("JNull", reg=Reg(S_ALLD), offset="OUT"),
          op("SafeCast", dst=Reg(S_ALL), src=Reg(S_ALLD)),
          op("JNull", reg=Reg(S_ALL), offset="OUT"))
    b.const(S_I, 0)          # S_ZI and S_ONE are set above the gate, deliberately
    b.walk(S_ALL, S_I, "OUT", "ROWTOP", t_len, t_raw, S_DYN)
    b.add(op("ToVirtual", dst=Reg(S_ROW), src=Reg(S_DYN)),
          op("JNull", reg=Reg(S_ROW), offset="ROWTOP"))
    b.clone(t_rowid, dst=S_ROWID, obj=S_ROW)
    b.add(op("JNull", reg=Reg(S_ROWID), offset="ROWTOP"))
    b.clone(P["t_press"], dst=S_OK, arg0=S_ROWID)
    b.add(op("JFalse", cond=Reg(S_OK), offset="ROWTOP"))
    b.dynget(S_LISTD, S_ROW, ABILITY_COLUMN)
    b.add(op("JNull", reg=Reg(S_LISTD), offset="NUMROAD"),
          op("SafeCast", dst=Reg(S_LIST), src=Reg(S_LISTD)),
          op("JNull", reg=Reg(S_LIST), offset="NUMROAD"))
    # ---- NAMED: the row names the ability outright ----------------------------------------------
    b.const(S_J, 0)
    b.walk(S_LIST, S_J, "ROWTOP", "ABTOP", t_len, t_raw, S_DYN)
    b.dynget(S_EID, S_DYN, ABILITY_COLUMN)
    b.add(op("JNull", reg=Reg(S_EID), offset="ABTOP"),
          op("UnsafeCast", dst=Reg(S_ES), src=Reg(S_EID)),
          op("JNull", reg=Reg(S_ES), offset="ABTOP"))
    b.const(S_ROAD, 0)                      # assigned on EVERY path into the shared tail
    b.add(op("JAlways", offset="HAVEID"))

    # ==== THE NUMBERED ROAD: the slot number comes out of the row's own id; no position is fixed
    b.ops.append(label("NUMROAD"))
    b.const(S_ROAD, 1)
    gg(P["t_getglob"], S_FAM, abilitywalk.FAMILY_GLOBAL)   # the SAME prepared token, never a copy
    b.add(op("Null", dst=Reg(S_NULLA)))
    b.clone(t_idxof, dst=S_SIDX, arg0=S_ROWID, arg1=S_FAM, arg2=S_NULLA)
    b.add(op("JNotEq", a=Reg(S_SIDX), b=Reg(S_ZI), offset="ROWTOP"))     # must START with it
    b.clone(t_slen, dst=S_FLEN, obj=S_FAM)
    b.clone(t_slen, dst=S_RLEN, obj=S_ROWID)
    b.add(op("Mov", dst=Reg(S_J2), src=Reg(S_FLEN)),
          op("JSGte", a=Reg(S_J2), b=Reg(S_RLEN), offset="ROWTOP"))      # nothing after the token
    b.const(S_NUM, 0)
    b.const(S_TEN, 10)
    b.const(S_C48, 48)
    b.const(S_C57, 57)
    b.ops.append(header("DIGTOP"))
    b.add(op("JSGte", a=Reg(S_J2), b=Reg(S_RLEN), offset="DIGDONE"))
    b.clone(t_ccat, dst=S_CC, arg0=S_ROWID, arg1=S_J2)
    b.add(op("JNull", reg=Reg(S_CC), offset="ROWTOP"),
          op("SafeCast", dst=Reg(S_V), src=Reg(S_CC)),
          op("JSLt", a=Reg(S_V), b=Reg(S_C48), offset="ROWTOP"),
          op("JSGt", a=Reg(S_V), b=Reg(S_C57), offset="ROWTOP"),
          op("Mul", dst=Reg(S_NUM), a=Reg(S_NUM), b=Reg(S_TEN)),
          op("Sub", dst=Reg(S_V), a=Reg(S_V), b=Reg(S_C48)),
          op("Add", dst=Reg(S_NUM), a=Reg(S_NUM), b=Reg(S_V)),
          op("Incr", dst=Reg(S_J2)),
          op("JAlways", offset="DIGTOP"))
    b.ops.append(label("DIGDONE"))
    b.add(op("Sub", dst=Reg(S_POS), a=Reg(S_NUM), b=Reg(S_ONE)),         # Ability_1 is position 0
          op("JSLt", a=Reg(S_POS), b=Reg(S_ZI), offset="ROWTOP"))
    if PROBE_CANCEL_STAGES:
        # STAGE A -- slot 1 only: cancel with no walk and no comparison at all.
        b.add(op("JNotEq", a=Reg(S_POS), b=Reg(S_ZI), offset="NOTA"),
              op("UnsafeCast", dst=Reg(S_ELEM), src=Reg(S_CAP)))
        b.clone(P["t_try"], dst=S_RET, arg0=S_ELEM)
        b.add(op("JAlways", offset="OUT"))
        b.ops.append(label("NOTA"))
    if PROBE_WHICH_LIST:
        # ==== FOUR CANDIDATE LISTS, ONE PER KEY: each road only measures ====
        b.const(S_TWO, 2)
        b.const(S_THREE, 3)
        # no loops: each key stops one op further down the SAME chain
        def _cancel():
            b.add(op("UnsafeCast", dst=Reg(S_ELEM), src=Reg(S_CAP)))
            b.clone(P["t_try"], dst=S_RET, arg0=S_ELEM)
            b.add(op("JAlways", offset="OUT"))

        # the hardest question sits on the key proven to fire; the others cannot fail
        def _first(arr_from, dst_arr, t_field, obj):
            """entry zero of `obj.<field>`, guarded on length; leaves it in S_BDYN."""
            b.clone(t_field, dst=dst_arr, obj=obj)
            b.add(op("JNull", reg=Reg(dst_arr), offset="ROWTOP"))
            b.clone(t_len, dst=S_LEN, obj=dst_arr)
            b.add(op("JSGte", a=Reg(S_ZI), b=Reg(S_LEN), offset="ROWTOP"))
            b.clone(t_raw, dst=S_RAW, obj=dst_arr)
            b.add(op("GetArray", dst=Reg(S_BDYN), array=Reg(S_RAW), index=Reg(S_ZI)),
                  op("JNull", reg=Reg(S_BDYN), offset="ROWTOP"))

        def _isbutton(to):
            b.add(op("UnsafeCast", dst=Reg(S_CAND), src=Reg(S_BDYN)))
            gg(t_cls, S_CLS, g_btncls)
            b.add(op("Call2", dst=Reg(S_ISBTN), fun=fIndex(chk_fi),
                     arg0=Reg(S_CLS), arg1=Reg(S_CAND)),
                  op("JFalse", cond=Reg(S_ISBTN), offset=to))

        # --- Ability_1: road Q, cancel only while NO window is open (the intended fix, in place)
        b.add(op("JNotEq", a=Reg(S_POS), b=Reg(S_ZI), offset="PB"))
        b.clone(t_getgame, dst=S_GAME, arg0=S_CAP)
        b.add(op("JNull", reg=Reg(S_GAME), offset="ROWTOP"))
        b.clone(t_gameui, dst=S_UI, obj=S_GAME)
        b.add(op("JNull", reg=Reg(S_UI), offset="ROWTOP"))
        b.clone(t_wins, dst=S_ALT, obj=S_UI)
        b.add(op("JNull", reg=Reg(S_ALT), offset="QGO"))
        b.clone(t_len, dst=S_LEN, obj=S_ALT)
        b.add(op("JSGte", a=Reg(S_ZI), b=Reg(S_LEN), offset="QGO"),
              op("JAlways", offset="ROWTOP"))          # a window is open: refuse, like the mouse
        b.ops.append(label("QGO"))
        _cancel()
        b.ops.append(label("PB"))
        # --- Ability_2 (Shift+W): the INVERSE -- cancel only while a window IS open
        b.add(op("JNotEq", a=Reg(S_POS), b=Reg(S_ONE), offset="PC"))
        b.clone(t_getgame, dst=S_GAME, arg0=S_CAP)
        b.add(op("JNull", reg=Reg(S_GAME), offset="ROWTOP"))
        b.clone(t_gameui, dst=S_UI, obj=S_GAME)
        b.add(op("JNull", reg=Reg(S_UI), offset="ROWTOP"))
        b.clone(t_wins, dst=S_ALT, obj=S_UI)
        b.add(op("JNull", reg=Reg(S_ALT), offset="ROWTOP"))
        b.clone(t_len, dst=S_LEN, obj=S_ALT)
        b.add(op("JSGte", a=Reg(S_ZI), b=Reg(S_LEN), offset="ROWTOP"))
        _cancel()
        # --- Ability_3 (Shift+C): unconditional -- the positive control
        b.ops.append(label("PC"))
        b.add(op("JNotEq", a=Reg(S_POS), b=Reg(S_TWO), offset="PD"))
        _cancel()
        b.ops.append(label("PD"))
        b.add(op("JAlways", offset="ROWTOP"))
        b.ops.append(label("HAVEID"))
        b.clone(t_crec, dst=S_CAPV, obj=S_CAP)
        b.add(op("JNull", reg=Reg(S_CAPV), offset="OEDONE"))
        b.clone(t_kind, dst=S_OS, obj=S_CAPV)
        b.add(op("JNull", reg=Reg(S_OS), offset="OEDONE"),
              op("Call2", dst=Reg(S_CMP), fun=fIndex(cmp_fn.findex.value),
                 arg0=Reg(S_OS), arg1=Reg(S_ES)),
              op("JNotEq", a=Reg(S_CMP), b=Reg(S_ZI), offset="OEDONE"),
              op("UnsafeCast", dst=Reg(S_ELEM), src=Reg(S_CAP)))
        b.clone(P["t_try"], dst=S_RET, arg0=S_ELEM)
        b.add(op("JAlways", offset="OUT"))
        b.ops.append(label("OEDONE"))
        b.add(op("JNotEq", a=Reg(S_ROAD), b=Reg(S_ZI), offset="ROWTOP"),
              op("JAlways", offset="ABTOP"))
        block = resolve(b.ops, "W37 cancel (list probe)")
        K = len(block)
        _no_dead_branches(block, "W37cap probe")
        C = 1
        n, preds = splice(fn, C, block, "W37 cancel (list probe)")
        _guard(n == K, "block length changed")
        if verbose:
            print("W37cap: LIST PROBE, %d ops at op%d of f@%d -- Ability_1..4 each test one "
                  "candidate list and cancel iff it is usable. NOT a fix."
                  % (K, C, fn.findex.value))
        return fn
    # ==== THE NUMBERED ROAD: the slot is the indicator's place among its parent's VISIBLE children
    b.add(op("UnsafeCast", dst=Reg(S_SELFO), src=Reg(S_CAP)))
    b.clone(abilitykeys.W33["t_parent"], dst=S_PAR, obj=S_SELFO)
    b.add(op("JNull", reg=Reg(S_PAR), offset="ROWTOP"))
    b.clone(abilitykeys.W33["t_children"], dst=S_ALT, obj=S_PAR)
    b.add(op("JNull", reg=Reg(S_ALT), offset="ROWTOP"))
    b.const(S_S, 0)
    b.const(S_N, 0)
    b.walk(S_ALT, S_S, "ROWTOP", "FINDTOP", t_len, t_raw, S_BDYN)
    b.add(op("UnsafeCast", dst=Reg(S_WRAP), src=Reg(S_BDYN)),
          op("JNotEq", a=Reg(S_WRAP), b=Reg(S_SELFO), offset="NOTME"),
          # this IS the indicator: the visible things before it are its slot
          op("JNotEq", a=Reg(S_N), b=Reg(S_POS), offset="ROWTOP"),
          op("UnsafeCast", dst=Reg(S_ELEM), src=Reg(S_CAP)))
    b.clone(P["t_try"], dst=S_RET, arg0=S_ELEM)
    b.add(op("JAlways", offset="OUT"))
    b.ops.append(label("NOTME"))
    b.clone(t_vis, dst=S_VIS, obj=S_WRAP)
    b.add(op("JFalse", cond=Reg(S_VIS), offset="FINDTOP"),
          op("Incr", dst=Reg(S_N)),
          op("JAlways", offset="FINDTOP"))

    # ==== SHARED TAIL: the running capture's `kind` against the ability id, by VALUE ====
    b.ops.append(label("HAVEID"))
    b.clone(t_crec, dst=S_CAPV, obj=S_CAP)
    b.add(op("JNull", reg=Reg(S_CAPV), offset="OEDONE"))
    b.clone(t_kind, dst=S_OS, obj=S_CAPV)
    b.add(op("JNull", reg=Reg(S_OS), offset="OEDONE"),
          op("Call2", dst=Reg(S_CMP), fun=fIndex(cmp_fn.findex.value),
             arg0=Reg(S_OS), arg1=Reg(S_ES)),
          op("JNotEq", a=Reg(S_CMP), b=Reg(S_ZI), offset="OEDONE"),
          # --- a hit: the same road the mouse's right-click takes ------------------------------
          op("UnsafeCast", dst=Reg(S_ELEM), src=Reg(S_CAP)))
    b.clone(P["t_try"], dst=S_RET, arg0=S_ELEM)
    b.add(op("JAlways", offset="OUT"))
    # no match: a NAMED row resumes its own list, the numbered road moves to the next key
    b.ops.append(label("OEDONE"))
    b.add(op("JNotEq", a=Reg(S_ROAD), b=Reg(S_ZI), offset="ROWTOP"),
          op("JAlways", offset="ABTOP"))

    block = resolve(b.ops, "W37 cancel")
    K = len(block)
    _no_dead_branches(block, "W37cap")
    # FOUR loop headers (rows, the row's abilities, the digits, the indicator walk)
    _guard(sum(1 for o in block if o.op == "Label") == 4,
           "expected four loop headers, found %d" % sum(1 for o in block if o.op == "Label"))
    C = 1
    _guard(len(fn.ops) > C, "the per-frame routine is too short to splice into")
    n, preds = splice(fn, C, block, "W37 cancel")
    _guard(n == K, "block length changed")
    seg = fn.ops[C:C + K]
    # THE SHAPE ASSERTION IS A RELATION: the block jumps clear of the no-match tail
    cancels = [i for i, o in enumerate(seg) if o.op == "Call1"
               and getattr(o.df.get("fun"), "value", None) == P["tryfi"]]
    # TWO cancels: NAMED matches the capture's kind, NUMBERED the slot the indicator occupies
    WANTC = 3 if PROBE_CANCEL_STAGES else 2
    _guard(len(cancels) == WANTC,
           "expected %d cancel road(s)%s, found %s"
           % (WANTC, " (probe stages A and B plus the real one)" if PROBE_CANCEL_STAGES else "",
              cancels))
    for c in cancels:
        _guard(seg[c].df["arg0"].value == S_ELEM, "a cancel is not handed the indicator")
    _guard(sum(1 for o in seg if o.op == "DynGet") == 2,
           "the block should read exactly two cdb values by name, found %d"
           % sum(1 for o in seg if o.op == "DynGet"))
    # ONE value comparison: only the NAMED road matches an id; the numbered compares POINTERS
    _guard(sum(1 for o in seg if o.op == "Call2"
               and getattr(o.df.get("fun"), "value", None) == cmp_fn.findex.value) == 1,
           "expected one value comparison, found %d"
           % sum(1 for o in seg if o.op == "Call2"
                 and getattr(o.df.get("fun"), "value", None) == cmp_fn.findex.value))
    # THE USER'S DEFECT, ASSERTED: the cancel compares against a RUNNING CAPTURE's own `kind`
    guardcmp = [i for i, o in enumerate(seg) if o.op == "Call2"
                and getattr(o.df.get("fun"), "value", None) == cmp_fn.findex.value
                and {o.df["arg0"].value, o.df["arg1"].value} == {S_OS, S_ES}]
    _guard(len(guardcmp) == 1 and guardcmp[0] < cancels[-1],
           "the cancel is not guarded by a running capture's own kind (%s vs %s)"
           % (guardcmp, cancels))
    _guard([i for i, o in enumerate(seg) if o.op == "Field"
            and o.df["dst"].value == S_OS and o.df["obj"].value == S_CAPV],
           "the thing compared is not read off a capture record")
    # AND THE RECORD COMES OFF THE INDICATOR WE HOLD, not off the panel's `structure`
    _guard([i for i, o in enumerate(seg) if o.op == "Field"
            and o.df["dst"].value == S_CAPV and o.df["obj"].value == S_CAP],
           "the capture record is not read off the indicator")
    # THE NUMBERED ROAD: the slot is found via the INDICATOR's parent, by POINTER EQUALITY
    par = [i for i, o in enumerate(seg) if o.op == "Field"
           and o.df["dst"].value == S_PAR and o.df["obj"].value == S_SELFO]
    _guard(par, "the row the slot is counted in is not the indicator's own parent")
    kids = [i for i, o in enumerate(seg) if o.op == "Field"
            and o.df["dst"].value == S_ALT and o.df["obj"].value == S_PAR]
    _guard(kids and min(kids) > min(par), "the children walked are not that parent's")
    ident = [i for i, o in enumerate(seg) if o.op == "JNotEq"
             and {o.df["a"].value, o.df["b"].value} == {S_WRAP, S_SELFO}]
    _guard(len(ident) == 1, "the indicator is not found by identity, exactly once (%s)" % ident)
    # AND THE COUNT SKIPS WHAT THE PLAYER CANNOT SEE: the ability's own button is HIDDEN
    vis = [i for i, o in enumerate(seg) if o.op == "Field"
           and o.df["dst"].value == S_VIS and o.df["obj"].value == S_WRAP]
    _guard(len(vis) == 1, "the walk does not ask whether a child is visible (%s)" % vis)
    _guard([i for i, o in enumerate(seg) if o.op == "JFalse" and o.df["cond"].value == S_VIS],
           "it reads `visible` but does not skip on it")
    # and the position it is compared against must be DERIVED from the row's own id, never loaded
    posw = [i for i, o in enumerate(seg) if o.df.get("dst") is not None
            and o.op in ("Int", "Sub", "Mov", "Add", "Mul", "Incr")
            and o.df["dst"].value == S_POS]
    _guard(len(posw) == 1 and seg[posw[0]].op == "Sub",
           "the slot the index is compared against must be derived from the row's own id, not "
           "loaded (writes to it: %s)" % [(i, seg[i].op) for i in posw])
    # the one cast on this road feeds a POINTER COMPARISON, safe without a proof
    _guard(not [i for i, o in enumerate(seg) if o.op == "Call2"
                and getattr(o.df.get("fun"), "value", None) == chk_fi],
           "this road needs no class test -- if one is back, so is the guessing it belonged to")
    for i, o in enumerate(seg):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt != "JumpOffset" or o.df.get(nm) is None:
                continue
            t = i + 1 + o.df[nm].value
            _guard(0 <= t <= K, "block op%d jumps to %d, outside the block (0..%d)" % (i, t, K))
    if verbose:
        print("W37cap: %d ops at op%d of f@%d (now %d), preds %s"
              % (K, C, fn.findex.value, len(fn.ops), preds))
        print("     gated on the panel's capture field first; the numbered road counts to the slot "
              "in the row's own id over %s.abilityButtons, skipping a claimed ability and "
              "HoldPosition (g@%d); it cancels only when a RUNNING capture's own kind is that "
              "ability -- no marker, nothing minted here" % (DISPT, g_hold))
    return fn
