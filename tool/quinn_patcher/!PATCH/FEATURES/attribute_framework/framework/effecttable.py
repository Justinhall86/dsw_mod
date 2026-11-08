#!/usr/bin/env python3
"""What an effect is, in declared columns keyed by its spelling; the slot number is no column."""
import types

from tools.project import guard
from framework.names import JOIN, module_of, parse, vocabulary, ways_of_writing

# the seven, in the order the plan lists them; a row may hold nothing else
COLUMNS = ("name", "part", "behaviour", "sign", "repeat", "cost", "stamp",
           "amount", "offers")
# a column is its own name in capitals -- except `name`, which is the word the file declares
CAPITALS = {column: "WORD" if column == "name" else column.upper() for column in COLUMNS}
# what an effect's file may declare: the targeting S3 reads, and one per column (DERIVED)
DECLARES = ("TARGET",) + tuple(CAPITALS[column] for column in COLUMNS)
# and the editor's wording, which the GUI reads and no row ever does
WORDING = ("FAMILY", "PHRASE", "BARE", "HOLDER", "HOLDER_BARE", "RIDERS", "TURNED_PHRASE",
           "TURNED_HOLDER", "ONLY_ONE", "OPENS_THE_BUILDER")
# and what every word says of what it hands over and takes, and of `Not` (`framework/turned.py`)
SAYS = ("OFFERS_NONE", "OFFERS_OWED", "NEEDS", "NEEDS_NONE", "NOT_NONE", "TURNED_AFTER")
# and the ones it must: every column but the word, the part, the amount and what it offers
REQUIRED = tuple(CAPITALS[column] for column in COLUMNS
                 if column not in ("name", "part", "amount", "offers"))

# the parts of a target an effect may read. A slot is not among them, and never will be
PARTS = ("resource", "trait", "unit", "hegemony", "development", "quest", "alert")
SIGNS = ("+", "-")
# LUMP accumulates when repeated; SUSTAINED does not, and only SUSTAINED may go trigger-less
REPEATS = ("LUMP", "SUSTAINED", "EITHER")
COSTS = ("ordinary", "costly")
# who gets the credit: the same set the riders (`ForMe`, `ForTarget`, `ForAll`) override from
STAMPS = ("me", "target", "all", "none")
# where the number comes from: `the row` as written, or `one` stack (the short trait spelling)
AMOUNTS = ("the row", "one")
# the columns that are one word out of a small set, and how a refusal says so
ONE_OF = (("amount", AMOUNTS, "takes its number from"),
          ("sign", SIGNS, "signs itself"), ("repeat", REPEATS, "repeats as"),
          ("cost", COSTS, "costs"), ("stamp", STAMPS, "credits"))


# ---------------------------------------------------------------- WHAT A ROW IS, AND HOW IT IS READ

class Effect:
    """One row of the table: what one authored word does, and nothing about how it is spelt."""

    __slots__ = COLUMNS

    def __init__(self, name, part, behaviour, sign, repeat, cost, stamp,
                 amount="the row", offers=()):
        self.name = name
        self.part = part
        self.behaviour = behaviour
        self.sign = sign
        self.repeat = repeat
        self.cost = cost
        self.stamp = stamp
        self.amount = amount
        # what a trailing word on its right may attach to
        self.offers = offers

    def __repr__(self):
        return "%s(%s%s -> %s)" % (self.name, self.sign, self.part or "", self.behaviour)


def checked_row(where, declared, takes_a_target):
    """One row from what a file declares, every column checked; `takes_a_target` gates the part."""
    for name in sorted(declared):
        guard(name in DECLARES,
              "%s declares `%s`, which is not one of the seven%s"
              % (where, name, " -- a slot belongs to the spelling, not to the effect"
                 if name == "SLOT" else ""))
    for name in REQUIRED:
        guard(declared.get(name), "%s declares no `%s`" % (where, name))

    # a column a file leaves out keeps the row's own default
    row = Effect(**{column: declared.get(CAPITALS[column]) for column in COLUMNS
                    if CAPITALS[column] in declared or column == "part"})
    # the one-word-of-a-set columns, `repeat` among them: declared, or the build refuses
    for column, allowed, saying in ONE_OF:
        written_as = getattr(row, column)
        guard(written_as in allowed, "%s %s %r, and `%s` is one of %s"
              % (where, saying, written_as, column, ", ".join(allowed)))
    guard(row.part is None or row.part in PARTS,
          "%s reads `%s` of the target, and a target has %s" % (where, row.part, ", ".join(PARTS)))
    # a word that takes NO target reads no part of one
    guard(not (takes_a_target == "never" and row.part),
          "%s takes no target at all and still reads `%s` of one" % (where, row.part))
    return row


