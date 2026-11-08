#!/usr/bin/env python3
"""What the parse found, kept per application from the bake until the road reads it back."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, argument_kind, assemble, field_by_name, function_named,
                          kind_named, number, register_like, returns_type, shared_function,
                          slot_global, template, written)
from framework.columns import FOUND as FROM_THE_COLUMNS
from framework.effectdata import CARRIES
from framework.triggermatch import FOUND as FROM_THE_HOOK
from framework.loadguard import clear_site, emit_empty
from framework.oneshot import MAKE, MAP, TELL
from framework.pieceword import FOUND as FROM_THE_SPELLING
from framework.rowreader import reader_for
from framework.scopematch import FOUND as FROM_THE_SCOPE
# and the owner word: a relationship between two factions
from framework.ownermatch import FOUND as FROM_THE_OWNER
# and the rider: who a row's result counts for
from framework.ridermatch import FOUND as FROM_THE_RIDER
# and the narrowing words, REPEATABLE, riding as bits of one number
from framework.narrowmatch import FOUND as FROM_THE_NARROWING
# and a tally per multiplier word, REPEATABLE, each scaling by a count the road works out
from framework.multmatch import FOUND as FROM_THE_MULTIPLIER
# and the parameter, with the column it marked: what a row handed the act to use
from framework.parammatch import FOUND as FROM_THE_PARAMETER

# what everything here is keyed under, named once for every file that keys on it
HELD_BY = "logic.AttributeApplication"
# reading one back out of a map: what the one-shot never needed, because it only ever asked
READ = "haxe.ds.ObjectMap.get"
# what the parse found and the road reads back, each with its kind, taken from the files
KEPT = (tuple((name, kind) for name, kind, _ in CARRIES)
        + FROM_THE_SPELLING + FROM_THE_SCOPE + FROM_THE_HOOK + FROM_THE_COLUMNS
        + FROM_THE_OWNER + FROM_THE_RIDER + FROM_THE_NARROWING + FROM_THE_MULTIPLIER
        + FROM_THE_PARAMETER)
NAMES = tuple(name for name, _ in KEPT)
# ⛔ `scope` KEEPS A MAP OF ITS OWN: `rederive.py` marks a restored row looked at in it
ALONE = ("scope",)
# every number a word brings is read off the row's list where it is used, never copied out of it
WORDLY = tuple(name for name, _ in FROM_THE_NARROWING + FROM_THE_MULTIPLIER)
# every other whole number rides ONE list per application, as its place here then itself, if not 0
RECORDED = tuple(name for name, kind in KEPT if kind == "count_kind" and name not in ALONE
                 and name not in WORDLY) + WORDLY
COPIED = len(RECORDED) - len(WORDLY)
MAPPED = tuple(name for name in NAMES if name not in RECORDED)
# the row's list itself, as a road holds it and as a stage reads it
NUMBERS = "numbers"
NUMBERS_PART = "name.%s" % NUMBERS
# the one function every word's number is looked up by, and how it is told apart
LOOKUP = "the row's number"
# how a word's number is folded onto the list as the id is read: added, ORed, written, taken off
ADD, OR, SET, TAKE = 0, 1, 2, 3
FOLD, GET = "a word's number folded onto the row's list", "a word's number, at the bake"
# what that list is kept under, beside the maps of the rest
RECORD = "record"
STORES = MAPPED + (RECORD,)
# what each store is kept in, one slot each, so nothing needs a shape of our own
SLOT = "the parse's %s"


def slot_named(name):
    """What the slot for one store is called."""
    guard(name in STORES, "`%s` is not one of the parse's stores: %s" % (name, ", ".join(STORES)))
    return SLOT % name


def make_slots(bc):
    """MAKE a place for every map. Each is empty until an opening puts one there."""
    return {name: slot_global(bc, slot_named(name), kind_named(bc, MAP)) for name in STORES}


def slots(bc):
    """READ those places: the ones this file already has. Reading never makes."""
    made = getattr(bc, SLOTS_ON, None) or {}
    return {name: made[slot_named(name)] for name in STORES if slot_named(name) in made}


def check_what_we_borrow(bc):
    """Reading and telling take one of our maps first, and agree about what a key is."""
    kind = kind_named(bc, MAP)
    for what in (READ, TELL):
        guard(gv(list(function_named(bc, what).regs)[0]) == kind,
              "%s does not take one of our maps first" % what)
    guard(argument_kind(bc, READ) == argument_kind(bc, TELL),
          "%s and %s disagree about what a key is" % (READ, TELL))


# ------------------------------------------------- WHAT GOES SOMEWHERE THE ROAD NEVER SEES

def emit_at_a_new_world(bc, fn, into):
    """NOT A STAGE. Every map goes when a new state begins; `into` is reused for each."""
    made = slots(bc)
    guard(len(made) == len(STORES), "%d of the %d maps have a place" % (len(made), len(STORES)))
    return [op for name in STORES for op in emit_empty(bc, fn, made[name], into)]


def emit_ready(bc, fn):
    """NOT A STAGE. Per row: read every map into a place, made if absent; the block and places."""
    made, into, out = slots(bc), {}, []
    guard(len(made) == len(STORES), "%d of the %d maps have a place" % (len(made), len(STORES)))
    making = gv(function_named(bc, MAKE).findex)
    for name in STORES:
        holds = a_new_place(bc, fn, kind_named(bc, MAP))
        into[name] = holds
        out += [
            _op(bc, "GetGlobal", **{"dst": holds, "global": made[name]}),
            (_op(bc, "JNotNull", reg=holds), "the parse has %s" % name),
            _op(bc, "New", dst=holds),
            _op(bc, "Call1", dst=a_new_place(bc, fn, hands_back(bc, MAKE)), fun=making,
                arg0=holds),
            _op(bc, "SetGlobal", **{"global": made[name], "src": holds}),
            "the parse has %s:" % name,
            _op(bc, "Label"),
        ]
    return out, into


def check_the_place(bc, fn, place, kind, what, reader=None):
    """Refuse a place that is not the kind the thing it carries IS. It MAKES nothing."""
    reader = reader or reader_for(bc)
    places = list(fn.regs)
    guard(place < len(places),
          "%s is place %d and there are %d" % (what, place, len(places)))
    guard(gv(places[place]) == getattr(reader, kind),
          "%s is a place of kind t@%s and it carries a t@%s"
          % (what, gv(places[place]), getattr(reader, kind)))


def emit_writing(bc, fn, application, found, maps, kept, reader=None):
    """NOT A STAGE. At the bake, per row: what the classifier found goes into the maps, checked."""
    telling = gv(function_named(bc, TELL).findex)
    reader = reader or reader_for(bc)
    out = []
    for name, kind in KEPT:
        if name in WORDLY:
            continue
        guard(name in found, "what was found for `%s` was not handed over" % name)
        check_the_place(bc, fn, found[name], kind, "what was found for `%s`" % name, reader)
    for name in STORES:
        guard(name in maps, "the map for `%s` was not handed over" % name)
    kinds = dict(KEPT)
    for name in MAPPED:
        # ⛔ A NUMBER IS BOXED ON THE WAY IN; A POINTER IS HANDED OVER AS ITSELF
        if _is_a_number(kinds[name]):
            wrapped = a_new_place(bc, fn, argument_kind(bc, TELL, 1))
            out += [_op(bc, "ToDyn", dst=wrapped, src=found[name])]
        else:
            wrapped = found[name]
        out += [
                _op(bc, "Call3", dst=a_new_place(bc, fn, hands_back(bc, TELL)), fun=telling,
                    arg0=maps[name], arg1=application, arg2=wrapped)]
    listed, block = _the_record(bc, fn, found, reader, kept.listed)
    return out + block + [
        _op(bc, "Call3", dst=a_new_place(bc, fn, hands_back(bc, TELL)), fun=telling,
            arg0=maps[RECORD], arg1=application, arg2=listed)]


def _the_record(bc, fn, found, reader, listed):
    """Onto the row's list, each copied number not 0, as its place in `RECORDED` then itself."""
    from framework import tray
    pushing = function_named(bc, tray.PUSH)
    which, zero = (a_new_place(bc, fn, reader.count_kind) for _ in range(2))
    boxed = a_new_place(bc, fn, argument_kind(bc, tray.PUSH, 0))
    length = a_new_place(bc, fn, hands_back(bc, tray.PUSH))

    def op(name, **operands):
        return _op(bc, name, **operands)

    out = [op("Int", dst=zero, ptr=number(bc, 0))]
    for at, name in enumerate(RECORDED[:COPIED]):
        left_out = "the record leaves out %s" % name
        out += [(op("JEq", a=found[name], b=zero), left_out),
                op("Int", dst=which, ptr=number(bc, at)),
                op("ToDyn", dst=boxed, src=which),
                op("Call2", dst=length, fun=gv(pushing.findex), arg0=listed, arg1=boxed),
                op("ToDyn", dst=boxed, src=found[name]),
                op("Call2", dst=length, fun=gv(pushing.findex), arg0=listed, arg1=boxed),
                left_out + ":", op("Label")]
    return listed, out


