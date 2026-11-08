"""`Own` -- the holder's own faction, and nothing else."""
from framework.trailing import OWNER_IS_GLUED, OWNER_SAYS_WHOSE, VAL_NOT_ITS
from framework.turned import OWNER_TURNS_ITS_WORD
WORD = "Own"
# the editor text around a scope's noun, then around `Faction`'s named target
PHRASE = "Each of your {nouns}"
AS = "As {name}"
# who a narrowing with no owner word of its own asks, in its editor text
SUBJECT = "you"
# in front of a narrowing (any one picked passes), then a count (summed); each then the holder's
NARROW, NARROW_HOLDER = "you", "the giver"
COUNT, COUNT_HOLDER = "you", "the giver"
# the holder's line names one faction, so its verb takes `{s}`
HOLDER_S = "s"
# an owner word never names a thing in a target column; it says who, not which
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), OWNER_IS_GLUED
NEEDS, NEEDS_NONE = (), OWNER_IS_GLUED
# why `Not` never turns it
NOT_NONE = OWNER_TURNS_ITS_WORD
# must the candidate be owned by a faction at all? `yes`, `no`, or `either`
OWNED = "yes"
# must its faction BE the holder's? True, False, or None for "do not care"
SAME = True
# and the game's own questions, each asked of (the holder, the candidate); all must hold
ASKS = ()
# True only for `Friendly`: the holder's own things pass WITHOUT the question being asked
OR_SAME = False
# which owner word this is, as a number of ours: never a list place, never 0 (no owner word)
NUMBER = 10
# the one faction a `With` word speaks of, then the holder's
ONE, ONE_HOLDER = "you", "my faction"
# its territory in the editor text, as `Borders` says it
LAND = "my"
# what no owner word written means
UNSAID = True
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = OWNER_SAYS_WHOSE
VAL_NONE = VAL_NOT_ITS
