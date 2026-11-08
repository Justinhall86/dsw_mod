"""Quest timers read through our attributes, and the game's list widened for our quest pick."""
from tools.project import gv, guard
from tools.hlcode import (argument_kind, argument_kinds, assemble, field_by_name, function_named,
                          kind_named, new_function, replace_body, returns_type, slot_global,
                          template, text_object, written)
from tools.splice import insert
from framework import ofthekind, traps
from framework.boundary import LOOKUP
from framework.parsed import a_new_place
from framework.pipeline import Place, hands_for

# the game's own read of what a thing carries of one attribute: thing, attribute, target, faction
ASKS = "ent.Object.getAtbVal"
BASE, QUEST, QUESTS = "logic.faction.BaseQuest", "logic.faction.Quest", "logic.faction.Quests"
INFO, DURATION, WEIGHT, MANAGER, OWNER = "inf", "duration", "weight", "manager", "owner"
# every place the game reads a running quest's limit off its sheet row
DURATION_READS = ("logic.faction.BaseQuest.hasDuration", "logic.faction.BaseQuest.getTimeLeft",
                  "logic.faction.BaseQuest.getProgress", "logic.faction.Quest.regularUpdate")
# the faction's quest calendar, in days: new basic quests, and each quest's own cooldown cycles
CALENDAR = "logic.faction.Quests.get_questCycleDuration"
# the game's list of quests a faction may take now, which leaves weight 0 out
AVAILABLE = "logic.faction.Quests.getAvailableQuestsOfType"
# our attributes, plain, added ratio, multiplied ratio, as the Effects tab names them
DURATION_BY = ("Quest_Duration_Flat", "Quest_Duration_ARatio", "Quest_Duration_MRatio")
COOLDOWN_BY = ("Quest_Cooldown_Flat", "Quest_Cooldown_ARatio", "Quest_Cooldown_MRatio")
# a limit at or past this is the sheet's way of saying none, and stays none
UNLIMITED = 10000
# raised only while our own pick asks the game's list: weight 0 is then kept
LIFT = "weight 0 kept for our quest pick"
# raised only while our own pick asks the game's list for a row spelling `IgnoreCond`
SKIPPED = "conditions passed for our quest pick"
SPLICES = ("QuestDuration", "QuestCooldown", "OfWeight", "IgnoreCond")
# per held application of ours, by its number: the Of words its row spelled, and that row's `val`
NARROWED = "the Of words each quest-picking application of ours was spelled with, by its number"
NARROWED_VAL = "the val each quest-picking application of ours was spelled with, by its number"
# raised the first time any such row is noted; down, a quest's limit is read as the game reads it
ANY_NARROWED = "a quest-picking held row of ours spelled Of words"
MAPS = (NARROWED, NARROWED_VAL)
# the faction's applications of one attribute, and where it keeps them
CARRIED, KEPT_ON = "logic.AttributesManager.getAppsByKind", "attributes"
# the game's check of one quest, and the one condition test in it our switch steps past
VALID, CHECK = "logic.faction.Quests.isQuestValid", "logic.faction.$Quests.checkCondition"
# each effect's switch, raised at the bake of a row spelling it; down, our call answers at once
IN_USE = {"QuestDuration": "a row spells QuestDuration",
          "QuestCooldown": "a row spells QuestCooldown"}
# where each word's call sits in the game, and how many steps it adds there (`_sizecheck.py`)
READ_SITES = {"QuestDuration": {DURATION_READS[0]: 2, DURATION_READS[1]: 2, DURATION_READS[2]: 1,
                                DURATION_READS[3]: 1},
              "QuestCooldown": {CALENDAR: 1}, "OfWeight": {AVAILABLE: 2}, "IgnoreCond": {VALID: 2}}


def the_info(bc):
    """Where a quest keeps its sheet row, and that row's kind."""
    return field_by_name(bc, kind_named(bc, BASE), INFO, "a quest")


