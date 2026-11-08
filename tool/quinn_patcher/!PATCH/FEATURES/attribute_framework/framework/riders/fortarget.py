"""`ForTarget` -- a trailing word: the receiver's owner sees the effect (`TargetFaction`)."""
from framework.trailing import (NOTHING_TRAILS_IT, RIDER_FOLLOWS_THE_EFFECT, RIDER_SAYS_WHO,
                               VAL_NOT_ITS)
from framework.turned import RIDER_HAS_NO_OTHER_SIDE
WORD = "ForTarget"
# its family on the catalogue
KIN = 'Grammar'
# the editor text after an effect that gives a trait; never offered, a row without a rider says it
PHRASE = "It affects the target."
UNOFFERED = True
# a rider names no target column: it says who sees the effect, never what the effect is about
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS, NEEDS_NONE = (), RIDER_FOLLOWS_THE_EFFECT
# why `Not` never turns it
NOT_NONE = RIDER_HAS_NO_OTHER_SIDE
# the credit: `target` is the receiver's owner, which a row spelling no rider already gets
STAMP = "target"
# its choice in the builder's rider menu
LABEL = "target"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = RIDER_SAYS_WHO
VAL_NONE = VAL_NOT_ITS
