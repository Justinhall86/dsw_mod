#!/usr/bin/env python3
"""A trailing word takes the nearest word on its left offering what it needs, or is skipped."""
from tools.project import guard
from tools.hlcode import number, template, written
from framework import names as vocab
from framework.names import module_of, vocabulary
from framework.rowreader import reader_for

# what a word's file calls the kinds it offers, and what a trailing word's calls the one it needs
OFFERS = "OFFERS"
NEEDS = "NEEDS"
# what one kind's place holds before any word on the left offered it; after, the offer's turn
NOT_YET = 0
# the turn of the latest offer, so a word needing several kinds takes the nearest
LATEST = "the latest offer"
# what a word's file says beside an empty OFFERS or NEEDS: why it is empty, in a sentence
NONE_BECAUSE = {OFFERS: "OFFERS_NONE", NEEDS: "NEEDS_NONE"}
# what a word's file says it owes on a side, not built yet: {kind: why}, listed every build
OWED = {OFFERS: "OFFERS_OWED", NEEDS: "NEEDS_OWED"}
# ⛔ A PAIRING SPELLED WORD TO WORD, never kind to kind, reaches only the word it names: `With`
BY_NAME = ("REFINES", "PARTNERED")
# a trailing word's family words on the catalogue it should trail and does not yet, each with why
OWED_AFTER = "OWED_AFTER"
# what a word's file calls its family, and the family that is the grammar's own
KIN, GRAMMAR = "KIN", "Grammar"
# folders whose words trail a family's words, and folders whose words head them
TRAILERS = ("modifiers", "parameters")
HEADS = ("triggers", "multipliers", "effects", "narrowing")


# what a kind carries that is the grammar's own and no game thing: weighed, scaled or rated
GRAMMAR_OWN = "the grammar's own"
# ⛔ ONE PLACE, each by the game's class name; a treaty is no class, so its cdb row's stands in
KINDS = {
    "an amount": GRAMMAR_OWN,
    "a comparison": GRAMMAR_OWN,
    "a production rate": GRAMMAR_OWN,
    # a development's or a building's domain, which `OfTDomain` weighs against the ones it names
    "a domain": GRAMMAR_OWN,
    "a quest pick": "logic.faction.BaseQuest",
    "a quest start": "logic.faction.BaseQuest",
    "a treaty ending": "_Data.Treaty_Impl_",
    "a treaty pick": "_Data.Treaty_Impl_",
    "a development count": "logic.faction.Development",
    "a development pick": "logic.faction.Development",
    "a building count": "ent.Building",
    "a unit count": "ent.Unit",
    "a unit being made": "ent.Unit",
    "a structure count": "ent.Structure",
    "an agent count": "logic.faction.Agent",
    "a region count": "ent.Zone",
    "a faction count": "ent.Faction",
}
# each class a count holds or a narrowing asks, with every class above it; the build checks each
ABOVE = {
    "ent.Object": ("logic.Logic", "net.Serializable"),
    "ent.Faction": ("ent.Entity", "ent.Object", "logic.Logic", "net.Serializable"),
    "ent.Structure": ("ent.Entity", "ent.Object", "logic.Logic", "net.Serializable"),
    "ent.BaseBuilding": ("ent.Entity", "ent.Object", "logic.Logic", "net.Serializable"),
    "ent.Unit": ("ent.MobileEntity", "ent.Entity", "ent.Object", "logic.Logic", "net.Serializable"),
    "ent.Army": ("ent.Unit", "ent.MobileEntity", "ent.Entity", "ent.Object", "logic.Logic",
                 "net.Serializable"),
    "logic.faction.Agent": ("ent.Object", "logic.Logic", "net.Serializable"),
    "ent.Zone": ("ent.Object", "logic.Logic", "net.Serializable"),
    "logic.Upgrades": ("logic.Logic", "net.Serializable"),
}
# in a count's `(question, field)`, in place of the field: the member is asked, and must say no
SAYS_NO = "says no"
# the catalogue family each game thing belongs to: a word handing one over is of that family
FAMILY_OF = {
    "logic.faction.BaseQuest": "Quest",
    "_Data.Treaty_Impl_": "Treaty",
    "logic.faction.Development": "Development",
    "ent.Building": "Building",
    "ent.Unit": "Unit",
    "ent.Structure": "Structure",
    "logic.faction.Agent": "Agent",
    "ent.Zone": "Region",
    "ent.Faction": "Faction",
}
# kinds carrying one game thing two ways, each owed one kind, listed every build until merged
MERGE_OWED = {}
# kinds carrying one game thing two ways that stay apart, each with why: merging opens nothing
KEPT_APART = {
    ("a quest pick", "a quest start"): "only a quest being started has conditions to step past",
    ("a treaty ending", "a treaty pick"): "`With` already reads the treaty a trigger fired on",
    ("a development count", "a development pick"): "the words giving research hand over both",
    ("a unit count", "a unit being made"): "merging would only open `SpawnTUnit_OrTUnit`, which "
                                           "the user dropped",
}
# WHY A WORD HANDS OVER OR TAKES NOTHING, one sentence per role, named by every file it is true of
OPENS_THE_RULE = "it opens its part of the rule, so nothing sits on its left for it to take from"
SCOPE_HANDS_NOTHING = "a scope names the things a rule applies to; no word takes anything from it"
OWNER_IS_GLUED = "an owner word is glued to the word it says whose; it hands nothing on"
RIDER_FOLLOWS_THE_EFFECT = "a rider follows the row's effect, whichever it is; the effect table " \
                           "says which effects each credit fits"