def cell_of(bc, name):
    """Where the sheet row keeps one cell, found by its name."""
    return field_by_name(bc, the_info(bc)[1], name, "a quest's sheet row")[0]


def emit_carried(at, faction, attribute, into):
    """`into` holds what `faction` carries of the game attribute named `attribute`."""
    text, found = at.scratch_arg(LOOKUP), at.scratch_return(LOOKUP)
    kind = at.scratch_arg(ASKS, 0)
    target, whose = at.scratch_arg(ASKS, 1), at.scratch_arg(ASKS, 2)
    got = at.scratch_return(ASKS)
    out = [at.op("GetGlobal", **{"dst": text, "global": at.text_object(attribute)}),
           at.op("Call1", dst=found, fun=at.named_function(LOOKUP), arg0=text)]
    out += ([at.op("Mov", dst=kind, src=found)] if at.kind_of(found) == at.kind_of(kind)
            else [at.op("SafeCast", dst=kind, src=found)])
    return out + [at.op("Null", dst=target), at.op("Null", dst=whose),
                  at.op("Call4", dst=got, fun=at.named_function(ASKS), arg0=faction, arg1=kind,
                        arg2=target, arg3=whose),
                  at.op("Mov", dst=into, src=got)]


def emit_scaled(at, faction, number, attributes, weighed=None):
    """`number` plus the plain one, times one plus the added ratio, times the multiplied ratio."""
    flat, added, ratio = (at.scratch_like(number) for _ in range(3))
    one, whole = at.scratch_of("I32"), at.scratch_like(number)
    out = []
    for attribute, into in zip(attributes, (flat, added, ratio)):
        out += emit_carried(at, faction, attribute, into)
        if weighed:
            out += emit_unnarrowed(weighed[0], at, weighed[1], faction, weighed[2], attribute,
                                   into, into is ratio)
    return (out
            + [at.op("Add", dst=number, a=number, b=flat),
               at.op("Int", dst=one, ptr=at.number(1)),
               at.op("ToSFloat", dst=whole, src=one),
               at.op("Add", dst=added, a=added, b=whole),
               at.op("Mul", dst=number, a=number, b=added),
               at.op("Mul", dst=number, a=number, b=ratio)])


def _place(bc, own, name):
    return Place(name, {}, {}, None, None, None, "%s: as the game has it" % name,
                 hands_for(bc, own))


def in_use_slot(bc, word):
    """The switch a row spelling `word` raises at its bake."""
    truth = returns_type(function_named(bc, DURATION_READS[0]), DURATION_READS[0])
    return slot_global(bc, IN_USE[word], truth), truth


def emit_in_use(bc, fn, spelling):
    """At the bake of a row spelling an effect with a switch: that switch raised; else nothing."""
    if spelling not in IN_USE:
        return []
    slot, truth = in_use_slot(bc, spelling)
    raised = a_new_place(bc, fn, truth)
    return [written(template(bc, "Bool"), dst=raised, value=True),
            written(template(bc, "SetGlobal"), **{"global": slot, "src": raised})]


def _unless_in_use(bc, at, word, back):
    """One check and out: with the switch down, straight to `back`."""
    slot, _truth = in_use_slot(bc, word)
    raised = at.scratch_return(DURATION_READS[0])
    return [at.op("GetGlobal", **{"dst": raised, "global": slot}),
            (at.op("JFalse", cond=raised), back)]


