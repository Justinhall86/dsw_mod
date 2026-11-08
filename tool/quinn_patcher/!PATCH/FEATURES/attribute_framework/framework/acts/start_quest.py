"""`start-quest`: the named quest started as the console starts one, else one the game picks."""
from tools.project import guard
from tools.hlcode import (argument_kind, argument_kinds, assemble, slot_global, template,
                          text_object, written)
from framework.acts.gain_devs import VALID, _asking
from framework.acts.gain_res import PAYEE, WHICH
from framework.columns import PART_FOR_NARROWING
from framework.forwhom import JUST_ONE, counted
# a quest's sheet cell read by its name, so a new cell word adds no instruction
from framework.rowreader import READ_COLUMN

STAGE, DOES = "start-quest", "start quest"
NUMBER = 8
# the pick: kinds, quests, 11 steps back over the names, three over its section; then the starts
LOOPS = 2 + 11 + 3 + 1
# the faction's quests; the console's start, which only starts a quest the faction may take now
THROUGH = "ent.Faction.get_quests"
NAMED = "logic.faction.Quests.tryStartQuest"
# and the game's own weighted pick of a basic quest, the one its quest cycle starts
PICKED = "logic.faction.Quests.requestNextBasicQuest"
TAKES = ((THROUGH, 0), (NAMED, 1), (PICKED, 0))
READS = (PAYEE, "columns.named", WHICH, "value", PART_FOR_NARROWING, JUST_ONE, "effect.turned")
TURNED = READS[-1]
ENTERED = "SPINE a quest row reached its act"
STARTED = "SPINE a quest row started the named quest"
REFUSED = "SPINE a quest row named a quest the faction may not take now"
RANDOM = "SPINE a quest row asked the game for a quest"
NOBODY = "SPINE a quest row had no faction"
# the game's own start of a quest, and the name of one kind by its number; none past the last
START, KIND_NAME = "logic.faction.Quests.startQuest", "_Data.$Quest_type_Impl_.getName"
SAME, SHUFFLE = "String.__compare", "$Std.random"
# the game's own read of one quest off its list, whose answer is a quest's sheet row
ONE_QUEST = "lib.$ArrayExtensions_pickWeight_Quest.pickWeight"
# what a count pass hands as the quest to start: past any count
NO_PICK = 1 << 30
SAID = "SPINE a quest row started a quest among those its words keep"
NONE_KEPT = "SPINE a quest row's words kept no quest the faction may take"
QUEST_ID = "id"
# what the modifiers and their comparison file behind the act, each followed by a name or code
KIND_MARK, CELL_MARK, SKIP_MARK = "|quest kind", "|quest cell", "|quest skips"
# filed right behind a kind's name when `Not` turned its word: every kind but that one is kept
KIND_OUT_MARK = "|quest kind out"
# filed by every word handing over its quests, then its name: the Of words up to the next are its
HEAD_MARK = "|quest head"
# filed behind a quest word whose column named one quest (`TQuestDuration`), then that quest's id
ID_MARK = "|quest id"
# and when `Not` turned it (`NotTQuestDuration`, `StartNotTQuest`): every quest but that one
ID_OUT_MARK = "|quest id out"
# what a modifier's file names: the quest kind it keeps, the cell it weighs, the check it skips
KIND, CELL, SKIPS = "KIND", "CELL", "SKIPS"
# the name a skipping modifier gives the game's check of a quest's conditions
CONDITIONS = "conditions"
COMPARED_MARK, NUMBER_OF = "|quest compared", "$Std.parseInt"
PICK = "quest pick, or the game's"
FIELD = READ_COLUMN
# what the pick answers when the row spelled no modifier: past any count, as the pool has no -1
NOT_SPELLED = (1 << 30) + 1
# the pick's argument holding the quest `Not` left out (`StartNotTQuest`), none when not turned
LEFT_OUT = 3