NOTHING_TRAILS_IT = "it is the last word of its pairing: no word takes anything from it"
NO_FAMILY_TRAILER = "no word of its family trails it; a new one is refused until this says so"
NOT_IS_GLUED = "it sits inside another word's spelling; each word says itself whether it takes Not"
ASKS_ITS_OWN = "a narrowing asks its own question of the thing in scope; it takes nothing " \
               "from the word on its left"
# what a word about quests, treaties or developments owes, until it hands over the ones it is about
OWES_ITS_QUESTS = "it hands over the quests it is about once built; until then a quest word " \
                  "after it is skipped"
OWES_ITS_TREATIES = "it hands over the treaties it is about once built; until then `With` " \
                    "reaches it only through its own wiring, or not at all"

# what a word file names its with-`val` form by: that form's own spelling and wordings
WITH_VAL = "WITH_VAL"
# what a file says when it takes only one side, and why; or why the other is not built yet
ANSWERS = {"bare": ("BARE_NONE", "BARE_OWED"), "named": ("NAMED_NONE", "NAMED_OWED"),
           "val": ("VAL_NONE", "VAL_OWED")}
# WHY A WORD TAKES NO BARE FORM, one sentence per role, named by every file it is true of
NAMES_ONE_THING = "it is an amount or a stack of one named thing; with nothing named there is " \
                  "none"
ADDS_ONE_KIND = "it adds or keeps one named kind"
# WHY A WORD TAKES NO NAMED FORM
PICKS_FROM_ITS_LIST = "its kind is picked from its own list"
NOTHING_TO_NAME = "it shapes a number or a check; there is nothing to name"
NO_NAME_TO_WRITE = "the game gives it no name to write in a target column"
ALL_OR_ONE_DOMAIN = "the game scales research for every development or one domain, never one"
OWNER_SAYS_WHOSE = "an owner word says whose; it names nothing of its own"
RIDER_SAYS_WHO = "a rider says who is credited; it names nothing of its own"
COMPARISON_SAYS_A_SIDE = "a comparison says which side of `val` is kept; it names nothing"
TURNS_ITS_WORD = "`Not` turns the word after it; it names nothing of its own"
# WHY A WORD TAKES `val` ALWAYS, OR NEVER
VAL_IS_ITS_AMOUNT = "`val` is its amount"
ONLY_EVER_ONE = "there is only ever one"
VAL_NOT_ITS = "it fires, scopes, credits, compares or shapes another word; `val` is not its"
VAL_IS_ITS_DATE = "`val` is the day or month it fires on"


