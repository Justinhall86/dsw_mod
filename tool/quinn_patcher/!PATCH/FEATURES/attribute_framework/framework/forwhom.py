#!/usr/bin/env python3
"""Who an act is for (`ForMe`, `ForAll`); each act, factor and plain gate one shared function."""
from copy import copy

from tools.project import gv, guard
from tools.hlcode import assemble, number, template, written
from framework import mark, multmatch
from framework.columns import PART_FOR_NARROWING
from framework.effectdata import STAMP_IS
from framework.foreignwalk import EVERY_ONE, HOW_MANY, WHOSE_RULE
from framework.ownermatch import ASKED_AS
from framework.parsed import loaded
from framework.ridermatch import NAMED as RIDER, emit_taken, emit_walks
from framework.scopematch import PAYEE

# the payee's main base, which moves with the payee
THE_BASE = "main_base"
# what a multiplier's file names: the narrowing that picks the other side of what it counts
PARTNERED_BY = "PARTNERED"


def partnered_words():
    """Every multiplier a narrowing picks the partners of, in a settled order."""
    from framework.names import module_of, vocabulary
    return tuple(sorted(s for s, w in vocabulary().items()
                        if getattr(module_of(w), PARTNERED_BY, None)))


def counted_by(narrowing):
    """Every multiplier whose partners `narrowing` picks."""
    from framework.names import module_of, vocabulary
    return tuple(w for w in partnered_words()
                 if getattr(module_of(vocabulary()[w]), PARTNERED_BY) == narrowing)


READS = (PAYEE, THE_BASE, "name.%s" % RIDER, WHOSE_RULE, EVERY_ONE, HOW_MANY)
# how much: every count word's scaling made once per row, one F64 factor each act multiplies by
HOW_MUCH = "how much"
FACTOR = (HOW_MUCH,)
# the game's own day grant takes an F64 second, so the factor is of that kind
FACTOR_KIND = "argument 1 of logic.faction.Developments.addDevDays"
# whether the spelling means ONE of what it grants (`GainDev`, `SpawnTUnit`), not the row's number
JUST_ONE = "effect.one"
# each linked counting word's scaling, a function of its own calling the next, and the last
LINK, LAST_LINK = "how much, by %s", "how much, by nothing more"
# the row part a linked word's count is taken from: the payee, when it is the kind counted on
COUNTED_ON = PAYEE


def counted(place, into):
    """The row's number as a whole one into `into`; 1 when the spelling means one."""
    single = place.scratch_like(place.row[JUST_ONE])
    as_written = place.here("the row's own number is what it asks for")
    return [place.op("ToInt", dst=into, src=place.row["value"]),
            place.op("Int", dst=single, ptr=place.number(1)),
            (place.op("JNotEq", a=place.row[JUST_ONE], b=single), as_written),
            place.op("Mov", dst=into, src=single),
            as_written + ":", place.op("Label")]


def factor_stage(stage):
    """The how-much step, a RESOLVE whose note every act needs; an owner word walks the factions."""
    from framework import questpick
    from framework.ownerpicks import WALKED
    reads = multmatch.READS + tuple(p for p in WALKED if p not in multmatch.READS)
    reads += questpick.reads_too(reads, (PART_FOR_NARROWING,) * bool(partnered_words()))
    return stage(HOW_MUCH, "RESOLVE", reads=reads, holds=FACTOR_KIND, body=_calling_the_factor)


def _calling_the_factor(place):
    """One shared function makes the factor for every road; this road only calls it."""
    from framework.pipeline import Place
    from tools.hlcode import assemble
    parts = list(place.row)
    kinds = [place.kind_of(place.row[p]) for p in parts]
    # a case's road over Void places writes it inline, so it leaves no function in the file
    if 0 in kinds:
        return _factor(place)

    def body(hands):
        made = Place(HOW_MUCH, {p: i for i, p in enumerate(parts)}, {},
                     hands["scratch_arg"](FACTOR_KIND.split(" of ")[1], 1), None, None, None, hands)
        return assemble(loaded(made, _factor(made)) + [made.op("Ret", ret=made.note)])
    shared = place._hands["shared"]((HOW_MUCH,) + tuple(kinds), kinds, place.kind_of(place.note),
                                    body)
    return [place.op("CallN", dst=place.note, fun=shared, args=[place.row[p] for p in parts])]


