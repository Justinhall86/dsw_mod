#!/usr/bin/env python3
"""A quest's pillage and liberation trackers count only what the quest's own faction did."""
from tools.project import gv, guard
from tools.hlcode import (assemble, enum_case, field_by_name, function_named, kind_named,
                          new_function, number, replace_body, returns_type)
from tools.splice import insert
from framework import ofthekind, traps
from framework.foreignwalk import emit_the_list
from framework.parsed import a_new_place
from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
from standalone import cdbwalk, onoff

NAME = "questowner"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the trackers that never ask who acted; `Me_Track_Pillages` already does
WORDS = ("Me_Track_TPillages", "Me_Track_LiberatesTTarget", "Me_Track_Liberates")
# every tracker hears every event here, and counts by raising its value through the setter
HEARS, RAISES = "ConditionApplication.onEvent", "ConditionApplication.set_trackerVal"
# the event a pillage and a liberation arrive as, and which of its parts is the faction that acted
EVENT, CASE, ACTOR = "lib.Event", "OnCompleteSiegeAction", 2
FACTION, QUESTS_OF = "ent.Faction", "ent.Faction.get_quests"
QUEST, SUBQUEST, STATE = "logic.faction.Quest", "logic.faction.Subquest", "logic.state.State"
# the state's factions, a faction's quests, a quest's conditions and subquests, by name
FACTIONS, RUNNING, OWN, FAILING, PARTS = (
    "factions", "currentQuests", "conditions", "failureConditions", "subquests")
# a game list is three deep: the proxy, its dynamic array, that array's base
INNER = "array"
WHAT = "%s, own faction only"
# a pillage tracker whose subject is a structure counts that structure, never its kind
SUBJECT, OBJECT, STRUCTURE = "Me_Track_TPillages", "object", "ent.Structure"
WHAT_SUBJECT = "%s subject only" % SUBJECT


class _Writer:
    """Places, names and list walks for one function."""

    def __init__(self, bc, fn):
        self.bc, self.fn, self.op, self.n = bc, fn, cdbwalk.op_of(bc), 0

    def place(self, kind):
        return a_new_place(self.bc, self.fn, kind_named(self.bc, kind)
                           if isinstance(kind, str) else gv(kind))

    def here(self, what):
        self.n += 1
        return "%s %d" % (what, self.n)

    def field(self, holder, name, over):
        """`holder.name` in a new place, or on to `over` when it is nothing."""
        at, kind = field_by_name(self.bc, gv(self.fn.regs[holder]), name, "a holder")
        into = self.place(kind)
        return into, [self.op("Field", dst=into, obj=holder, field=at),
                      (self.op("JNull", reg=into), over)]

    def walk(self, listed, kind, body, over):
        """`body(item)` per member of the game list in `listed`, then on to `over`."""
        bc, op = self.bc, self.op
        dyn, out = self.field(listed, INNER, over)
        base, more = self.field(dyn, INNER, over)
        entries = kind_named(bc, ARRAY_OF_ENTRIES)
        long_at, count_kind = field_by_name(bc, entries, COUNT_ON, "an object array")
        held_at, held_kind = field_by_name(bc, entries, BACKING_ON, "an object array")
        objects, held = self.place(ARRAY_OF_ENTRIES), self.place(held_kind)
        index, step, count = (self.place(count_kind) for _ in range(3))
        got, item = self.place("Dyn"), self.place(kind)
        again, following = self.here("the next"), self.here("past this one")
        return out + more + [
            op("UnsafeCast", dst=objects, src=base),
            op("Int", dst=index, ptr=number(bc, 0)),
            op("Int", dst=step, ptr=number(bc, 1)),
            again + ":", op("Label"),
            op("Field", dst=count, obj=objects, field=long_at),
            (op("JSGte", a=index, b=count), over),
            op("Field", dst=held, obj=objects, field=held_at),
            op("GetArray", dst=got, array=held, index=index),
            op("Add", dst=index, a=index, b=step),
            (op("JNull", reg=got), following),
            op("UnsafeCast", dst=item, src=got)] + body(item) + [
            following + ":", op("Label"),
            (op("JAlways"), again)]

    def each(self, holder, name, kind, body):
        """`body(item)` per member of `holder.name`, and on past it."""
        over = self.here("done with %s" % name)
        listed, out = self.field(holder, name, over)
        return out + self.walk(listed, kind, body, over) + [over + ":", self.op("Label")]


