"""`complete-quest`: a random solve of the faction's running quest completed as the game does it."""
from tools.project import guard
from tools.hlcode import argument_kind, argument_kinds
from framework.acts.gain_devs import _asking
from framework.acts.gain_res import PAYEE, WHICH
from framework.acts.start_quest import THROUGH, repeated
from framework.columns import PART_FOR_NARROWING
from framework.forwhom import JUST_ONE
from framework.questions.borders_owner import _the_list as the_list
from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON

STAGE = "complete-quest"
NUMBER = 9
# running quests and solves, the random pick's two walks, the shared Of weighing, the row's number
LOOPS = 2 + 2 + 14 + 1
QUESTS, RUNNING = "logic.faction.Quests", "currentQuests"
QUEST, SOLVE, KIND, SOLVES = "logic.faction.Quest", "logic.faction.Subquest", "kind", "subquests"
# what the game's own removal sets first, and returns at once on when it is already set
REMOVED = "removed"
# the quest's own completion; a solve's goes through its own door, forced past its conditions
COMPLETE = "logic.faction.Quest.complete"
SOLVED = "logic.faction.Subquest.complete"
# the solve's inner completion, whose second argument is the plain yes-or-no `forced` wraps
INNER = "logic.faction.Subquest.implInlineComplete"
TAKES = ((THROUGH, 0), (COMPLETE, 0), (SOLVED, 1), (INNER, 2))
# `CompleteNotTQuest`: the quest named is the one a random pick leaves out
TURNED = "effect.turned"
READS = (PAYEE, "columns.named", WHICH, "value", PART_FOR_NARROWING, JUST_ONE, TURNED)
DOES = "complete quest"
ENTERED = "SPINE a quest-completing row reached its act"
DONE = "SPINE a quest-completing row completed the named quest"
DONE_SOLVE = "SPINE a quest-completing row completed the named solve"
NOT_RUNNING = "SPINE a quest-completing row named a quest the faction is not running"
NOBODY = "SPINE a quest-completing row had no faction"


def emit_act(place):
    """The named running quest, or the running quest holding the named solve, completed."""
    return acting(place, NUMBER, (ENTERED, NOT_RUNNING, NOBODY), _complete, _solve, DOES)


def acting(place, number, words, on_quest, on_solve, does):
    """Gate on `number`, then walk the faction's running quests for the one the row names."""
    from framework.questpick import word_doing
    entered, not_running, nobody_word = words
    mine = place.scratch_like(place.row[WHICH])
    quests = place.scratch_return(THROUGH)
    past = place.here("this row names another act")
    nobody = place.here("this row has no faction to end a quest for")
    missing = place.here("the faction runs no quest of that name")
    return [place.op("Int", dst=mine, ptr=place.number(number)),
            (place.op("JNotEq", a=place.row[WHICH], b=mine), past),
            ] + _asking(place, entered) + [
            (place.op("JNull", reg=place.row[PAYEE]), nobody),
            place.op("Call1", dst=quests, fun=place.named_function(THROUGH),
                     arg0=place.row[PAYEE]),
            (place.op("JNull", reg=quests), nobody),
            ] + repeated(place, "quests ended", lambda again: _running(
                place, quests, on_quest, on_solve, missing, again, word_doing(does)), past) + [
            missing + ":", place.op("Label")] + _asking(place, not_running) + [
            (place.op("JAlways"), past),
            nobody + ":", place.op("Label")] + _asking(place, nobody_word) + [
            past + ":", place.op("Label")]


def _each(place, listed, kind, tag, body, over):
    """`body(item, following)` per entry of a game list of `kind`, then on to `over`."""
    _c, count = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    backing_at, backing = place.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    at, step = place.scratch_like(count), place.scratch_like(count)
    entries, got, item = (place.scratch_of(one) for one in (ARRAY_OF_ENTRIES, "Dyn", kind))
    again, following = place.here("%s, the next" % tag), place.here("%s, past this one" % tag)
    return [(place.op("JNull", reg=listed), over),
            ] + the_list(place, listed, entries, count, over) + [
            place.op("Field", dst=backing, obj=entries, field=backing_at),
            (place.op("JNull", reg=backing), over),
            place.op("Int", dst=at, ptr=place.number(0)),
            place.op("Int", dst=step, ptr=place.number(1)),
            again + ":", place.op("Label"),
            (place.op("JSGte", a=at, b=count), over),
            place.op("GetArray", dst=got, array=backing, index=at),
            place.op("Add", dst=at, a=at, b=step),
            (place.op("JNull", reg=got), following),
            place.op("UnsafeCast", dst=item, src=got),
            ] + body(item, following) + [
            following + ":", place.op("Label"),
            (place.op("JAlways"), again)]


