#!/usr/bin/env python3
"""Where a scope's rules run: over the holder's own store of authored rows, in its regular tick."""
from crashlink import disasm

from tools.project import gv, guard
from tools.hlcode import (argument_kind, call_sites, field_by_name, function_named, kind_named,
                          number, returns_type, text_object)
from tools.splice import insert, where
from framework import board, columns, driver, triggermatch, pipeline
from framework import reach
from framework import setreach
from framework import carrierplace
from framework import scopematch
from framework import tray
from framework import traps
from framework import sayonce
from framework.sayonce import COMPLAIN, SAYING
from framework.parsed import a_new_place
from framework.names import vocabulary
from framework.rowreader import reader_for

# what a scope's file calls the place its rules run -- the second of its two places
DECLARES = "ROAD"
# the game's own bucket lookup: hand it the store and a row, get that row's applications back
BUCKETS = "logic.AttributesManager.getAppsByID"
# the one thing of the row's own packed onto an application (`parsed.HELD_BY`)
THE_VALUE = "val"
# the field a holder and an application each keep their OWN id in, plain text on either
NAMED_BY = "kind"
# the word a scope overrides that default with (`Agt` has only `name`)
NAMED_BY_BY = "NAMED_BY"
# what tells one THING from another: two ornithopters share `kind`
THE_ID_ON = "__uid"
# where a faction's spawned units go: the game's spawn wants a structure
THE_BASE_THROUGH = "ent.Faction.get_mainBase"
# the holder's own attribute store, and its array of buckets, one per row
STORE_ON = "attributes"
BUCKETS_IN = "cache"
HOW_MANY, WHAT_IT_HOLDS = "length", "array"
# how far into a site its opening may reach before the shape has plainly moved
OPENING = 20
# the opposite of each jump over a site's early return: ours leaves on the jump NOT taken
THE_OTHER_WAY = {"JFalse": "JTrue", "JTrue": "JFalse",
                 "JNull": "JNotNull", "JNotNull": "JNull"}
# where the block leaves, the two loops it carries, and where the pick rejoins
DONE = "the rules are done"
# how many stores a road with an owner reads: the thing's own, then its owner's
HOLDERS = 2
# THE OUTER PASS: which holder's store this time; a road that is its own payee has ONE store
STORE, NEXT_STORE = "read the next store", "on to the next store"
OWNS_IT, HAVE_STORE = "read the owner's store", "the store is in hand"
# and past those two, one pass per thing carrying a row a reach moved to the faction
A_CARRIER = "read a carrier's store"
# one pass per OTHER faction: the foreign walk, which gives an owner word its meaning
A_FOREIGN = "read another faction's store"
# where a thing nobody owns joins that walk: every store is foreign to it
EVERY_ONE_IS_FOREIGN = "nobody owns this thing, so no store is its own"
ROW, NEXT_ROW = "the next row", "on to the next row"
APP, NEXT_APP = "the next application", "on to the next application"
# the column gate's number, said as one of a few minted words (the channel takes TEXT)
COLUMN_WORDS = ((0, "SPINE column none"), (1, "SPINE column 1"), (2, "SPINE column 2"))
COLUMN_OTHER = "SPINE column other"
SAID_COLUMN, SAY_COLUMN = "the column has been said", "say the column"
# and the trigger the row named, its words taken from the vocabulary itself
HOOK_WORD, HOOK_NONE = "SPINE hook %s", "SPINE hook none"
SAID_HOOK, SAY_HOOK = "the trigger has been said", "say the trigger"


