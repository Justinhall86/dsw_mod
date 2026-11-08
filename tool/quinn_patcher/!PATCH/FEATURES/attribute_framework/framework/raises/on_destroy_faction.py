"""A faction's last main base fell: walk each faction's rows and its things', weighing the taker."""
import sys

from tools.project import gv, guard
from tools.hlcode import call_sites, field_by_name, function_named, kind_named
from tools.splice import insert
from framework import raisewalk, sayonce, traps
from framework.triggers import on_destroy_faction as word, on_eliminate
from framework.parsed import a_new_place
from framework.rowreader import reader_for

# what this splice is called, which is what its own record answers to
SPLICE = "a last base fell"
# what the walk's own places are named after
NOUN = "destruction"
# the other words a destruction raises too
ALSO = (on_eliminate,)
# ⛔ said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "a faction lost its last main base"
HAS_FACTION = "the destroyer is in hand"
HAS_THING = "the base taken is in hand"
RAISED = "a row owed something by this destruction"
FIRES = "this row fires on this destroyed faction"


def site(bc):
    """The game's own loss of a main base, checked to be about a faction."""
    fn = function_named(bc, word.SITE)
    found = gv(list(fn.regs)[0])
    guard(found == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, found, word.ABOUT))
    return fn


def the_point(bc, fn):
    """Where the victim is ended, and the destroyer and the base off the news sent right after."""
    ends = call_sites(fn, function_named(bc, word.BEFORE))
    guard(len(ends) == 1,
          "%s calls %s %d time(s), not once" % (word.SITE, word.BEFORE, len(ends)))
    news = [i for i in call_sites(fn, function_named(bc, word.NEWS)) if i > ends[0]]
    guard(news, "%s sends no %s after the victim is ended" % (word.SITE, word.NEWS))
    args = [gv(a) for a in fn.ops[news[0]].df["args"].value]
    regs = [gv(r) for r in fn.regs]
    is_faction = regs[args[1]] == kind_named(bc, word.ABOUT)
    guard(is_faction and regs[args[2]] == kind_named(bc, word.BASE),
          "the news after the victim is ended carries t@%s and t@%s, not a faction and a base"
          % (regs[args[1]], regs[args[2]]))
    return ends[0], args[1], args[2]


def the_called(bc):
    """WHERE a faction keeps its id, which is the text a target column names."""
    called_at, called_kind = field_by_name(bc, kind_named(bc, word.ABOUT), word.CALLED,
                                           "a faction")
    guard(called_kind == reader_for(bc).text_kind,
          "a faction's `%s` is t@%s rather than the text a target column names"
          % (word.CALLED, called_kind))
    return called_at


def kinds(bc):
    """The destroyer's kind, the victim's, and the base's."""
    return kind_named(bc, word.ABOUT), kind_named(bc, word.ABOUT), kind_named(bc, word.BASE)


def places(bc, fn, at):
    """Where the number floats: the base taken."""
    at.where = a_new_place(bc, fn, kind_named(bc, word.SHOWN_AS))


def opening(bc, fn, op, at, done):
    """The destroyer, the base, the victim and what the victim is called, said once."""
    _end, destroyer, base = the_point(bc, fn)
    return (sayonce.emit_word_always(bc, fn, FINISHED, even_when_quiet=True)
            + [op("Mov", dst=at.faction, src=destroyer),
               (op("JNull", reg=at.faction), done)]
            + sayonce.emit_word_always(bc, fn, HAS_FACTION, even_when_quiet=True)
            + [op("Mov", dst=at.running, src=base),
               (op("JNull", reg=at.running), done),
               op("Mov", dst=at.thing, src=0)]
            + sayonce.emit_word_always(bc, fn, HAS_THING, even_when_quiet=True)
            + [op("Field", dst=at.acting, obj=at.thing, field=the_called(bc)),
               op("UnsafeCast", dst=at.where, src=at.running)]
            + sayonce.emit_always(bc, fn, at.acting))


def install(bc):
    """Splice it just ahead of the game ending the victim, while the base taken is in hand."""
    fn = site(bc)
    end, _destroyer, _base = the_point(bc, fn)
    how_many = insert(bc, fn, end, raisewalk.emit(bc, fn, sys.modules[__name__]), SPLICE,
                      traps.IN_PLAY)
    return ("DESTRUCTION: %d instruction(s) at %s -- it raises a mark on every row whose "
            "trigger is `%s`, on a marked one only when the victim is the faction its own target "
            "column names" % (how_many, word.SITE, word.WORD))
