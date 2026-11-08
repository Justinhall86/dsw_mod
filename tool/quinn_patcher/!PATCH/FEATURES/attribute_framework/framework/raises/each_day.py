"""A day began: once per faction, walk each faction's rows and its things', weighed by the day."""
import sys
from types import SimpleNamespace

from tools.project import gv, guard
from tools.hlcode import (assemble, call_sites, function_named, kind_named, new_function, number,
                          replace_body, returns_type, template, written)
from tools.splice import insert
from framework import foreignwalk, raisewalk, sayonce, traps, triggermatch
from framework.triggers import each_day as word, each_month, on_day, on_month
from framework.parsed import a_new_place
from framework.rowreader import reader_for

# what the splice is called, which is what its own record answers to
SPLICE = "a day began"
# what the walk's own places are named after
NOUN = "new day"
# the with-`val` forms, each by its own spelling, and the other words a new day raises too
EACH_DAYS, EACH_MONTHS = (SimpleNamespace(WORD=w.WITH_VAL["WORD"]) for w in (word, each_month))
ALSO = (on_day, each_month, on_month, EACH_DAYS, EACH_MONTHS)
# ⛔ said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "a day began"
HAS_FACTION = "the faction whose day began is in hand"
HAS_THING = "the new day's number is in hand"
RAISED = "a row owed something by this day"
FIRES = "this row fires on this day"
# the walk's own places: the day's number, then the faction whose day it is
DAY, ACTOR = 0, 1
# what the calendar test's own places are named after
CALENDAR = "the calendar"


def site(bc):
    """The game's tick, checked to be about the game."""
    fn = function_named(bc, word.SITE)
    guard(gv(fn.regs[0]) == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, gv(fn.regs[0]), word.ABOUT))
    return fn


def the_point(bc, fn):
    """The one call writing the new day down, and the place holding that day."""
    found = call_sites(fn, function_named(bc, word.MARKS))
    guard(len(found) == 1,
          "%s calls %s %d time(s), not once" % (word.SITE, word.MARKS, len(found)))
    at = found[0]
    day = gv(fn.ops[at].df["arg1"])
    guard(gv(fn.regs[day]) == reader_for(bc).count_kind,
          "%s hands %s t@%s rather than a whole day" % (word.SITE, word.MARKS, gv(fn.regs[day])))
    return at, day


def kinds(bc):
    """The faction's kind, twice (it is also what fired), and the faction's again."""
    signer = kind_named(bc, word.SIGNER)
    return signer, signer, signer


def places(bc, fn, at):
    """Where the number floats: nowhere of the day's own, so the scope's thing."""
    at.where = a_new_place(bc, fn, kind_named(bc, word.SHOWN_AS))


def opening(bc, fn, op, at, done):
    """The faction whose day began, and where the number floats, said once."""
    return (sayonce.emit_word_always(bc, fn, FINISHED, even_when_quiet=True)
            + [op("Mov", dst=at.faction, src=ACTOR),
               (op("JNull", reg=at.faction), done),
               op("Mov", dst=at.thing, src=at.faction),
               op("Mov", dst=at.running, src=at.faction)]
            + sayonce.emit_word_always(bc, fn, HAS_FACTION, even_when_quiet=True)
            + sayonce.emit_word_always(bc, fn, HAS_THING, even_when_quiet=True)
            + [op("Null", dst=at.acting), op("Null", dst=at.where)])