def forms(file, where, own):
    """A word file's forms: the file, then its with-`val` form, which says all of `own` itself."""
    import types
    yield file
    form = getattr(file, WITH_VAL, None)
    if form is None:
        return
    guard(isinstance(form, dict) and form.get("WORD") and set(form) <= set(own),
          "%s names a with-`val` form of %r, and that is {name: what} over %s"
          % (where, form, ", ".join(own)))
    shared = {n: getattr(file, n) for n in dir(file) if n.isupper() and n not in own + (WITH_VAL,)}
    yield types.SimpleNamespace(**dict(shared, **form))


# what a with-`val` form in a word file outside the tables (`EachDays`) says itself; one each
FORM_OWN = ("WORD", "NUMBER", "TARGET", "PHRASE", "HOLDER")
_FORMS = {}


def claim_form(claim, words, module, family, where):
    """Claim a word file's with-`val` spelling beside its own, when it has one."""
    form = getattr(module, WITH_VAL, None)
    if form:
        claim(words, form["WORD"], family, form.get("TARGET", module.TARGET), where)


def val_form(file, word):
    """The file, or its with-`val` form when the word is that form's spelling."""
    form = getattr(file, WITH_VAL, None)
    if not form or form.get("WORD") != word.spelling:
        return file
    key = (word.source, word.spelling)
    if key not in _FORMS:
        _FORMS[key] = list(forms(file, word.source, FORM_OWN))[1]
    return _FORMS[key]


def carries(kind):
    """The game's name for what one kind carries, or `GRAMMAR_OWN`; one not listed is refused."""
    guard(kind in KINDS, "`%s` is no kind: the kinds are %s" % (kind, ", ".join(sorted(KINDS))))
    return KINDS[kind]


def family_of(kind):
    """The catalogue family a kind's game thing belongs to; None for the grammar's own."""
    thing = carries(kind)
    return None if thing == GRAMMAR_OWN else FAMILY_OF[thing]


def _unsettled(item):
    """A game thing carried by two kinds or more, and no pair kept apart."""
    return len(item[1]) > 1 and all(set(pair) != set(item[1]) for pair in KEPT_APART)


def doubles():
    """(refused, owed): each game thing two kinds carry, refused unless kept apart or owed."""
    by_thing = {}
    for kind, thing in sorted(KINDS.items()):
        if thing != GRAMMAR_OWN:
            by_thing.setdefault(thing, []).append(kind)
    refused, owed_ = [], []
    for thing, two in sorted(filter(_unsettled, by_thing.items())):
        why = next((w for pair, w in MERGE_OWED.items() if set(pair) == set(two)), None)
        line = "%s carry `%s` both" % (" and ".join("`%s`" % k for k in two), thing)
        (owed_ if why else refused).append(line + (" -- owed: %s" % why if why else ""))
    return refused, owed_


def checked():
    """Every kind's game thing has its family, and each owed or kept-apart pair names real kinds."""
    for kind, thing in KINDS.items():
        guard(thing == GRAMMAR_OWN or thing in FAMILY_OF,
              "`%s` carries `%s`, which no family holds" % (kind, thing))
    for pair in list(MERGE_OWED) + list(KEPT_APART):
        guard(all(k in KINDS for k in pair), "the pair %s names no kind" % (pair,))


def in_the_game(bc):
    """Each game thing a kind carries, found in the game file by its name; one missing stops it."""
    from tools.hlcode import kind_named
    for thing in sorted(set(KINDS.values()) - {GRAMMAR_OWN}):
        kind_named(bc, thing)
    return len(set(KINDS.values()) - {GRAMMAR_OWN})


def offers_of(word):
    """The kinds one word offers to the trailing words on its right."""
    offered = getattr(module_of(word), OFFERS, ())
    guard(isinstance(offered, tuple) and all(isinstance(k, str) and k for k in offered),
          "%s offers %r, and what a word offers is a tuple of kinds" % (word.source, offered))
    return offered


