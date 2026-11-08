"""`ResProd` -- an effect held through the game's own attributes."""
from framework.trailing import NAMES_ONE_THING, VAL_IS_ITS_AMOUNT
from framework.turned import NO_OTHER_ONE_IS_MEANT
WORD = 'ResProd'
# its family on the catalogue
KIN = 'Resource'
# its own number among the held words, never reordered
NUMBER = 100
# the game's attributes it raises, per parameter: `plain`, `ARatio`, `MRatio`
ATTRIBUTES = {
    "plain": "TRes_Prod_Flat",
    "ARatio": "TRes_Prod_ARatio",
    "MRatio": "TRes_Prod_MRatio",
}
# the editor text
PHRASE = '::s_value:: [::target::] production'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = VAL_IS_ITS_AMOUNT
# with `Not`: why it takes none
NOT_NONE = NO_OTHER_ONE_IS_MEANT