def _running(place, quests, on_quest, on_solve, missing, past, head):
    """Each running quest by its id, then its solves by theirs; unnamed, a random one kept."""
    from framework.questpick import emit_kept
    running_at, running = place.field_of(QUESTS, RUNNING)
    solves_at, solves = place.field_of(QUEST, SOLVES)
    asked = place.row["columns.named"]
    chosen = place.scratch_of(QUEST)
    by_name, act_on = (place.here("a running quest, %s" % w) for w in ("named", "chosen"))

    def named(item, of_kind, following):
        kind_at, kind = place.field_of(of_kind, KIND)
        return [place.op("Field", dst=kind, obj=item, field=kind_at),
                (place.op("JNotEq", a=kind, b=asked), following)]

    def quest(item, following):
        its_solves = place.here("a running quest, its solves")
        kind_at, kind = place.field_of(QUEST, KIND)
        gone_at, gone = place.field_of(QUEST, REMOVED)
        # ⛔ a quest ended this row may still be listed; the game marks it removed at once
        return [place.op("Field", dst=gone, obj=item, field=gone_at),
                (place.op("JTrue", cond=gone), following),
                place.op("Field", dst=kind, obj=item, field=kind_at),
                (place.op("JNotEq", a=kind, b=asked), its_solves)] + emit_kept(
            place, head, kind, following) + [
            place.op("Mov", dst=chosen, src=item),
            (place.op("JAlways"), act_on),
            its_solves + ":", place.op("Label"),
            place.op("Field", dst=solves, obj=item, field=solves_at),
            ] + _each(place, solves, SOLVE, "a running quest's solve",
                      lambda solve, after: named(solve, SOLVE, after) + emit_kept(
                          place, head, kind, after) + on_solve(
                          place, item, solve) + [(place.op("JAlways"), past)], following)

    left_out, zero = place.scratch_like(asked), place.scratch_like(place.row[TURNED])
    picked = place.here("a running quest, picked")
    return [place.op("Field", dst=running, obj=quests, field=running_at),
            place.op("Null", dst=left_out), place.op("Int", dst=zero, ptr=place.number(0)),
            (place.op("JNull", reg=asked), picked),
            (place.op("JEq", a=place.row[TURNED], b=zero), by_name),
            place.op("Mov", dst=left_out, src=asked),
            picked + ":", place.op("Label"),
            ] + _random_one(place, running, chosen, head, left_out) + [
            (place.op("JNull", reg=chosen), missing),
            (place.op("JAlways"), act_on),
            by_name + ":", place.op("Label")] + _each(
        place, running, QUEST, "a running quest", quest, missing) + [
        act_on + ":", place.op("Label")] + on_quest(place, chosen) + [
        (place.op("JAlways"), past)]


def _random_one(place, running, chosen, head, left_out):
    """No quest named, or `left_out`: our shared pick of a running quest its Of words keep."""
    from framework.questpick import names_of
    args = [running, left_out] + list(names_of(place) or ())
    kinds = [place.kind_of(r) for r in args]
    # ⛔ A CASE'S ROAD OVER VOID PLACES: a pick made for it would land in the game file
    if 0 in kinds + [place.kind_of(chosen)]:
        return []
    pick = place._hands["shared"](("a random running quest", head) + tuple(kinds), kinds,
                                  place.kind_of(chosen), lambda hands: _picking(hands, head, args))
    return [place.op("CallN", dst=chosen, fun=pick, args=args)]