# what a scope's own file calls the thing its numbers appear over, when it has one
SHOWS_AT = "SHOWN_AT"
# "nothing was asked for" -- a scope with no host differs from a host of None
_NOTHING = object()
# what it calls WHO GETS PAID, asked once per holder
OWNER_BY = "OWNER"
# a scope naming a HOST reads one more store: where the engine files rows not on the holder
HOST_BY, HOST_KIND_BY, STAMPED_BY = "HOST", "HOST_KIND", "STAMPED_BY"
# a second door to that host, (kind, field), asked only when the first answers nothing
HOST_ALSO_BY = "HOST_ALSO"
HOST_OWNER_BY = "HOST_OWNER"
# a road declaring this reads the region's own store as one more pass
READS_REGION_BY = "READS_ITS_REGION"
# the game's own place for what made an application, and the place inside its own stamp
SOURCE_ON = "source"
# the game's own "has this faction died": a winner or an absorbed faction does not read dead
IS_DEAD = "ent.Faction.isDead"
# where the host pass goes when it is not this pass's turn
A_HOST = "read the host's store"
# and where the region pass goes, which sits after the host and before the carriers
A_REGION = "read the region's store"
# where a carrier the kind checks turned away goes, so a set row whose carrier is a village is read
A_SET_CARRIER = "read a set carrier's store, at the shared numbers"
# said once per road behind `belongpath`: the host pass ran
HOST_RAN = "SPINE a %s read its host's rules: "
# where a host row dies: past the stamp test, and past the last gate, each with the row's id
HOST_ROW, HOST_REACH = "SPINE a %s host row reached: ", ", its reach (0 blank, 1 Local): "
HOST_ROW_PAST = "SPINE a %s host row got past every gate: "
# a host row the stamp test let through that is not stamped as a building's state
HOST_NOT_A_STATE = "SPINE a %s host row is not a building state: "
# what a scope writes there when its holder is already the payee, so nothing is asked at all
ITSELF = "itself"
# is the village handed to anything? One switch, read by the road and by the two cost cases
HAND_THE_VILLAGE_OVER = True
# the part of the row that carries them, which is what an effect that pays reads.
PAYEE = scopematch.PAYEE
# instrument: once per row reaching the road with its own columns (what a load gives back)
STILL_CARRIES = "SPINE this row still carries its own"
# instrument: said once per world, the first time a road is entered at all
THE_ROAD_RAN = "the road was entered"
# a road's own diagnosis, latched once per world, each naming the scope
RAN = "SPINE the `%s` road ran"
REACHED = "SPINE the `%s` road reached a row"
# said every time a row gets past every gate, where the add and the acts sit
PAST_EVERY_GATE = "SPINE a row got past every gate on the `%s` road"
# a road entered while another run of it is still going
NESTED = "SPINE the `%s` road was entered INSIDE another run of itself"
# per holder per pass: a holder with no payee, so every store is FOREIGN
NO_PAYEE = "SPINE the `%s` road is walking a thing with no payee"
# instrument, once per world: a pass reached ANOTHER faction's store
FOREIGN_RAN = "SPINE the `%s` road walked another faction's store"
# and found rows there, said where the row loop is about to run
FOREIGN_ROWS = "SPINE the `%s` road found rows in another faction's store"
# and how many factions it counted, as one of a few minted words
FOREIGN_MANY = tuple((n, "SPINE the walk counted %d faction(s)" % n) for n in range(0, 9))
FOREIGN_MORE = "SPINE the walk counted more than 8 factions"


def _say_how_many_factions(bc, fn, op, counted, here):
    """How many factions the walk counted, as one of a few minted words, one per value."""
    spare = reader_for(bc).borrow_register(bc, fn, "count_kind")
    out, done = [], "%s: the faction count is said" % here
    for value, word in FOREIGN_MANY:
        past = "%s: not %d faction(s)" % (here, value)
        out += [op("Int", dst=spare, ptr=number(bc, value)),
                (op("JNotEq", a=counted, b=spare), past)]
        out += sayonce.emit(bc, fn, word, even_when_quiet=True)
        out += [(op("JAlways"), done), past + ":", op("Label")]
    return out + sayonce.emit(bc, fn, FOREIGN_MORE, even_when_quiet=True) + [
        done + ":", op("Label")]


def take_what_the_row_itself_said(bc, fn, op, application, *, which, into, flag):
    """Replace the column's id with the one the row itself carried, when it carried one."""
    from framework import alongside, widen
    from framework.rowreader import reader_for
    at, holds = widen.on_the_filed_thing(bc)
    reader = reader_for(bc)
    mine = a_new_place(bc, fn, holds)
    back = a_new_place(bc, fn, reader.value_kind)
    got = a_new_place(bc, fn, reader.value_kind)
    place = a_new_place(bc, fn, reader.count_kind)
    zero = a_new_place(bc, fn, reader.count_kind)
    howlong = a_new_place(bc, fn, reader.count_kind)
    done = "the row said nothing of its own"
    complain = function_named(bc, COMPLAIN)
    word = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    said = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    quiet = "already said this row carries its own"
    return [op("Field", dst=mine, obj=application, field=at),
            (op("JNull", reg=mine), done),
            # the column's own number less one is where its id sits, exactly as the load put it
            op("Mov", dst=place, src=which),
            op("Decr", dst=place),
            op("Int", dst=zero, ptr=number(bc, 0)),
            (op("JSLt", a=place, b=zero), done),
            op("Field", dst=howlong, obj=mine, field=alongside.counted(bc)),
            (op("JSGte", a=place, b=howlong), done),
            op("Field", dst=back, obj=mine, field=alongside.backing(bc)),
            op("GetArray", dst=got, array=back, index=place),
            (op("JNull", reg=got), done),
            op("SafeCast", dst=into, src=got),
            done + ":",
            op("Label")]


