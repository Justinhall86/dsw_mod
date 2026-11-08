#!/usr/bin/env python3
"""Membership for a SET reach: walk the holder's village's list (`SET_MEMBERS`), compare `__uid`."""
from tools.project import gv, guard
from tools.hlcode import (class_global, field_by_name, function_named, kind_named, number,
                          returns_type)
from framework import reach, tray
from framework.acts.spawn_tunits import CALLED_ON as A_VILLAGE
from framework.ofthekind import IS_REALLY
from framework.parsed import a_new_place

# what a word declares: the route from a village to the things its set holds, by name
MEMBERS_BY = "SET_MEMBERS"
# the other kind that names a set (its own village's); anything else names an EMPTY set
A_MILITIA = "ent.Army"
# and how a militia says which village raised it (never the wider `_structure` beside it)
ITS_VILLAGE = "militiaSource"
# what a list hung off a village is wrapped in, and the place inside it holding the array
WRAPPER = "hxbit.ArrayProxyData"
UNWRAPS_AT = "array"
# the field every holder carries its identity in; compared on this, never on a register
THE_ID_ON = "__uid"
# the four words this step can say, one per way out, behind the switch the old question used
BELONGS = "SPINE a set row's %s thing is in the carrier's list"
NO_VILLAGE = "SPINE a set row's %s carrier names no village"
EMPTY = "SPINE a set row's %s carrier has an empty list"
NOT_IN_IT = "SPINE a set row's %s thing is not in the carrier's list"


# the kinds a carrier may be and still name a set (a militia gets on by the ordinary gate)
CAN_HOLD_A_SET = (A_VILLAGE,)
from framework.ownermatch import OWNER_OF as ITS_FACTION, ASKED_ON as ANY_THING  # noqa: E402
# the field a holder keeps its rules in is the road's; `where_the_rules_are` fetches it

# and the three words the set-carrier pass says, one per way out

LET_ON = "SPINE a %s road took a set carrier of another kind"
# ⛔ THE THIRD WAY OUT IS NOT SAID: it is the ORDINARY case (1.4 million lines in 90 seconds)
NOT_A_HOLDER = None
NOT_OURS = "SPINE a %s road met a set carrier another faction owns"


def where_the_rules_are(bc):
    """Which field a holder keeps its own rules in, asked on the kind every holder shares."""
    from framework.storewalk import STORE_ON
    return field_by_name(bc, kind_named(bc, reach.EVERY_HOLDER), STORE_ON, "any holder")[0]


# the switch these words ride, spelled once so a caller can gate on it without a second literal
WORD = "belongpath"


def saying():
    """Is this step saying which way out it took? `standalone/onoff.py` holds the switch."""
    from standalone import onoff
    return onoff.on(WORD)


def _the_way_out(bc, fn, word):
    """One way out, behind this step's own word, so the board alone says if it is heard."""
    from framework import board, sayonce
    return board.said(bc, fn, "belongpath", lambda: sayonce.emit_word_always(
        bc, fn, word, even_when_quiet=True))


def words():
    """All four, for anything counting them in a log."""
    return (BELONGS, NO_VILLAGE, EMPTY, NOT_IN_IT)


def routes(bc, vocab=None):
    """{the kept reach value: the route from a village to that set's members}; no route refused."""
    from framework import scopematch
    from framework.names import module_of, vocabulary
    vocab = vocabulary() if vocab is None else vocab
    out = {}
    for spelling, word in scopematch.only_scopes(vocab).items():
        module = module_of(word)
        case = getattr(module, "REHOSTS_FROM", None)
        if not case or not getattr(module, reach.SETS_BY, False):
            continue
        route = getattr(module, MEMBERS_BY, None)
        guard(route, "`%s` says its reach names a set and declares no `%s` to reach one with"
              % (spelling, MEMBERS_BY))
        out[reach.case_value(bc, case)] = tuple(route)
    return out


def _asking(tag, n):
    """The place where the carrier is asked about the n-th kind that names its village."""
    return "%s: is the carrier kind %d" % (tag, n)


