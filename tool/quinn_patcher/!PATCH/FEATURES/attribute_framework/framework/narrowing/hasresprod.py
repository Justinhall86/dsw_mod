"""`HasResProd` -- a narrowing word: only a faction producing val of the resource a day."""
from framework.trailing import NAMES_ONE_THING, VAL_IS_ITS_AMOUNT
WORD = 'HasResProd'
# its family on the catalogue
KIN = 'Resource'
# the question it asks, by the name its file in `questions` declares
ASKS = 'resource produced a day'
# its bit in the narrowing set, never reordered
NUMBER = 7
TARGET = 'required'
# the editor text, then the holder's own line
PHRASE = 'if {subject} produce{s} {amount} [::target::] a day'
HOLDER = 'if my faction produces {amount} [::target::] a day'
# the word `OrLess` puts after the amount
SMALLER = 'less'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = VAL_IS_ITS_AMOUNT
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('produces', "doesn't produce"), ('produce', "don't produce"))