def emit_act(place):
    """The named quest, or the game's own pick, if the row named THIS act."""
    mine = place.scratch_like(place.row[WHICH])
    quests = place.scratch_return(THROUGH)
    started = place.scratch_return(NAMED)
    nothing = place.scratch_return(PICKED)
    past = place.here("this row names another act")
    nobody = place.here("this row has no faction to start a quest for")
    random = place.here("this row names no quest, so the game picks")
    refused = place.here("the faction may not take the named quest now")

    def once(again):
        return [(place.op("JNull", reg=place.row["columns.named"]), random),
                place.op("Int", dst=mine, ptr=place.number(0)),
                (place.op("JNotEq", a=place.row[TURNED], b=mine), random),
                place.op("Call2", dst=started, fun=place.named_function(NAMED), arg0=quests,
                         arg1=place.row["columns.named"]),
                (place.op("JFalse", cond=started), refused),
                ] + _asking(place, STARTED) + [
                (place.op("JAlways"), again),
                refused + ":", place.op("Label")] + _asking(place, REFUSED) + [
                (place.op("JAlways"), again),
                random + ":", place.op("Label"),
                ] + emit_pick(place, quests, nothing, PICKED, RANDOM) + [
                (place.op("JAlways"), again)]

    return [place.op("Int", dst=mine, ptr=place.number(NUMBER)),
            (place.op("JNotEq", a=place.row[WHICH], b=mine), past),
            ] + _asking(place, ENTERED) + [
            (place.op("JNull", reg=place.row[PAYEE]), nobody),
            place.op("Call1", dst=quests, fun=place.named_function(THROUGH),
                     arg0=place.row[PAYEE]),
            (place.op("JNull", reg=quests), nobody),
            ] + repeated(place, "quests started", once, past) + [
            nobody + ":", place.op("Label")] + _asking(place, NOBODY) + [
            past + ":", place.op("Label")]


def repeated(place, tag, once, over):
    """`once(again)` the row's number of times (once when the spelling means one), then `over`."""
    how_many = place.scratch_like(place.row[WHICH])
    at, step = place.scratch_like(how_many), place.scratch_like(how_many)
    again, following = place.here("%s, the next" % tag), place.here("%s, one more" % tag)
    return counted(place, how_many) + [
        place.op("Int", dst=at, ptr=place.number(0)),
        place.op("Int", dst=step, ptr=place.number(1)),
        again + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=how_many), over),
        ] + once(following) + [
        following + ":", place.op("Label"),
        place.op("Add", dst=at, a=at, b=step),
        (place.op("JAlways"), again)]


def install(bc):
    """Check the three calls this borrows, and that a quest is named the way a development is."""
    for name, takes in TAKES:
        got = len(argument_kinds(bc, name))
        guard(got == takes, "%s takes %d argument(s) and this hands it %d" % (name, got, takes))
    guard(argument_kind(bc, NAMED, 0) == argument_kind(bc, VALID, 0),
          "%s takes t@%s, and a target column's name is t@%s"
          % (NAMED, argument_kind(bc, NAMED, 0), argument_kind(bc, VALID, 0)))
    return "START QUEST: `%s` on the named one, else `%s`" % (NAMED, PICKED)


def skip_slot(bc):
    """Our switch: one bit per skipping modifier the pick is asking for now; none, zero."""
    from framework.questtimer import AVAILABLE, SKIPPED
    number = argument_kind(bc, AVAILABLE, 0)
    return slot_global(bc, SKIPPED, number), number


def skip_bit(module):
    """The bit a skipping modifier's own number names in our switch."""
    number = getattr(module, "SKIP_NUMBER", None)
    guard(isinstance(number, int) and not isinstance(number, bool) and 0 < number < 31,
          "%s says its SKIP_NUMBER is %r, not a whole one from 1 to 30" % (module.WORD, number))
    return 1 << (number - 1)


def marks():
    """Every text the pick knows a filed word by: marks, cells, each quest word and modifier."""
    from framework.names import vocabulary
    from framework.questpick import ID, TYPE, heads
    return (KIND_MARK, KIND_OUT_MARK, CELL_MARK, SKIP_MARK, COMPARED_MARK, HEAD_MARK, ID_MARK,
            ID_OUT_MARK, TYPE, ID) + heads() + tuple(
        filed_by(w)[1] for w in vocabulary().values() if filed_by(w))