def _factor(place):
    """The factor starts at the events this payment covers, scaled by every count word spelled."""
    from framework.parsed import READ
    one, boxed = place.scratch_of("I32"), place.scratch_return(READ)
    wide = place.scratch_like(place.note)
    plain = place.here("this payment covers one event")
    return [place.op("Int", dst=one, ptr=place.number(1)),
            place.op("ToSFloat", dst=place.note, src=one),
            place.op("GetGlobal", **{"dst": boxed, "global": place.slot(mark.COVERS)}),
            (place.op("JNull", reg=boxed), plain),
            place.op("SafeCast", dst=one, src=boxed),
            place.op("ToSFloat", dst=wide, src=one),
            place.op("Mul", dst=place.note, a=place.note, b=wide),
            plain + ":", place.op("Label")] + multmatch.emit_scaled(place, place.note) + [
        # ⛔ READ ONCE: the gate writes it only for a payment, so the next row starts at none
        place.op("Null", dst=boxed),
        place.op("SetGlobal", **{"global": place.slot(mark.COVERS), "src": boxed})]


def scaled(place, amount):
    """`amount` times the factor; none on a road with no how-much step; a whole number via F64."""
    from framework import rescount
    factor = place.notes.get(HOW_MUCH)
    if factor is None:
        return []
    one = rescount.emit_one(place, amount)
    if place.kind_of(amount) == place.kind_of(factor):
        return one + [place.op("Mul", dst=amount, a=amount, b=factor)]
    wide = place.scratch_like(factor)
    return one + [place.op("ToSFloat", dst=wide, src=amount),
            place.op("Mul", dst=wide, a=wide, b=factor), place.op("ToInt", dst=amount, src=wide)]


def emit_linked(place, amount):
    """`amount` scaled by every linked word, through the first one's function; inline on Void."""
    words = multmatch.linked_words()
    if not words:
        return []
    parts = list(place.row)
    kinds = [place.kind_of(place.row[p]) for p in parts]
    if 0 in kinds:
        return [op for word in words for op in emit_one(place, amount, word)]
    return _calling_the_link(place, parts, kinds, amount, words)


def _calling_the_link(place, parts, kinds, amount, words):
    """A call to `words[0]`'s function, or the last one, handed the row's parts and the amount."""
    from framework.pipeline import Place
    handed = kinds + [place.kind_of(amount)]
    named = LINK % words[0] if words else LAST_LINK

    def body(hands):
        made = Place(named, {p: i for i, p in enumerate(parts)}, {}, None, None, None, None,
                     hands)
        at = len(parts)
        ops = (emit_one(made, at, words[0]) + _calling_the_link(made, parts, kinds, at, words[1:])
               if words else [])
        return assemble(loaded(made, ops) + [made.op("Ret", ret=at)])
    shared = place._hands["shared"]((named,) + tuple(handed), handed, handed[-1], body)
    return [place.op("CallN", dst=amount, fun=shared,
                     args=[place.row[p] for p in parts] + [amount])]


def emit_one(place, amount, word, count=None):
    """`amount` times the word's count per copy with no owner word, then per owner word's copies."""
    from framework import questpick, rescount
    from framework.multmatch import OWNED, TIMES, _owned, pickers
    from framework.parsed import kept_number, kept_number_at
    times = kept_number(place, TIMES % word)
    # ⛔ ONE ROUTE FOR BOTH SPELLINGS: a marked one only hands the count the kind it named
    named, turned, out = rescount.emit_kind_named(place, word) if (
        word in rescount.named_of()) else (None, None, [])
    none = rescount.every_kind(place, word, named, out)
    plain = times
    if word in pickers():
        plain, tally = place.scratch_like(times), place.scratch_like(times)
        out.append(place.op("Mov", dst=plain, src=times))
        # ⛔ ONE WALK OVER THE OWNER NUMBERS: a new owner word is one more turn, never more code
        out += _each_owner(place, word, lambda owner: kept_number_at(
            place, OWNED % (word, 0), owner, tally) + [
            place.op("Sub", dst=plain, a=plain, b=tally)] + _owned(place, amount, word, owner,
                                                                   tally, (named, turned, none)))
    if count is None:
        count, zero = place.scratch_like(times), place.scratch_like(times)
        unspelled = place.here("%s, no copy without an owner word" % word)
        out += [place.op("Int", dst=zero, ptr=place.number(0)),
                (place.op("JSGte", a=zero, b=plain), unspelled)] + _partnered(
            place, word, count, named) + _left_out(place, word, count, turned, none)
        held = (count, place.row.get(COUNTED_ON), none, named)
        out += questpick.raised_by(place, word, held, amount, plain) + [
            unspelled + ":", place.op("Label")]
    else:
        held = (count, place.row.get(COUNTED_ON), none, named)
        out += questpick.raised_by(place, word, held, amount, plain)
    return out


