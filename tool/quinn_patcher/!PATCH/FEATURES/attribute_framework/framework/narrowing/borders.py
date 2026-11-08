"""`Borders` -- a narrowing word."""
WORD = 'Borders'
# its family on the catalogue
KIN = 'Allegiance'
# the question it asks, by the name its file in `questions` declares
ASKS = "region borders an owner's"
# its bit in the narrowing set, never reordered
NUMBER = 6
TARGET = 'optional'
# the editor text, then the holder's own line
PHRASE = 'if it borders {owner} territory'
HOLDER = 'if I border {owner} territory'
# with `Not` before the owner word (`BordersNotEnemy`), each as the editor, then the holder
NOT_BEFORE_PHRASE = 'if it borders territory of a faction other than {owners}'
NOT_BEFORE_HOLDER = 'if I border territory of a faction other than {owners}'
# its with-`val` form: its own spelling, question, bit and wordings
WITH_VAL = {
    'WORD': 'BordersRegions',
    'ASKS': 'regions bordered',
    'NUMBER': 18,
    'TARGET': 'optional',
    'PHRASE': 'if it borders {amount} {owner} regions',
    'HOLDER': 'if I border {amount} {owner} regions',
    'NOT_BEFORE_PHRASE': 'if it borders {amount} regions of a faction other than {owners}',
    'NOT_BEFORE_HOLDER': 'if I border {amount} regions of a faction other than {owners}',
    'SMALLER': 'fewer',
}
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('borders', "doesn't border"), ('border', "don't border"))