class Kept:
    """The row's list at the bake: each word's number folded onto it the moment it is read."""

    def __init__(self, bc, fn, reader):
        from framework.narrowmatch import AFTER_THE_TRIGGER, OWN
        self.bc, self.fn, self.reader = bc, fn, reader
        self.listed = reader.borrow_register(bc, fn, "listing_kind")
        # `ored` holds OR from the row's start: the most folded way, so no fold writes it again
        self.which, self.value, self.how, self.back, self.shift, self.ored = (
            a_new_place(bc, fn, reader.count_kind) for _ in range(6))
        self.shifted = OWN
        moves = {RECORDED.index(AFTER_THE_TRIGGER % n) - RECORDED.index(n) for n in OWN}
        guard(len(moves) == 1, "a trigger's narrowings sit %s past the subject's" % sorted(moves))
        self.shift_by = moves.pop()

    def emit_new(self):
        """An empty list for the row; every narrowing read from here on is the subject's own."""
        from framework import tray
        from framework.atload import emit_a_new_list
        bc, fn, made = self.bc, self.fn, tray.recipe(self.bc)
        typed, raw, backing = (a_new_place(bc, fn, made["of"][k])
                               for k in ("typed", "raw", "backing"))
        return emit_a_new_list(bc, self._op, made, hands_back(bc, READ), self.listed, self.back,
                               typed, raw, backing) + [
            self._op("Int", dst=self.shift, ptr=number(bc, 0)),
            self._op("Int", dst=self.ored, ptr=number(bc, OR))]

    def emit_after_a_trigger(self):
        """Every narrowing read from here on is the trigger's own."""
        return [self._op("Int", dst=self.shift, ptr=number(self.bc, self.shift_by))]

    def _at(self, name, at=None):
        guard(name in RECORDED[COPIED:], "`%s` is no word's number on the row's list" % name)
        out = [self._op("Int", dst=self.which, ptr=number(self.bc, RECORDED.index(name)))]
        if name in self.shifted:
            out.append(self._op("Add", dst=self.which, a=self.which, b=self.shift))
        if at is not None:
            out.append(self._op("Add", dst=self.which, a=self.which, b=at))
        return out

    def fold(self, name, how, value=None, at=None, const=1):
        """`value`, else `const`, folded into `name`'s number (`at` further on) as `how` says."""
        # ⛔ HANDED AS IT IS: OR is 1, so `ored` is also the number most often folded
        value = self.ored if value is None and const == OR else value
        given = [] if value is not None else [
            self._op("Int", dst=self.value, ptr=number(self.bc, const))]
        way = [] if how == OR else [self._op("Int", dst=self.how, ptr=number(self.bc, how))]
        return self._at(name, at) + given + way + [
            self._op("CallN", dst=self.back, fun=self._shared(FOLD, 4, _folding),
                     args=[self.listed, self.which, self.value if value is None else value,
                           self.ored if how == OR else self.how])]

    def get(self, name, into):
        """`name`'s number as folded so far into `into`, 0 when nothing was."""
        return self._at(name) + [self._op("CallN", dst=into, fun=self._shared(GET, 2, _getting),
                                          args=[self.listed, self.which])]

    def _shared(self, key, n, body):
        kinds = [gv(list(self.fn.regs)[self.listed])] + [self.reader.count_kind] * (n - 1)
        return shared_function(self.bc, self.fn, lambda _bc, made: made, (key,) + tuple(kinds),
                               kinds, self.reader.count_kind,
                               lambda made: body(self.bc, made, self.reader))

    def _op(self, name, **operands):
        return _op(self.bc, name, **operands)


