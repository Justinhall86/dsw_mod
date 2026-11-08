#!/usr/bin/env python3
"""What proves `framework/names.py`. Nothing here goes into the game."""
from tools.project import gv, guard
from framework.names import (FAMILIES, JOIN, Word, claim, parse,
                         parse_piece, readings, vocabulary)


def check(bc=None):
    """The cases. They are the whole of this step: nothing here touches the game."""
    words = vocabulary()
    guard(len(words) >= 3, "the folders hold %d words, expected at least three" % len(words))

    # the spelling rule, one piece at a time
    gain3 = parse_piece("GainTRes3", words)
    guard(gain3.problem is None and gain3.word.spelling == "GainRes"
          and gain3.targeted and gain3.column == 3,
          "GainTRes3 read as %r" % gain3)
    guard(parse_piece("GainTRes", words).column == 1, "a targeted piece with no number is not 1")
    guard(parse_piece("GainRes", words).problem, "GainRes was accepted, and it names no resource")
    seven = parse_piece("OnTSiegeAction7", words)
    guard(seven.problem is None and seven.column == 7 and seven.targeted,
          "OnTSiegeAction7 read as %r" % seven)
    any_siege = parse_piece("OnSiegeAction", words)
    guard(any_siege.problem is None and not any_siege.targeted and any_siege.column == 0,
          "OnSiegeAction read as %r -- untargeted means ANY, and that is not a column"
          % any_siege)
    # THE MARK SITS AT A WORD BOUNDARY, in front of a capital -- anywhere else it is a letter
    for boundary in ("GainTRes", "TGainRes"):
        read = parse_piece(boundary, words)
        guard(read.problem is None and read.targeted and read.word.spelling == "GainRes",
              "`%s` puts the mark at a boundary and read as %r" % (boundary, read))
    for typo in ("GaiTnRes", "GainResT", "GainRTes"):
        guard(parse_piece(typo, words).problem,
              "`%s` was read as a targeted resource gain, so a typo is a legal spelling" % typo)

    # an unknown piece is named, with the nearest word we do know
    unknown = parse_piece("GainTRss", words)
    guard(unknown.problem and "GainRes" in unknown.problem,
          "an unknown piece was reported as %r" % unknown.problem)

    # a number with no `T` names a column that untargeted has no use for
    guard(parse_piece("OnSiegeAction2", words).problem,
          "a number was accepted on a piece with no target")
    guard(parse_piece("Faction2", words).problem, "the same, on a scope")
    # and a target on column zero is the one thing untargeted already means
    guard(parse_piece("GainTRes0", words).problem, "a target on column zero was accepted")
    # a word whose own spelling ends in a number can still be found: the whole one is tried first
    guard(("Res2", False, None) in readings("Res2"),
          "a spelling that ends in a number is never offered whole: %s" % readings("Res2"))
    # and an empty piece is a fault rather than something to step over
    guard(parse("Faction%s%sGainTRes" % (JOIN, JOIN), words).problem,
          "a name with nothing between two joins was accepted")

    # a whole name, and the parts it comes back in
    whole = parse("Faction_OnSiegeAction_GainTRes2", words)
    guard(whole.problem is None, "a good name was refused: %s" % whole.problem)
    guard(whole.scope.word.spelling == "Faction", "the scope came back as %r" % whole.scope)
    guard(whole.hook.word.spelling == "OnSiegeAction", "the hook came back as %r" % whole.hook)
    guard(whole.effect.column == 2, "the effect's column came back as %r" % whole.effect)
    guard(whole.narrowing == [] and whole.riders == [] and whole.owner is None,
          "a name with none of them found some")
    # and a name missing a part says which part
    guard("what to DO" in (parse("Faction_OnSiegeAction", words).problem or ""),
          "a name with no effect was accepted")

    # the same spelling in two folders refuses, through the very call the loader makes
    twice = {}
    claim(twice, "Doubled", "scopes", "optional", "scopes/doubled.py")
    try:
        claim(twice, "Doubled", "effects", "optional", "effects/doubled.py")
    except RuntimeError as refusal:
        guard("scopes/doubled.py" in str(refusal) and "effects/doubled.py" in str(refusal),
              "the refusal does not name both places: %s" % refusal)
    else:
        guard(False, "one spelling was claimed by two folders and nothing refused it")
    return len(words)
