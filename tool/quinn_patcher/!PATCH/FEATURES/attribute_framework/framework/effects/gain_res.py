"""`GainRes` -- an effect doing one game action: gain val of the named resource."""
from framework.trailing import NAMES_ONE_THING, VAL_IS_ITS_AMOUNT
from framework.turned import NO_OTHER_ONE_IS_MEANT
WORD = 'GainRes'
# its family on the catalogue
KIN = 'Resource'
# a fresh word in the word builder opens on this effect
OPENS_THE_BUILDER = True
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'add resource'
TARGET = 'required'
# the editor text
PHRASE = '::value:: [::target::]'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = VAL_IS_ITS_AMOUNT
# with `Not`: why it takes none
NOT_NONE = NO_OTHER_ONE_IS_MEANT