def _walked(bc, made, reader):
    """The places a walk along the row's list needs, and the first steps onto it."""
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
    entries = kind_named(bc, ARRAY_OF_ENTRIES)
    length_at, length_kind = field_by_name(bc, entries, COUNT_ON, "a list")
    backing_at, backing_kind = field_by_name(bc, entries, BACKING_ON, "a list")
    size, at = (a_new_place(bc, made, length_kind) for _ in range(2))
    held, old, spare = (a_new_place(bc, made, reader.count_kind) for _ in range(3))
    got, backing = a_new_place(bc, made, hands_back(bc, READ)), a_new_place(bc, made, backing_kind)
    p = dict(size=size, at=at, held=held, old=old, spare=spare, got=got, backing=backing)
    return p, [(_op(bc, "JNull", reg=0), "absent"),
               _op(bc, "Field", dst=size, obj=0, field=length_at),
               _op(bc, "Field", dst=backing, obj=0, field=backing_at),
               _op(bc, "Int", dst=at, ptr=number(bc, 0)),
               "the next entry:", _op(bc, "Label"),
               (_op(bc, "JSGte", a=at, b=size), "absent"),
               _op(bc, "GetArray", dst=got, array=backing, index=at),
               _op(bc, "SafeCast", dst=held, src=got),
               _op(bc, "Incr", dst=at),
               (_op(bc, "JNotEq", a=held, b=1), "not this entry"),
               _op(bc, "GetArray", dst=got, array=backing, index=at),
               _op(bc, "SafeCast", dst=old, src=got)]