def _filed(bc, texts, listed, hands):
    """Each minted text pushed, in order, onto the row's names at the bake."""
    from framework.parammatch import emit_pushed
    from framework.rowreader import reader_for
    out = []
    for text in texts:
        held = hands["place"](reader_for(bc).text_kind)
        out += [written(template(bc, "GetGlobal"), **{"dst": held, "global": text_object(
            bc, text)})] + emit_pushed(bc, held, listed, hands)
    return out


def filed_by(word):
    """A modifier's mark and the kind, cell or check it names; None for any other word."""
    from framework.names import module_of
    from framework.narrowcount import FAMILY
    module = module_of(word) if word.family == FAMILY else None
    if getattr(module, SKIPS, None):
        return SKIP_MARK, str(skip_bit(module))
    named = [(m, getattr(module, n)) for m, n in ((KIND_MARK, KIND), (CELL_MARK, CELL))
             if getattr(module, n, None)]
    return named[0] if named else None


def emit_filed(bc, word, listed, hands):
    """A modifier at the bake, as `OfTDomain` is: its mark, then the name it files."""
    return [] if listed is None or filed_by(word) is None else _filed(
        bc, filed_by(word), listed, hands)


def emit_kind_left_out(bc, one, listed, hands):
    """`NotOfTypeLandsraad` at the bake: behind its kind's name, the mark that it is left out."""
    from framework.rowreader import reader_for
    from framework.turned import emit_left_out, turned_after
    filed = filed_by(one.word)
    if listed is None or turned_after(one.word) is None or not filed or filed[0] != KIND_MARK:
        return []
    spare = hands["place"](reader_for(bc).count_kind)
    return emit_left_out(bc, hands, spare, spare, _filed(bc, (KIND_OUT_MARK,), listed, hands),
                         "%s filed" % one.text)


def emit_filed_comparison(bc, code, listed, hands):
    """A comparison at the bake: its mark, then its code as text, behind what it weighs."""
    return [] if listed is None else _filed(bc, (COMPARED_MARK, str(code)), listed, hands)


def _entry(at, r, into):
    return [at.op("GetArray", dst=r["got"], array=r["entries"], index=r["e"]),
            at.op("SafeCast", dst=into, src=r["got"]), at.op("Incr", dst=r["e"])]


def _is(at, r, mark, other):
    """Past this, the entry just read is `mark`; else to `other`."""
    return [at.op("Call2", dst=r["same"], fun=at.named_function(SAME), arg0=r["name"],
                  arg1=r[mark]), (at.op("JNotEq", a=r["same"], b=r["zero"]), other)]


def _spelled(at, r, nothing):
    """What the row's modifiers filed behind the act; with none filed, to `nothing`."""
    every, read, cell, compared, skips, ids, out = (at.here(w) for w in (
        "each name", "names read", "not a kind", "not a cell", "not compared", "not skipped",
        "not the quest named"))
    number = at.scratch_return(NUMBER_OF)
    return [at.op("Mov", dst=r["e"], src=r["start"]),
            every + ":", at.op("Label"), (at.op("JSGte", a=r["e"], b=r["count"]), read)
            ] + _entry(at, r, r["name"]) + _is(at, r, KIND_MARK, cell) + [
        at.op("Mov", dst=r["kinds"], src=r["one"]), at.op("Mov", dst=r["any"], src=r["one"]),
        at.op("Incr", dst=r["e"]), (at.op("JAlways"), every),
        cell + ":", at.op("Label")] + _is(at, r, CELL_MARK, compared) + [
        (at.op("JSGte", a=r["e"], b=r["count"]), read)] + _entry(at, r, r["cell"]) + [
        at.op("Mov", dst=r["any"], src=r["one"]), (at.op("JAlways"), every),
        compared + ":", at.op("Label")] + _is(at, r, COMPARED_MARK, skips) + [
        (at.op("JSGte", a=r["e"], b=r["count"]), read)] + _entry(at, r, r["name"]) + [
        at.op("Call1", dst=number, fun=at.named_function(NUMBER_OF), arg0=r["name"]),
        (at.op("JNull", reg=number), every),
        at.op("SafeCast", dst=r["compared"], src=number), (at.op("JAlways"), every),
        skips + ":", at.op("Label")] + _is(at, r, SKIP_MARK, ids) + [
        (at.op("JSGte", a=r["e"], b=r["count"]), read)] + _entry(at, r, r["name"]) + [
        at.op("Call1", dst=number, fun=at.named_function(NUMBER_OF), arg0=r["name"]),
        (at.op("JNull", reg=number), every), at.op("SafeCast", dst=r["same"], src=number),
        at.op("Or", dst=r["skips"], a=r["skips"], b=r["same"]),
        at.op("Mov", dst=r["any"], src=r["one"]), (at.op("JAlways"), every),
        ids + ":", at.op("Label")] + _is(at, r, ID_MARK, out) + [
        (at.op("JSGte", a=r["e"], b=r["count"]), read)] + _entry(at, r, r["id"]) + [
        at.op("Mov", dst=r["any"], src=r["one"]), (at.op("JAlways"), every),
        out + ":", at.op("Label")] + _is(at, r, ID_OUT_MARK, every) + [
        (at.op("JSGte", a=r["e"], b=r["count"]), read)] + _entry(at, r, r["id"]) + [
        at.op("Mov", dst=r["out"], src=r["one"]),
        at.op("Mov", dst=r["any"], src=r["one"]), (at.op("JAlways"), every),
        read + ":", at.op("Label"), (at.op("JEq", a=r["any"], b=r["zero"]), nothing)]


