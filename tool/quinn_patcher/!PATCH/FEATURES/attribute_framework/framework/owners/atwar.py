"""`AtWar` -- a faction actually at war with the holder -- narrower than `Enemy`."""
from framework.trailing import OWNER_IS_GLUED, OWNER_SAYS_WHOSE, VAL_NOT_ITS
from framework.turned import OWNER_TURNS_ITS_WORD
WORD = "AtWar"
# the editor text around a scope's noun, then around `Faction`'s named target; [War] reads Conflict
PHRASE = "Each {noun} in [War] with you"
AS = "The {name} in [War] with you"
# who a narrowing with no owner word of its own asks, in its editor text
SUBJECT = "they"
# in front of a narrowing (any one picked passes), then a count (summed); each then the holder's
NARROW = "any of the factions in [War] with you"
NARROW_HOLDER = "any of the factions in [War] with the giver"
COUNT, COUNT_HOLDER = "the factions in [War] with you", "the factions in [War] with the giver"
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
SAME = False
# and the game's own questions, each asked of (the holder, the candidate); all must hold
ASKS = (("ent.Entity.isAtWarWith", True),)
# True only for `Friendly`: the holder's own things pass WITHOUT the question being asked
OR_SAME = False
# which owner word this is, as a number of ours: never a list place, never 0 (no owner word)
NUMBER = 3
# the one faction a `With` word speaks of, then the holder's
ONE, ONE_HOLDER = "a faction in [War] with you", "a faction in [War] with the giver"
# its territory in the editor text, as `Borders` says it
LAND = "[War]"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = OWNER_SAYS_WHOSE
VAL_NONE = VAL_NOT_ITS