def emit_fired(bc, fn, at, into, refused):
    """Past this, the row's `val` fits today on the calendar its trigger keeps; else `refused`."""
    from framework.pipeline import Place, hands_for
    place = Place(CALENDAR, {}, {}, None, None, None, refused, hands_for(bc, fn))
    n, zero, one, month_days, wanted, month, rest = (place.scratch_of("I32") for _ in range(7))
    as_is = place.kind_of(at.value) == place.kind_of(n)
    guard(as_is or place.kind_of(at.value) == place.kind_of(place.scratch_of("F64")),
          "an application's `val` is t@%s, neither a whole number nor a float"
          % place.kind_of(at.value))
    named = into[triggermatch.NAMED]
    each_day, on_a_day, on_a_month, passed = (
        place.here(w) for w in ("every val-th day", "the day val names",
                                "the month val names", "fits today"))

    def number_of(w):
        return place.op("Int", dst=wanted, ptr=place.number(triggermatch.number_of(w.WORD)))
    return [
        place.op("Field", dst=at.value, obj=at.application, field=at.value_at),
        place.op("Mov" if as_is else "ToInt", dst=n, src=at.value),
        place.op("Int", dst=zero, ptr=place.number(0)),
        place.op("Int", dst=one, ptr=place.number(1)),
        number_of(word), (place.op("JEq", a=named, b=wanted), passed),
        number_of(EACH_DAYS), (place.op("JEq", a=named, b=wanted), each_day),
        number_of(on_day), (place.op("JEq", a=named, b=wanted), on_a_day),
        # A MONTH WORD: today is the first of a month, and `month` is which one, 1 from 01.01
        place.op("Int", dst=month_days, ptr=place.number(word.MONTH_DAYS)),
        place.op("Sub", dst=month, a=DAY, b=one),
        place.op("SMod", dst=rest, a=month, b=month_days),
        (place.op("JNotEq", a=rest, b=zero), refused),
        place.op("SDiv", dst=month, a=month, b=month_days),
        place.op("Add", dst=month, a=month, b=one),
        number_of(on_month), (place.op("JEq", a=named, b=wanted), on_a_month),
        number_of(each_month), (place.op("JEq", a=named, b=wanted), passed),
        # `EachMonths`: every val-th month; a `val` of 0 or less, every month
        (place.op("JSLte", a=n, b=zero), passed),
        place.op("SMod", dst=rest, a=month, b=n),
        (place.op("JNotEq", a=rest, b=zero), refused),
        (place.op("JAlways"), passed),
        on_a_month + ":", place.op("Label"),
        (place.op("JNotEq", a=month, b=n), refused),
        (place.op("JAlways"), passed),
        # `EachDays`: every val-th day; a `val` of 0 or less, every day
        each_day + ":", place.op("Label"),
        (place.op("JSLte", a=n, b=zero), passed),
        place.op("SMod", dst=rest, a=DAY, b=n),
        (place.op("JNotEq", a=rest, b=zero), refused),
        (place.op("JAlways"), passed),
        on_a_day + ":", place.op("Label"),
        (place.op("JNotEq", a=DAY, b=n), refused),
        passed + ":", place.op("Label")]


def own_function(bc, fn):
    """The walk, handed the day's number and the faction whose day it is."""
    nothing = returns_type(fn, word.SITE)
    own = new_function(bc, [reader_for(bc).count_kind, kind_named(bc, word.SIGNER)], nothing,
                       like=fn)
    walk = raisewalk.emit(bc, own, sys.modules[__name__])
    back = a_new_place(bc, own, nothing)
    replace_body(own, walk + [written(template(bc, "Ret"), ret=back)])
    return own


def every_faction(bc, fn, walk):
    """Ours, handed the day's number: one walk per faction in the game's own list."""
    def op(name, **operands):
        return written(template(bc, name), **operands)
    nothing = returns_type(fn, word.SITE)
    own = new_function(bc, [reader_for(bc).count_kind], nothing, like=fn)
    factions = a_new_place(bc, own, foreignwalk.the_list_kind(bc))
    faction = a_new_place(bc, own, kind_named(bc, word.SIGNER))
    length = a_new_place(bc, own, reader_for(bc).count_kind)
    index = a_new_place(bc, own, reader_for(bc).count_kind)
    back = a_new_place(bc, own, nothing)
    loop, done = "the next faction whose day began", "every faction's day walked"
    replace_body(own, assemble(
        foreignwalk.emit_the_list(bc, own, factions, done)
        + foreignwalk.emit_the_length(bc, own, factions, length, done)
        + [op("Int", dst=index, ptr=number(bc, 0)),
           loop + ":", op("Label"),
           (op("JSGte", a=index, b=length), done)]
        + foreignwalk.emit_the_faction_at(bc, own, factions, index, faction, done)
        + [op("Incr", dst=index),
           (op("JNull", reg=faction), loop),
           op("Call2", dst=back, fun=gv(walk.findex), arg0=0, arg1=faction),
           (op("JAlways"), loop),
           done + ":", op("Label"),
           op("Ret", ret=back)]))
    return own


def install(bc):
    """One call where the game writes the new day down, its daily updates already run."""
    fn = site(bc)
    at, day = the_point(bc, fn)
    bridge = every_faction(bc, fn, own_function(bc, fn))
    nothing = a_new_place(bc, fn, returns_type(bridge, word.SITE))
    calls = [written(template(bc, "Call1"), dst=nothing, fun=gv(bridge.findex), arg0=day)]
    how_many = insert(bc, fn, at, calls, SPLICE, traps.IN_PLAY)
    return ("NEW DAY: %d instruction(s) at %s, calling f@%d -- it raises a mark on every row "
            "whose trigger is %s, once per faction, when the day fits"
            % (how_many, word.SITE, gv(bridge.findex),
               ", ".join("`%s`" % w.WORD for w in (word,) + ALSO)))