def _skipping(at, r):
    """The skipping modifiers' bits the row filed, in our switch for the game's checks to ask."""
    slot, _number = skip_slot(at._hands["bc"]())
    return [at.op("SetGlobal", **{"global": slot, "src": r["skips"]})]


def _kind_kept(at, r, named, skip):
    """Past this, `named` is a kind the row's words name and none they leave out; else `skip`."""
    every, judged, plain, following, done, kept = (at.here(w) for w in (
        "each kind word", "kind word read", "kind kept by name", "next kind word",
        "kind words read", "kind kept"))
    named_plain, hit, match, out = (at.scratch_of("I32") for _ in range(4))
    return [(at.op("JEq", a=r["kinds"], b=r["zero"]), kept),
            at.op("Int", dst=named_plain, ptr=at.number(0)),
            at.op("Int", dst=hit, ptr=at.number(0)),
            at.op("Mov", dst=r["e"], src=r["start"]),
            every + ":", at.op("Label"), (at.op("JSGte", a=r["e"], b=r["count"]), done)
            ] + _entry(at, r, r["name"]) + _is(at, r, KIND_MARK, every) + [
        (at.op("JSGte", a=r["e"], b=r["count"]), done)] + _entry(at, r, r["name"]) + [
        at.op("Call2", dst=match, fun=at.named_function(SAME), arg0=named, arg1=r["got"]),
        at.op("Int", dst=out, ptr=at.number(0)),
        (at.op("JSGte", a=r["e"], b=r["count"]), judged),
        at.op("GetArray", dst=r["got"], array=r["entries"], index=r["e"]),
        at.op("SafeCast", dst=r["name"], src=r["got"])] + _is(at, r, KIND_OUT_MARK, judged) + [
        at.op("Incr", dst=r["e"]), at.op("Mov", dst=out, src=r["one"]),
        judged + ":", at.op("Label"),
        (at.op("JEq", a=out, b=r["zero"]), plain),
        (at.op("JEq", a=match, b=r["zero"]), skip),
        (at.op("JAlways"), following),
        plain + ":", at.op("Label"),
        at.op("Mov", dst=named_plain, src=r["one"]),
        (at.op("JNotEq", a=match, b=r["zero"]), following),
        at.op("Mov", dst=hit, src=r["one"]),
        following + ":", at.op("Label"), (at.op("JAlways"), every),
        done + ":", at.op("Label"),
        (at.op("JEq", a=named_plain, b=r["zero"]), kept),
        (at.op("JEq", a=hit, b=r["zero"]), skip),
        kept + ":", at.op("Label")]


