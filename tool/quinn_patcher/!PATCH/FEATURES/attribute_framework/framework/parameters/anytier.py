"""`AnyTier` -- a trailing parameter: a random pick from every development of the faction's tree."""
from framework.trailing import NOTHING_TO_NAME, NOTHING_TRAILS_IT, VAL_NOT_ITS
from framework.turned import SHAPES_THE_EFFECT
WORD = "AnyTier"
# its family on the catalogue
KIN = 'Development'
# the editor text it adds
PHRASE = "of any tier"
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NUMBER = 4
NEEDS = "a development pick"
# why `Not` never turns it
NOT_NONE = SHAPES_THE_EFFECT
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_NOT_ITS