def _each_owner(place, word, body):
    """`body(n)` for each owner number `n` from 1 to the highest, in one walk."""
    from framework.ownermatch import highest
    n, past = place.scratch_of("I32"), place.scratch_of("I32")
    again, done = (place.here("%s, %s" % (word, what)) for what in (
        "the next owner number", "every owner number"))
    return [place.op("Int", dst=n, ptr=place.number(1)),
            place.op("Int", dst=past, ptr=place.number(highest() + 1)),
            again + ":", place.op("Label"),
            (place.op("JSGte", a=n, b=past), done)] + body(n) + [
            place.op("Incr", dst=n),
            (place.op("JAlways"), again),
            done + ":", place.op("Label")]


def _left_out(place, word, count, turned, none=None):
    """Turned (`PerNotTTreaty2`): `count` becomes the count of every kind less the one named."""
    if turned is None:
        return []
    every, zero = place.scratch_like(count), place.scratch_like(turned)
    plain = place.here("%s, not turned" % word)
    whole = copy(place)
    whole.name = place.here("%s, every kind" % word)
    return [place.op("Int", dst=zero, ptr=place.number(0)),
            (place.op("JEq", a=turned, b=zero), plain)] + _partnered(whole, word, every, none) + [
        place.op("Sub", dst=count, a=every, b=count),
        plain + ":", place.op("Label")]


def _partnered(place, word, count, named=None):
    """The word's count; a narrowing picking its partners sums it per partner when spelled."""
    import importlib
    from framework.names import module_of, vocabulary
    plain = _counted_lazily(place, word, count, named)
    partner = getattr(module_of(vocabulary()[word]), PARTNERED_BY, None)
    if partner is None:
        return plain
    asks = importlib.import_module(module_of(vocabulary()[partner]).WEIGHED_BY)
    return asks.emit_counted(place, word, count, named, plain, partner)


def _counted_lazily(place, word, count, named=None):
    """The word's count off the payee, of any kind `named`, by its one shared function; else 0."""
    from types import SimpleNamespace
    from tools.hlcode import kind_named
    from framework.rowreader import reader_for
    bc, fn = place._hands["bc"](), place._hands["fn"]()
    on = place.row.get(COUNTED_ON)
    if on is None or place.kind_of(on) != kind_named(bc, multmatch.declared(word)[0]):
        return [place.op("Int", dst=count, ptr=place.number(0))]
    site = SimpleNamespace(word=LINK % word, named=None if named is None else 1)
    return multmatch._calling_the_count(bc, fn, place.op, site, reader_for(bc), word, count, on,
                                        named)


def stage_of(act, stage):
    """An act's stage, run for whom the rider says unless the act settles that itself."""
    from framework.rescount import ACT_READS
    held = tuple(r for r in ACT_READS if r not in act.READS)
    if getattr(act, "RIDER_SETTLED", False):
        return stage(act.STAGE, "ACT", reads=act.READS + held, needs=FACTOR,
                     body=lambda place: _calling_the_act(place, act.emit_act))
    return stage(act.STAGE, "ACT", reads=act.READS + held + tuple(
        r for r in READS if r not in act.READS + held),
                 needs=FACTOR, body=lambda place: _calling_the_act(
                     place, lambda inner: emit(inner, act.emit_act(inner))))


