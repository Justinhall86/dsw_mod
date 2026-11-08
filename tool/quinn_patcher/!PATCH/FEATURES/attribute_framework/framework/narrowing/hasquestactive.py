"""`HasQuestActive` -- a narrowing word; `HasActiveQuests`, its with-`val` form, counts them."""
WORD = 'HasQuestActive'
# its family on the catalogue
KIN = 'Quest'
# the question it asks, by the name its file in `questions` declares
ASKS = 'running a quest'
# its bit in the narrowing set, never reordered
NUMBER = 11
TARGET = 'optional'
# the editor text, then the holder's own line
PHRASE = 'if {subject} {have} [::target::] active'
HOLDER = 'if my faction has [::target::] active'
BARE = 'if {subject} {have} an active quest'
HOLDER_BARE = 'if my faction has an active quest'
# its with-`val` form: its own spelling, question, bit and wordings
WITH_VAL = {
    'WORD': 'HasActiveQuests',
    'ASKS': 'quests running',
    'NUMBER': 12,
    'TARGET': 'never',
    'PHRASE': 'if {subject} {have} {amount} active quests',
    'HOLDER': 'if my faction has {amount} active quests',
    'SMALLER': 'fewer',
}
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('has', "doesn't have"), ('have', "don't have"))