def _marks(at, r, nothing):
    """The row's names in hand, and the marks to know them by; with no names, `nothing`."""
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
    entries_at, r["entries"] = at.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    count_at, r["count"] = at.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    # the one quest the row's column named, none until its mark is read
    r["id"], r["out"] = at.scratch_arg(SAME, 0), at.scratch_of("I32")
    out = [at.op("Null", dst=r["id"]), at.op("Int", dst=r["out"], ptr=at.number(0)),
           (at.op("JNull", reg=1), nothing),
           at.op("Field", dst=r["entries"], obj=1, field=entries_at),
           at.op("Field", dst=r["count"], obj=1, field=count_at)]
    for mark in (KIND_MARK, KIND_OUT_MARK, CELL_MARK, COMPARED_MARK, SKIP_MARK, HEAD_MARK,
                 ID_MARK, ID_OUT_MARK):
        r[mark] = at.scratch_arg(SAME, 0)
        out.append(at.op("GetGlobal", **{"dst": r[mark], "global": at.text_object(mark)}))
    return out


def _section(at, r, head):
    """The names `head` (a name, or a place holding one) filed after its mark, to the next's."""
    every, look, over, closed, empty, done = (at.here("section, %s" % w) for w in (
        "each name", "its name", "read", "closed", "unfiled", "done"))
    r["head"] = head if isinstance(head, int) else at.scratch_arg(SAME, 0)
    named = [] if isinstance(head, int) else [
        at.op("GetGlobal", **{"dst": r["head"], "global": at.text_object(head)})]
    return named + [at.op("Int", dst=r["start"], ptr=at.number(0)),
            at.op("Int", dst=r["found"], ptr=at.number(0)),
            at.op("Int", dst=r["e"], ptr=at.number(0)),
            every + ":", at.op("Label"), (at.op("JSGte", a=r["e"], b=r["count"]), over)
            ] + _entry(at, r, r["name"]) + _is(at, r, HEAD_MARK, every) + [
        (at.op("JEq", a=r["found"], b=r["zero"]), look),
        at.op("Sub", dst=r["end"], a=r["e"], b=r["one"]), (at.op("JAlways"), closed),
        look + ":", at.op("Label"), (at.op("JSGte", a=r["e"], b=r["count"]), over)
        ] + _entry(at, r, r["name"]) + _is(at, r, "head", every) + [
        at.op("Mov", dst=r["found"], src=r["one"]), at.op("Mov", dst=r["start"], src=r["e"]),
        (at.op("JAlways"), every),
        over + ":", at.op("Label"), at.op("Mov", dst=r["end"], src=r["count"]),
        closed + ":", at.op("Label"), (at.op("JEq", a=r["found"], b=r["zero"]), empty),
        at.op("Mov", dst=r["count"], src=r["end"]), (at.op("JAlways"), done),
        empty + ":", at.op("Label"),
        at.op("Int", dst=r["count"], ptr=at.number(0)),
        at.op("Int", dst=r["start"], ptr=at.number(0)),
        done + ":", at.op("Label")]


def _weighed(at, r, quest, val, skip):
    """Past this, the row's cell of `quest` lies on the kept side of `val`; else to `skip`."""
    from framework import compmatch
    weighed = at.here("weighed")
    held, value = at.scratch_like(val), at.scratch_return(FIELD)
    return [(at.op("JNull", reg=r["cell"]), weighed),
            at.op("Call2", dst=value, fun=at.named_function(FIELD), arg0=quest, arg1=r["cell"]),
            (at.op("JNull", reg=value), skip),
            at.op("SafeCast", dst=held, src=value)] + compmatch.emit_compared(
        at, held, val, skip, r["compared"], "by its cell") + [weighed + ":", at.op("Label")]


def _id_left_out(at, r, quest, skip):
    """`StartNotTQuest`: past this, `quest` is not the one handed as left out; else to `skip`."""
    kept, name = at.here("not the quest left out"), at.scratch_arg(START, 0)
    id_at, _ = at.field_of(quest, QUEST_ID)
    return [(at.op("JNull", reg=LEFT_OUT), kept),
            at.op("Field", dst=name, obj=quest, field=id_at),
            at.op("Call2", dst=r["same"], fun=at.named_function(SAME), arg0=name, arg1=LEFT_OUT),
            (at.op("JEq", a=r["same"], b=r["zero"]), skip), kept + ":", at.op("Label")]


