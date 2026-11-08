#!/usr/bin/env python3
"""What proves `framework/traps.py`. Nothing here goes into the game."""
from tools.project import guard
from tools.splice import every_kind, where
from framework import traps
from framework.driver import scopes_with_drivers
from framework.storewalk import scopes_with_roads, splice_name


def check(bc):
    """Every refusal fires, every block names a declared kind, and a later trap reaches later."""
    _every_kind_says_what_one_is()
    _the_three_refusals(bc)
    _a_later_trap_reaches_a_later_member(bc)
    _both_per_tick_members_wear_it(bc)
    named = _every_block_names_a_kind_that_exists(bc)
    return "%d kind(s), %d trap(s), %d block(s) each naming one" % (
        len(traps.KINDS), len(traps.TRAPS), named)


def _every_block_names_a_kind_that_exists(bc):
    """The kinds `tools/splice.py` recorded, crossed against the kinds anything declares."""
    said = every_kind(bc)
    guard(said, "nothing was spliced, so no block could have named a kind")
    for what, kind in sorted(said.items()):
        guard(kind in traps.KINDS,
              "`%s` says it is `%s`, which nothing declares as a kind -- the kinds are %s"
              % (what, kind, ", ".join(sorted(traps.KINDS))))
    # ⚠ AND NOT "every kind has a member": that would test the order the cases run in
    return len(said)


def _every_kind_says_what_one_is():
    guard(traps.KINDS, "no kind is declared, so no trap could be about anything")
    for kind, why in traps.KINDS.items():
        guard(why and len(why) > 10,
              "`%s` says `%r` about what a member is, which is not an answer" % (kind, why))
    for trap in traps.TRAPS:
        guard(trap.kind in traps.KINDS,
              "`%s` is on `%s`, which is not a kind" % (trap.name, trap.kind))
        guard(trap.needs, "`%s` needs nothing, so nothing about a member could refuse it"
                          % trap.name)


def _refused(what):
    try:
        what()
    except RuntimeError:
        return True
    return False


def _the_three_refusals(bc):
    """A kind nobody declared, a trap on one, and a member that supplies nothing."""
    guard(_refused(lambda: traps.worn_by("a kind nobody declared")),
          "asking about a kind nobody declared was allowed")
    guard(_refused(lambda: traps.declare_trap("a kind nobody declared", "x", ("y",), None)),
          "a trap on a kind nobody declared was allowed")
    guard(_refused(lambda: traps.wear(bc, traps.PER_TICK, None, "LEAVE")),
          "a member that supplies nothing was allowed to wear a trap that needs something")
    guard(_refused(lambda: traps.declare_kind(traps.PER_TICK, "again")),
          "a kind was allowed to be declared twice")


def _a_later_trap_reaches_a_later_member(bc):
    """THE WHOLE POINT: a member wears whatever is declared by the moment it is written."""
    kind = traps.declare_kind("a kind this case invents", "it exists for exactly this check")
    try:
        first = len(traps.wear(bc, kind, None, "LEAVE"))
        guard(first == 0, "a fresh kind already carried %d instruction(s)" % first)
        traps.declare_trap(kind, "one this case declares", ("nothing",),
                      lambda bc_, fn, leaves, nothing: [nothing])
        later = traps.wear(bc, kind, None, "LEAVE", nothing="an instruction")
        guard(later == ["an instruction"],
              "a member written after the trap was declared carries %r" % (later,))
    finally:
        traps.KINDS.pop(kind, None)
        traps.TRAPS[:] = [t for t in traps.TRAPS if t.kind != kind]


def _both_per_tick_members_wear_it(bc):
    """Every road is a member of the per-tick kind, and each is in the game."""
    guard(traps.worn_by(traps.PER_TICK),
          "`%s` carries no trap, and the load guard is the reason it is a kind"
          % traps.PER_TICK)
    from framework.names import vocabulary
    words = vocabulary()
    guard(scopes_with_drivers(words), "no scope has a driver, so that kind has no member")
    for spelling in scopes_with_roads(words):
        guard(where(bc, splice_name(spelling)),
              "the `%s` rules never went in, so the second member is not there" % spelling)
