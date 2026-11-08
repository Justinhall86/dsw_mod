"""`HasTreaty` -- a narrowing word: only a faction holding the named treaty, or bare, any."""
WORD = 'HasTreaty'
# its family on the catalogue
KIN = 'Treaty'
# the question it asks, by the name its file in `questions` declares
ASKS = 'treaties active'
# its bit in the narrowing set, never reordered
NUMBER = 15
TARGET = 'optional'
# the editor text, then the holder's own line, each with a target and bare
PHRASE = 'if {subject} hold{s} [::target::]'
HOLDER = 'if my faction holds [::target::]'
BARE = 'if {subject} hold{s} a treaty'
HOLDER_BARE = 'if my faction holds a treaty'
# its with-`val` form: its own spelling, question, bit and wordings
WITH_VAL = {
    'WORD': 'HasTreaties',
    'ASKS': 'treaties held',
    'NUMBER': 17,
    'TARGET': 'optional',
    'PHRASE': 'if {subject} hold{s} [::target::] with {amount} factions',
    'HOLDER': 'if my faction holds [::target::] with {amount} factions',
    'BARE': 'if {subject} hold{s} {amount} treaties',
    'HOLDER_BARE': 'if my faction holds {amount} treaties',
    'SMALLER': 'fewer',
}
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('holds', "doesn't hold"), ('hold', "don't hold"))