def _walk(hands):
    """Quests the row keeps, counted; the one numbered by the last argument is started."""
    from framework.pipeline import Place
    from framework.questpick import word_doing
    from framework.questtimer import AVAILABLE
    at = Place("quest pick", {}, {}, None, None, None, "quest pick: done", hands)
    r = {w: at.scratch_of("I32") for w in ("zero", "one", "e", "compared", "kinds", "any",
                                          "same", "skips", "start", "end", "found")}
    r["got"], r["name"], r["cell"] = (at.scratch_of("Dyn"), at.scratch_arg(FIELD, 1),
                                      at.scratch_arg(FIELD, 1))
    kind, n, i, size = (at.scratch_of("I32") for _ in range(4))
    listed = at.scratch_return(AVAILABLE)
    quest = at.scratch_return(ONE_QUEST)
    size_at, _ = at.field_of(listed, "length")
    backing_at, backing = at.field_of(listed, "array")
    got, name = at.scratch_of("Dyn"), at.scratch_arg(START, 0)
    nothing = at.scratch_return(START)
    val, pick, spelled = 2, LEFT_OUT + 1, at.here("a quest left out, so ours picks")
    id_at, _ = at.field_of(quest, QUEST_ID)
    outer, inner, next_kind, counted, passed, done, unspelled = (at.here(w) for w in (
        "each kind", "each quest", "next kind", "counted", "passed by", "done", "unspelled"))
    named = at.scratch_return(KIND_NAME)
    return assemble([
        at.op("Int", dst=r["zero"], ptr=at.number(0)),
        at.op("Int", dst=r["one"], ptr=at.number(1)),
        at.op("Int", dst=r["kinds"], ptr=at.number(0)),
        at.op("Int", dst=r["any"], ptr=at.number(0)),
        at.op("Int", dst=r["skips"], ptr=at.number(0)),
        at.op("Int", dst=r["compared"], ptr=at.number(0)),
        at.op("Null", dst=r["cell"]),
        (at.op("JNull", reg=LEFT_OUT), spelled), at.op("Mov", dst=r["any"], src=r["one"]),
        spelled + ":", at.op("Label"),
        at.op("Int", dst=n, ptr=at.number(0)),
        at.op("Int", dst=kind, ptr=at.number(0))]
        + _marks(at, r, unspelled) + _section(at, r, word_doing(DOES))
        + _spelled(at, r, unspelled) + _skipping(at, r) + [
        outer + ":", at.op("Label"),
        at.op("Call1", dst=named, fun=at.named_function(KIND_NAME), arg0=kind),
        (at.op("JNull", reg=named), done)]
        + _kind_kept(at, r, named, next_kind) + [
        at.op("Call2", dst=listed, fun=at.named_function(AVAILABLE), arg0=0, arg1=kind),
        (at.op("JNull", reg=listed), next_kind),
        at.op("Field", dst=size, obj=listed, field=size_at),
        at.op("Field", dst=backing, obj=listed, field=backing_at),
        at.op("Int", dst=i, ptr=at.number(0)),
        inner + ":", at.op("Label"),
        (at.op("JSGte", a=i, b=size), next_kind),
        at.op("GetArray", dst=got, array=backing, index=i),
        at.op("Add", dst=i, a=i, b=r["one"]),
        at.op("ToVirtual", dst=quest, src=got)]
        + _id_left_out(at, r, quest, passed) + _weighed(at, r, got, val, passed) + [
        (at.op("JNotEq", a=n, b=pick), counted),
        at.op("Field", dst=name, obj=quest, field=id_at),
        at.op("Call2", dst=nothing, fun=at.named_function(START), arg0=0, arg1=name),
        counted + ":", at.op("Label"),
        at.op("Add", dst=n, a=n, b=r["one"]),
        passed + ":", at.op("Label"),
        (at.op("JAlways"), inner),
        next_kind + ":", at.op("Label"),
        at.op("Add", dst=kind, a=kind, b=r["one"]),
        (at.op("JAlways"), outer),
        done + ":", at.op("Label"),
        at.op("Ret", ret=n),
        unspelled + ":", at.op("Label"),
        at.op("Int", dst=n, ptr=at.number(NOT_SPELLED)),
        at.op("Ret", ret=n)])