def what_it_is_drawn_over(bc, fn, spelling, words, op):
    """The thing this scope's numbers appear over, and the instructions that reach it."""
    from framework.names import module_of
    named = getattr(module_of(words[spelling]), SHOWS_AT, None)
    # the holder itself, with nothing asked of the game: on some roads it is already in hand
    if named == ITSELF:
        return 0, []
    if named is None:
        nowhere = a_new_place(bc, fn, gv(list(function_named(bc, tray.DRAW).regs)[0]))
        return nowhere, [op("Null", dst=nowhere)]
    reaches = function_named(bc, named)
    over = a_new_place(bc, fn, returns_type(reaches, named))
    return over, [op("Call1", dst=over, fun=gv(reaches.findex), arg0=0)]


def splice_name(word):
    """What that scope's road is called, so writing it down and reading it back agree."""
    return "the `%s` rules" % word


def road_starts(fn, site):
    """Where the rules go: after the site's own opening call, when it opens with one."""
    ops = fn.ops or []
    guard(ops, "%s has no instructions at all" % site)
    start = 0
    for i, op in enumerate(ops[:OPENING]):
        if op.op.startswith("J") or op.op in ("Switch", "Ret"):
            break
        if op.op.startswith("Call"):
            start = i + 1
            break
    guard(start < len(ops), "%s has nothing after its opening call" % site)
    # a call whose answer is branched on is a condition: nothing may go in front of a jump
    if ops[start].op.startswith("J"):
        start = 0
    guard(not ops[start].op.startswith("J"),
          "the rules of %s would start on a %s, and nothing may go in front of a jump"
          % (site, ops[start].op))
    return start


def scopes_with_roads(words=None):
    """Every scope word whose own file says where its rules run."""
    from framework.names import module_of, vocabulary
    from framework.scopematch import only_scopes
    words = vocabulary() if words is None else words
    return sorted(spelling for spelling, word in only_scopes(words).items()
                  if hasattr(module_of(word), DECLARES))


def _saying_the_region_pass():
    """Is the region pass's own path said? `standalone/onoff.py` holds the switch."""
    from standalone import onoff
    return onoff.on("regionpass")


def _the_region_pass_says(bc, fn, road, how_far):
    """One latched word per way into the region pass, while `regionpass` is on."""
    return board.said(bc, fn, "regionpass", lambda: sayonce.emit(
        bc, fn, "SPINE the %s road %s" % (road, how_far), even_when_quiet=True))


def _declared(spelling, what, words, or_else=_NOTHING):
    from framework.names import module_of
    if or_else is not _NOTHING:
        return getattr(module_of(words[spelling]), what, or_else)
    return getattr(module_of(words[spelling]), what)


def the_liveness_question(bc, spelling, words):
    """The question the scope's per-scope update asks before its own early exit, and our jump."""
    site = _declared(spelling, driver.DECLARES[1], words)
    fn = function_named(bc, site)
    opening = driver.live_path_starts(fn, site)
    # none is an answer: a site stepping over no return of its own is live when called
    if not opening:
        return None, None
    asked = [i for i in range(opening) if fn.ops[i].op.startswith("Call")]
    guard(asked,
          "%s returns early without asking anything, so there is no question to borrow" % site)
    called = gv(fn.ops[asked[-1]].df["fun"])
    target = next((f for f in bc.functions if gv(f.findex) == called), None)
    guard(target is not None, "%s asks something that is not a function of this file" % site)
    header = disasm.func_header(bc, target) or ""
    guard(" (" in header, "%s asks something with no readable name" % site)
    # the jump between that question and the return it steps over
    jumps = [fn.ops[i].op for i in range(asked[-1], opening)
             if fn.ops[i].op in THE_OTHER_WAY]
    guard(len(jumps) == 1,
          "%s weighs its own answer with %s, and this reads one jump" % (site, jumps or "nothing"))
    return header.split(" (")[0].split()[-1], THE_OTHER_WAY[jumps[0]]


