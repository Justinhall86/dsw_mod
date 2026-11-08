"""`HegProd` -- an effect held through the game's own attributes."""
from framework.trailing import VAL_IS_ITS_AMOUNT
from framework.turned import NO_OTHER_ONE_IS_MEANT
WORD = 'HegProd'
# its family on the catalogue
KIN = 'Hegemony'
# its own number among the held words, never reordered
NUMBER = 103
# the game's attributes it raises, per parameter; bare, only a ratio: `HegProd_ARatio`
ATTRIBUTES = {
    "plain": "THegemony_BaseGain_Flat",
    "ARatio": "THegemony_ARatio, Hegemony_ARatio",
    "MRatio": "THegemony_MRatio, Hegemony_MRatio",
}
# the editor text
PHRASE = '::s_value:: [::target::] [Hegemony] production'
BARE = '::s_value:: hegemony production'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_IS_ITS_AMOUNT
# with `Not`: why it takes none
NOT_NONE = NO_OTHER_ONE_IS_MEANT
