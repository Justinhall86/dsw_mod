"""`GainTraitStack` -- an effect doing one game action; `GainTraitStacks`, with `val`, gains val."""
from framework.trailing import NAMES_ONE_THING
from framework.turned import NO_OTHER_ONE_IS_MEANT
WORD = 'GainTraitStack'
# its family on the catalogue
KIN = 'Trait'
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'set trait stacks'
TARGET = 'required'
# the editor text
PHRASE = 'a stack of [::target::]'
AMOUNT = 'one'
# its with-`val` form: its own spelling and wordings
WITH_VAL = {
    'WORD': 'GainTraitStacks',
    'TARGET': 'required',
    'PHRASE': '::value:: stacks of [::target::]',
}
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
# with `Not`: why it takes none
NOT_NONE = NO_OTHER_ONE_IS_MEANT
