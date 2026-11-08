"""A siege action finished: walk each faction's rows and its things', weighing the besieger."""
import sys

from tools.project import gv, guard
from tools.hlcode import field_by_name, function_named, kind_named
from tools.splice import insert
from framework import raisewalk, sayonce, traps
from framework.triggers import on_siege_action as word
from framework.rowreader import reader_for

# what this splice is called, which is what its own record answers to
SPLICE = "a siege action finished"
# what the walk's own places are named after
NOUN = "siege"
# ⛔ all five are said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "a siege action finished"
HAS_FACTION = "the besieging faction is in hand"
HAS_THING = "the besieged thing is in hand"
RAISED = "a row owed something by this siege"
# where reading the action's name rejoins, and where a row that fires (unmarked or matching) lands
NO_ACTION = "the finishing action has no name"
FIRES = "this row fires on this action"


def site(bc):
    """The game's own end of one occupation action, found by name and checked to be about one."""
    fn = function_named(bc, word.SITE)
    found = gv(list(fn.regs)[0])
    guard(found == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, found, word.ABOUT))
    return fn


def what_is_in_hand(bc):
    """WHERE the two things sit on the component, both by the names its own type gives them."""
    about = kind_named(bc, word.ABOUT)
    return (field_by_name(bc, about, word.BESIEGER_ON, "a siege")[0],
            field_by_name(bc, about, word.BESIEGED_ON, "a siege")[0])


def the_action_finishing(bc):
    """WHERE the siege keeps the ending action, and where that keeps its id (a column's word)."""
    about = kind_named(bc, word.ABOUT)
    at, held = field_by_name(bc, about, word.ACTION_ON, "a siege")
    called_at, called_kind = field_by_name(bc, held, word.CALLED, "the action a siege is running")
    guard(called_kind == reader_for(bc).text_kind,
          "a siege action's `%s` is t@%s rather than the text a target column names"
          % (word.CALLED, called_kind))
    return at, held, called_at


def kinds(bc):
    """The besieger's kind, the besieged thing's, and the finishing action's."""
    about = kind_named(bc, word.ABOUT)
    action_kind = the_action_finishing(bc)[1]
    return (field_by_name(bc, about, word.BESIEGER_ON, "a siege")[1],
            field_by_name(bc, about, word.BESIEGED_ON, "a siege")[1], action_kind)


def opening(bc, fn, op, at, done):
    """The besieger, the besieged thing, and what the finishing action is called, said once."""
    faction_at, thing_at = what_is_in_hand(bc)
    action_at, _kind, called_at = the_action_finishing(bc)
    return (sayonce.emit_word_always(bc, fn, FINISHED, even_when_quiet=True)
            + [op("GetThis", dst=at.faction, field=faction_at),
               (op("JNull", reg=at.faction), done)]
            + sayonce.emit_word_always(bc, fn, HAS_FACTION, even_when_quiet=True)
            + [op("GetThis", dst=at.thing, field=thing_at),
               (op("JNull", reg=at.thing), done)]
            + sayonce.emit_word_always(bc, fn, HAS_THING, even_when_quiet=True)
            + [op("Null", dst=at.acting),
               op("GetThis", dst=at.running, field=action_at),
               (op("JNull", reg=at.running), NO_ACTION),
               op("Field", dst=at.acting, obj=at.running, field=called_at),
               NO_ACTION + ":",
               op("Label")]
            + sayonce.emit_always(bc, fn, at.acting))


def install(bc):
    """Splice it at the entry of the game's own end-of-action."""
    fn = site(bc)
    how_many = insert(bc, fn, 0, raisewalk.emit(bc, fn, sys.modules[__name__]), SPLICE,
                      traps.IN_PLAY)
    return ("SIEGE: %d instruction(s) at %s -- it walks each faction's rows and every thing's "
            "a scope declares, and raises a mark on every one whose trigger is `%s`, on a marked "
            "one only when the action finishing is the one its own target column names"
            % (how_many, word.SITE, word.WORD))
