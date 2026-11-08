"""A treaty ended: walk each faction's rows and its things', once for each of its two sides."""
import sys

from tools.project import gv, guard
from tools.hlcode import (assemble, call_sites, function_named, kind_named, new_function,
                          replace_body, returns_type, template, written)
from tools.splice import insert
from framework import raisewalk, sayonce, traps
from framework.ownermatch import THE_GAME_CLASS, THE_GAME_ON, THE_STATE_ON
from framework.triggers import on_treaty_end as word
from framework.triggers.on_treaty import SITE as SIGNING
from framework.raises.on_treaty import kinds, places  # noqa: F401
from framework.parsed import a_new_place
from framework.rowreader import reader_for

# what the two splices are called, which is what their own records answer to
SPLICE, DEFEAT = "a treaty ended", "a defeated faction's treaty dropped"
# what the walk's own places are named after
NOUN = "ended treaty"
# ⛔ said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "a treaty ended"
HAS_FACTION = "the faction whose treaty ended is in hand"
HAS_THING = "the ended treaty's id is in hand"
RAISED = "a row owed something by this ending"
FIRES = "this row fires on this ending"
# the walk's own places: the diplomacy, the treaty's id, the actor, the partner, ran its time
ITS_ID, ACTOR, PARTNER, BY_TIME = 1, 2, 3, 4
# where the game's clock is on its state, as its own expiry reads it
CLOCK = "time"
# what a yes-or-no word says that this raise answers, and what its gate is called
RAN, IN_ENDING = "ran its time", "the ending is the one its row's words say"
# how the game's update hands its daily check the diplomacy
DAILY_CLOSES = "InstanceClosure"


def site(bc):
    """The game's drain of a treaty, checked to be about the diplomacy."""
    fn = function_named(bc, word.SITE)
    guard(gv(fn.regs[0]) == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, gv(fn.regs[0]), word.ABOUT))
    return fn


def the_drain(bc, fn, what):
    """Right past the one call taking the record off the list, and the test of what it said."""
    found = call_sites(fn, function_named(bc, word.DRAINS))
    guard(len(found) == 1, "%s calls %s %d time(s), not once" % (what, word.DRAINS, len(found)))
    at = found[0]
    after = fn.ops[at + 1]
    guard(after.op == "JFalse" and gv(after.df["cond"]) == gv(fn.ops[at].df["dst"]),
          "%s does not test what %s said right after it" % (what, word.DRAINS))
    guard(gv(fn.ops[at].df["arg1"]) == 1, "%s drains something other than its record" % what)
    return at + 2


def the_daily(bc):
    """The game's daily check of one treaty, the one function its update closes over."""
    update = function_named(bc, word.DAILY)
    closed = [o for o in update.ops if o.op == DAILY_CLOSES]
    guard(len(closed) == 1, "%s closes over %d function(s), not one" % (word.DAILY, len(closed)))
    fn = next(f for f in bc.functions if gv(f.findex) == gv(closed[0].df["fun"]))
    guard([gv(r) for r in fn.regs[:2]] == [gv(r) for r in site(bc).regs[:2]],
          "%s's daily check is not handed the diplomacy and a treaty record" % word.DAILY)
    return fn


def opening(bc, fn, op, at, done):
    """The ending side, the treaty's id, and where the number floats, said once."""
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


def emit_fired(bc, fn, at, into, refused):
    """Past this, every yes-or-no word the row spelled after the trigger says what happened."""
    from framework import columns
    from framework.names import vocabulary
    from framework.narrowmatch import flag_of
    from framework.pipeline import Place, hands_for
    place = Place(name=IN_ENDING, row=into, notes={}, note=None, kept=None, store=None,
                  refused=refused, hands=hands_for(bc, fn))
    flagged = sorted(s for s, w in vocabulary().items() if flag_of(w) == RAN)
    return [op for spelling in flagged for op in raisewalk.emit_flagged(
        place, spelling, into[columns.PART_FOR_NARROWING], BY_TIME, refused)]


def own_function(bc, fn):
    """The walk, handed the diplomacy, the treaty's id, both sides, and whether it ran its time."""
    signing = function_named(bc, SIGNING)
    handed = [gv(r) for r in list(signing.regs)[:4]] + [reader_for(bc).count_kind]
    guard(handed[1] == reader_for(bc).text_kind and handed[2] == handed[3] == kind_named(
        bc, word.SIGNER), "%s is not handed a treaty id and two factions" % SIGNING)
    nothing = returns_type(fn, word.SITE)
    own = new_function(bc, handed, nothing, like=fn)
    walk = raisewalk.emit(bc, own, sys.modules[__name__])
    back = a_new_place(bc, own, nothing)
    replace_body(own, walk + [written(template(bc, "Ret"), ret=back)])
    return own