def _duration_function(bc, site, this_kind, limit_kind):
    """Handed a quest and its sheet limit: the limit its faction's attributes make of it."""
    own = new_function(bc, [this_kind, limit_kind], limit_kind, like=site)
    at = _place(bc, own, "QuestDuration")
    back = at.refused
    base, big, zero = at.scratch_of("I32"), at.scratch_of("I32"), at.scratch_of("I32")
    number = at.scratch_return(ASKS)
    quest = at.scratch_of(QUEST)
    out = _unless_in_use(bc, at, "QuestDuration", back) + [
           (at.op("JNull", reg=1), back),
           at.op("SafeCast", dst=base, src=1),
           at.op("Int", dst=big, ptr=at.number(UNLIMITED)),
           (at.op("JSGte", a=base, b=big), back)]
    if this_kind == kind_named(bc, QUEST):
        out += [at.op("Mov", dst=quest, src=0)]
    else:
        out += ofthekind.emit(bc, own, at.op, 0, quest, kind_named(bc, QUEST), back)
    quests_at, quests = at.field_of(QUEST, MANAGER)
    owner_at, faction = at.field_of(QUESTS, OWNER)
    out += [at.op("Field", dst=quests, obj=quest, field=quests_at),
            (at.op("JNull", reg=quests), back),
            at.op("Field", dst=faction, obj=quests, field=owner_at),
            (at.op("JNull", reg=faction), back),
            at.op("ToSFloat", dst=number, src=base)]
    row = at.scratch_of("Dyn")
    out += emit_quest_row(at, quest, row) + emit_scaled(at, faction, number, DURATION_BY, (
        bc, SPLICES[0], row))
    boxed = at.scratch_like(1)
    kept = "QuestDuration: not below none"
    out += [at.op("ToInt", dst=base, src=number),
            at.op("Int", dst=zero, ptr=at.number(0)),
            (at.op("JSGte", a=base, b=zero), kept),
            at.op("Mov", dst=base, src=zero),
            kept + ":", at.op("Label"),
            at.op("ToDyn", dst=boxed, src=base),
            at.op("Ret", ret=boxed),
            back + ":", at.op("Label"),
            at.op("Ret", ret=1)]
    replace_body(own, assemble(out))
    return own


def _calendar_function(bc, site):
    """Handed the faction's quests and the game's calendar: the calendar its attributes make."""
    days = gv(site.regs[gv(site.ops[-1].df["ret"])])
    own = new_function(bc, [kind_named(bc, QUESTS), days], days, like=site)
    at = _place(bc, own, "QuestCooldown")
    back = at.refused
    owner_at, faction = at.field_of(QUESTS, OWNER)
    number, least = at.scratch_return(ASKS), at.scratch_like(1)
    kept = "QuestCooldown: at least a day"
    out = _unless_in_use(bc, at, "QuestCooldown", back) + [
           at.op("Field", dst=faction, obj=0, field=owner_at),
           (at.op("JNull", reg=faction), back),
           at.op("ToSFloat", dst=number, src=1)]
    out += emit_scaled(at, faction, number, COOLDOWN_BY)
    out += [at.op("ToInt", dst=least, src=number),
            at.op("Mov", dst=1, src=least),
            at.op("Int", dst=least, ptr=at.number(1)),
            (at.op("JSGte", a=1, b=least), kept),
            at.op("Mov", dst=1, src=least),
            kept + ":", at.op("Label"),
            at.op("Ret", ret=1),
            back + ":", at.op("Label"),
            at.op("Ret", ret=1)]
    replace_body(own, assemble(out))
    return own


def duration_reads(bc, fn):
    """Every instruction of `fn` reading a quest's sheet limit, by the cell's name."""
    info_kind, at = the_info(bc)[1], cell_of(bc, DURATION)
    return [i for i, o in enumerate(fn.ops)
            if o.op == "Field" and gv(o.df["field"]) == at
            and gv(fn.regs[gv(o.df["obj"])]) == info_kind]


def _the_durations(bc):
    went, made = 0, {}
    for name in DURATION_READS:
        fn = function_named(bc, name)
        found = duration_reads(bc, fn)
        guard(found, "%s reads no quest limit" % name)
        this_kind = gv(fn.regs[0])
        for i in reversed(found):
            limit = gv(fn.ops[i].df["dst"])
            key = (this_kind, gv(fn.regs[limit]))
            if key not in made:
                made[key] = _duration_function(bc, fn, *key)
            call = written(template(bc, "Call2"), dst=limit, fun=gv(made[key].findex), arg0=0,
                           arg1=limit)
            kind = traps.PER_TICK if name.endswith("regularUpdate") else traps.IN_PLAY
            went += insert(bc, fn, i + 1, [call], "%s %d" % (SPLICES[0], went), kind)
    return went


