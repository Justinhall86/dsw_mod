"""`Friendly` -- the holder's own faction AND its allies."""
from framework.trailing import OWNER_IS_GLUED, OWNER_SAYS_WHOSE, VAL_NOT_ITS
from framework.turned import OWNER_TURNS_ITS_WORD
WORD = "Friendly"
# the editor text around a scope's noun, then around `Faction`'s named target
PHRASE = "Each friendly {noun}"
AS = "The friendly {name}"
# who a narrowing with no owner word of its own asks, in its editor text
SUBJECT = "they"
# in front of a narrowing (any one picked passes), then a count (summed); each then the holder's
NARROW, NARROW_HOLDER = "you or any of your allies", "the giver or any of its allies"
COUNT, COUNT_HOLDER = "you and your allies", "the giver and its allies"
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
SAME = None
# and the game's own questions, each asked of (the holder, the candidate); all must hold
ASKS = (("ent.Entity.isAlly", True),)
# True only for `Friendly`: the holder's own things pass WITHOUT the question being asked
OR_SAME = True
# which owner word this is, as a number of ours: never a list place, never 0 (no owner word)
NUMBER = 5
# the one faction a `With` word speaks of, then the holder's
ONE, ONE_HOLDER = "you or one of your allies", "the giver or one of its allies"
# its territory in the editor text, as `Borders` says it
LAND = "friendly"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = OWNER_SAYS_WHOSE
VAL_NONE = VAL_NOT_ITS