def only_capitals(where, names):
    """Refuse a near miss (`Part` for `PART`) rather than dropping it in silence."""
    for name in names:
        guard(name.startswith("_") or name in DECLARES or name.upper() not in DECLARES,
              "%s declares `%s`, and it is spelt `%s`" % (where, name, name.upper()))


def read_row(word):
    """One effect's row, read off the file the word was found in."""
    module = module_of(word)
    only_capitals(word.source, dir(module))
    declared = {name: getattr(module, name) for name in dir(module)
                if name.isupper() and name not in WORDING + SAYS}
    return checked_row(word.source, declared, word.target)


def table(words=None):
    """Every effect the folder declares, one row each, KEYED BY THE WORD ALONE."""
    words = words if words is not None else vocabulary()
    rows = {spelling: read_row(word) for spelling, word in sorted(words.items())
            if word.family == "effects"}
    guard(rows, "no effect is declared, so nothing a modder writes could ever do anything")
    return rows


# ------------------------------------------------------------------------- WHAT A ROW ANSWERS

def row_named(name, rows):
    """The row a parsed id names. The number written after the word never reaches this."""
    guard(name.effect is not None, "`%s` says nothing about what to DO" % name.text)
    spelling = name.effect.word.spelling
    guard(spelling in rows, "`%s` is not an effect this build carries" % spelling)
    return rows[spelling]


def cannot_author(name, row):
    """Why this id cannot be authored, given its row -- or nothing at all when it can."""
    if name.hook is None and row.repeat == "LUMP":
        return ("`%s` has no trigger and `%s` accumulates when it is repeated, so nothing would "
                "stop it being paid again every tick" % (name.text, row.name))
    return None


# ----------------------------------------------------------------------- WHAT THE BUILD CHECKS

def check_behaviours(rows, road):
    """RULE 2: every behaviour a row names is an ACT on the road, and two rows may share one."""
    acts = sorted(s.name for s in road.stages if s.kind == "ACT")
    for row in rows.values():
        guard(row.behaviour in acts,
              "`%s` says its behaviour is `%s`, and the road's acts are %s"
              % (row.name, row.behaviour, ", ".join(acts) or "none at all"))
    return acts


def ids_for(spelling, words):
    """Every id these words allow for this effect: each scope, trigger or none, and parameter."""
    scopes = [w.spelling for w in words.values() if w.family == "scopes"]
    hooks = [w.spelling for w in words.values() if w.family == "triggers"] + [None]
    # `DevSpeed_ARatio`: a word whose game takes only a ratio is written with one
    params = [None] + [w.spelling for w in words.values()
                       if w.family == "parameters" and w.target == "never"]
    return (JOIN.join(part for part in (scope, hook, written_as, param) if part)
            for param in params for scope in scopes for hook in hooks
            for written_as in ways_of_writing(spelling))


def check_authorable(rows, words):
    """Every effect must be reachable by SOME id these words allow (the bake's rules, at build)."""
    for spelling in rows:
        reachable = any(parse(text, words).problem is None and cannot_author(
            parse(text, words), row_named(parse(text, words), rows)) is None
            for text in ids_for(spelling, words))
        guard(reachable, "nothing anyone could write reaches `%s`: every id the words allow is "
                         "refused, so the effect is unusable" % spelling)


def install(bc):
    """Read the table out of the folder, join it to the road, and check every row is reachable."""
    # imported HERE, not at the top, to avoid an import ring with the road
    from framework.pipeline import roads
    words = vocabulary()
    rows = table(words)
    # every scope's road, not one of them: a behaviour missing from any road is missing
    for road in roads().values():
        check_behaviours(rows, road)
    check_authorable(rows, words)
    return ("EFFECTS: %d row(s) of %d columns, a file each, "
            "each reachable by an id the words allow -- %s"
            % (len(rows), len(COLUMNS), "; ".join(repr(r) for r in rows.values())))


# ------------------------------------ THE HELD TABLE: a held word's file names its ATTRIBUTES