def _the_calendar(bc):
    fn = function_named(bc, CALENDAR)
    rets = [i for i, o in enumerate(fn.ops) if o.op == "Ret"]
    guard(rets == [len(fn.ops) - 1], "%s answers in %d place(s), not once at its end"
          % (CALENDAR, len(rets)))
    own = _calendar_function(bc, fn)
    days = gv(fn.ops[-1].df["ret"])
    call = written(template(bc, "Call2"), dst=days, fun=gv(own.findex), arg0=0, arg1=days)
    return insert(bc, fn, rets[0], [call], SPLICES[1], traps.IN_PLAY)


def lift_slot(bc):
    """Our switch: raised, the game's list keeps quests of weight 0."""
    truth = returns_type(function_named(bc, DURATION_READS[0]), DURATION_READS[0])
    return slot_global(bc, LIFT, truth), truth


def _the_weight_test(bc):
    """Right before the game's step past a quest of weight 0: kept while our switch is raised."""
    fn = function_named(bc, AVAILABLE)
    at = cell_of(bc, WEIGHT)
    reads = [i for i, o in enumerate(fn.ops) if o.op == "Field" and gv(o.df["field"]) == at
             and gv(fn.regs[gv(o.df["obj"])]) == the_info(bc)[1]]
    guard(len(reads) == 1, "%s reads a quest's weight %d time(s), not once"
          % (AVAILABLE, len(reads)))
    shape = [o.op for o in fn.ops[reads[0] + 1:reads[0] + 5]]
    guard(shape == ["Int", "ToSFloat", "JNotGte", "JAlways"],
          "%s weighs a quest as %s, not as the step past weight 0" % (AVAILABLE, shape))
    skip = reads[0] + 4
    guard(gv(fn.ops[skip].df["offset"]) < 0, "%s does not step back past weight 0" % AVAILABLE)
    slot, truth = lift_slot(bc)
    raised = a_new_place(bc, fn, truth)
    block = [written(template(bc, "GetGlobal"), **{"dst": raised, "global": slot}),
             written(template(bc, "JTrue"), cond=raised, offset=1)]
    return insert(bc, fn, skip, block, SPLICES[2], traps.IN_PLAY)


def make_slots(bc):
    """Our two maps and our switch; the maps are made at a pass's start, the switch stays down."""
    from tools.hlcode import kind_or_argument
    from framework.acts.gain_res_prod import MAP
    for which in MAPS:
        slot_global(bc, which, kind_named(bc, MAP))
    slot_global(bc, ANY_NARROWED, kind_or_argument(bc, "Bool"))


def quest_pickers():
    """Every held word handing over its quests to the Of words after it."""
    from framework import effecttable
    from framework.questpick import OFFERED
    return tuple(one for one in effecttable.held_rows() if OFFERED in one.offers)


