#!/usr/bin/env python3
"""What proves `framework/effecttable.py`. Nothing here goes into the game."""
from tools.project import guard
from framework.effecttable import (CAPITALS, COLUMNS, DECLARES, STAMPS, Effect, cannot_author,
                               check_authorable, check_behaviours, checked_row, ids_for,
                               only_capitals, row_named, table, ways_of_writing)
from framework.names import parse, vocabulary
from framework.pipeline import Pipeline, Stage

# what the `GainRes` row declares, as the checks see it -- the cases bend copies of it
GAIN = {"WORD": "GainRes", "PART": "resource", "BEHAVIOUR": "add-resource", "SIGN": "+",
        "REPEAT": "LUMP", "COST": "ordinary", "STAMP": "me"}
from cases.effectdata import WHERE


def bent(**changes):
    """The shipped row's declarations with something changed, or dropped when it is given None."""
    declared = dict(GAIN)
    for name, value in changes.items():
        if value is None:
            declared.pop(name, None)
        else:
            declared[name] = value
    return declared


def refusal(what):
    """The sentence something was refused with, or nothing at all when it was not refused."""
    try:
        what()
    except RuntimeError as no:
        return str(no)
    return None


def refused(what, why, saying=None):
    """Something that must be refused, with the words the refusal has to contain."""
    said = refusal(what)
    guard(said is not None, why)
    guard(saying is None or saying in said, "%s -- it said: %s" % (why, said))
    return said


def check(bc):
    """The cases: the seven columns, the slot that is not one, and the road the table joins to."""
    words = vocabulary()
    rows = table(words)
    _the_shipped_row(rows)
    _one_row_answers_every_number(words, rows)
    _a_column_is_refused_when_it_is_wrong()
    _a_lump_needs_a_trigger(words, rows)
    _a_behaviour_is_written_once(rows)
    return len(rows)


def _the_shipped_row(rows):
    """The shipped rows, seven columns each, and no eighth can be put on one."""
    from framework.effectdata import behaviours
    acts = {r.behaviour for r in rows.values()}
    guard(acts == set(behaviours()),
          "the shipped rows name %s and the acts are %s; every act is some effect's"
          % (sorted(acts), sorted(behaviours())))
    reworded = [r for r in rows.values() if r.amount == "one"]
    guard(reworded and all(r.behaviour in acts for r in reworded),
          "a rewording has to name the act it is a rewording OF")
    row = rows["GainRes"]
    for column in COLUMNS:
        guard(getattr(row, column) is not None or column == "part",
              "the shipped row says nothing for `%s`" % column)
    guard((row.part, row.sign, row.repeat) == ("resource", "+", "LUMP"),
          "the shipped row reads %r %r %r" % (row.part, row.sign, row.repeat))
    try:
        row.slot = 3
    except AttributeError:
        pass
    else:
        guard(False, "a row grew an eighth column")


def _one_row_answers_every_number(words, rows):
    """THE POINT OF THE TABLE: the number belongs to the spelling, and one row serves them all."""
    numbered = {}
    for spelling, expected in (("GainTRes", 1), ("GainTRes2", 2), ("GainTRes3", 3)):
        name = parse("Faction_OnSiegeAction_%s" % spelling, words)
        guard(name.problem is None, "`%s` did not parse: %s" % (spelling, name.problem))
        guard(name.effect.column == expected,
              "`%s` names column %d" % (spelling, name.effect.column))
        numbered[spelling] = row_named(name, rows)
    guard(len(set(id(r) for r in numbered.values())) == 1,
          "three numbers found %d rows" % len(set(id(r) for r in numbered.values())))
    # and a slot declared in a file is refused by name, because that is where it keeps turning up
    refused(lambda: checked_row(WHERE, bent(SLOT=3), "required"),
            "an effect declared a slot", saying="belongs to the spelling")
    refused(lambda: checked_row(WHERE, bent(MAXIMUM=5), "required"),
            "an effect declared a column nobody knows")
    # what a file may declare is the seven, taken from them rather than copied beside them
    guard(DECLARES == ("TARGET",) + tuple(CAPITALS[c] for c in COLUMNS),
          "what a file may declare is %s and the columns are %s" % (DECLARES, COLUMNS))
    guard(all(c.upper() in DECLARES for c in COLUMNS if c != "name"),
          "a column exists that no file is allowed to declare")
    # a near miss is refused rather than dropped, and anything else lower-case is left alone
    refused(lambda: only_capitals(WHERE, ["WORD", "Part", "SIGN"]),
            "a mis-cased declaration was dropped in silence", saying="it is spelt `PART`")
    refused(lambda: only_capitals(WHERE, ["sign"]), "a lower-cased declaration was dropped")
    only_capitals(WHERE, ["WORD", "PART", "a_helper", "__doc__"])
    # and the mark is offered only where the parser lets one sit: in front of a capital
    guard(ways_of_writing("GainRes") == ["GainRes", "TGainRes", "GainTRes"],
          "the reachability check writes %s" % ways_of_writing("GainRes"))