def _calling_the_act(place, write):
    """One shared function per act for every road; what the tray was shown to comes back."""
    from framework.pipeline import Place
    from framework.tray import SHOWN_TO
    from tools.hlcode import assemble
    parts, needed = list(place.row), list(place.notes)
    handed = [place.row[p] for p in parts] + [place.notes[n] for n in needed]
    kinds = [place.kind_of(r) for r in handed]
    # a case's road over Void places writes it inline, so it leaves no function in the file
    if 0 in kinds or not handed:
        return write(place)
    gives = parts.index(SHOWN_TO) if SHOWN_TO in parts else 0

    def body(hands):
        made = Place(place.name, {p: i for i, p in enumerate(parts)},
                     {n: len(parts) + i for i, n in enumerate(needed)}, None, None, None, None,
                     hands)
        return assemble(loaded(made, write(made)) + [made.op("Ret", ret=gives)])
    shared = place._hands["shared"]((place.name,) + tuple(kinds), kinds, kinds[gives], body)
    back = place.row[SHOWN_TO] if SHOWN_TO in parts else place.scratch_like(handed[0])
    return [place.op("CallN", dst=back, fun=shared, args=handed)]


def written_for(road, bc, fn, stage, row, notes, hands):
    """A plain gate as one function per road and a call to it; anything holding state inline."""
    from framework.pipeline import EXIT, SCOPE_IS
    from framework.scopematch import GATE
    def here():
        at = road._place(stage, row, notes, hands)
        return loaded(at, stage.body(at))
    # the scope gate calls each narrowing's own function, so it stays put: shared is one deep
    if (stage.kind != "GATE" or stage.opening or stage.store or stage.needs
            or SCOPE_IS not in row or stage.name == GATE):
        return here()
    # the road's first register rides first, since a gate may ask after the thing ticked
    parts = [p for p in stage.reads if row[p] is not None]
    handed = [0, row[SCOPE_IS]] + [row[p] for p in parts]
    kinds = [gv(list(fn.regs)[r]) for r in handed]
    # a case's road over Void places writes it inline, so it leaves no function in the file
    if 0 in kinds:
        return here()
    shared = hands["shared"](("gate", road.name, stage.name) + tuple(kinds), kinds, kinds[1],
                             lambda made_hands: _gate_body(bc, stage, parts, len(handed),
                                                           made_hands))
    said, none = hands["scratch_like"](row[SCOPE_IS]), hands["scratch_like"](row[SCOPE_IS])
    return [written(template(bc, "CallN"), dst=said, fun=shared, args=handed),
            written(template(bc, "Int"), dst=none, ptr=number(bc, 0)),
            (written(template(bc, "JEq"), a=said, b=none), EXIT)] + mark.emit_written_off(
        road._place(stage, row, notes, hands), said)