def emit_noted(place, app, tag):
    """A quest-picking row spelling Of words: they and its `val` noted against `app`."""
    from framework.acts.gain_res import WHICH
    from framework.acts.gain_res_prod import APPLICATION, MAP, TELL
    from framework.columns import PART_FOR_NARROWING
    from framework.questpick import UNSPELLED, emit_answer, names_of
    if names_of(place) is None or not quest_pickers():
        return []
    past = place.here("no Of words to note: %s" % tag)
    noting = place.here("Of words to note: %s" % tag)
    mine, answer, spare = (place.scratch_like(place.row[WHICH]), place.scratch_of("I32"),
                           place.scratch_of("I32"))
    out = []
    for one in quest_pickers():
        other = place.here("not `%s`: %s" % (one.word, tag))
        out += [place.op("Int", dst=mine, ptr=place.number(one.number)),
                (place.op("JNotEq", a=place.row[WHICH], b=mine), other)] + emit_answer(
            place, one.word, None, answer) + [
            place.op("Int", dst=spare, ptr=place.number(UNSPELLED)),
            (place.op("JEq", a=answer, b=spare), past),
            (place.op("JAlways"), noting),
            other + ":", place.op("Label")]
    names, vals = place.scratch_of(MAP), place.scratch_of(MAP)
    boxed, told = place.scratch_of("Dyn"), place.scratch_return(TELL)
    at_uid, uid = place.field_of(APPLICATION, "uid")
    raised = place.scratch_of("Bool")
    return out + [
        (place.op("JAlways"), past),
        noting + ":", place.op("Label"),
        place.op("GetGlobal", **{"dst": names, "global": place.slot(NARROWED)}),
        (place.op("JNull", reg=names), past),
        place.op("GetGlobal", **{"dst": vals, "global": place.slot(NARROWED_VAL)}),
        (place.op("JNull", reg=vals), past),
        place.op("Field", dst=uid, obj=app, field=at_uid),
        place.op("UnsafeCast", dst=boxed, src=place.row[PART_FOR_NARROWING]),
        place.op("Call3", dst=told, fun=place.named_function(TELL), arg0=names, arg1=uid,
                 arg2=boxed),
        place.op("ToDyn", dst=boxed, src=place.row["value"]),
        place.op("Call3", dst=told, fun=place.named_function(TELL), arg0=vals, arg1=uid,
                 arg2=boxed),
        place.op("Bool", dst=raised, value=True),
        place.op("SetGlobal", **{"global": place.slot(ANY_NARROWED), "src": raised}),
        past + ":", place.op("Label")]


def emit_quest_row(at, quest, row):
    """`row`, a Dyn, gets the quest's sheet row; none, it stays none."""
    from framework.acts.complete_quest import KIND
    from framework.questpick import emit_row
    kind_at, kind = at.field_of(QUEST, KIND)
    found, flag = at.here("the quest's sheet row read"), at.scratch_of("Bool")
    return [at.op("Null", dst=row),
            at.op("GetGlobal", **{"dst": flag, "global": at.slot(ANY_NARROWED)}),
            (at.op("JFalse", cond=flag), found),
            at.op("Field", dst=kind, obj=quest, field=kind_at)
            ] + emit_row(at, kind, row, found) + [found + ":", at.op("Label")]


