"""A treaty signed: walk each faction's rows and its things', once for each of its two signers."""
import sys

from tools.project import gv, guard
from tools.hlcode import (call_sites, function_named, kind_named, new_function, replace_body,
                          returns_type, template, written)
from tools.splice import insert
from framework import raisewalk, sayonce, traps
from framework.triggers import on_treaty as word
from framework.parsed import a_new_place
from framework.rowreader import reader_for

# what this splice is called, which is what its own record answers to
SPLICE = "a treaty signed"
# what the walk's own places are named after
NOUN = "signed treaty"
# ⛔ said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "a treaty was signed"
HAS_FACTION = "the signing faction is in hand"
HAS_THING = "the signed treaty's id is in hand"
RAISED = "a row owed something by this signing"
FIRES = "this row fires on this signing"
# the site's places the walk is handed, as (actor, partner): each signer is the actor once
SIGNERS = ((2, 3), (3, 2))
# the walk's own places: the diplomacy, the treaty's id, the actor, the partner
HANDED = 4
ITS_ID, ACTOR, PARTNER = 1, 2, 3


def site(bc):
    """The game's start of a treaty, checked to be about the diplomacy and two factions."""
    fn = function_named(bc, word.SITE)
    regs = [gv(r) for r in fn.regs]
    guard(regs[0] == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, regs[0], word.ABOUT))
    guard(regs[ITS_ID] == reader_for(bc).text_kind,
          "%s is handed t@%s rather than the text a target column names" % (word.SITE,
                                                                            regs[ITS_ID]))
    for actor, partner in SIGNERS:
        guard(regs[actor] == kind_named(bc, word.SIGNER),
              "%s place %d is t@%s rather than a %s" % (word.SITE, actor, regs[actor],
                                                         word.SIGNER))
    return fn


def the_point(bc, fn):
    """The first of the two alerts, one per signer, sent once the treaty is in place."""
    found = call_sites(fn, function_named(bc, word.BEFORE))
    guard(len(found) == len(SIGNERS),
          "%s calls %s %d time(s), not once per signer" % (word.SITE, word.BEFORE, len(found)))
    return found[0]


def kinds(bc):
    """The faction's kind, twice (it is also what fired), and the treaty id's."""
    signer = kind_named(bc, word.SIGNER)
    return signer, signer, reader_for(bc).text_kind


def places(bc, fn, at):
    """Where the number floats: nowhere of the event's own, so the scope's thing."""
    at.where = a_new_place(bc, fn, kind_named(bc, word.SHOWN_AS))


def opening(bc, fn, op, at, done):
    """The signing faction, the treaty's id, and where the number floats, said once."""
    return (sayonce.emit_word_always(bc, fn, FINISHED, even_when_quiet=True)
            + [op("Mov", dst=at.faction, src=ACTOR),
               (op("JNull", reg=at.faction), done),
               op("Mov", dst=at.thing, src=at.faction)]
            + sayonce.emit_word_always(bc, fn, HAS_FACTION, even_when_quiet=True)
            + [op("Mov", dst=at.running, src=ITS_ID),
               (op("JNull", reg=at.running), done)]
            + sayonce.emit_word_always(bc, fn, HAS_THING, even_when_quiet=True)
            + [op("Mov", dst=at.acting, src=at.running),
               op("Null", dst=at.where)]
            + sayonce.emit_always(bc, fn, at.acting))


def own_function(bc, fn):
    """The walk in a function of ours, handed the diplomacy, the treaty and both signers."""
    handed = [gv(r) for r in list(fn.regs)[:HANDED]]
    nothing = returns_type(fn, word.SITE)
    own = new_function(bc, handed, nothing, like=fn)
    walk = raisewalk.emit(bc, own, sys.modules[__name__])
    back = a_new_place(bc, own, nothing)
    replace_body(own, walk + [written(template(bc, "Ret"), ret=back)])
    return own


def both_signers(bc, fn, walk):
    """A function of ours calling the walk once per signer, so the site makes one call."""
    handed = [gv(r) for r in list(fn.regs)[:HANDED]]
    nothing = returns_type(fn, word.SITE)
    own = new_function(bc, handed, nothing, like=fn)
    back = a_new_place(bc, own, nothing)
    replace_body(own, [written(template(bc, "Call4"), dst=back, fun=gv(walk.findex), arg0=0,
                               arg1=ITS_ID, arg2=actor, arg3=partner)
                       for actor, partner in SIGNERS] + [written(template(bc, "Ret"), ret=back)])
    return own


def install(bc):
    """Splice one call, walking once per signer, once the treaty is in place, before its alerts."""
    fn = site(bc)
    own = both_signers(bc, fn, own_function(bc, fn))
    nothing = a_new_place(bc, fn, returns_type(fn, word.SITE))
    calls = [written(template(bc, "Call4"), dst=nothing, fun=gv(own.findex), arg0=0,
                     arg1=ITS_ID, arg2=SIGNERS[0][0], arg3=SIGNERS[0][1])]
    how_many = insert(bc, fn, the_point(bc, fn), calls, SPLICE, traps.IN_PLAY)
    return ("TREATY SIGNED: %d instruction(s) at %s calling f@%d, %d of ours -- it raises a "
            "mark on every row whose trigger is `%s`, once per signer, on a marked one only "
            "when the treaty is the one its own target column names"
            % (how_many, word.SITE, gv(own.findex), len(own.ops), word.WORD))