def _ran_its_time(at, kind, ran, done):
    """`ran` is 1 when the treaty's kind has a length and the game's clock is past it; else 0."""
    started_at, started = at.field_of(1, word.STARTED)
    length = at.scratch_return(word.LENGTH)
    full, lasted, zero = (at.scratch_of("I32") for _ in range(3))
    seconds = at.scratch_like(started)
    holding = at.scratch_of(THE_GAME_CLASS)
    game_at, game = at.field_of(THE_GAME_CLASS, THE_GAME_ON)
    state_at, state = at.field_of(game, THE_STATE_ON)
    clock_at, clock = at.field_of(state, CLOCK)
    return [
        at.op("Int", dst=ran, ptr=at.number(0)),
        at.op("Int", dst=zero, ptr=at.number(0)),
        at.op("Field", dst=started, obj=1, field=started_at),
        at.op("Call1", dst=length, fun=at.named_function(word.LENGTH), arg0=kind),
        (at.op("JNull", reg=length), done),
        at.op("SafeCast", dst=seconds, src=length),
        at.op("ToInt", dst=full, src=seconds),
        (at.op("JSLte", a=full, b=zero), done),
        at.op("GetGlobal", **{"dst": holding, "global": at.the_one_global(THE_GAME_CLASS)}),
        at.op("Field", dst=game, obj=holding, field=game_at),
        (at.op("JNull", reg=game), done),
        at.op("Field", dst=state, obj=game, field=state_at),
        (at.op("JNull", reg=state), done),
        at.op("Field", dst=clock, obj=state, field=clock_at),
        at.op("Sub", dst=seconds, a=clock, b=started),
        at.op("ToInt", dst=lasted, src=seconds),
        (at.op("JSLt", a=lasted, b=full), done),
        at.op("Int", dst=ran, ptr=at.number(1)),
        done + ":", at.op("Label")]


def both_sides(bc, fn, walk):
    """Ours, handed the diplomacy and the record: one walk per side, each its actor once."""
    from framework.pipeline import Place, hands_for
    nothing = returns_type(fn, word.SITE)
    own = new_function(bc, [gv(r) for r in list(fn.regs)[:2]], nothing, like=fn)
    at = Place("treaty ending", {}, {}, None, None, None, "treaty ending: refused",
               hands_for(bc, own))
    read, sides = [], []
    for side in word.SIDES:
        side_at, held = at.field_of(1, side)
        read.append(at.op("Field", dst=held, obj=1, field=side_at))
        sides.append(held)
    kind_at, kind = at.field_of(1, word.KIND)
    ran = at.scratch_of("I32")
    back = a_new_place(bc, own, nothing)
    first, second = sides
    return replace_body(own, assemble(
        read + [at.op("Field", dst=kind, obj=1, field=kind_at)]
        + _ran_its_time(at, kind, ran, at.here("its time weighed"))
        + [at.op("CallN", dst=back, fun=gv(walk.findex), args=[0, kind, actor, partner, ran])
           for actor, partner in ((first, second), (second, first))]
        + [at.op("Ret", ret=back)]))


def _spliced(bc, fn, at, bridge, name):
    """One call to ours, handed the diplomacy and the record, at `at`."""
    nothing = a_new_place(bc, fn, returns_type(bridge, word.SITE))
    calls = [written(template(bc, "Call2"), dst=nothing, fun=gv(bridge.findex), arg0=0, arg1=1)]
    return insert(bc, fn, at, calls, name, traps.IN_PLAY)


def install(bc):
    """One call where the record left the list: the game's drain, and the daily defeat check."""
    fn = site(bc)
    daily = the_daily(bc)
    bridge = both_sides(bc, fn, own_function(bc, fn))
    drained = _spliced(bc, fn, the_drain(bc, fn, word.SITE), bridge, SPLICE)
    dropped = _spliced(bc, daily, the_drain(bc, daily, word.DAILY), bridge, DEFEAT)
    return ("TREATY ENDED: %d instruction(s) at %s and %d in its daily check, calling f@%d -- it "
            "raises a mark on every row whose trigger is `%s`, once per side, on a marked one "
            "only when the treaty is the one its own target column names"
            % (drained, word.SITE, dropped, gv(bridge.findex), word.WORD))
