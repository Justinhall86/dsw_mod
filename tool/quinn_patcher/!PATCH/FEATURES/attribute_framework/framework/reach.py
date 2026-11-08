#!/usr/bin/env python3
"""The reach a modder authored (the cdb's `scope` column), read off the raw row at the load."""
from tools.project import gv, guard
from tools.hlcode import enum_case, function_named, number, returns_type, text_object
from framework import board, columns, tray
from framework.parsed import a_new_place
from framework.rowreader import reader_for
from framework import sayonce
from framework.sayonce import COMPLAIN

# the cdb column reach is authored in, read off the raw row BY NAME -- never by position
COLUMN = "scope"
from framework.boundary import LOOKUP as NUMBER_OF  # noqa: E402
# the game's own enum for the column; a case's number is found by name, never written down
ENUM = columns.REACH_ENUM
# ⛔ NO CASE IS NAMED HERE: a scope word file claims its case, so a new reach is a line in a WORD
FACTION = "EFaction"
# WHETHER A CLAIMED CASE NAMES A SET (paid once per MEMBER) RATHER THAN ONE HOLDER
SETS_BY = "REHOSTS_A_SET"
# the kind every holder a reach can name has in common, zones included
EVERY_HOLDER = "ent.Object"
# the two words, one per authored row: a reach written, or the column left alone
CARRIES = "SPINE reach written"
BLANK = "SPINE reach blank"
# AND THE FAR END OF THE ROUND TRIP, said at the bake when a kept reach comes back
CAME_BACK = "SPINE reach came back"
# and every row the bake matched at all, so an unapplied reach is not read as a broken trip
BACK_AT_ALL = "SPINE reach row matched"
# where the branch goes and where the two paths rejoin, named apart from the words
GOES_TO_WRITTEN = "this row carries a reach"
SAID = "the reach has been said"
# COUNTED FROM ONE, so a column left alone keeps zero and needs no sentinel
BLANK_IS = 0
# the list kept between load and bake, and the place the road reads; both in `framework/columns.py`
WHICH_REACH = columns.WHICH_REACH
NAMED = columns.REACH_NAMED


def saying():
    """Are the reach's own words in this build? `standalone/onoff.py` holds the switch."""
    from standalone import onoff
    return onoff.on("reachwords")


def words():
    """Both words, what a modder wrote first and what they left alone second."""
    return (CARRIES, BLANK)


def case_value(bc, case):
    """What the kept reach reads as for one of the game's own cases: the case plus one."""
    return enum_case(bc, ENUM, case) + 1


def registers(bc, fn, reader=None):
    """The one place this needs on `fn`, typed from a borrowed signature."""
    reader = reader or reader_for(bc)
    return {NAMED: reader.borrow_register(bc, fn, "count_kind")}


def emit_read(bc, fn, op, row_reg, into, reader=None):
    """What the modder wrote in the column, counted from one; zero is a column left alone."""
    reader = reader or reader_for(bc)
    # refused HERE: off a narrowed row every column answers nothing, which reads as blank
    guard(gv(list(fn.regs)[row_reg]) == reader.row_kind,
          "the reach was handed a narrowed row, and a column can only be read off the raw one")
    text = a_new_place(bc, fn, reader.text_kind)
    value = a_new_place(bc, fn, reader.value_kind)
    blank = "the column was left alone"
    return [op("Int", dst=into, ptr=number(bc, BLANK_IS)),
            op("GetGlobal", **{"dst": text, "global": text_object(bc, COLUMN)}),
            op("Call2", dst=value, fun=gv(reader.reading.findex), arg0=row_reg, arg1=text),
            (op("JNull", reg=value), blank),
            op("SafeCast", dst=into, src=value),
            # the one instruction that makes blank its own answer rather than another `Local`
            op("Incr", dst=into),
            blank + ":",
            op("Label")]


def claimed(bc, words=None):
    """Every reach case a scope word claims, as {the kept value: that word's own number}."""
    from framework import scopematch
    return {case_value(bc, case): num
            for case, num in scopematch.rehosted_to(words).items()}