def carriers_that_name_a_village(bc, vocab=None):
    """[(a carrier kind, the FIELD naming its village)], off the scope words' own `HOST`."""
    from framework import scopematch
    from framework.names import module_of, vocabulary
    from tools.hlcode import field_by_name, kind_named
    vocab = vocabulary() if vocab is None else vocab
    out, seen = [], set()
    for spelling, word in scopematch.only_scopes(vocab).items():
        module = module_of(word)
        host = getattr(module, "HOST", None)
        entity = getattr(module, "ENTITY", None)
        if not host or not entity or "." in host or entity in seen:
            continue
        # the name has to BE a field of that kind, checked now rather than at run time
        at, holds = field_by_name(bc, kind_named(bc, entity), host,
                                  "the village a %s stands in" % spelling)
        guard(holds is not None, "`%s` names `%s` as its host and it holds nothing"
              % (spelling, host))
        seen.add(entity)
        out.append((entity, at))
    return out


def _route_kinds(bc, route):
    """Every step of a route checked against the file BEFORE anything is emitted."""
    guard(route, "a route to a set's members cannot be empty")
    at, steps = kind_named(bc, A_VILLAGE), []
    for name in route:
        where, holds = field_by_name(bc, at, name, "a village's own list")
        steps.append((where, holds))
        at = holds
    guard(at == kind_named(bc, WRAPPER),
          "the route `%s` ends on a t@%s, and a list of members is kept in a %s"
          % (".".join(route), at, WRAPPER))
    return steps


