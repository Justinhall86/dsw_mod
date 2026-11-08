"""`Any` -- before a narrowing, any one faction: `AnyHasTDev`, `NotAnyHasTDev`, `AnyNotHasTDev`."""
from framework.trailing import OWNER_IS_GLUED, OWNER_SAYS_WHOSE, VAL_NOT_ITS
from framework.turned import OWNER_TURNS_ITS_WORD
WORD = "Any"
# the editor text around a scope's noun, then around `Faction`'s named target; never shown
PHRASE = "Each {noun}"
AS = "{name}"
# who a narrowing with no owner word of its own asks, in its editor text
SUBJECT = "they"
# in front of a narrowing (any one picked passes), then a count, which it never stands before
NARROW, NARROW_HOLDER = "any of the factions", "any of the factions"
COUNT, COUNT_HOLDER = "any faction", "any faction"
# an owner word never names a thing in a target column; it says who, not which
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), OWNER_IS_GLUED
NEEDS, NEEDS_NONE = (), OWNER_IS_GLUED
# why `Not` never turns it
NOT_NONE = OWNER_TURNS_ITS_WORD
# the only kind of word it is glued to: `All` is the word in front of a scope or a count
ONLY_BEFORE = "narrowing"
# a word that asks nothing at all, so it accepts every faction, as `All` does
EVERYONE = True
# must the candidate be owned by a faction at all? `yes`, `no`, or `either`
OWNED = "either"
# must its faction BE the holder's? True, False, or None for "do not care"
SAME = None
# and the game's own questions, each asked of (the holder, the candidate); all must hold
ASKS = ()
# True only for `Friendly`: the holder's own things pass WITHOUT the question being asked
OR_SAME = False
# which owner word this is, as a number of ours: never a list place, never 0 (no owner word)
NUMBER = 11
# the one faction a `With` word speaks of, then the holder's
ONE, ONE_HOLDER = "any faction", "any faction"
# its territory in the editor text, as `Borders` says it
LAND = "any"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = OWNER_SAYS_WHOSE
VAL_NONE = VAL_NOT_ITS