def _getting(bc, made, reader):
    """GET's body: the number entered for `which`, 0 when the list has none."""
    p, out = _walked(bc, made, reader)
    return assemble(out + [_op(bc, "Ret", ret=p["old"]),
                           "not this entry:", _op(bc, "Label"), _op(bc, "Incr", dst=p["at"]),
                           (_op(bc, "JAlways"), "the next entry"),
                           "absent:", _op(bc, "Label"),
                           _op(bc, "Int", dst=p["old"], ptr=number(bc, 0)),
                           _op(bc, "Ret", ret=p["old"])])


def _folding(bc, made, reader):
    """FOLD's body: the entry for `which` changed where it is, or both pushed when there is none."""
    from framework.tray import PUSH
    p, out = _walked(bc, made, reader)
    old, spare = p["old"], p["spare"]
    boxed = a_new_place(bc, made, argument_kind(bc, PUSH, 0))
    pushed = a_new_place(bc, made, hands_back(bc, PUSH))
    for how, way in ((ADD, "Add"), (OR, "Or"), (TAKE, "Sub")):
        out += [_op(bc, "Int", dst=spare, ptr=number(bc, how)),
                (_op(bc, "JNotEq", a=3, b=spare), "not %d" % how),
                _op(bc, way, dst=old, a=old, b=2), (_op(bc, "JAlways"), "folded"),
                "not %d:" % how, _op(bc, "Label")]
    push = gv(function_named(bc, PUSH).findex)
    return assemble(out + [
        _op(bc, "Mov", dst=old, src=2),
        "folded:", _op(bc, "Label"),
        _op(bc, "ToDyn", dst=p["got"], src=old),
        _op(bc, "SetArray", array=p["backing"], index=p["at"], src=p["got"]),
        (_op(bc, "JAlways"), "done"),
        "not this entry:", _op(bc, "Label"), _op(bc, "Incr", dst=p["at"]),
        (_op(bc, "JAlways"), "the next entry"),
        "absent:", _op(bc, "Label"),
        (_op(bc, "JNull", reg=0), "done"),
        _op(bc, "ToDyn", dst=boxed, src=1),
        _op(bc, "Call2", dst=pushed, fun=push, arg0=0, arg1=boxed),
        _op(bc, "ToDyn", dst=boxed, src=2),
        _op(bc, "Call2", dst=pushed, fun=push, arg0=0, arg1=boxed),
        "done:", _op(bc, "Label"), _op(bc, "Ret", ret=2)])


def places_for(bc, fn, reader):
    """A place per kept thing a road reads back, and the row's list; none per word's number."""
    into = {name: reader.borrow_register(bc, fn, kind) for name, kind in KEPT if name not in WORDLY}
    into[NUMBERS] = reader.borrow_register(bc, fn, "listing_kind")
    return into