def _picking(hands, head, took):
    """The running quests kept counted, then the one the game's random number lands on."""
    from tools.hlcode import assemble
    from framework.acts.start_quest import SHUFFLE
    from framework.pipeline import Place
    from framework.questpick import emit_kept
    name = "a random running quest"
    at = Place(name, {}, {}, None, None, None, "%s: done" % name, hands)
    running, left_out, names = 0, 1, ((2, 3) if len(took) > 2 else None)
    kind_at, kind = at.field_of(QUEST, KIND)
    gone_at, gone = at.field_of(QUEST, REMOVED)
    chosen = at.scratch_of(QUEST)
    kept, seen, one = (at.scratch_of("I32") for _ in range(3))
    picked = at.scratch_return(SHUFFLE)
    counted, none = at.here("the running quests kept, counted"), at.here("none kept")

    def keeps(item, following, tag):
        ok = at.here("%s, kept" % tag)
        # no Of word: any running quest is kept, the plain form's as the `val` form's
        named = at.here("%s, none left out" % tag)
        return [at.op("Field", dst=gone, obj=item, field=gone_at),
                (at.op("JTrue", cond=gone), following),
                at.op("Field", dst=kind, obj=item, field=kind_at),
                (at.op("JNull", reg=left_out), named),
                (at.op("JEq", a=kind, b=left_out), following),
                named + ":", at.op("Label"),
                ] + emit_kept(at, head, kind, following, unspelled=ok, names=names) + [
                ok + ":", at.op("Label")]

    def tally(item, following):
        return keeps(item, following, "counted") + [at.op("Add", dst=kept, a=kept, b=one)]

    def landed(item, following):
        hit = at.here("the one picked")
        return keeps(item, following, "picked") + [
            (at.op("JEq", a=seen, b=picked), hit),
            at.op("Add", dst=seen, a=seen, b=one),
            (at.op("JAlways"), following),
            hit + ":", at.op("Label"),
            at.op("Mov", dst=chosen, src=item),
            at.op("Ret", ret=chosen)]

    return assemble([at.op("Null", dst=chosen),
                     at.op("Int", dst=kept, ptr=at.number(0)),
                     at.op("Int", dst=seen, ptr=at.number(0)),
                     at.op("Int", dst=one, ptr=at.number(1)),
                     ] + _each(at, running, QUEST, "counted", tally, counted) + [
                     counted + ":", at.op("Label"),
                     (at.op("JEq", a=kept, b=seen), none),
                     at.op("Call1", dst=picked, fun=at.named_function(SHUFFLE), arg0=kept),
                     ] + _each(at, running, QUEST, "picked", landed, none) + [
                     none + ":", at.op("Label"),
                     at.op("Ret", ret=chosen)])


def _complete(place, quest):
    """One of the quest's solves at random, completed with its rewards; with none, the quest."""
    from framework.acts.start_quest import SHUFFLE
    solves_at, solves = place.field_of(QUEST, SOLVES)
    _c, count = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    backing_at, backing = place.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    entries, got, solve = (place.scratch_of(one) for one in (ARRAY_OF_ENTRIES, "Dyn", SOLVE))
    none, picked = place.scratch_like(count), place.scratch_return(SHUFFLE)
    nothing = place.scratch_return(COMPLETE)
    whole, done = place.here("a quest with no solve, whole"), place.here("a quest, completed")
    return [place.op("Field", dst=solves, obj=quest, field=solves_at),
            (place.op("JNull", reg=solves), whole),
            ] + the_list(place, solves, entries, count, whole) + [
            place.op("Field", dst=backing, obj=entries, field=backing_at),
            (place.op("JNull", reg=backing), whole),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JSGte", a=none, b=count), whole),
            place.op("Call1", dst=picked, fun=place.named_function(SHUFFLE), arg0=count),
            place.op("GetArray", dst=got, array=backing, index=picked),
            (place.op("JNull", reg=got), whole),
            place.op("UnsafeCast", dst=solve, src=got),
            ] + _solve(place, quest, solve) + [
            (place.op("JAlways"), done),
            whole + ":", place.op("Label"),
            place.op("Call1", dst=nothing, fun=place.named_function(COMPLETE), arg0=quest),
            ] + _asking(place, DONE) + [
            done + ":", place.op("Label")]


def _solve(place, _quest, solve):
    """The solve's own completion, forced: its rewards, then its quest's completion."""
    forced, yes = place.scratch_arg(SOLVED, 0), place.scratch_arg(INNER, 1)
    answer = place.scratch_return(SOLVED)
    return [place.op("Bool", dst=yes, value=True),
            place.op("ToDyn", dst=forced, src=yes),
            place.op("Call2", dst=answer, fun=place.named_function(SOLVED), arg0=solve,
                     arg1=forced)] + _asking(place, DONE_SOLVE)


def check_what_we_borrow(bc):
    """Each borrowed call takes what this hands it, and `forced` is the kind both doors take."""
    for name, takes in TAKES:
        got = len(argument_kinds(bc, name))
        guard(got == takes, "%s takes %d argument(s) and this hands it %d" % (name, got, takes))
    guard(argument_kind(bc, INNER, 0) == argument_kind(bc, SOLVED, 0),
          "%s is forced with t@%s and %s with t@%s" % (
              SOLVED, argument_kind(bc, SOLVED, 0), INNER, argument_kind(bc, INNER, 0)))


def install(bc):
    """Check the calls this borrows; the road runs this act in the game."""
    check_what_we_borrow(bc)
    return "COMPLETE QUEST: `%s` on the named running quest, `%s` forced on the named solve" % (
        COMPLETE, SOLVED)
