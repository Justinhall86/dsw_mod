"""A quest ending unfinished: kept in the faction's tally, then each faction's rows walked."""
import sys

from tools.project import gv, guard
from tools.hlcode import (argument_kinds, call_sites, field_by_name, function_named, kind_named,
                          new_function, number, replace_body, returns_type, template, text_object,
                          written)
from tools.splice import insert
from framework import questpick, raisewalk, sayonce, traps
from framework.triggers import on_quest_fail as word
from framework.parsed import a_new_place
from framework.rowreader import reader_for
from framework.questions import quest_done, quests_done
from framework.questions.quests_failed import KEPT_AS
from framework.raises.on_start_quest import kinds, owner_at, places  # noqa: F401

# what this splice is called, which is what its own record answers to
SPLICE = "a quest failed"
# what the walk's own places are named after
NOUN = "failed quest"
# ⛔ said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "a quest ended unfinished"
KEPT = "the unfinished quest is kept in its faction's tally"
HAS_FACTION = "the faction failing is in hand"
HAS_THING = "the failed quest's id is in hand"
RAISED = "a row owed something by this failure"
FIRES = "this row fires on this failure"
# past the trigger, its Of words keep the quest it fired on, or the row is not raised
emit_fired = questpick.fired_by(word)
# the tally's own reading and writing, as the game's completion count uses them
GETS, PUTS = ("%s.%s" % (quests_done.AS_MAP, n) for n in ("get", "set"))


def site(bc):
    """The game's own ending of a quest, checked to be about a faction's quests and a quest."""
    fn = function_named(bc, word.SITE)
    regs = [gv(r) for r in fn.regs]
    guard(regs[0] == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, regs[0], word.ABOUT))
    guard(regs[1] == kind_named(bc, word.HANDED),
          "%s is handed t@%s rather than a %s" % (word.SITE, regs[1], word.HANDED))
    return fn


def the_point(bc, fn):
    """Right past the test that the quest was on the running list to take off."""
    found = call_sites(fn, function_named(bc, word.AFTER))
    guard(len(found) == 1,
          "%s calls %s %d time(s), not once" % (word.SITE, word.AFTER, len(found)))
    guard(fn.ops[found[0] + 1].op == "JFalse",
          "%s does not test what %s answers right after it" % (word.SITE, word.AFTER))
    return found[0] + 2


def _of(bc, kind, name, what):
    return field_by_name(bc, kind_named(bc, kind), name, what)


def _kept(bc, fn, op, key, by, done):
    """`by` added to what the quests' tally keeps under `key`, none kept counted as none."""
    tally_at, tally = _of(bc, quests_done.QUESTS, quests_done.TALLY, "quests")
    held_at, held = _of(bc, quests_done.TALLY_KIND, quests_done.HELD_IN, "a tally")
    get, put = function_named(bc, GETS), function_named(bc, PUTS)
    the_map = a_new_place(bc, fn, kind_named(bc, quests_done.AS_MAP))
    got = a_new_place(bc, fn, returns_type(get, GETS))
    boxed = a_new_place(bc, fn, argument_kinds(bc, PUTS)[-1])
    count, step = (a_new_place(bc, fn, reader_for(bc).count_kind) for _ in range(2))
    tallied, holding = a_new_place(bc, fn, gv(tally)), a_new_place(bc, fn, gv(held))
    back = a_new_place(bc, fn, returns_type(put, PUTS))
    none = "%s: kept %d, none before" % (NOUN, by)
    return [op("Field", dst=tallied, obj=0, field=tally_at),
            (op("JNull", reg=tallied), done),
            op("Field", dst=holding, obj=tallied, field=held_at),
            (op("JNull", reg=holding), done),
            op("SafeCast", dst=the_map, src=holding),
            op("Int", dst=count, ptr=number(bc, 0)),
            op("Call2", dst=got, fun=gv(get.findex), arg0=the_map, arg1=key),
            (op("JNull", reg=got), none),
            op("SafeCast", dst=count, src=got),
            none + ":", op("Label"),
            # ⛔ the file keeps its numbers unsigned: a step down is a `Sub` of 1, never a -1
            op("Int", dst=step, ptr=number(bc, abs(by))),
            op("Add" if by > 0 else "Sub", dst=count, a=count, b=step),
            op("ToDyn", dst=boxed, src=count),
            op("Call3", dst=back, fun=gv(put.findex), arg0=the_map, arg1=key, arg2=boxed)]


def its_id_at(bc):
    """WHERE a quest keeps its id."""
    return field_by_name(bc, kind_named(bc, word.HANDED), word.ITS_ID, "a quest")[0]


def opening(bc, fn, op, at, done):
    """No completion; kept in the tally; the faction, the quest's id, where the number floats."""
    done_at, done_kind = _of(bc, word.HANDED, word.DONE_ON, "a quest")
    ended = a_new_place(bc, fn, gv(done_kind))
    mark, key = (a_new_place(bc, fn, reader_for(bc).text_kind) for _ in range(2))
    join = gv(function_named(bc, quest_done.JOINED_BY).findex)
    return ([(op("JNull", reg=1), done),
             op("Field", dst=ended, obj=1, field=done_at),
             (op("JTrue", cond=ended), done)]
            + sayonce.emit_word_always(bc, fn, FINISHED, even_when_quiet=True)
            + [op("Field", dst=at.running, obj=1, field=its_id_at(bc)),
               (op("JNull", reg=at.running), done),
               op("GetGlobal", **{"dst": mark, "global": text_object(bc, KEPT_AS)}),
               op("Call2", dst=key, fun=join, arg0=at.running, arg1=mark)]
            + _kept(bc, fn, op, key, 1, done) + _kept(bc, fn, op, mark, -1, done)
            + sayonce.emit_word_always(bc, fn, KEPT, even_when_quiet=True)
            + [op("GetThis", dst=at.faction, field=owner_at(bc)[0]),
               (op("JNull", reg=at.faction), done),
               op("Mov", dst=at.thing, src=at.faction)]
            + sayonce.emit_word_always(bc, fn, HAS_FACTION, even_when_quiet=True)
            + sayonce.emit_word_always(bc, fn, HAS_THING, even_when_quiet=True)
            + [op("Mov", dst=at.acting, src=at.running),
               op("Null", dst=at.where)]
            + sayonce.emit_always(bc, fn, at.acting))


def own_function(bc, fn):
    """The walk in a function of ours, handed the quests and the quest as the site has them."""
    handed = [gv(r) for r in list(fn.regs)[:2]]
    nothing = returns_type(fn, word.SITE)
    own = new_function(bc, handed, nothing, like=fn)
    walk = raisewalk.emit(bc, own, sys.modules[__name__])
    back = a_new_place(bc, own, nothing)
    replace_body(own, walk + [written(template(bc, "Ret"), ret=back)])
    return own


def install(bc):
    """Splice one call to the walk where an unfinished quest has just left the running list."""
    text_object(bc, KEPT_AS)
    fn = site(bc)
    own = own_function(bc, fn)
    nothing = a_new_place(bc, fn, returns_type(fn, word.SITE))
    call = written(template(bc, "Call2"), dst=nothing, fun=gv(own.findex), arg0=0, arg1=1)
    how_many = insert(bc, fn, the_point(bc, fn), [call], SPLICE, traps.IN_PLAY)
    return ("QUEST FAILED: %d instruction(s) at %s calling f@%d, %d of ours -- an unfinished "
            "quest is kept in its faction's tally and raises a mark on every row whose trigger "
            "is `%s`" % (how_many, word.SITE, gv(own.findex), len(own.ops), word.WORD))