def needs_of(word):
    """The kinds a trailing word needs, any one of them; none for a word that needs none."""
    needed = getattr(module_of(word), NEEDS, None)
    needed = (needed,) if isinstance(needed, str) else (needed or ())
    guard(isinstance(needed, tuple) and all(isinstance(k, str) and k for k in needed),
          "%s needs %r, and a trailing word needs a kind or a tuple of kinds"
          % (word.source, needed))
    return needed


def kinds(words=None):
    """Every kind some word needs, in a settled order; one no word offers stops the build."""
    words = vocabulary() if words is None else words
    offered = {kind for word in words.values() for kind in offers_of(word)}
    needed = sorted({kind for word in words.values() for kind in needs_of(word)})
    for kind in needed:
        guard(kind in offered, "%s need %s, and no word offers it"
              % (", ".join(sorted(s for s, w in words.items() if kind in needs_of(w))), kind))
    return needed


def attached(pieces):
    """Each needing piece of a parsed id, paired with the piece it attaches to, or nothing."""
    out = []
    for at, piece in enumerate(pieces):
        needed = set(needs_of(piece.word)) if piece.word else set()
        if not needed:
            continue
        left = [one for one in pieces[:at] if one.word and needed & set(offers_of(one.word))]
        out.append((piece, left[-1] if left else None))
    return out


def registers(bc, fn, reader=None):
    """One place per needed kind and one for the latest offer's turn, on `fn`."""
    reader = reader or reader_for(bc)
    return {kind: reader.borrow_register(bc, fn, vocab.NUMBER_KEPT_IN)
            for kind in kinds() + [LATEST]}


def emit_forget(bc, r):
    """Empty every kind's place before an id is read; nothing left of the first piece offers."""
    return [written(template(bc, "Int"), dst=r[kind], ptr=number(bc, NOT_YET)) for kind in r]


def _marks(bc, r, word):
    """An offering branch's end: a new turn, and each kind it offers marked with it."""
    offered = [kind for kind in offers_of(word) if kind in r]
    return [written(template(bc, "Incr"), dst=r[LATEST])] * bool(offered) + [
        written(template(bc, "Mov"), dst=r[kind], src=r[LATEST]) for kind in offered]


def _nearest(bc, r, one, blocks, needed, skipped):
    """Each needed kind's own block, run when that kind was offered last; none offered skips."""
    taken, out = "%s: its nearest kind taken" % one.text, []
    for kind in needed:
        later = "%s: %s is not the nearest" % (one.text, kind)
        out += [(written(template(bc, "JSGte"), a=r[other], b=r[kind]), later)
                for other in needed if other != kind] + list(blocks[kind]) + [
            (written(template(bc, "JAlways")), taken), later + ":", written(template(bc, "Label"))]
    return out + [(written(template(bc, "JAlways")), skipped),
                  taken + ":", written(template(bc, "Label"))]


def _joined(known):
    """A word's blocks per kind, handed by more than one matcher, joined into one branch."""
    out, at = [], {}
    for one, block in known:
        if not isinstance(block, dict):
            out.append((one, block))
        elif one.text in at:
            held = out[at[one.text]][1]
            guard(not set(held) & set(block), "`%s` is handed a block for %s twice"
                  % (one.text, sorted(set(held) & set(block))))
            held.update(block)
        else:
            at[one.text] = len(out)
            out.append((one, dict(block)))
    return out