def weighing(op, kind, answer):
    """One jump weighing one answer. Which operand names the answer depends on the jump."""
    guard(kind in THE_OTHER_WAY, "`%s` is not a jump that weighs an answer" % kind)
    return op(kind, **{("cond" if kind in ("JTrue", "JFalse") else "reg"): answer})


class Store:
    """Where a holder keeps its authored rows: every field from the holder down to one row."""

    def __init__(self, bc, holder_kind):
        self.holder_kind = holder_kind
        self.store_at, self.store_kind = field_by_name(
            bc, holder_kind, STORE_ON, "the holder these rules are about")
        self.buckets_at, self.buckets_kind = field_by_name(
            bc, self.store_kind, BUCKETS_IN, "the attribute store")
        self.count_at, _ = field_by_name(bc, self.buckets_kind, HOW_MANY, "the bucket array")
        self.bucket_kind = returns_type(function_named(bc, BUCKETS), BUCKETS)
        self.bucket_count_at, _ = field_by_name(bc, self.bucket_kind, HOW_MANY, "one bucket")
        self.holds_at, self.holds_kind = field_by_name(
            bc, self.bucket_kind, WHAT_IT_HOLDS, "one bucket")


def _a_set_row_is_not_another_building_s(bc, fn, op, application, held, reader, past):
    """Leave the stamp test early when THIS row's reach names a set, a region, or the faction."""
    from framework import reach, setreach
    values = sorted(setreach.routes(bc)) + carrierplace.past_the_kind_match(bc)
    wanted = reader.borrow_register(bc, fn, "count_kind")
    # the reach off this very application, silent and under its own name
    out = reach.emit_take_off_the_row(bc, fn, op, application, held, reader, on_road="",
                                      tag="at the stamp test")
    for value in values:
        out += [op("Int", dst=wanted, ptr=number(bc, value)),
                (op("JEq", a=held, b=wanted), past)]
    return out


def _the_stamp_a_building_state_carries(bc):
    """Which case of the game's own enum a building state's rows are stamped with, read out."""
    from framework.userow import MAKES_ONE
    fn = function_named(bc, "logic.Upgrades.addAttributes")
    made = call_sites(fn, function_named(bc, MAKES_ONE))
    guard(len(made) == 1,
          "the building-state route files %d application(s), and this reads the one" % len(made))
    # the third argument is what made it -- the same place `userow` counts from
    stamp = gv(fn.ops[made[0]].df["args"].value[3])
    wrote = [i for i in range(made[0]) if fn.ops[i].df.get("dst") is not None
             and gv(fn.ops[i].df["dst"]) == stamp]
    guard(wrote, "nothing in the building-state route leaves a stamp for the application it files")
    at = fn.ops[wrote[-1]]
    guard(at.op == "MakeEnum",
          "the building-state route's stamp is made by a %s, and this reads the case off an enum"
          % at.op)
    return gv(at.df["construct"])


def _saying_the_reach(bc, fn, op, reach_reg, word):
    """The reach a row carries, said as the road walks it -- one word per case, plus blank."""
    out, done = [], "%s: the row's reach has been said" % word
    every = {case: reach_case + 1 for case, reach_case
             in ((c, i) for i, c in enumerate(_reach_cases(bc)))}
    every["nothing"] = 0
    spare = a_new_place(bc, fn, gv(list(fn.regs)[reach_reg]))
    for case, value in sorted(every.items(), key=lambda pair: pair[1]):
        past = "%s: the row's reach is not %s" % (word, case)
        out += [op("Int", dst=spare, ptr=number(bc, value)),
                (op("JNotEq", a=reach_reg, b=spare), past)]
        out += sayonce.emit_word_now(bc, fn, "SPINE this row's reach is `%s`" % case)
        out += [(op("JAlways"), done), past + ":", op("Label")]
    return out + [done + ":", op("Label")]


def _reach_cases(bc):
    """Every case the cdb's own reach column has, in the order the game declares them."""
    from tools.hlcode import kind_named
    from framework import columns
    kind = bc.types[kind_named(bc, columns.REACH_ENUM)]
    return [one.name.resolve(bc) for one in kind.definition.constructs]


