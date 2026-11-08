"""`HasDev` -- a narrowing word; `HasDevs`, its with-`val` form, counts developments owned."""
WORD = 'HasDev'
# its family on the catalogue
KIN = 'Development'
# the question it asks, by the name its file in `questions` declares
ASKS = 'owns development'
# its bit in the narrowing set, never reordered
NUMBER = 4
TARGET = 'optional'
# the editor text, then the holder's own line
PHRASE = 'if {subject} own{s} [::target::]'
HOLDER = 'if my faction owns [::target::]'
BARE = 'if {subject} own{s} a development'
HOLDER_BARE = 'if my faction owns a development'
# its with-`val` form: its own spelling, question, bit and wordings
WITH_VAL = {
    'WORD': 'HasDevs',
    'ASKS': 'developments owned',
    'NUMBER': 5,
    'TARGET': 'never',
    'PHRASE': 'if {subject} own{s} {amount} developments',
    'HOLDER': 'if my faction owns {amount} developments',
    'SMALLER': 'fewer',
}
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('owns', "doesn't own"), ('own', "don't own"))
