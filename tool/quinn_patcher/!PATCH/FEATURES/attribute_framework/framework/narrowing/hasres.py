"""`HasRes` -- a narrowing word: on a unit row: only units whose owner holds val of the resource."""
from framework.trailing import NAMES_ONE_THING, VAL_IS_ITS_AMOUNT
WORD = 'HasRes'
# its family on the catalogue
KIN = 'Resource'
# the question it asks, by the name its file in `questions` declares
ASKS = 'resource held'
# its bit in the narrowing set, never reordered
NUMBER = 2
TARGET = 'required'
# the editor text, then the holder's own line
PHRASE = 'if {subject} hold{s} {amount} [::target::]'
HOLDER = 'if my faction holds {amount} [::target::]'
# the word `OrLess` puts after the amount
SMALLER = 'less'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = VAL_IS_ITS_AMOUNT
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('holds', "doesn't hold"), ('hold', "don't hold"))
