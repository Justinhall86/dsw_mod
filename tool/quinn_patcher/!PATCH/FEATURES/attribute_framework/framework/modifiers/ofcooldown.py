"""`OfCooldown` -- a trailing word (`StartQuest_OfCooldown_OrLess`): a quest weighed by cooldown."""
from framework.trailing import NOTHING_TO_NAME, VAL_IS_ITS_AMOUNT
from framework.turned import WEIGHED_BY_ITS_COMPARISON
WORD = "OfCooldown"
# its family on the catalogue
KIN = 'Quest'
# the editor text it adds to the act it trails
PHRASE = " with a cooldown of {amount} cycles{tail}"
# the word `OrLess` puts after the amount
SMALLER = "fewer"
# the amount is `val`, so no target column is read
TARGET = "never"
# what it attaches to, and what a comparison after it takes
NEEDS = "a quest pick"
OFFERS = ("a comparison",)
# why `Not` never turns it
NOT_NONE = WEIGHED_BY_ITS_COMPARISON
# the quest's own sheet cell weighed against `val`, filed behind the act
CELL = "cooldown"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_IS_ITS_AMOUNT