def _owner_function(bc, hears):
    """Ours, handed a tracker: the faction running a quest it belongs to, or nothing."""
    tracker = gv(hears.regs[0])
    own = new_function(bc, [tracker], kind_named(bc, FACTION), like=hears)
    w = _Writer(bc, own)
    op = w.op
    quests_of = function_named(bc, QUESTS_OF)
    found, none = "the owner", "no owner"
    factions = w.place(field_by_name(bc, kind_named(bc, STATE), FACTIONS, "the state")[1])
    quests, holder, nothing = w.place(returns_type(quests_of, QUESTS_OF)), w.place(
        FACTION), w.place(FACTION)

    def mine(condition):
        return [(op("JEq", a=condition, b=0), found)]

    def per_quest(quest):
        return (w.each(quest, OWN, tracker, mine) + w.each(quest, FAILING, tracker, mine)
                + w.each(quest, PARTS, SUBQUEST, lambda sub: w.each(sub, OWN, tracker, mine)))

    def per_faction(one):
        past = w.here("no quests")
        return [op("Mov", dst=holder, src=one),
                op("Call1", dst=quests, fun=gv(quests_of.findex), arg0=one),
                (op("JNull", reg=quests), past)] + w.each(quests, RUNNING, QUEST, per_quest) + [
                past + ":", op("Label")]

    replace_body(own, assemble(
        emit_the_list(bc, own, factions, none) + w.walk(factions, FACTION, per_faction, none)
        + [none + ":", op("Label"),
           op("Null", dst=nothing),
           op("Ret", ret=nothing),
           found + ":", op("Label"),
           op("Ret", ret=holder)]))
    return own


def _actor(bc, fn):
    """Where the event's acting faction is read, by the event case's name."""
    case = enum_case(bc, EVENT, CASE)
    reads = {gv(o.df["dst"]) for o in fn.ops if o.op == "EnumField"
             and gv(o.df["construct"]) == case and gv(o.df["field"]) == ACTOR}
    guard(len(reads) == 1, "%s reads the %s actor into %s, not one place" % (HEARS, CASE, reads))
    actor = reads.pop()
    guard(gv(fn.regs[actor]) == kind_named(bc, FACTION), "the %s actor is no faction" % CASE)
    return actor


def _count_site(bc, fn, word):
    """`word`'s case, and where it reads the value its raise adds one to."""
    named = [i for i, o in enumerate(fn.ops) if o.op == "String"
             and bc.strings.value[gv(o.df["ptr"])] == word]
    guard(len(named) == 1, "%s names %s %d time(s)" % (HEARS, word, len(named)))
    jump = next(i for i in range(named[0], len(fn.ops)) if fn.ops[i].op == "JEq")
    case = jump + 1 + gv(fn.ops[jump].df["offset"])
    raises = gv(function_named(bc, RAISES).findex)
    call = next(i for i in range(case, len(fn.ops)) if fn.ops[i].op == "Call2"
                and gv(fn.ops[i].df["fun"]) == raises)
    shape = [o.op for o in fn.ops[call - 3:call + 2]]
    guard(shape == ["GetThis", "Float", "Add", "Call2", "JAlways"],
          "%s counts as %s, not a read, a one, an add, the raise and a leave" % (word, shape))
    return case, call - 3


def _subject_only(bc, fn, op):
    """Past the subject test: a subject that is a structure leaves, so its kind never counts."""
    case, at = _count_site(bc, fn, SUBJECT)
    object_at = field_by_name(bc, gv(fn.regs[0]), OBJECT, "a tracker")[0]
    tests = [i for i in range(case, at - 1) if fn.ops[i].op == "GetThis"
             and gv(fn.ops[i].df["field"]) == object_at and fn.ops[i + 1].op == "JEq"
             and i + 2 + gv(fn.ops[i + 1].df["offset"]) == at]
    guard(len(tests) == 1, "%s tests its subject %d time(s), not once" % (SUBJECT, len(tests)))
    subject, past = gv(fn.ops[tests[0]].df["dst"]), tests[0] + 2
    held = a_new_place(bc, fn, kind_named(bc, STRUCTURE))
    block = assemble(ofthekind.emit_or_below(
        bc, fn, op, subject, held, kind_named(bc, STRUCTURE), "kind") + [
        # onto the case's own leave, past the kind test and the count
        op("JAlways", offset=(at + 4) - past),
        "kind:"])
    return insert(bc, fn, past, block, WHAT_SUBJECT, traps.IN_PLAY)


def install(bc):
    if not onoff.on(NAME):
        return "questowner: OFF"
    fn = function_named(bc, HEARS)
    actor = _actor(bc, fn)
    owner_fn = _owner_function(bc, fn)
    op = cdbwalk.op_of(bc)
    went = _subject_only(bc, fn, op)
    # the last site first, so an earlier one has not moved it
    sites = sorted(((_count_site(bc, fn, w), w) for w in WORDS), key=lambda s: -s[0][1])
    for (case, at), word in sites:
        guard(not any(gv((o.df or {}).get("dst", -1)) == actor for o in fn.ops[case:at]),
              "%s's case writes over the acting faction before it counts" % word)
        owner = a_new_place(bc, fn, kind_named(bc, FACTION))
        # no quest runs it (an objective's tracker), or its faction acted: the game's count runs
        block = assemble([
            op("Call1", dst=owner, fun=gv(owner_fn.findex), arg0=0),
            (op("JNull", reg=owner), "count"),
            (op("JEq", a=owner, b=actor), "count"),
            # past the read, the one, the add and the raise, onto the case's own leave
            op("JAlways", offset=4),
            "count:"])
        went += insert(bc, fn, at, block, WHAT % word, traps.IN_PLAY)
    return "questowner: %d instruction(s) in %d tracker(s), %s; %s" % (
        went, len(sites), WORDS, WHAT_SUBJECT)