def _saying_it_was_refused(bc, fn, op, got_past, word):
    """Whether the row just walked got past the gates, said before its name."""
    fine = "%s: this row got through" % word
    spare = a_new_place(bc, fn, gv(list(fn.regs)[got_past]))
    return [op("Int", dst=spare, ptr=number(bc, 1)),
            (op("JEq", a=got_past, b=spare), fine)] \
        + sayonce.emit_word_now(bc, fn, "SPINE the `%s` road refused the row named next" % word) \
        + [fine + ":", op("Label"),
           op("Int", dst=got_past, ptr=number(bc, 0))]


def _saying_the_bound(bc, fn, op, from_reg, to_reg, word):
    """The two numbers a pass walks between, said outright rather than as a word per value."""
    from framework.acts.gain_res import AS_TEXT
    aloud = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    dropped = a_new_place(bc, fn, returns_type(function_named(bc, COMPLAIN), COMPLAIN))
    boxed = a_new_place(bc, fn, argument_kind(bc, AS_TEXT))
    out = sayonce.emit_word_now(bc, fn, "SPINE the `%s` road walks from" % word)
    for which in (from_reg, to_reg):
        out += [op("ToDyn", dst=boxed, src=which),
                op("Call1", dst=aloud, fun=gv(function_named(bc, AS_TEXT).findex), arg0=boxed),
                op("Call1", dst=dropped, fun=gv(function_named(bc, COMPLAIN).findex), arg0=aloud)]
    return out


def _saying_which_store(bc, fn, op, store_reg, word):
    """Which of a road's stores this pass is reading, said every pass, named per road."""
    out, done = [], "%s: the store has been said" % word
    spare = a_new_place(bc, fn, gv(list(fn.regs)[store_reg]))
    for which, spelling in enumerate(("the thing's own store", "its owner's store")):
        past = "%s: this pass is not %s" % (word, spelling)
        out += [op("Int", dst=spare, ptr=number(bc, which)),
                (op("JNotEq", a=store_reg, b=spare), past)]
        out += sayonce.emit_word_now(
            bc, fn, "SPINE the `%s` road is reading %s" % (word, spelling))
        out += [(op("JAlways"), done), past + ":", op("Label")]
    out += sayonce.emit_word_now(
        bc, fn, "SPINE the `%s` road is reading somebody else's store" % word)
    return out + [done + ":", op("Label")]


def _granted_to_the_place(bc, fn, op, scope_reg, holders, into, reader, word):
    """Past the last gate: a word about a PLACE hands what it grants to that place."""
    from framework import scopematch
    spare, out = None, []
    for value, onto in sorted(scopematch.granted_to().items()):
        if holders.get(onto) is None:
            continue
        spare = spare if spare is not None else a_new_place(bc, fn, reader.count_kind)
        past = "%s: this row is not granted to the %s" % (word, onto)
        out += [op("Int", dst=spare, ptr=number(bc, value)),
                (op("JNotEq", a=scope_reg, b=spare), past),
                (op("JNull", reg=holders[onto]), past),
                op("UnsafeCast", dst=into, src=holders[onto]),
                past + ":", op("Label")]
    return out


def _saying_the_scope(bc, fn, op, scope_reg, word):
    """The scope NUMBER this row carries, said from the ROAD, never the scope gate."""
    from framework.scopematch import numbers as scope_numbers, NOTHING_NAMED
    out, done = [], "%s: the row's scope has been said" % word
    every = dict(scope_numbers())
    every["nothing named"] = NOTHING_NAMED
    spare = a_new_place(bc, fn, gv(list(fn.regs)[scope_reg]))
    for spelling, value in sorted(every.items(), key=lambda pair: pair[1]):
        past = "%s: the row's scope is not %s" % (word, spelling)
        out += [op("Int", dst=spare, ptr=number(bc, value)),
                (op("JNotEq", a=scope_reg, b=spare), past)]
        out += sayonce.emit_word_now(bc, fn, "SPINE this row's scope is `%s`" % spelling)
        out += [(op("JAlways"), done), past + ":", op("Label")]
    return out + [done + ":", op("Label")]


def named_by_for(spelling, words=None):
    """The field the holder keeps its own id in -- `kind` unless its file says otherwise."""
    return _declared(spelling, NAMED_BY_BY, words or vocabulary(), NAMED_BY)