def _switched(place, slot, raised, up):
    return [place.op("Bool", dst=raised, value=up),
            place.op("SetGlobal", **{"global": slot, "src": raised})]


def _lowered(place, raised, zero):
    """Both of our pick's switches down: the game's list and its checks as the game has them."""
    from framework.questtimer import lift_slot
    bc = place._hands["bc"]()
    return _switched(place, lift_slot(bc)[0], raised, False) + [
        place.op("Int", dst=zero, ptr=place.number(0)),
        place.op("SetGlobal", **{"global": skip_slot(bc)[0], "src": zero})]


def _picking(hands, game_pick, asked):
    """A quest the row's modifiers keep, started; with no modifier, the game's own pick."""
    from framework.pipeline import Place
    from framework.questtimer import DURATION_READS, lift_slot
    at = Place(PICK, {}, {}, None, None, None, "%s: done" % PICK, hands)
    count, picked, started, against = (at.scratch_of("I32") for _ in range(4))
    got = at.scratch_return(game_pick)
    kinds = [at.kind_of(r) for r in (0, 1, 2, LEFT_OUT, count)]
    walk = at._hands["shared"](("quest pick",) + tuple(kinds), kinds, kinds[-1], _walk)
    slot, _truth = lift_slot(at._hands["bc"]())
    raised = at.scratch_return(DURATION_READS[0])
    none, plain = at.here("none kept"), at.here("no Of word")
    return assemble(_switched(at, slot, raised, True) + [
        at.op("Int", dst=picked, ptr=at.number(NO_PICK)),
        at.op("CallN", dst=count, fun=walk, args=[0, 1, 2, LEFT_OUT, picked]),
        at.op("Int", dst=against, ptr=at.number(NOT_SPELLED)),
        (at.op("JEq", a=count, b=against), plain),
        at.op("Int", dst=against, ptr=at.number(0)),
        (at.op("JEq", a=count, b=against), none),
        at.op("Call1", dst=picked, fun=at.named_function(SHUFFLE), arg0=count),
        at.op("CallN", dst=started, fun=walk, args=[0, 1, 2, LEFT_OUT, picked]),
        ] + _lowered(at, raised, against) + _asking(at, SAID) + [
        at.op("Ret", ret=got),
        none + ":", at.op("Label"),
        ] + _lowered(at, raised, against) + _asking(at, NONE_KEPT) + [
        at.op("Ret", ret=got),
        plain + ":", at.op("Label"),
        ] + _lowered(at, raised, against) + [
        at.op("Call1", dst=got, fun=at.named_function(game_pick), arg0=0),
        ] + _asking(at, asked) + [at.op("Ret", ret=got)])


def emit_pick(place, quests, into, game_pick, asked):
    """In the act's one call to the game's pick: ours, which asks the game with no modifier on."""
    names, val = place.row[PART_FOR_NARROWING], place.row["value"]
    if place.kind_of(names) == 0:
        return [place.op("Call1", dst=into, fun=place.named_function(game_pick),
                         arg0=quests)] + _asking(place, asked)
    named, zero = place.row["columns.named"], place.scratch_like(place.row[TURNED])
    left, kept = place.scratch_like(named), place.here("no quest left out")
    args = [quests, names, val, left]
    kinds = [place.kind_of(r) for r in args]
    pick = place._hands["shared"]((PICK,) + tuple(kinds), kinds, place.kind_of(into),
                                  lambda hands: _picking(hands, game_pick, asked))
    return [place.op("Null", dst=left), place.op("Int", dst=zero, ptr=place.number(0)),
            (place.op("JEq", a=place.row[TURNED], b=zero), kept),
            place.op("Mov", dst=left, src=named), kept + ":", place.op("Label"),
            place.op("CallN", dst=into, fun=pick, args=args)]
