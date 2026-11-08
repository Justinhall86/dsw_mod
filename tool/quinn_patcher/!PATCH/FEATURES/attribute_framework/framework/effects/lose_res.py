"""`LoseRes` -- an effect doing one game action: lose val of the named resource."""
from framework.trailing import NAMES_ONE_THING, VAL_IS_ITS_AMOUNT
from framework.turned import NO_OTHER_ONE_IS_MEANT
WORD = 'LoseRes'
# its family on the catalogue
KIN = 'Resource'
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'add resource'
TARGET = 'required'
# the editor text
PHRASE = '::value:: [::target::]'
SIGN = '-'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = VAL_IS_ITS_AMOUNT
# with `Not`: why it takes none
NOT_NONE = NO_OTHER_ONE_IS_MEANT
