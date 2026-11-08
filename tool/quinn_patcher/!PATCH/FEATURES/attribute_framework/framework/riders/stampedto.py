"""`StampedTo<Owner>` -- a trailing word: a trait gets one copy per faction the owner word picks."""
from framework.trailing import (NOTHING_TRAILS_IT, RIDER_FOLLOWS_THE_EFFECT, RIDER_SAYS_WHO,
                               VAL_NOT_ITS)
from framework.turned import RIDER_HAS_NO_OTHER_SIDE
WORD = "StampedTo"
# its family on the catalogue
KIN = 'Trait'
# the editor text after an effect that gives a trait
PHRASE = "It counts as each faction the owner word picks."
# a rider names no target column: it says whose the trait counts as, never what it is about
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS, NEEDS_NONE = (), RIDER_FOLLOWS_THE_EFFECT
# why `Not` never turns it
NOT_NONE = RIDER_HAS_NO_OTHER_SIDE
# a walk over every faction, each one the glued owner word picks given a copy of its own
STAMP = "all"
STAMP_ONLY = True
# the owner word is glued after it (`StampedToEnemy`); `StampedToAll` is its own, `Own` is `Me`
OWNERS_PICK, OWNER_AFTER, NOT_OWNERS = True, True, ("All", "Own")
# its choice in the builder's rider menu
LABEL = "each picked faction's"
# the editor text set inside the effect's line, then the holder's
INLINE, INLINE_HOLDER = ("(counts as each picked faction's)",
                         "(counts as each picked faction's)")
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = RIDER_SAYS_WHO
VAL_NONE = VAL_NOT_ITS