def emit_unnarrowed(bc, at, head, faction, row, attribute, into, multiplied):
    """`into` loses each application of ours of `attribute` whose Of words refuse `row`."""
    from framework.acts.gain_res_prod import APPLICATION, MAP, READ
    from framework.questpick import REFUSED, emit_answer
    from framework.rowreader import reader_for
    tag = "%s, %s" % (head, attribute)
    over = at.here("%s: weighed" % tag)
    flag = at.scratch_of("Bool")
    names, vals = at.scratch_of(MAP), at.scratch_of(MAP)
    manager_at, manager = at.field_of(faction, KEPT_ON)
    text, every = at.scratch_arg(CARRIED, 0), at.scratch_return(CARRIED)
    listed = a_new_place(bc, at._hands["fn"](), reader_for(bc).listing_kind)
    val_at, val = at.field_of(APPLICATION, "val")
    stacks_at, stacks = at.field_of(APPLICATION, "stackCount")
    spelled, got, answer, spare = (at.scratch_like(val), at.scratch_of("Dyn"),
                                   at.scratch_of("I32"), at.scratch_of("I32"))
    at_uid, uid = at.field_of(APPLICATION, "uid")
    zero, one, zeroed = at.scratch_like(val), at.scratch_like(stacks), at.scratch_like(stacks)

    def body(app, following):
        again = at.here("%s: once more per stack" % tag)
        undo = ([(at.op("JEq", a=val, b=zero), following),
                 at.op("SDiv", dst=into, a=into, b=val)] if multiplied else
                [at.op("Sub", dst=into, a=into, b=val)])
        return [at.op("Field", dst=uid, obj=app, field=at_uid),
                at.op("Call2", dst=got, fun=at.named_function(READ), arg0=names, arg1=uid),
                (at.op("JNull", reg=got), following),
                at.op("UnsafeCast", dst=listed, src=got),
                at.op("Call2", dst=got, fun=at.named_function(READ), arg0=vals, arg1=uid),
                (at.op("JNull", reg=got), following),
                at.op("SafeCast", dst=spelled, src=got),
                ] + emit_answer(at, head, row, answer, (listed, spelled)) + [
                at.op("Int", dst=spare, ptr=at.number(REFUSED)),
                (at.op("JNotEq", a=answer, b=spare), following),
                at.op("Field", dst=val, obj=app, field=val_at),
                at.op("Field", dst=stacks, obj=app, field=stacks_at),
                at.op("Int", dst=one, ptr=at.number(1)),
                again + ":", at.op("Label")] + undo + [
                at.op("Sub", dst=stacks, a=stacks, b=one),
                (at.op("JSGte", a=stacks, b=one), again)]
    return [at.op("GetGlobal", **{"dst": flag, "global": at.slot(ANY_NARROWED)}),
            (at.op("JFalse", cond=flag), over),
            (at.op("JNull", reg=row), over),
            at.op("GetGlobal", **{"dst": names, "global": at.slot(NARROWED)}),
            (at.op("JNull", reg=names), over),
            at.op("GetGlobal", **{"dst": vals, "global": at.slot(NARROWED_VAL)}),
            (at.op("JNull", reg=vals), over),
            at.op("Field", dst=manager, obj=faction, field=manager_at),
            (at.op("JNull", reg=manager), over),
            at.op("GetGlobal", **{"dst": text, "global": at.text_object(attribute)}),
            at.op("Call2", dst=every, fun=at.named_function(CARRIED), arg0=manager, arg1=text),
            at.op("Int", dst=zeroed, ptr=at.number(0)),
            at.op("ToSFloat", dst=zero, src=zeroed)] + _each_of(
        at, every, tag, body, over) + [over + ":", at.op("Label")]


def _each_of(at, listed, tag, body, over):
    """`body(app, following)` per application in the game's own list, then on to `over`."""
    from framework.acts.gain_res_prod import A_LIST, APPLICATION
    from framework.tray import BACKING_ON, COUNT_ON
    count_at, count = at.field_of(A_LIST, COUNT_ON)
    backing_at, backing = at.field_of(A_LIST, BACKING_ON)
    index, step = at.scratch_like(count), at.scratch_like(count)
    item, app = at.scratch_of("Dyn"), at.scratch_of(APPLICATION)
    again, following = at.here("%s: the next" % tag), at.here("%s: past this one" % tag)
    return [(at.op("JNull", reg=listed), over),
            at.op("Int", dst=index, ptr=at.number(0)),
            at.op("Int", dst=step, ptr=at.number(1)),
            again + ":", at.op("Label"),
            at.op("Field", dst=count, obj=listed, field=count_at),
            (at.op("JSGte", a=index, b=count), over),
            at.op("Field", dst=backing, obj=listed, field=backing_at),
            at.op("GetArray", dst=item, array=backing, index=index),
            at.op("Add", dst=index, a=index, b=step),
            (at.op("JNull", reg=item), following),
            at.op("UnsafeCast", dst=app, src=item)] + body(app, following) + [
            following + ":", at.op("Label"),
            (at.op("JAlways"), again)]