# the folder every effect word's own file sits in
FOLDER = "effects"
# the parameter each `ATTRIBUTES` key answers to; `plain` is the row with no parameter spelled
HELD_COLUMNS = (("plain", None), ("ARatio", "ARatio"), ("MRatio", "MRatio"))
# where a family's target is named: the row's own column, an `OfTDomain` pick, or nowhere
OWN, NONE, PICKED_DOMAIN = "own", "none", "domain"
# declared by a held word whose column names a thing filed for the words after it: its part
FILED = "FILED"
# the game's own target mark in an attribute's name, and what it means: part, where named, case
FORMS = (("TRes", "resource", OWN, "ETResource"),
         ("THegemony", "hegemony", OWN, "ETHegemony"),
         ("TDomain", None, PICKED_DOMAIN, "ETDomain"))
# ours, past every act's own number, so a held word's `does` never names another act
HELD_FIRST = 100


class Held:
    """One held word: its attribute families, its own number, and what the editor says."""

    def __init__(self, word, families, number, wording, bare, source):
        self.word, self.source = word, source
        self.families = families
        self.number = number
        self.wording = wording
        self.bare = bare
        # what its own file adds to what every held word hands the words on its right
        self.offers = ()
        # the part its column names for the words after it, never for the game (`TQuestDuration`)
        self.filed = None

    @property
    def target(self):
        ways = {way for _part, way, _enum, _kinds in self.families}
        if OWN not in ways:
            return "optional" if self.filed else "never"
        return "required" if ways == {OWN} else "optional"

    @property
    def part(self):
        return next((part for part, way, _e, _k in self.families if way == OWN), self.filed)

    def __repr__(self):
        return "%s(%d)" % (self.word, self.number)


def form_of(attribute):
    """The target form an attribute's name carries; NONE's when it carries no target mark."""
    for piece in attribute.split("_"):
        if not piece.startswith("T") or len(piece) < 2 or not piece[1].isupper():
            continue
        for mark, part, way, enum in FORMS:
            if piece == mark or (piece.startswith(mark) and not piece[len(mark)].islower()):
                return part, way, enum
        guard(False, "`%s` carries the target mark `%s`, and the held table knows only %s"
              % (attribute, piece, ", ".join(m for m, _p, _w, _e in FORMS)))
    return None, NONE, None


def families_of(word, cells):
    """`cells` is (parameter, text) per column; one family per target form, own first."""
    found = {}
    for parameter, text in cells:
        for attribute in (a.strip() for a in str(text or "").split(",")):
            if not attribute:
                continue
            kinds = found.setdefault(form_of(attribute), [])
            guard(parameter not in [p for p, _a in kinds], "`%s` names two %s attributes of one "
                  "target form" % (word, parameter or "plain"))
            kinds.append((parameter, attribute))
    order = (OWN, PICKED_DOMAIN, NONE)
    return tuple((part, way, enum, tuple(kinds)) for (part, way, enum), kinds
                 in sorted(found.items(), key=lambda kv: order.index(kv[0][1])))


# ------------------------------------- THE ONE-SHOT TABLE: a word doing one of the game's actions

# a `-` row takes away what its action gives: its verb and its holder's line say so
TAKING = ("loses", "I take %s from my faction")
DEVELOPMENT_OFFERS = ("an amount", "a development count", "a development pick", "a domain")
# per game action a file's `DOES` names: its act, verb, holder's line, part, repeat and offers
ACTIONS = {
    "add resource": ("add-resource", "pays", "I give my faction %s", "resource", "LUMP",
                     ("an amount",)),
    "add hegemony": ("add-hegemony", "pays", "I give my faction %s", "hegemony", "LUMP",
                     ("an amount",)),
    "set trait stacks": ("add-trait-stacks", "lands", "I gain %s", "trait", "EITHER",
                         ("an amount",)),
    "acquire development": ("add-developments", "pays", "I give my faction %s", "development",
                            "LUMP", DEVELOPMENT_OFFERS),
    "add research days": ("add-development-days", "pays", "I give my faction %s",
                          "development", "LUMP", DEVELOPMENT_OFFERS),
    "recruit unit": ("spawn-units", "spawns", "I spawn %s for my faction", "unit", "LUMP",
                     ("an amount", "a unit being made")),
    "start quest": ("start-quest", "starts", "I start %s for my faction", "quest", "LUMP", ()),
    "complete quest": ("complete-quest", "completes", "I complete %s for my faction", "quest",
                       "LUMP", ("a quest pick",)),
    "fail quest": ("fail-quest", "fails", "I fail %s for my faction", "quest", "LUMP",
                   ("a quest pick",)),
    "raise alert": ("raise-alert", "raises", "I raise %s for my faction", "alert", "LUMP", ()),
}
# what a held word is, in the same terms
HELD_ACTION = ("add-production", "pays", "I give my faction %s", None, "SUSTAINED",
               ("an amount", "a production rate"))
