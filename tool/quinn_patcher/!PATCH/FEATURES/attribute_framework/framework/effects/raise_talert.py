"""`RaiseAlert` -- an effect doing one game action: the named alert shows in the alert column."""
from framework.trailing import NAMES_ONE_THING, NOTHING_TRAILS_IT, ONLY_EVER_ONE
from framework.turned import NO_OTHER_ONE_IS_MEANT
WORD = 'RaiseAlert'
# its family on the catalogue
KIN = 'Alert'
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'raise alert'
TARGET = 'required'
# the editor text
PHRASE = 'the alert [::target::]'
AMOUNT = 'one'
# what a trailing word on its right may attach to, and why nothing does
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = ONLY_EVER_ONE
# with `Not`: why it takes none
NOT_NONE = NO_OTHER_ONE_IS_MEANT