def naming_a_set(bc, words=None):
    """Every claimed reach case whose own word says it names a SET, as kept values."""
    from framework import scopematch
    from framework.names import module_of, vocabulary
    words = vocabulary() if words is None else words
    out = set()
    for _spelling, word in scopematch.only_scopes(words).items():
        module = module_of(word)
        case = getattr(module, "REHOSTS_FROM", None)
        if case and getattr(module, SETS_BY, False):
            out.add(case_value(bc, case))
    return out


def naming_a_set_by_value(words=None):
    """The same set cases as the ENUM CASE each names (`naming_a_set` gives the kept value)."""
    from framework import scopematch
    from framework.names import module_of, vocabulary
    words = vocabulary() if words is None else words
    out = set()
    for _spelling, word in scopematch.only_scopes(words).items():
        module = module_of(word)
        case = getattr(module, "REHOSTS_FROM", None)
        if case and getattr(module, SETS_BY, False):
            out.add(case)
    return out


def emit_rehost(bc, fn, op, held, thing, holders, into, reader=None, word=None,
                leave=None):
    """The thing in hand, or the holder `holders` gives for the reach its word claims."""
    reader = reader or reader_for(bc)
    wanted = a_new_place(bc, fn, reader.count_kind)
    kept = "this row is read against the thing in hand"
    a_set = naming_a_set(bc)
    out = [op("UnsafeCast", dst=into, src=thing)]
    for value, its_word in sorted(claimed(bc).items()):
        # A SET CASE KEEPS THE THING IN HAND; `framework/setreach.py` decides membership
        if value in a_set:
            continue
        if value not in holders:
            continue
        past = "%s: the reach is not %d" % (kept, value)
        out += [op("Int", dst=wanted, ptr=number(bc, value)),
                (op("JNotEq", a=held, b=wanted), past)]
        if word is not None:
            out += [op("Int", dst=wanted, ptr=number(bc, its_word)),
                    (op("JNotEq", a=word, b=wanted), kept)]
        out += [(op("JNull", reg=holders[value]), kept),
                op("UnsafeCast", dst=into, src=holders[value])]
        out += [(op("JAlways"), kept),
                past + ":", op("Label")]
    return out + [kept + ":", op("Label")]


def emit_moved_by_another_word(bc, fn, op, held, word, reader, here, leave):
    """Leave unless this row's reach is claimed by a word OTHER than the one in hand."""
    reader = reader or reader_for(bc)
    wanted = reader.borrow_register(bc, fn, "count_kind")
    out, mine = [], "%s: a reach claims this row" % here
    a_set = naming_a_set(bc)
    for value, its_word in sorted(claimed(bc).items()):
        past = "%s: the reach is not %d" % (here, value)
        out += [op("Int", dst=wanted, ptr=number(bc, value)),
                (op("JNotEq", a=held, b=wanted), past)]
        # A SET IS NOT STEPPED OVER: it has no single holder's pass, and is paid once per member
        if value not in a_set:
            out += [op("Int", dst=wanted, ptr=number(bc, its_word)),
                    (op("JEq", a=word, b=wanted), leave)]
        out += [(op("JAlways"), mine),
                past + ":", op("Label")]
    return out + [(op("JAlways"), leave), mine + ":", op("Label")]


def _saying_how_far():
    """Is the taking saying where it stopped? `standalone/onoff.py` holds the switch."""
    from standalone import onoff
    return onoff.on("userowsays")


def _taken_apart(bc, fn, op, application, into, reader):
    """The taking as one function of ours per kind handed, and a call to it."""
    from tools.hlcode import assemble, shared_function
    kind, count = gv(list(fn.regs)[application]), gv(list(fn.regs)[into])

    def body(made):
        back = a_new_place(bc, made, count)
        return assemble(emit_take_off_the_row(bc, made, op, 0, back, reader, apart=False)
                        + [op("Ret", ret=back)])
    fun = shared_function(bc, fn, lambda _bc, made: made, ("reach off the row", kind, count),
                          [kind], count, body)
    return [op("CallN", dst=into, fun=fun, args=[application])]