def _naming_the_holder(bc, fn, holder_id):
    """The kind of the thing this pass is walking, said out loud -- behind its own switch."""
    return board.said(bc, fn, "roadnamesits",
                      lambda: sayonce.emit_always(bc, fn, holder_id))


def _switch_on():
    """Is the road naming what it walks? `standalone/onoff.py` holds the one switch."""
    from standalone import onoff
    return onoff.on("roadnamesits")


_naming_the_holder.on = _switch_on


class Site:
    """One scope's road site: the place, the holder it is about, and every field it reads."""

    def __init__(self, bc, spelling, words):
        self.word = spelling
        self.name = _declared(spelling, DECLARES, words)
        self.fn = function_named(bc, self.name)
        self.question, self.leave_on = the_liveness_question(bc, spelling, words)
        # the holder is the function's first place; the chain down to one row is a `Store`
        self.holder_kind = gv(list(self.fn.regs)[0])
        self.__dict__.update(vars(Store(bc, self.holder_kind)))

    def __repr__(self):
        return "Site(the `%s` rules in %s)" % (self.word, self.name)


def say_the_column(bc, fn, op, flag, column, wanted):
    """Say which column this row's effect names, once per row, in front of the gate it decides."""
    if not SAYING:
        return []
    complain = function_named(bc, COMPLAIN)
    holds = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    out = [(op("JFalse", cond=flag), SAID_COLUMN)]
    for value, word in COLUMN_WORDS:
        past = "%s, not %d" % (SAID_COLUMN, value)
        out += [op("Int", dst=wanted, ptr=number(bc, value)),
                (op("JNotEq", a=column, b=wanted), past),
                op("GetGlobal", **{"dst": holds, "global": text_object(bc, word)}),
                (op("JAlways"), SAY_COLUMN),
                past + ":",
                op("Label")]
    return out + [op("GetGlobal", **{"dst": holds, "global": text_object(bc, COLUMN_OTHER)}),
                  SAY_COLUMN + ":",
                  op("Label"),
                  op("Call1", dst=discarded, fun=gv(complain.findex), arg0=holds),
                  SAID_COLUMN + ":",
                  op("Label")]


def say_the_hook(bc, fn, op, flag, hook, wanted):
    """Say which trigger this row named, once per row, beside the column it named."""
    if not SAYING:
        return []
    complain = function_named(bc, COMPLAIN)
    holds = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    out = [(op("JFalse", cond=flag), SAID_HOOK)]
    for spelling, value in sorted(triggermatch.numbers().items()):
        past = "%s, not %s" % (SAID_HOOK, spelling)
        out += [op("Int", dst=wanted, ptr=number(bc, value)),
                (op("JNotEq", a=hook, b=wanted), past),
                op("GetGlobal", **{"dst": holds,
                                   "global": text_object(bc, HOOK_WORD % spelling)}),
                (op("JAlways"), SAY_HOOK),
                past + ":",
                op("Label")]
    return out + [op("GetGlobal", **{"dst": holds, "global": text_object(bc, HOOK_NONE)}),
                  SAY_HOOK + ":",
                  op("Label"),
                  op("Call1", dst=discarded, fun=gv(complain.findex), arg0=holds),
                  SAID_HOOK + ":",
                  op("Label")]


def install(bc):
    """SPLICE each scope's road into the place its own file says its rules run."""
    from framework.raises.on_kill import fill
    from framework.walk import emit
    words = vocabulary()
    every = pipeline.roads()
    spliced, asked = {}, {}
    for spelling in scopes_with_roads(words):
        guard(spelling in every,
              "`%s` says where its rules run and has no road to run there" % spelling)
        site = Site(bc, spelling, words)
        block = fill(bc, site, every[spelling], emit)
        insert(bc, site.fn, road_starts(site.fn, site.name), block, splice_name(spelling),
               traps.PER_TICK)
        spliced[spelling] = where(bc, splice_name(spelling))
        asked[spelling] = (site.name, site.question)
    return ("STORE WALK: %d road(s) spliced where their own rules run -- %s"
            % (len(spliced), "; ".join(
                "`%s` in %s at %d, %d instruction(s), liveness borrowed from `%s`"
                % (word, asked[word][0], at, many, asked[word][1])
                for word, (at, many) in sorted(spliced.items()))))
