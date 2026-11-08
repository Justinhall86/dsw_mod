"""A quest completed by a faction: walk each faction's rows and its things', weighing it."""
import sys

from tools.project import gv, guard
from tools.hlcode import (call_sites, field_by_name, function_named, kind_named, new_function,
                          replace_body, returns_type, template, written)
from tools.splice import insert
from framework import questpick, raisewalk, sayonce, traps
from framework.triggers import on_quest_complete as word
from framework.parsed import a_new_place
from framework.raises.on_start_quest import kinds, owner_at, places  # noqa: F401

# what this splice is called, which is what its own record answers to
SPLICE = "a quest completed"
# what the walk's own places are named after
NOUN = "completed quest"
# ⛔ said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "a quest was completed"
HAS_FACTION = "the faction completing is in hand"
HAS_THING = "the completed quest's id is in hand"
RAISED = "a row owed something by this completion"
FIRES = "this row fires on this completion"
# past the trigger, its Of words keep the quest it fired on, or the row is not raised
emit_fired = questpick.fired_by(word)


def site(bc):
    """The game's own count of a completion, checked to be about a faction's quests and a quest."""
    fn = function_named(bc, word.SITE)
    regs = [gv(r) for r in fn.regs]
    guard(regs[0] == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, regs[0], word.ABOUT))
    guard(regs[1] == kind_named(bc, word.HANDED),
          "%s is handed t@%s rather than a %s" % (word.SITE, regs[1], word.HANDED))
    return fn


def the_point(bc, fn):
    """The one call that announces the completion, once it is counted."""
    found = call_sites(fn, function_named(bc, word.BEFORE))
    guard(len(found) == 1,
          "%s calls %s %d time(s), not once" % (word.SITE, word.BEFORE, len(found)))
    return found[0]


def its_id_at(bc):
    """WHERE a quest keeps its id."""
    return field_by_name(bc, kind_named(bc, word.HANDED), word.ITS_ID, "a quest")[0]


def opening(bc, fn, op, at, done):
    """The faction, the quest's id, and where the number floats, said once."""
    return (sayonce.emit_word_always(bc, fn, FINISHED, even_when_quiet=True)
            + [op("GetThis", dst=at.faction, field=owner_at(bc)[0]),
               (op("JNull", reg=at.faction), done),
               op("Mov", dst=at.thing, src=at.faction)]
            + sayonce.emit_word_always(bc, fn, HAS_FACTION, even_when_quiet=True)
            + [(op("JNull", reg=1), done),
               op("Field", dst=at.running, obj=1, field=its_id_at(bc)),
               (op("JNull", reg=at.running), done)]
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
    """Splice one call to the walk once the completion is counted, ahead of its announcement."""
    fn = site(bc)
    own = own_function(bc, fn)
    nothing = a_new_place(bc, fn, returns_type(fn, word.SITE))
    call = written(template(bc, "Call2"), dst=nothing, fun=gv(own.findex), arg0=0, arg1=1)
    how_many = insert(bc, fn, the_point(bc, fn), [call], SPLICE, traps.IN_PLAY)
    return ("QUEST COMPLETED: %d instruction(s) at %s calling f@%d, %d of ours -- it raises a "
            "mark on every row whose trigger is `%s`, on a marked one only when the quest is the "
            "one its own target column names"
            % (how_many, word.SITE, gv(own.findex), len(own.ops), word.WORD))