def emit_take_off_the_row(bc, fn, op, application, into, reader=None, on_road="", row_id=None,
                          tag="", apart=True):
    """The reach off the application's own row, its LAST entry; `tag` names a second reading."""
    from framework import alongside, widen
    reader = reader or reader_for(bc)
    # ⛔ INLINE ONLY WHILE IT SPEAKS: a word's code inside every road grows the game's functions
    if apart and not _saying_how_far():
        return _taken_apart(bc, fn, op, application, into, reader)

    def said(how_far):
        # once a launch each, latched -- four words per road, so the one that stopped it is named
        if not _saying_how_far() or not on_road:
            return []
        return board.said(bc, fn, "userowsays", lambda: sayonce.emit(
            bc, fn, "SPINE the reach on the %s road: %s" % (on_road, how_far),
            even_when_quiet=True))

    at, holds = widen.on_the_filed_thing(bc)
    made = tray.recipe(bc)
    mine = a_new_place(bc, fn, holds)
    back = a_new_place(bc, fn, reader.value_kind)
    got = a_new_place(bc, fn, reader.value_kind)
    entry = a_new_place(bc, fn, made["entry"])
    amount = a_new_place(bc, fn, made["of"]["held"])
    last = a_new_place(bc, fn, reader.count_kind)
    none = a_new_place(bc, fn, reader.count_kind)
    done = "this row carries no reach of its own" + (" (%s)" % tag if tag else "")
    return ([op("Int", dst=into, ptr=number(bc, BLANK_IS)),
             op("Field", dst=mine, obj=application, field=at),
             (op("JNotNull", reg=mine), "%s: a row is on it" % done)]
            + said("an application carries no row of ours")
            + [(op("JAlways"), done),
               "%s: a row is on it" % done + ":", op("Label")]
            + said("an application carries a row of ours")
            # the last place in it, worked out from the list rather than written down
            + [op("Field", dst=last, obj=mine, field=alongside.counted(bc)),
               op("Decr", dst=last),
               op("Int", dst=none, ptr=number(bc, 0)),
               (op("JSGte", a=last, b=none), "%s: the list has something in it" % done)]
            + said("that row's list is empty")
            + [(op("JAlways"), done),
               "%s: the list has something in it" % done + ":", op("Label"),
               op("Field", dst=back, obj=mine, field=alongside.backing(bc)),
               op("GetArray", dst=got, array=back, index=last),
               (op("JNotNull", reg=got), "%s: the last place holds something" % done)]
            + said("the last place in that row's list holds nothing")
            + [(op("JAlways"), done),
               "%s: the last place holds something" % done + ":", op("Label"),
               op("UnsafeCast", dst=entry, src=got),
               op("Field", dst=amount, obj=entry, field=made["amount"]),
               op("ToInt", dst=into, src=amount)]
            + said("a reach came off a row")
            + _is_it_this_row(bc, fn, op, mine, last, back, made, reader, row_id, said)
            + [done + ":",
               op("Label")])


def _is_it_this_row(bc, fn, op, mine, last, back, made, reader, row_id, said):
    """Does the list this application carries name the row the road holds? Says, never refuses."""
    # the switch is asked directly: `said` MAKES a place the first time it is called
    if row_id is None or not _saying_how_far():
        return []
    naming = a_new_place(bc, fn, reader.count_kind)
    none = a_new_place(bc, fn, reader.count_kind)
    got = a_new_place(bc, fn, reader.value_kind)
    entry = a_new_place(bc, fn, made["entry"])
    amount = a_new_place(bc, fn, made["of"]["held"])
    named = a_new_place(bc, fn, reader.count_kind)
    ours = a_new_place(bc, fn, returns_type(function_named(bc, NUMBER_OF), NUMBER_OF))
    over = "the list has been asked whose it is"
    return ([op("Mov", dst=naming, src=last),
             op("Decr", dst=naming),
             op("Int", dst=none, ptr=number(bc, 0)),
             (op("JSLt", a=naming, b=none), over),
             op("GetArray", dst=got, array=back, index=naming),
             (op("JNull", reg=got), over),
             op("UnsafeCast", dst=entry, src=got),
             op("Field", dst=amount, obj=entry, field=made["amount"]),
             op("ToInt", dst=named, src=amount),
             op("Call1", dst=ours, fun=gv(function_named(bc, NUMBER_OF).findex), arg0=row_id),
             (op("JEq", a=named, b=ours), "%s: the list is this row's own" % over)]
            + said("the list on an application belongs to ANOTHER row")
            + [(op("JAlways"), over),
               "%s: the list is this row's own" % over + ":", op("Label")]
            + said("the list on an application is this row's own")
            + [over + ":", op("Label")])


