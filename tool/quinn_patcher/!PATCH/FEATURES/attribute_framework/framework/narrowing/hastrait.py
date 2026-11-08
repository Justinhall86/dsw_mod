"""`HasTrait` -- a narrowing word; `HasTraitStacks`, its with-`val` form, counts its stacks."""
from framework.trailing import NAMES_ONE_THING
WORD = 'HasTrait'
# its family on the catalogue
KIN = 'Trait'
# the question it asks, by the name its file in `questions` declares
ASKS = 'carries trait'
# its bit in the narrowing set, never reordered
NUMBER = 0
TARGET = 'required'
# the editor text, then the holder's own line
PHRASE = 'if it has [::target::]'
HOLDER = 'if I have [::target::]'
# its with-`val` form: its own spelling, question, bit and wordings
WITH_VAL = {
    'WORD': 'HasTraitStacks',
    'ASKS': 'trait stacks',
    'NUMBER': 3,
    'TARGET': 'required',
    'PHRASE': 'if it has {amount} stacks of [::target::]',
    'HOLDER': 'if I have {amount} stacks of [::target::]',
    'SMALLER': 'fewer',
}
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('has', "doesn't have"), ('have', "don't have"))