def gated(bc, r, known, spare, places, filing=None):
    """Every branch: a needing word stepped over unless its kind was offered; its offers marked."""
    out = []
    for one, block in _joined(known):
        needed = needs_of(one.word)
        marks = _marks(bc, r, one.word) + (list(filing(one.word)) if filing else [])
        if not needed:
            out.append((one, list(block) + marks))
            continue
        for kind in needed:
            guard(kind in r, "`%s` needs %s, and this walk keeps no place for it"
                  % (one.text, kind))
        guard(isinstance(block, dict) or len(needed) == 1 or not block,
              "`%s` needs %s and hands one block, not one per kind" % (one.text, needed))
        blocks = block if isinstance(block, dict) else {kind: block for kind in needed}
        guard(sorted(blocks) == sorted(needed),
              "`%s` hands blocks for %s and needs %s" % (one.text, sorted(blocks), needed))
        skipped = "%s `%s` has nothing on its left offering %s" % (
            places, one.text, " or ".join(needed))
        opened = [written(template(bc, "Int"), dst=spare, ptr=number(bc, NOT_YET)),
                  (written(template(bc, "JEq"), a=r[needed[0]], b=spare), skipped)
                  ] + list(blocks[needed[0]]) if len(needed) == 1 else _nearest(
            bc, r, one, blocks, needed, skipped)
        out.append((one, opened + marks + [skipped + ":", written(template(bc, "Label"))]))
    return out


def gate(bc, fn, known, spare, places, reader=None, filing=None):
    """One walk's whole gate: its places made, every branch gated, and the emptying of them."""
    r = registers(bc, fn, reader)
    return gated(bc, r, known, spare, places, filing), emit_forget(bc, r)


def table(words=None):
    """Every word that offers or needs something, as `word offers ... / needs ...`."""
    words = vocabulary() if words is None else words
    return ["`%s` %s" % (spelling, " and ".join(
        (["offers %s" % ", ".join(offers_of(word))] if offers_of(word) else [])
        + (["needs %s" % " or ".join(needs_of(word))] if needs_of(word) else [])))
        for spelling, word in sorted(words.items()) if offers_of(word) or needs_of(word)]


def owed_of(word, side):
    """The kinds one word owes on one side, each with why: listed every build, never matched."""
    owed = getattr(module_of(word), OWED[side], {})
    guard(isinstance(owed, dict) and all(isinstance(k, str) and isinstance(v, str) and v
                                         for k, v in owed.items()),
          "%s owes %r, and what a word owes is {kind: why}" % (word.source, owed))
    return owed


def _unlisted(spelling, word):
    """Each kind one word names that the one list of kinds does not hold."""
    named = (set(offers_of(word)) | set(needs_of(word))
             | set(owed_of(word, OFFERS)) | set(owed_of(word, NEEDS)))
    return ["`%s` (%s) names `%s`, which is no kind: the kinds are listed once, in trailing.py"
            % (spelling, word.source, kind) for kind in sorted(named - set(KINDS))]


def _misfamilied(spelling, word, family):
    """A head whose catalogue family is not the family of a game thing it hands over."""
    said = family.get(spelling)
    if word.family not in HEADS or not said or said == GRAMMAR:
        return []
    handed = (set(offers_of(word)) | set(owed_of(word, OFFERS))) & set(KINDS)
    wrong = sorted(k for k in handed if family_of(k) not in (None, said))
    return ["`%s` (%s) is %s on the catalogue and hands over `%s`, a %s thing"
            % (spelling, word.source, said, k, family_of(k)) for k in wrong]


def undeclared(words=None):
    """Each word silent on a side, empty without a why, naming no kind, or misfamilied."""
    words = vocabulary() if words is None else words
    family = catalogue_families()
    out = list(doubles()[0])
    for spelling, word in sorted(words.items()):
        module = module_of(word)
        for side in (OFFERS, NEEDS):
            if not hasattr(module, side):
                out.append("`%s` (%s) never says what it %s" % (spelling, word.source,
                                                                 side.lower()))
            elif not (getattr(module, side) or getattr(module, NONE_BECAUSE[side], None)
                      or owed_of(word, side)):
                out.append("`%s` (%s) %s nothing and never says why" % (spelling, word.source,
                                                                        side.lower()))
        out += ["`%s` (%s) pairs with `%s` by name, not by what it needs, and owes no kind"
                % (spelling, word.source, getattr(module, name)) for name in BY_NAME
                if getattr(module, name, None)
                and not (owed_of(word, OFFERS) or owed_of(word, NEEDS))]
        out += _unlisted(spelling, word) + _misfamilied(spelling, word, family)
    return out


