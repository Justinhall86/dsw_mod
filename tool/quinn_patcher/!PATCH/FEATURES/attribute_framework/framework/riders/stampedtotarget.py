"""`StampedToTarget` -- a trailing word: a trait counts as its receiver's owner's."""
from framework.trailing import (NOTHING_TRAILS_IT, RIDER_FOLLOWS_THE_EFFECT, RIDER_SAYS_WHO,
                               VAL_NOT_ITS)
from framework.turned import RIDER_HAS_NO_OTHER_SIDE
WORD = "StampedToTarget"
# its family on the catalogue
KIN = 'Trait'
# the editor text after an effect that gives a trait; never offered, a row without a rider says it
PHRASE = "It counts as the target's."
UNOFFERED = True
# a rider names no target column: it says whose the trait counts as, never what it is about
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS, NEEDS_NONE = (), RIDER_FOLLOWS_THE_EFFECT
# why `Not` never turns it
NOT_NONE = RIDER_HAS_NO_OTHER_SIDE
# the credit a row spelling no rider already gets
STAMP = "target"
STAMP_ONLY = True
# its choice in the builder's rider menu
LABEL = "the target's"
# the editor text set inside the effect's line, then the holder's
INLINE, INLINE_HOLDER = "(counts as the target's)", "(counts as the target's)"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = RIDER_SAYS_WHO
VAL_NONE = VAL_NOT_ITS