# what a game action owes the words after it, not built yet: {kind: why}, listed every build
ACTIONS_OWE = {}
# why no effect needs a kind: true of every effect
HEADS_ITS_RULE = "an effect heads its rule, so nothing on its left is there for it to need"
# what each form of a one-shot file says for itself; the action and the rest are the file's
FORM_OWN = ("WORD", "TARGET", "PHRASE", "BARE", "AMOUNT", "TURNED_PHRASE")
# what an effect's file says of `Not`: the text it sits after, or why it takes none
NOT_SAID = ("TURNED_AFTER", "NOT_NONE", "TURNED_PHRASE")


class Shot:
    """One one-shot word: the game action it does, and what its row says on top of that."""

    def __init__(self, word, does, target, amount, offers, wording, bare, sign, none_because,
                 source):
        self.none_because = none_because
        self.word, self.source = word, source
        self.does = does
        self.sign = sign or "+"
        self.target = target
        self.amount = amount
        self.offers = offers
        self.wording = wording
        self.bare = bare
        self.turned_after = self.not_none = self.turned_wording = None


_FILES = []


def _shot(file, where, does):
    """A one-shot word from its own file: the game action it does and what it says on top."""
    said = lambda name: getattr(file, name, None)
    guard(does in ACTIONS, "%s does `%s`, and the game actions are %s"
          % (where, does, ", ".join(sorted(ACTIONS))))
    guard(not said("ATTRIBUTES"), "%s names a game action and game attributes both" % where)
    offers = said("OFFERS")
    guard(offers is None or isinstance(offers, tuple), "%s offers %r" % (where, offers))
    one = Shot(said("WORD"), does, said("TARGET"), said("AMOUNT"), offers, said("PHRASE"),
               said("BARE"), said("SIGN"), said("OFFERS_NONE") if offers == () else None, where)
    return _not_said(one, said)


def _not_said(one, said):
    """What the word's file says of `Not`, kept on its row: its text before `Not`, or why none."""
    one.turned_after, one.not_none, one.turned_wording = (said(n) for n in NOT_SAID)
    return one


def _held(file, where, cells):
    """A held word from its own file: the game's attributes it raises and its own number."""
    said = lambda name: getattr(file, name, None)
    guard(isinstance(cells, dict) and set(cells) <= {n for n, _p in HELD_COLUMNS},
          "%s names ATTRIBUTES %r, keyed by %s" % (where, cells, [n for n, _p in HELD_COLUMNS]))
    number = said("NUMBER")
    guard(isinstance(number, int) and number >= HELD_FIRST,
          "%s says its NUMBER is %r, not a whole one from %d" % (where, number, HELD_FIRST))
    kinds = [(p, cells.get(n)) for n, p in HELD_COLUMNS]
    one = Held(said("WORD"), families_of(said("WORD"), kinds), number, said("PHRASE"),
               said("BARE"), where)
    one.offers = tuple(said("OFFERS") or ())
    one.filed = said(FILED)
    guard(one.filed in (None,) + PARTS, "%s files a %r, and a part is one of %s"
          % (where, one.filed, PARTS))
    guard(one.target != "optional" or one.bare,
          "%s may go without a target and declares no `BARE`" % where)
    return _not_said(one, said)


def _sheet():
    """Every effect word's own file, held and one-shot, read once per build; held by NUMBER."""
    if _FILES:
        return _FILES[0]
    import importlib
    from framework.names import dummy_effects, members
    from framework.trailing import WITH_VAL, forms
    held, shots = [], []
    for name in members("framework.%s" % FOLDER):
        where = "%s/%s.py" % (FOLDER, name)
        file = importlib.import_module("framework.%s.%s" % (FOLDER, name))
        guard(getattr(file, "WORD", None) and getattr(file, "PHRASE", None),
              "%s declares no WORD or no PHRASE" % where)
        does, cells = getattr(file, "DOES", None), getattr(file, "ATTRIBUTES", None)
        guard(does or cells, "%s names neither a game action nor game attributes" % where)
        if does:
            shots += [_shot(form, where, does) for form in forms(file, where, FORM_OWN)]
            continue
        guard(not hasattr(file, WITH_VAL), "%s is a held word with a with-`val` form" % where)
        held.append(_held(file, where, cells))
    numbers = [one.number for one in held]
    guard(len(set(numbers)) == len(numbers), "two held words share a NUMBER: %s" % sorted(numbers))
    _FILES.append(dummy_effects(tuple(sorted(held, key=lambda one: one.number)), tuple(shots)))
    return _FILES[0]