def owed(words=None):
    """Everything owed, one line each: kinds to hand over or take, pairings by name, merges."""
    words = vocabulary() if words is None else words
    out = ["merge: " + line for line in doubles()[1]]
    for spelling, word in sorted(words.items()):
        if word.source == vocab.DUMMY_SOURCE:
            continue
        module = module_of(word)
        out += ["`%s` owes, to %s, `%s`: %s" % (spelling, "hand over" if side == OFFERS
                                                else "take", kind, why)
                for side in (OFFERS, NEEDS) for kind, why in sorted(owed_of(word, side).items())]
        out += ["`%s` is tied to `%s` by name until it is paid" % (spelling, getattr(module, name))
                for name in BY_NAME if getattr(module, name, None)]
        if word.family in TRAILERS + ("narrowing",):
            out += ["`%s` owes trailing `%s`: %s" % (spelling, head, why)
                    for head, why in sorted(getattr(module, OWED_AFTER, {}).items())]
    return out


def takes(targets, with_val):
    """Which sides a file's forms take, off their targets and whether it holds a `val` form."""
    return {"named": bool({"required", "optional"} & set(targets)),
            "bare": bool({"optional", "never"} & set(targets)), "val": with_val}


def unformed(words=None):
    """(silent, owed): each word file silent or wrong on a side it lacks, and each owing one."""
    from framework.names import own_file
    words = vocabulary() if words is None else words
    files = {}
    for word in words.values():
        if word.source != vocab.DUMMY_SOURCE:
            files.setdefault(word.source, []).append(word)
    silent, owed = [], []
    for source, found in sorted(files.items()):
        file = own_file(found[0])
        has = takes([w.target for w in found], bool(getattr(file, WITH_VAL, None)))
        for side, (none_by, owed_by) in sorted(ANSWERS.items()):
            none, due = getattr(file, none_by, None), getattr(file, owed_by, None)
            if has[side]:
                silent += ["%s takes %s and says it does not" % (source, side)] * bool(none or due)
            elif due:
                owed.append("%s owes %s: %s" % (source, side, due))
            elif not none:
                silent.append("%s never says whether it takes %s, or why not" % (source, side))
    return silent, owed


def catalogue_families():
    """Each word's family, as its own file's `KIN` says it; a word saying none has none."""
    from framework.names import DUMMY_SOURCE, own_file
    return {spelling: getattr(own_file(word), KIN) for spelling, word in vocabulary().items()
            if word.source != DUMMY_SOURCE and getattr(own_file(word), KIN, None)}


def install(bc):
    """Read what every word offers and needs, and pool the two numbers a kind's place holds."""
    from framework.names import unworded
    from framework.turned import unsaid
    checked()
    silent = undeclared()
    unturned, unworded_ = unsaid()[0], unworded()
    guard(not silent, "%d word(s) do not say what they offer and need:\n  %s"
          % (len(silent), "\n  ".join(silent)))
    guard(not unturned and not unworded_, "%d word(s) say nothing true of `Not`, and %d lack an "
          "editor wording:\n  %s" % (len(unturned), len(unworded_),
                                     "\n  ".join(unturned + unworded_)))
    unsure = unformed()[0]
    guard(not unsure, "%d word file(s) say nothing true of bare, named or `val`:\n  %s"
          % (len(unsure), "\n  ".join(unsure)))
    found = in_the_game(bc)
    needed = kinds()
    number(bc, NOT_YET)
    still = owed() + unsaid()[1] + unformed()[1]
    return ("TRAILING WORDS: %d kind(s) needed (%s); %d game thing(s) the kinds carry, each found "
            "in the game file; %s -- a trailing word with nothing on its left offering its kind is "
            "skipped and the row works without it\n  OWED (%d): %s"
            % (len(needed), ", ".join(needed), found, "; ".join(table()), len(still),
               "\n    ".join(still)))