def _skip_asked(bc, site, bit):
    """Ours, asked by the game's check: is `bit` among those our pick is asking for now?"""
    from framework.acts.start_quest import skip_slot
    own = new_function(bc, [], returns_type(site, VALID), like=site)
    at = Place("skip asked", {}, {}, None, None, None, "skip asked: done", hands_for(bc, own))
    held, mask, zero = (at.scratch_of("I32") for _ in range(3))
    said, no = at.scratch_return(VALID), at.here("not asked")
    replace_body(own, assemble([
        at.op("GetGlobal", **{"dst": held, "global": skip_slot(bc)[0]}),
        at.op("Int", dst=mask, ptr=at.number(bit)), at.op("And", dst=held, a=held, b=mask),
        at.op("Int", dst=zero, ptr=at.number(0)), at.op("Bool", dst=said, value=False),
        (at.op("JEq", a=held, b=zero), no), at.op("Bool", dst=said, value=True),
        no + ":", at.op("Label"), at.op("Ret", ret=said)]))
    return own


def the_condition_test(bc):
    """Right after the game's condition test fails a quest: passed when our pick asks it."""
    from framework.acts.start_quest import CONDITIONS, SKIPS, filed_by, skip_bit
    from framework.names import module_of, vocabulary
    asking = [module_of(w) for w in vocabulary().values() if filed_by(w)
              and getattr(module_of(w), SKIPS, None) == CONDITIONS]
    if not asking:
        return 0
    guard(len(asking) == 1, "%d words skip the quest's %s" % (len(asking), CONDITIONS))
    fn, test = function_named(bc, VALID), gv(function_named(bc, CHECK).findex)
    calls = [i for i, o in enumerate(fn.ops) if o.op.startswith("Call")
             and o.df.get("fun") is not None and gv(o.df["fun"]) == test]
    guard(len(calls) == 1, "%s tests a condition %d time(s), not once" % (VALID, len(calls)))
    at = calls[0]
    shape = [o.op for o in fn.ops[at + 1:at + 5]]
    guard(shape == ["JTrue", "Bool", "Ret", "JAlways"] and gv(fn.ops[at + 1].df["offset"]) == 2,
          "%s fails a quest as %s, not as a test answering false" % (VALID, shape))
    own = _skip_asked(bc, fn, skip_bit(asking[0]))
    raised = a_new_place(bc, fn, returns_type(fn, VALID))
    block = [written(template(bc, "Call0"), dst=raised, fun=gv(own.findex)),
             written(template(bc, "JTrue"), cond=raised, offset=2)]
    return insert(bc, fn, at + 2, block, SPLICES[3], traps.IN_PLAY)


def install(bc):
    """Our attributes read where the game reads a quest's limit and its calendar."""
    from framework.acts import start_quest as pick
    for name in DURATION_BY + COOLDOWN_BY:
        text_object(bc, name)
    guard(argument_kind(bc, ASKS, 0) == returns_type(function_named(bc, CALENDAR), CALENDAR),
          "%s takes its attribute as t@%s" % (ASKS, argument_kind(bc, ASKS, 0)))
    named = returns_type(function_named(bc, pick.KIND_NAME), pick.KIND_NAME)
    guard(len(argument_kinds(bc, pick.FIELD)) == 2 and argument_kind(bc, pick.FIELD, 1) == named,
          "%s does not take a thing and a name as %s names a kind" % (pick.FIELD, pick.KIND_NAME))
    for text in tuple(pick.marks()) + tuple(one.word for one in quest_pickers()):
        text_object(bc, text)
    make_slots(bc)
    durations, calendar, weight, skipped = (_the_durations(bc), _the_calendar(bc),
                                            _the_weight_test(bc), the_condition_test(bc))
    return ("QUEST TIMERS: %d call(s) where a quest's limit is read, %d on the calendar, %d "
            "instruction(s) keeping weight 0 and %d passing conditions for our pick -- `%s` and "
            "`%s` read by name; the modifiers read behind the act, after `%s`, `%s` and `%s`" % (
                durations, calendar, weight, skipped, DURATION_BY[0], COOLDOWN_BY[0],
                pick.KIND_MARK, pick.CELL_MARK, pick.SKIP_MARK))