def emit_is_a_member(bc, fn, op, reader, word, held, carrier, leave):
    """Is the thing in hand one of the members the carrier's village names? (no set: through)"""
    the_routes = routes(bc)
    if not the_routes:
        return []

    def _why(one):
        if not saying():
            return []
        return _the_way_out(bc, fn, one % word)

    wanted = reader.borrow_register(bc, fn, "count_kind")
    mine_id = reader.borrow_register(bc, fn, "count_kind")
    their_id = reader.borrow_register(bc, fn, "count_kind")
    at_place = reader.borrow_register(bc, fn, "count_kind")
    this_one = reader.borrow_register(bc, fn, "count_kind")
    how_many = reader.borrow_register(bc, fn, "count_kind")
    village = a_new_place(bc, fn, kind_named(bc, A_VILLAGE))
    militia = a_new_place(bc, fn, kind_named(bc, A_MILITIA))
    village_class = a_new_place(bc, fn,
                                gv(bc.global_types[class_global(bc, kind_named(bc, A_VILLAGE))]))
    militia_class = a_new_place(bc, fn,
                                gv(bc.global_types[class_global(bc, kind_named(bc, A_MILITIA))]))
    really = a_new_place(bc, fn, returns_type(function_named(bc, IS_REALLY), IS_REALLY))
    # AND A PLACE AND A CLASS PER KIND THAT NAMES ITS VILLAGE WITH A FIELD, from the declarations
    standing_in = [(entity, at, a_new_place(bc, fn, kind_named(bc, entity)),
                    a_new_place(bc, fn,
                                gv(bc.global_types[class_global(bc, kind_named(bc, entity))])))
                   for entity, at in carriers_that_name_a_village(bc)]
    holder = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    got = a_new_place(bc, fn, kind_named(bc, "Dyn"))
    listed = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    # where a village keeps its own identity, and where each member keeps its own
    ours_at = field_by_name(bc, gv(list(fn.regs)[0]), THE_ID_ON, "the thing in hand")[0]
    theirs_at = field_by_name(bc, kind_named(bc, reach.EVERY_HOLDER), THE_ID_ON, "a member")[0]
    raised_at = field_by_name(bc, kind_named(bc, A_MILITIA), ITS_VILLAGE, "a militia")[0]
    unwraps_at, unwrapped = field_by_name(bc, kind_named(bc, WRAPPER), UNWRAPS_AT, "a list")
    raw = a_new_place(bc, fn, unwrapped)
    counted_at = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.COUNT_ON,
                               "a list")[0]
    backing_at, backing_kind = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES),
                                             tray.BACKING_ON, "a list")
    backing = a_new_place(bc, fn, backing_kind)
    through = "%s: this row's reach names no set" % word
    # ⛔⛔ EVERY PLACE THIS WALK READS INTO IS EMPTIED FIRST, or an early exit keeps a stale one
    steps_by_value, emptied = {}, []
    for value, route in sorted(the_routes.items()):
        steps = _route_kinds(bc, route)
        steps_by_value[value] = [(where, holds, a_new_place(bc, fn, holds))
                                 for where, holds in steps]
        emptied += [at for _where, _holds, at in steps_by_value[value]]
    # ⛔ `listed` AND `got` ARE EMPTIED TOO, though no `Field` writes them
    out = [op("Null", dst=at)
           for at in [village, militia, raw, backing, holder, listed, got] + emptied]
    for value, route in sorted(the_routes.items()):
        tag = "%s set %d" % (word, value)
        past = "%s: not this case" % tag
        a_militia = "%s: the carrier is not a village" % tag
        have = "%s: a village in hand" % tag
        nowhere = "%s: no village at all" % tag
        empty = "%s: nothing in the list" % tag
        missing = "%s: not in the list" % tag
        again = "%s: the next member" % tag
        # is the row's reach this case at all? Everything below is inside that one test
        out += [op("Int", dst=wanted, ptr=number(bc, value)),
                (op("JNotEq", a=held, b=wanted), past),
                # THE CARRIER'S VILLAGE, the carrier asked what it IS before it is read
                op("Null", dst=village),
                op("GetGlobal", **{"dst": village_class,
                                   "global": class_global(bc, kind_named(bc, A_VILLAGE))}),
                op("Call2", dst=really, fun=gv(function_named(bc, IS_REALLY).findex),
                   arg0=village_class, arg1=carrier),
                (op("JFalse", cond=really), a_militia),
                op("UnsafeCast", dst=village, src=carrier),
                (op("JAlways"), have),
                # a militia names the one that raised it
                a_militia + ":", op("Label"),
                op("GetGlobal", **{"dst": militia_class,
                                   "global": class_global(bc, kind_named(bc, A_MILITIA))}),
                op("Call2", dst=really, fun=gv(function_named(bc, IS_REALLY).findex),
                   arg0=militia_class, arg1=carrier),
                (op("JFalse", cond=really), _asking(tag, 0)),
                op("UnsafeCast", dst=militia, src=carrier),
                op("Field", dst=village, obj=militia, field=raised_at),
                (op("JAlways"), have)]
        # AND EVERY OTHER KIND NAMING ITS VILLAGE BY A FIELD (a BUILDING), before any misfire
        for n, (entity, at, place, its_class) in enumerate(standing_in):
            out += [_asking(tag, n) + ":", op("Label"),
                    op("GetGlobal", **{"dst": its_class,
                                       "global": class_global(bc, kind_named(bc, entity))}),
                    op("Call2", dst=really, fun=gv(function_named(bc, IS_REALLY).findex),
                       arg0=its_class, arg1=carrier),
                    (op("JFalse", cond=really), _asking(tag, n + 1)),
                    op("UnsafeCast", dst=place, src=carrier),
                    op("Field", dst=village, obj=place, field=at),
                    (op("JAlways"), have)]
        # asked about every kind and matched none: NOW it is the misfire, and an empty set
        out += [_asking(tag, len(standing_in)) + ":", op("Label"),
                (op("JAlways"), nowhere),
                have + ":", op("Label"),
                (op("JNull", reg=village), nowhere)]
        # the route from that village to the list, one named step at a time
        at_reg = village
        for where, _holds, nxt in steps_by_value[value]:
            out += [op("Field", dst=nxt, obj=at_reg, field=where),
                    (op("JNull", reg=nxt), empty)]
            at_reg = nxt
        # and the list itself, unwrapped the way the game unwraps its own
        out += [op("Field", dst=raw, obj=at_reg, field=unwraps_at),
                (op("JNull", reg=raw), empty),
                op("SafeCast", dst=listed, src=raw),
                (op("JNull", reg=listed), empty),
                # our own identity, read once for the whole walk
                op("Field", dst=mine_id, obj=0, field=ours_at),
                # AND HOW LONG THE LIST IS, so an empty list gets its own way out
                op("Field", dst=how_many, obj=listed, field=counted_at),
                op("Int", dst=this_one, ptr=number(bc, 0)),
                # nothing in it, as `0 >= how many`, the same comparison the loop uses
                (op("JSGte", a=this_one, b=how_many), empty),
                op("Int", dst=at_place, ptr=number(bc, 0)),
                again + ":", op("Label"),
                op("Field", dst=how_many, obj=listed, field=counted_at),
                (op("JSGte", a=at_place, b=how_many), missing),
                op("Mov", dst=this_one, src=at_place),
                op("Incr", dst=at_place),
                op("Field", dst=backing, obj=listed, field=backing_at),
                op("GetArray", dst=got, array=backing, index=this_one),
                (op("JNull", reg=got), again),
                op("UnsafeCast", dst=holder, src=got),
                op("Field", dst=their_id, obj=holder, field=theirs_at),
                (op("JNotEq", a=mine_id, b=their_id), again)]
        out += _why(BELONGS)
        out += [(op("JAlways"), through),
                nowhere + ":", op("Label")] + _why(NO_VILLAGE) + [
                (op("JAlways"), leave),
                empty + ":", op("Label")] + _why(EMPTY) + [
                (op("JAlways"), leave),
                missing + ":", op("Label")] + _why(NOT_IN_IT) + [
                (op("JAlways"), leave),
                past + ":", op("Label")]
    return out + [through + ":", op("Label")]