def emit_reading(bc, fn, application, into, maps, reader=None):
    """NOT A STAGE. At the road, per row: what was kept comes back into the row's places."""
    reading = gv(function_named(bc, READ).findex)
    reader = reader or reader_for(bc)
    out = []
    guard(NUMBERS in into, "the row's list was not handed a place to come back into")
    check_the_place(bc, fn, into[NUMBERS], "listing_kind", "the row's list", reader)
    for name, kind in KEPT:
        if name in WORDLY:
            continue
        guard(name in into and (name in maps or name in RECORDED) and RECORD in maps,
              "`%s` was not handed a place to come back into" % name)
        check_the_place(bc, fn, into[name], kind, "what `%s` comes back into" % name, reader)
        if name in RECORDED:
            continue
        got = a_new_place(bc, fn, hands_back(bc, READ))
        # and back the same way round: a number unboxed, a pointer reinterpreted
        taking = "SafeCast" if _is_a_number(kind) else "UnsafeCast"
        out += [_op(bc, "Call2", dst=got, fun=reading, arg0=maps[name], arg1=application),
                _op(bc, taking, dst=into[name], src=got)]
    return out + _read_the_record(bc, fn, application, into, maps[RECORD], reader)


def _read_the_record(bc, fn, application, into, kept_in, reader):
    """Every recorded number back to 0, then each the list holds into the place its entry names."""
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
    entries = kind_named(bc, ARRAY_OF_ENTRIES)
    length_at, length_kind = field_by_name(bc, entries, COUNT_ON, "a list")
    backing_at, backing_kind = field_by_name(bc, entries, BACKING_ON, "a list")
    got = a_new_place(bc, fn, hands_back(bc, READ))
    listed = into[NUMBERS]
    how_many, at, which, spare = (a_new_place(bc, fn, length_kind) for _ in range(4))
    backing = a_new_place(bc, fn, backing_kind)
    again, taken, done = "the record's next entry", "the record's entry taken", "the record is read"

    def op(name, **operands):
        return _op(bc, name, **operands)

    op.number = lambda n: number(bc, n)
    return [op("Int", dst=into[name], ptr=number(bc, 0)) for name in RECORDED[:COPIED]] + [
        op("Call2", dst=got, fun=gv(function_named(bc, READ).findex), arg0=kept_in,
           arg1=application),
        op("UnsafeCast", dst=listed, src=got),
        (op("JNull", reg=listed), done),
        op("Field", dst=how_many, obj=listed, field=length_at),
        op("Field", dst=backing, obj=listed, field=backing_at),
        op("Int", dst=at, ptr=number(bc, 0)),
        again + ":", op("Label"),
        (op("JSGte", a=at, b=how_many), done),
        op("GetArray", dst=got, array=backing, index=at),
        op("SafeCast", dst=which, src=got),
        op("Incr", dst=at),
        op("GetArray", dst=got, array=backing, index=at),
        op("Incr", dst=at),
        # a word's number stays on the list: whoever uses it looks it up there
        op("Int", dst=spare, ptr=number(bc, COPIED)),
        (op("JSGte", a=which, b=spare), taken)] + _into_its_place(
            op, which, got, into, spare, 0, COPIED, taken) + [
        taken + ":", op("Label"),
        (op("JAlways"), again),
        done + ":", op("Label")]


def _into_its_place(op, which, got, into, spare, low, high, taken):
    """The entry into the place `which` names among `RECORDED[low:high]`, halving them each ask."""
    if high - low == 1:
        return [op("SafeCast", dst=into[RECORDED[low]], src=got), (op("JAlways"), taken)]
    middle = (low + high) // 2
    upper = "the record's entry is %d or past" % middle
    return ([op("Int", dst=spare, ptr=op.number(middle)),
             (op("JSGte", a=which, b=spare), upper)]
            + _into_its_place(op, which, got, into, spare, low, middle, taken)
            + [upper + ":", op("Label")]
            + _into_its_place(op, which, got, into, spare, middle, high, taken))


def kept_number(place, name):
    """A word's number off the row's list, looked up once per place, ahead of what uses it."""
    looked = place.looked
    name = looked["renamed"].get(name, name)
    if name not in looked["names"]:
        looked["names"][name] = place.scratch_of("I32")
        looked["loads"].extend(emit_looked_up(place, name, looked["names"][name]))
    return looked["names"][name]