def emit_say_it_came_back(bc, fn, op, held, reader=None):
    """One word at the bake when the reach kept for this row comes back as something written."""
    reader = reader or reader_for(bc)
    complain = function_named(bc, COMPLAIN)
    text = a_new_place(bc, fn, reader.text_kind)
    nothing = a_new_place(bc, fn, reader.count_kind)
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    said = "the far end has spoken"

    def say(word):
        # ⛔ NOTHING WHEN THE WORDS ARE OFF; the round trip itself still runs
        if not saying():
            return []
        return board.said(bc, fn, "reachwords", lambda: [
            op("GetGlobal", **{"dst": text, "global": text_object(bc, word)}),
            op("Call1", dst=discarded, fun=gv(complain.findex), arg0=text)])

    # TWO WORDS: every row the bake matched, and those carrying a reach
    return [op("Int", dst=nothing, ptr=number(bc, BLANK_IS))] + say(BACK_AT_ALL) + [
        (op("JEq", a=held, b=nothing), said)] + say(CAME_BACK) + [
        said + ":",
        op("Label")]


def words_for(route):
    """The two load words as one route (trait, development, building state) says them."""
    if not route:
        return (CARRIES, BLANK)
    return ("%s, route %s" % (CARRIES, route), "%s, route %s" % (BLANK, route))


def emit_say(bc, fn, op, held, reader=None, route=None):
    """Say which of the two words this row is, off the NUMBER `emit_read` worked out."""
    reader = reader or reader_for(bc)
    complain = function_named(bc, COMPLAIN)
    text = a_new_place(bc, fn, reader.text_kind)
    nothing = a_new_place(bc, fn, reader.count_kind)
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))

    def say(word, goes_on=None):
        # one word through the game's own complaint channel, our only way to the log
        if not saying():
            return [(op("JAlways"), goes_on)] if goes_on else []
        out = board.said(bc, fn, "reachwords", lambda: [
            op("GetGlobal", **{"dst": text, "global": text_object(bc, word)}),
            op("Call1", dst=discarded, fun=gv(complain.findex), arg0=text)])
        return out + ([(op("JAlways"), goes_on)] if goes_on else [])

    carries, blank = words_for(route)
    return ([op("Int", dst=nothing, ptr=number(bc, BLANK_IS)),
             (op("JNotEq", a=held, b=nothing), GOES_TO_WRITTEN)]
            + say(blank, goes_on=SAID)
            + [GOES_TO_WRITTEN + ":", op("Label")]
            + say(carries)
            + [SAID + ":", op("Label")])


def install(bc):
    """Put both words and the column's own name in the file, so the load can reach them."""
    every = words() + (CAME_BACK, BACK_AT_ALL, COLUMN)
    # and the same two words once per route, since the load says which route it is on
    from framework.atload import ROUTES
    for route in range(1, ROUTES + 1):
        every = every + words_for("%d of %d" % (route, ROUTES))
    for word in every:
        text_object(bc, word)
    guard(reader_for(bc).reading is not None,
          "the game's own way of reading one column off a row is not in this file")
    # asked HERE: the load writes its block three times, and would fail once per route
    guard(function_named(bc, COMPLAIN) is not None,
          "the channel a word reaches the log through is not in this file")
    return ("REACH: the cdb's `%s` column read off every authored row of ours at the load and "
            "said as one of two words -- `%s` when a modder wrote one, `%s` when the column was "
            "left alone. Nothing acts on it yet: this settles that what reaches us is what was "
            "written, and not the substitute the engine hands the filed row"
            % (COLUMN, CARRIES, BLANK))