def emit_a_carrier_of_another_kind(bc, fn, op, reader, word, carrier, owner, store, whose,
                                   onward, leave, only_regional=None):
    """Let a SET carrier of another kind on; given `only_regional`, any thing for Regional rows."""
    if not routes(bc):
        return [(op("JAlways"), leave)]

    def _why(one):
        # a way out whose word is `None` is deliberately silent (`NOT_A_HOLDER`)
        if one is None or not saying():
            return []
        return _the_way_out(bc, fn, one % word)

    door = function_named(bc, ITS_FACTION)
    a_faction = returns_type(door, ITS_FACTION)
    held_by = a_new_place(bc, fn, a_faction)
    really = a_new_place(bc, fn, returns_type(function_named(bc, IS_REALLY), IS_REALLY))
    theirs = reader.borrow_register(bc, fn, "count_kind")
    ours = reader.borrow_register(bc, fn, "count_kind")
    store_at = where_the_rules_are(bc)
    their_id = field_by_name(bc, a_faction, THE_ID_ON, "a faction")[0]
    # ⛔ each kind is ASKED before the one cast to the kind the owner door takes; nothing else
    holder = a_new_place(bc, fn, kind_named(bc, ANY_THING))
    got_on, nobody = "%s: a carrier that may get on" % word, "%s: nobody holds it" % word
    ours_own = "%s: the carrier is on our side" % word
    kinds = [(kind, 0) for kind in CAN_HOLD_A_SET]
    kinds += [] if only_regional is None else [(ANY_THING, 1)]
    out = [op("Null", dst=held_by), op("Null", dst=holder)]
    for kind, for_regional_rows in kinds:
        its_class = a_new_place(
            bc, fn, gv(bc.global_types[class_global(bc, kind_named(bc, kind))]))
        not_it = "%s: not a %s" % (word, kind)
        out += [op("GetGlobal", **{"dst": its_class,
                                   "global": class_global(bc, kind_named(bc, kind))}),
                op("Call2", dst=really, fun=gv(function_named(bc, IS_REALLY).findex),
                   arg0=its_class, arg1=carrier),
                (op("JFalse", cond=really), not_it),
                op("UnsafeCast", dst=holder, src=carrier)]
        if only_regional is not None:
            out += [op("Int", dst=only_regional, ptr=number(bc, for_regional_rows))]
        out += [(op("JAlways"), got_on), not_it + ":", op("Label")]
    out += _why(NOT_A_HOLDER) + [(op("JAlways"), leave),
                                 got_on + ":", op("Label"),
                                 # whose side it is on, through the door every entity answers
                                 op("Call1", dst=held_by, fun=gv(door.findex), arg0=holder),
                                 (op("JNull", reg=held_by), nobody),
                                 (op("JNull", reg=owner), nobody),
                                 op("Field", dst=theirs, obj=held_by, field=their_id),
                                 op("Field", dst=ours, obj=owner, field=their_id),
                                 (op("JEq", a=theirs, b=ours), ours_own),
                                 nobody + ":", op("Label")]
    out += _why(NOT_OURS) + [(op("JAlways"), leave),
                             ours_own + ":", op("Label"),
                             # its rules, at the field the shared kind declares
                             op("Field", dst=store, obj=holder, field=store_at),
                             (op("JNull", reg=store), leave),
                             op("UnsafeCast", dst=whose, src=carrier)]
    return out + _why(LET_ON) + [(op("JAlways"), onward)]


def install(bc):
    """Nothing is spliced here; declared so every route is checked against the file at build."""
    the_routes = routes(bc)
    for _value, route in sorted(the_routes.items()):
        _route_kinds(bc, route)
    guard(the_routes, "no scope word says its reach names a set, so nothing would be a member")
    return ("SETREACH: %d set reach(es) reach their members off the carrier's village -- %s"
            % (len(the_routes),
               "; ".join("case %d by %s" % (v, ".".join(r))
                         for v, r in sorted(the_routes.items()))))