def kept_number_at(place, name, at, into):
    """The number `at` places past `name`'s on the row's list into `into`, read where it stands."""
    return emit_looked_up(place, name, into, at)


def loaded(place, ops):
    """`ops`, once written, with every number they looked up read in front of them."""
    ops = list(ops)
    return list(place.looked["loads"]) + ops


def emit_looked_up(place, name, into, at=None):
    """`name`'s number (`at` further on) on the row's list into `into`, 0 when absent."""
    from framework.pipeline import Place
    from framework.tray import BACKING_ON, COUNT_ON
    from tools.hlcode import assemble
    listed = place.row[NUMBERS_PART]
    kinds = [place.kind_of(listed), place.kind_of(into)]
    # a case's road over Void places has no list to look in, so it reads none
    if 0 in kinds:
        return [place.op("Int", dst=into, ptr=place.number(0))]

    def body(hands):
        made = Place(LOOKUP, {}, {}, None, None, None, None, hands)
        size_at, size = made.field_of(0, COUNT_ON)
        backing_at, backing = made.field_of(0, BACKING_ON)
        at, which, got = made.scratch_like(1), made.scratch_like(1), made.scratch_of("Dyn")
        again, past, absent = (made.here(w) for w in ("next entry", "past the entry", "absent"))
        return assemble([
            (made.op("JNull", reg=0), absent),
            made.op("Field", dst=size, obj=0, field=size_at),
            made.op("Field", dst=backing, obj=0, field=backing_at),
            made.op("Int", dst=at, ptr=made.number(0)),
            again + ":", made.op("Label"),
            (made.op("JSGte", a=at, b=size), absent),
            made.op("GetArray", dst=got, array=backing, index=at),
            made.op("SafeCast", dst=which, src=got),
            made.op("Incr", dst=at),
            (made.op("JNotEq", a=which, b=1), past),
            made.op("GetArray", dst=got, array=backing, index=at),
            made.op("SafeCast", dst=which, src=got),
            made.op("Ret", ret=which),
            past + ":", made.op("Label"),
            made.op("Incr", dst=at),
            (made.op("JAlways"), again),
            absent + ":", made.op("Label"),
            made.op("Int", dst=which, ptr=made.number(0)),
            made.op("Ret", ret=which)])
    shared = place._hands["shared"]((LOOKUP,) + tuple(kinds), kinds, kinds[1], body)
    which = place.scratch_like(into)
    further = [] if at is None else [place.op("Add", dst=which, a=which, b=at)]
    return [place.op("Int", dst=which, ptr=place.number(RECORDED.index(name)))] + further + [
            place.op("CallN", dst=into, fun=shared, args=[listed, which])]


def _is_a_number(kind):
    """Does this kept thing's DECLARED kind hold a number rather than a pointer?"""
    return kind == "count_kind" or not isinstance(kind, str)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def a_new_place(bc, fn, kind):
    """One more place on `fn`, of a kind the game declares; `check_the_place` does the checking."""
    fn.regs.append(deepcopy(register_like(bc, kind)))
    fn.nregs.value = len(fn.regs)
    return len(fn.regs) - 1


def hands_back(bc, name):
    """The kind that named function answers with, for a place to catch it in."""
    return returns_type(function_named(bc, name), name)


def install(bc):
    """Make a place for every map, and check what this borrows; the bake fills, the road reads."""
    made = make_slots(bc)
    check_what_we_borrow(bc)
    beginning = deepcopy(clear_site(bc))
    beginning.regs.append(deepcopy(register_like(bc, kind_named(bc, MAP))))
    beginning.nregs.value = len(beginning.regs)
    emptying = emit_at_a_new_world(bc, beginning, len(beginning.regs) - 1)
    for at in range(len(RECORDED) + 1):
        number(bc, at)
    return ("PARSED: %d thing(s) the parse found are kept per application -- %d whole number(s) "
            "in one list holding only those not 0, the other %d a map each -- and %d "
            "instruction(s) empty all %d map(s) when a new world begins"
            % (len(NAMES), len(RECORDED), len(MAPPED), len(emptying), len(made)))
