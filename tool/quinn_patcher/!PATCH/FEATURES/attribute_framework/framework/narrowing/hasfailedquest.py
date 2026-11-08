"""`HasFailedQuest` -- a narrowing word; `HasFailedQuests`, its with-`val` form, counts failures."""
WORD = 'HasFailedQuest'
# its family on the catalogue
KIN = 'Quest'
# the question it asks, by the name its file in `questions` declares
ASKS = 'failed a quest'
# its bit in the narrowing set, never reordered
NUMBER = 13
TARGET = 'optional'
# the editor text, then the holder's own line
PHRASE = 'if {subject} {have} failed [::target::]'
HOLDER = 'if my faction has failed [::target::]'
BARE = 'if {subject} {have} failed a quest'
HOLDER_BARE = 'if my faction has failed a quest'
# its with-`val` form: its own spelling, question, bit and wordings
WITH_VAL = {
    'WORD': 'HasFailedQuests',
    'ASKS': 'quests failed',
    'NUMBER': 14,
    'TARGET': 'optional',
    'PHRASE': 'if {subject} {have} failed [::target::] {amount} times',
    'HOLDER': 'if my faction has failed [::target::] {amount} times',
    'BARE': 'if {subject} {have} failed {amount} quests',
    'HOLDER_BARE': 'if my faction has failed {amount} quests',
    'SMALLER': 'fewer',
}
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('failed', 'not failed'),)
