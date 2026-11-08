"""`OfWeight` -- a trailing word (`StartQuest_OfWeight_OrLess`): a quest weighed by its weight."""
from framework.trailing import NOTHING_TO_NAME, VAL_IS_ITS_AMOUNT
from framework.turned import WEIGHED_BY_ITS_COMPARISON
WORD = "OfWeight"
# its family on the catalogue
KIN = 'Quest'
# the editor text it adds to the act it trails
PHRASE = " with weight {amount}{tail}"
# the word `OrLess` puts after the amount
SMALLER = "less"
# the amount is `val`, so no target column is read
TARGET = "never"
# what it attaches to, and what a comparison after it takes
NEEDS = "a quest pick"
OFFERS = ("a comparison",)
# why `Not` never turns it
NOT_NONE = WEIGHED_BY_ITS_COMPARISON
# the quest's own sheet cell weighed against `val`, filed behind the act
CELL = "weight"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_IS_ITS_AMOUNT
