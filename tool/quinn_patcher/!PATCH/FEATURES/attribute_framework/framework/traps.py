#!/usr/bin/env python3
"""A trap is a property of a KIND: a member asks here as it is written and wears every trap."""
from tools.project import guard
from framework.loadguard import emit_wait, world_slot

# every kind anything may belong to, and why it is one -- declared, never inferred from a name
KINDS = {}
# every trap, in the order it was declared, so two on one kind are worn in a settled order
TRAPS = []


class Trap:
    """One rule, the kind it is about, and what a member of that kind has to carry because of it."""

    __slots__ = ("kind", "name", "needs", "emit")

    def __init__(self, kind, name, needs, emit):
        self.kind = kind
        self.name = name
        # what the member must hand over for this to be written at all, by name
        self.needs = tuple(needs)
        self.emit = emit

    def __repr__(self):
        return "Trap(%s on %s)" % (self.name, self.kind)


def declare_kind(kind, why):
    """Say that a kind exists, and what makes something a member of it."""
    guard(kind not in KINDS, "`%s` is declared twice as a kind" % kind)
    guard(why, "`%s` is declared as a kind and says nothing about what one IS" % kind)
    KINDS[kind] = why
    return kind


def declare_trap(kind, name, needs, emit):
    """Say that every member of that kind carries this. Refused if the kind is not one."""
    guard(kind in KINDS,
          "`%s` is a trap on `%s`, which is not a kind anything declares -- %s"
          % (name, kind, "the kinds are %s" % ", ".join(sorted(KINDS)) if KINDS else "none exist"))
    guard(not [t for t in TRAPS if t.kind == kind and t.name == name],
          "`%s` is declared twice on `%s`" % (name, kind))
    TRAPS.append(Trap(kind, name, needs, emit))
    return TRAPS[-1]


def worn_by(kind):
    """Every trap a member of that kind wears, in the order they were declared."""
    guard(kind in KINDS,
          "`%s` is not a kind anything declares, so nothing can be said about its members" % kind)
    return [t for t in TRAPS if t.kind == kind]


def wear(bc, kind, fn, goes_to, **supplied):
    """A member's instructions: `goes_to` is where a trap stops it, `supplied` what it hands."""
    out = []
    for trap in worn_by(kind):
        missing = [what for what in trap.needs if what not in supplied]
        guard(not missing,
              "a `%s` was written without %s, and `%s` needs %s"
              % (kind, ", ".join(missing), trap.name, ", ".join(trap.needs)))
        out += list(trap.emit(bc, fn, goes_to, **{w: supplied[w] for w in trap.needs}))
    return out


def install(bc):
    """Declare the kinds and traps, emptying both lists first: `build.py` builds twice a run."""
    KINDS.clear()
    del TRAPS[:]
    _the_kinds_and_their_traps()
    return ("TRAPS: %d kind(s) and %d trap(s) -- %s"
            % (len(KINDS), len(TRAPS),
               "; ".join("`%s` carries %s" % (k, ", ".join("`%s`" % t.name for t in worn_by(k)) or
                                              "nothing yet") for k in sorted(KINDS))))


# ------------------------------------------------------- the kinds, and the traps on them

PER_TICK = "a splice that runs every tick"
AT_AUTHORED_DATA = "a splice where the game reads what a modder wrote"
AT_A_MOMENT = "a splice at a moment the world has"
IN_PLAY = "a splice at something the game does in play"
AT_A_SAVE = "a splice where the game writes or reads a save"
FOR_A_CASE = "a block a case makes to test the splicer"
WAITS = "waits for the world"


def _the_kinds_and_their_traps():
    """The four kinds a block may belong to (the fourth a case's) and the trap declared on them."""
    declare_kind(PER_TICK, "it is spliced into something the game runs on its own clock, so it "
                           "can be reached before the world exists")
    declare_kind(AT_AUTHORED_DATA, "it runs where the game reads or files an authored row, which "
                                   "is once per row or per application and never on a tick")
    declare_kind(AT_A_MOMENT, "it runs at one of the two moments a world has -- becoming real, "
                              "and being replaced -- and at no other time")
    declare_kind(IN_PLAY, "it runs where the game does something a player caused, so the "
                          "world is real by the time it is reached and nothing it publishes "
                          "may be published before every refusal has been passed")
    declare_kind(AT_A_SAVE, "it runs where the game writes a saved thing out or reads one "
                            "back, so the order it runs in is the order every other saved "
                            "place is written and read at")
    # the one that is not a place in the game. It carries no trap and never will
    declare_kind(FOR_A_CASE, "a case made it to test the splicer, and it never reaches the game")
    declare_trap(PER_TICK, WAITS, ("world",), _emit_wait)


def _emit_wait(bc, fn, goes_to, world):
    """Leave unless the world is real. The trap that crashed a build when a driver skipped it."""
    return emit_wait(bc, fn, world_slot(bc), world, goes_to)
