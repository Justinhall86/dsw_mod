"""`DevSpeed` -- an effect held through the game's own attributes."""
# NO: no `TDevSpeed`; the game never speeds one development alone, so the user dropped it
from framework.trailing import ALL_OR_ONE_DOMAIN, VAL_IS_ITS_AMOUNT
from framework.turned import NAMES_NOTHING_TO_LEAVE_OUT
WORD = 'DevSpeed'
# its family on the catalogue
KIN = 'Development'
# its own number among the held words, never reordered
NUMBER = 101
# the game's attributes it raises, per parameter: `plain`, `ARatio`, `MRatio`
ATTRIBUTES = {
    "ARatio": "Development_TDomainCompletionSpeed_ARatio, Development_CompletionSpeed_ARatio",
    "MRatio": "Development_TDomainCompletionSpeed_MRatio, Development_CompletionSpeed_MRatio",
}
# the editor text
PHRASE = '::s_value:: research speed'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = ALL_OR_ONE_DOMAIN
VAL_NONE = VAL_IS_ITS_AMOUNT
# with `Not`: why it takes none
NOT_NONE = NAMES_NOTHING_TO_LEAVE_OUT