def held_rows():
    """Every held word's file, in NUMBER order."""
    return _sheet()[0]


def sheet_rows():
    """Every effect word's file, held and one-shot: each has its `word` and its `target`."""
    return _sheet()[0] + _sheet()[1]


def held_named(word):
    """The held word spelt `word`, or nothing."""
    return next((h for h in held_rows() if h.word == word), None)


def unparametered(name):
    """`HegProd` with no target and no `ARatio` or `MRatio` refused, the game having none."""
    from framework.names import Name
    one = name.effect
    held = None if one.targeted else held_named(one.word.spelling)
    kinds = next((k for _p, way, _e, k in getattr(held, "families", ()) if way == NONE), ())
    asked = [p for p, _a in kinds if p is not None]
    spelled = {p.word.spelling for p in name.pieces if p.family == "parameters"}
    if not asked or len(asked) < len(kinds) or spelled & set(asked):
        return None
    return Name(name.text, name.pieces, problem="`%s` with no target needs %s after it (in `%s`)"
                % (one.word.spelling, " or ".join("`%s`" % p for p in asked), name.text))


def _named_part(one, part):
    """`CompleteQuests`: a form naming nothing reads no part of a target, whatever its act reads."""
    return None if one.target == "never" else part


def held_module(word):
    """An effect word's file with what its action adds, so every reader reads it alike."""
    one = next((w for w in sheet_rows() if w.word == word), None)
    guard(one is not None, "`%s` has no file in `%s`" % (word, FOLDER))
    held = one if isinstance(one, Held) else None
    behaviour, verb, holder, part, repeat, offers = HELD_ACTION if held else ACTIONS[one.does]
    sign = "+" if held else one.sign
    guard(sign in SIGNS, "`%s` signs itself %r, and a sign is one of %s" % (word, sign, SIGNS))
    if sign == "-":
        guard(verb == "pays", "`%s` takes away, and only a paying action can" % word)
        verb, holder = TAKING
    module = types.ModuleType("framework.effects.%s" % word)
    module.WORD, module.FAMILY, module.TARGET = one.word, verb, one.target
    module.PHRASE, module.HOLDER = one.wording, holder % one.wording
    if one.bare:
        module.BARE, module.HOLDER_BARE = one.bare, holder % one.bare
    part = held.part if held else _named_part(one, part)
    if part:
        module.PART = part
    module.BEHAVIOUR, module.SIGN, module.REPEAT = behaviour, sign, repeat
    module.COST, module.STAMP = "ordinary", "me"
    if held and any(way == PICKED_DOMAIN for _p, way, _e, _k in held.families):
        offers += ("a development count", "a domain")
        module.ONLY_ONE = "a domain"
    if held:
        offers += held.offers
    offers = offers if held or one.offers is None else one.offers
    if offers or (not held and one.offers == ()):
        module.OFFERS = offers
    if not held and one.offers == () and one.none_because:
        module.OFFERS_NONE = one.none_because
    if not held and ACTIONS_OWE.get(one.does):
        module.OFFERS_OWED = ACTIONS_OWE[one.does]
    module.NEEDS, module.NEEDS_NONE = (), HEADS_ITS_RULE
    _turned(module, one, holder)
    if not held and one.amount:
        module.AMOUNT = one.amount
    return module


def _turned(module, one, holder):
    """`CompleteNotTQuest`: the text `Not` sits after and its wording, or why it takes none."""
    from framework import turned
    if one.target == "never":
        module.NOT_NONE = one.not_none or turned.NAMES_NOTHING_TO_LEAVE_OUT
        return
    guard((one.turned_after is None) != (one.not_none is None),
          "`%s` must say either where `Not` sits or why it takes none" % one.word)
    if one.not_none:
        module.NOT_NONE = one.not_none
        return
    guard(one.turned_wording, "`%s` takes `Not` and has no `TURNED_PHRASE`" % one.word)
    module.TURNED_AFTER, module.TURNED_PHRASE = one.turned_after, one.turned_wording
    module.TURNED_HOLDER = holder % one.turned_wording


def held_families():
    """Every held word's families, one after another, for whatever reads attributes alone."""
    return tuple(family for held in held_rows() for family in held.families)
