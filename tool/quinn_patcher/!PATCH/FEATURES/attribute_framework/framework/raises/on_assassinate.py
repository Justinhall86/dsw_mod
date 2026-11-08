"""An assassination succeeded: walk each faction's rows and its things', weighing the assassin."""
import sys

from tools.project import gv, guard
from tools.hlcode import call_sites, field_by_name, function_named, kind_named, returns_type
from tools.splice import insert
from framework import raisewalk, sayonce, traps
from framework.triggers import on_assassinate as word, on_eliminate
from framework.parsed import a_new_place
from framework.rowreader import reader_for

# what this splice is called, which is what its own record answers to
SPLICE = "an assassination succeeded"
# what the walk's own places are named after
NOUN = "assassination"
# the other words an assassination raises too
ALSO = (on_eliminate,)
# ⛔ said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "an assassination succeeded"
HAS_FACTION = "the assassin is in hand"
HAS_THING = "the victim is in hand"
RAISED = "a row owed something by this assassination"
FIRES = "this row fires on this victim"
# where finding the victim's main base rejoins, found or not
NO_BASE = "the victim's main base, looked for"


def site(bc):
    """The game's own success of an assassination, checked to be about a spy manager."""
    fn = function_named(bc, word.SITE)
    found = gv(list(fn.regs)[0])
    guard(found == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, found, word.ABOUT))
    return fn


def what_is_in_hand(bc):
    """WHERE the assassin and the assassination sit on the manager, by its own type's names."""
    about = kind_named(bc, word.ABOUT)
    return (field_by_name(bc, about, word.ASSASSIN_ON, "a spy manager")[0],
            field_by_name(bc, about, word.RECORD_ON, "a spy manager")[0])


def the_victim(bc):
    """WHERE the assassination keeps its victim, and where the victim keeps its id."""
    record = field_by_name(bc, kind_named(bc, word.ABOUT), word.RECORD_ON, "a spy manager")[1]
    at, victim = field_by_name(bc, record, word.VICTIM_ON, "an assassination")
    called_at, called_kind = field_by_name(bc, victim, word.CALLED, "the victim")
    guard(called_kind == reader_for(bc).text_kind,
          "a victim's `%s` is t@%s rather than the text a target column names"
          % (word.CALLED, called_kind))
    return at, victim, called_at, record


def kinds(bc):
    """The assassin's kind, the victim's, and the assassination's."""
    about = kind_named(bc, word.ABOUT)
    _at, victim, _called, record = the_victim(bc)
    return field_by_name(bc, about, word.ASSASSIN_ON, "a spy manager")[1], victim, record


def places(bc, fn, at):
    """The victim's main base, and where the number floats: that base, else the victim."""
    at.base = a_new_place(bc, fn, returns_type(function_named(bc, word.SHOWN_AT), word.SHOWN_AT))
    at.where = a_new_place(bc, fn, kind_named(bc, word.SHOWN_AS))


def opening(bc, fn, op, at, done):
    """The assassin, the assassination, its victim and what the victim is called, said once."""
    faction_at, record_at = what_is_in_hand(bc)
    victim_at, _victim, called_at, _record = the_victim(bc)
    return (sayonce.emit_word_always(bc, fn, FINISHED, even_when_quiet=True)
            + [op("GetThis", dst=at.faction, field=faction_at),
               (op("JNull", reg=at.faction), done)]
            + sayonce.emit_word_always(bc, fn, HAS_FACTION, even_when_quiet=True)
            + [op("GetThis", dst=at.running, field=record_at),
               (op("JNull", reg=at.running), done),
               op("Field", dst=at.thing, obj=at.running, field=victim_at),
               (op("JNull", reg=at.thing), done)]
            + sayonce.emit_word_always(bc, fn, HAS_THING, even_when_quiet=True)
            + [op("Field", dst=at.acting, obj=at.thing, field=called_at),
               op("Call1", dst=at.base, fun=gv(function_named(bc, word.SHOWN_AT).findex),
                  arg0=at.thing),
               op("UnsafeCast", dst=at.where, src=at.thing),
               (op("JNull", reg=at.base), NO_BASE),
               op("UnsafeCast", dst=at.where, src=at.base),
               NO_BASE + ":",
               op("Label")]
            + sayonce.emit_always(bc, fn, at.acting))


def install(bc):
    """Splice it just ahead of the game ending the victim, while its main base still stands."""
    fn = site(bc)
    found = call_sites(fn, function_named(bc, word.BEFORE))
    guard(len(found) == 1,
          "%s calls %s %d time(s), not once" % (word.SITE, word.BEFORE, len(found)))
    how_many = insert(bc, fn, found[0], raisewalk.emit(bc, fn, sys.modules[__name__]), SPLICE,
                      traps.IN_PLAY)
    return ("ASSASSINATION: %d instruction(s) at %s -- it raises a mark on every row whose "
            "trigger is `%s`, on a marked one only when the victim is the faction its own target "
            "column names" % (how_many, word.SITE, word.WORD))