def apart(place, key, write, like, extra):
    """`write(place, *extra)` as one function per key and the kinds handed; refusing leaves ours."""
    from framework.pipeline import Place
    from tools.hlcode import assemble as assembled
    parts, touched = _what_it_reads(place, write, like, extra)
    parts = sorted(parts)
    # ⛔ ONE COPY FOR EVERY ROAD: the thing ticked and a holder no instruction touches stay home
    lead = ([0] if 0 in touched else []) + [like]
    kept = [i for i in range(len(extra)) if 2 + i in touched]
    handed = lead + [extra[i] for i in kept] + [place.row[p] for p in parts]
    kinds = [place.kind_of(r) for r in handed]
    # a concrete place is handed as it is: the function takes the plainer kind, as the game's do
    widened = _widened(place, parts, kept)
    kinds = kinds[:len(handed) - len(parts)] + [widened.get(p, k) for p, k in zip(
        parts, kinds[len(handed) - len(parts):])]
    if 0 in kinds:
        return write(place, *extra)
    # ⛔ A WORD'S NUMBERS READ UNDER OTHER NAMES (after a trigger) ARE ANOTHER FUNCTION
    key = (key + (("after the trigger",) if place.looked["renamed"] else ()), tuple(parts),
           0 in touched, tuple(kept))
    like_at = len(lead) - 1

    def body(made_hands):
        given = {p: len(lead) + len(kept) + i for i, p in enumerate(parts)}
        made = Place(place.name, {p: given.get(p) for p in place.row}, {}, None, None, None,
                     "apart: refused", made_hands)
        made.looked["renamed"] = place.looked["renamed"]
        said = made_hands["scratch_like"](like_at)
        at = [len(lead) + kept.index(i) if i in kept else like_at for i in range(len(extra))]
        ops = assembled(loaded(made, write(made, *at)) + [
            made.op("Int", dst=said, ptr=made.number(1)), made.op("Ret", ret=said),
            "apart: refused:", made.op("Int", dst=said, ptr=made.number(0)),
            made.op("Ret", ret=said)])
        guard(not [o for o in ops if gv(o.df.get("dst", -1)) in range(len(handed))],
              "`%s` writes a place it is handed, so it cannot be a function" % (key,))
        return ops
    shared = place._hands["shared"]((key,) + tuple(kinds), kinds, kinds[like_at], body)
    said, none = place.scratch_like(like), place.scratch_like(like)
    return [place.op("CallN", dst=said, fun=shared, args=handed),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JEq", a=said, b=none), place.refused)]


def _widened(place, parts, kept):
    """With no holder handed, the owners and the rule's writer are taken as the plainest kind."""
    from framework.firedin import OWNER_OF
    from framework.reach import EVERY_HOLDER
    from tools.hlcode import kind_or_argument
    owners = [p for p in parts if p in (PAYEE, WHOSE_RULE) or p.startswith(OWNER_OF % "")]
    return {} if kept else {p: kind_or_argument(place._hands["bc"](), EVERY_HOLDER) for p in owners}


class _Reading(dict):
    """A row that remembers which of its parts were asked for."""

    def __init__(self, row):
        super().__init__(row)
        self.asked = set()

    def __getitem__(self, part):
        self.asked.add(part)
        return dict.__getitem__(self, part)

    def get(self, part, default=None):
        self.asked.add(part)
        return dict.get(self, part, default)


def _what_it_reads(place, write, like, extra):
    """The parts `write` reads and the first places it touches, off one write thrown away."""
    from copy import deepcopy
    from framework.pipeline import Place, hands_for
    from tools.hlcode import SHARED_ON, new_function
    bc, fn = place._hands["bc"](), place._hands["fn"]()
    shared = getattr(bc, SHARED_ON, None) or {}
    had = set(shared)
    handed = [0, like] + list(extra) + [r for r in place.row.values() if r is not None]
    kinds = [place.kind_of(r) for r in handed]
    if 0 in kinds:
        return [], set(range(2 + len(extra)))
    types, functions = len(bc.types), len(bc.functions)
    scratch = new_function(bc, kinds[:2], kinds[1], like=fn)
    scratch.regs[:] = [deepcopy(fn.regs[r]) for r in handed]
    scratch.nregs.value = len(scratch.regs)
    order = [p for p in place.row if place.row[p] is not None]
    row = _Reading({p: (2 + len(extra) + order.index(p) if p in order else None)
                    for p in place.row})
    hands, touched = _watched(hands_for(bc, scratch))
    out = write(Place(place.name, row, {}, None, None, None, "apart: refused", hands),
                *range(2, 2 + len(extra)))
    touched |= _registers_in(out)
    del bc.functions[functions:], bc.types[types:]
    for made in set(shared) - had:
        del shared[made]
    bc.nfunctions.value, bc.ntypes.value = len(bc.functions), len(bc.types)
    getattr(bc, "invalidate_findex_cache", lambda: None)()
    return [p for p in order if p in row.asked], touched


def _watched(hands):
    """The hands, noting each place asked about by number; reaching the function notes all."""
    touched, out = set(), dict(hands)

    def noting(name, at):
        def hand(*args, **kwargs):
            touched.update(args[i] for i in at if i < len(args) and isinstance(args[i], int))
            return hands[name](*args, **kwargs)
        return hand
    for name, at in (("scratch_like", (0,)), ("kind_of", (0,)), ("narrow", (0, 1)),
                     ("field_of", (0,)), ("says", (0,))):
        out[name] = noting(name, at)

    def the_function():
        touched.update(range(len(hands["fn"]().regs)))
        return hands["fn"]()
    out["fn"] = the_function
    return out, touched


def _registers_in(items):
    """Every place an instruction of `items` names, read or written."""
    from crashlink.opcodes import opcodes
    found = set()
    for item in items:
        one = item[0] if isinstance(item, tuple) else item
        if isinstance(one, str):
            continue
        for name, what in opcodes.get(one.op, {}).items():
            if what == "Reg":
                found.add(gv(one.df[name]))
            elif what == "Regs":
                found.update(gv(r) for r in (getattr(one.df[name], "value", None) or []))
    return found


def _gate_body(bc, stage, parts, handed, made_hands):
    """The gate inside its own function: one when the row passes, nought where it is refused."""
    from framework.pipeline import EXIT, Place
    given = {p: 2 + i for i, p in enumerate(parts)}
    made = Place(stage.name, {p: given.get(p) for p in stage.reads}, {}, None, None, None, EXIT,
                 made_hands)
    said = made_hands["scratch_like"](1)
    made_hands[mark.LOST_AT] = lambda: [written(template(bc, "Int"), dst=said, ptr=number(bc, 2)),
                                        written(template(bc, "Ret"), ret=said)]
    ops = assemble(loaded(made, stage.body(made)) + [
        written(template(bc, "Int"), dst=said, ptr=number(bc, 1)),
        written(template(bc, "Ret"), ret=said),
        EXIT + ":", written(template(bc, "Int"), dst=said, ptr=number(bc, 0)),
        written(template(bc, "Ret"), ret=said)])
    guard(not [o for o in ops if gv(o.df.get("dst", -1)) in range(handed)],
          "`%s` writes a place the road hands it, so it cannot leave the road" % stage.name)
    return ops


def emit(place, inner):
    """`inner` once for the road's payee or the holder, or once per faction; the payee put back."""
    from framework.storewalk import THE_BASE_THROUGH
    payee, base = place.row[PAYEE], place.row[THE_BASE]
    rider = place.row["name.%s" % RIDER]
    asks = place.kind_of(place.scratch_of(ASKED_AS))
    guard(place.kind_of(payee) == asks, "the payee is a t@%s and %s is called on a t@%s"
          % (place.kind_of(payee), THE_BASE_THROUGH, asks))
    road_payee, road_base = place.scratch_like(payee), place.scratch_like(base)
    spare = place.scratch_like(rider)
    at = place.scratch_like(place.row[HOW_MANY])
    item = place.scratch_of("Dyn")
    each, run, done = (place.here("for whom: the next faction"), place.here("for whom: settled"),
                       place.here("for whom: done"))
    mine, narrowing = place.narrowed(place.row[WHOSE_RULE], payee, goes_to=run)
    based = [place.op("Call1", dst=base, fun=place.named_function(THE_BASE_THROUGH), arg0=payee)]
    # `ForAll` and `For<Owner>` walk every faction; an owner word takes only those it picks
    walks = emit_walks(place, rider, spare)
    return [
        place.op("Mov", dst=road_payee, src=payee), place.op("Mov", dst=road_base, src=base),
        place.op("Int", dst=at, ptr=place.number(0)),
    ] + walks + [
        (place.op("JEq", a=rider, b=spare), each),
        place.op("Int", dst=spare, ptr=place.number(STAMP_IS["me"])),
        (place.op("JNotEq", a=rider, b=spare), run),
    ] + narrowing + [place.op("Mov", dst=payee, src=mine)] + based + [
        (place.op("JAlways"), run),
        each + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=place.row[HOW_MANY]), done),
        place.op("GetArray", dst=item, array=place.row[EVERY_ONE], index=at),
        place.op("Incr", dst=at),
    ] + emit_taken(place, (rider, place.row[WHOSE_RULE], item), payee) + [
        (place.op("JNull", reg=payee), each),
    ] + based + [
        run + ":", place.op("Label"),
    ] + inner + walks + [
        (place.op("JEq", a=rider, b=spare), each),
        done + ":", place.op("Label"),
        place.op("Mov", dst=payee, src=road_payee),
        place.op("Mov", dst=base, src=road_base),
    ]
