"""`OrLess` -- a trailing word (`HasTRes_OrLess`): at or below `val` keeps the thing."""
from framework.trailing import COMPARISON_SAYS_A_SIDE, NOTHING_TRAILS_IT, VAL_NOT_ITS
from framework.turned import COMPARISON_IS_A_SIDE
WORD = "OrLess"
# its family on the catalogue
KIN = 'Grammar'
# the editor text the weighing word's `{amount}` takes; `{smaller}` is that word's SMALLER
PHRASE = "::value:: or {smaller}"
# the app's menu choice
LABEL = "at most"
# a comparison names no target column: it says how `val` is weighed, never what
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
# what it attaches to: the nearest word on its left offering this
NEEDS = "a comparison"
# why `Not` never turns it
NOT_NONE = COMPARISON_IS_A_SIDE
# its own number in the slot of the narrowing it follows, from 1; never reordered
NUMBER = 1
# which side of `val` keeps the thing (`val` itself always does); the other side removes it
KEEPS = ("below",)
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = COMPARISON_SAYS_A_SIDE
VAL_NONE = VAL_NOT_ITS