def _a_column_is_refused_when_it_is_wrong():
    """Each of the seven, checked as the row is read rather than trusted."""
    guard(checked_row(WHERE, bent(), "required").behaviour == "add-resource",
          "the shipped declarations do not read as a row")
    refused(lambda: checked_row(WHERE, bent(SIGN="up"), "required"), "a sign was made up")
    refused(lambda: checked_row(WHERE, bent(REPEAT=None), "required"),
            "an effect did not say whether repeating it accumulates", saying="no `REPEAT`")
    refused(lambda: checked_row(WHERE, bent(REPEAT="ONCE"), "required"), "repeating was made up")
    refused(lambda: checked_row(WHERE, bent(COST="free"), "required"), "a cost was made up")
    refused(lambda: checked_row(WHERE, bent(PART="slot"), "required"),
            "an effect read a part of the target that does not exist")
    # the credit is one of the words a rider overrides it with, never a sentence
    refused(lambda: checked_row(WHERE, bent(STAMP="the holder's faction"), "required"),
            "the credit was written as a sentence", saying="`stamp` is one of")
    for who in STAMPS:
        guard(checked_row(WHERE, bent(STAMP=who), "required").stamp == who,
              "`%s` was not accepted as the credit" % who)
    # a word that takes NO target may not read part of one -- and that is the only direction
    refused(lambda: checked_row(WHERE, bent(), "never"),
            "an effect that takes no target still read one", saying="reads `resource`")
    guard(checked_row(WHERE, bent(PART=None), "optional").part is None,
          "an effect that reads no part of its target was refused for it")


def _a_lump_needs_a_trigger(words, rows):
    """Section 1's rule, where the id and its row are put together."""
    with_trigger = parse("Faction_OnSiegeAction_GainTRes", words)
    without = parse("Faction_GainTRes", words)
    guard(without.problem is None, "the trigger-less form did not parse: %s" % without.problem)
    guard(without.hook is None, "`%s` was read as having a trigger" % without.text)
    lump = row_named(with_trigger, rows)
    guard(cannot_author(with_trigger, lump) is None, "a triggered lump was refused")
    said = cannot_author(without, lump)
    guard(said and "every tick" in said, "a trigger-less lump was allowed: %r" % said)
    # and the same id is fine for an effect that repeating does not accumulate
    sustained = Effect("RevealMap", None, "add-resource", "+", "SUSTAINED", "ordinary", "none")
    guard(cannot_author(without, sustained) is None,
          "a trigger-less SUSTAINED effect was refused as well")
    # AND THE RULE HAS A CALLER: every effect must be reachable by some id these words allow
    check_authorable(rows, words)
    written = [text for text in ids_for("GainRes", words)
               if parse(text, words).problem is None]
    guard(written, "no id the words allow even parses for the shipped effect")
    # an effect nothing could ever name is refused, and a LUMP with no trigger to pair with is one
    triggerless = {spelling: row for spelling, row in rows.items()}
    refused(lambda: check_authorable(
        triggerless, {s: w for s, w in words.items() if w.family != "triggers"}),
        "a lump effect with no trigger in the vocabulary was called usable",
        saying="nothing anyone could write reaches")


def _a_behaviour_is_written_once(rows):
    """RULE 2: a behaviour is an ACT on the road, and a second NAME over it costs no code."""
    from framework.pipeline import a_road
    road = a_road()
    acts = check_behaviours(rows, road)
    from framework.effectdata import behaviours
    guard(acts == sorted(behaviours()), "the road's acts are %s" % acts)
    # a second name over the behaviour that is already there -- one row, no stage, no code
    both = dict(rows)
    both["LoseRes"] = checked_row(WHERE, bent(WORD="LoseRes", SIGN="-"), "required")
    guard(check_behaviours(both, road) == acts, "a second name over one behaviour added an act")
    # and a row naming an act nobody wrote is refused where the table meets the road
    invented = {"Wibble": checked_row(WHERE, bent(WORD="Wibble", BEHAVIOUR="do-a-thing"),
                                   "required")}
    refused(lambda: check_behaviours(invented, road),
            "a row named a behaviour the road has no act for", saying="do-a-thing")
    # and a stage of another KIND by that name is not a behaviour either
    not_an_act = Pipeline("a road whose `do-a-thing` is a gate", (
        Stage("do-a-thing", "GATE", owed="nothing -- this road is the case's own"),))
    refused(lambda: check_behaviours(invented, not_an_act),
            "a behaviour matched a stage that is not an act", saying="none at all")
