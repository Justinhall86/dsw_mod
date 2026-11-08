"""`HasDoneQuest` -- a narrowing word; `HasDoneQuests`, its with-`val` form, counts quests done."""
WORD = 'HasDoneQuest'
# its family on the catalogue
KIN = 'Quest'
# the question it asks, by the name its file in `questions` declares
ASKS = 'completed a quest'
# its bit in the narrowing set, never reordered
NUMBER = 9
TARGET = 'optional'
# the editor text, then the holder's own line
PHRASE = 'if {subject} {have} completed [::target::]'
HOLDER = 'if my faction has completed [::target::]'
BARE = 'if {subject} {have} completed a quest'
HOLDER_BARE = 'if my faction has completed a quest'
# its with-`val` form: its own spelling, question, bit and wordings
WITH_VAL = {
    'WORD': 'HasDoneQuests',
    'ASKS': 'quests completed',
    'NUMBER': 10,
    'TARGET': 'optional',
    'PHRASE': 'if {subject} {have} completed [::target::] {amount} times',
    'HOLDER': 'if my faction has completed [::target::] {amount} times',
    'BARE': 'if {subject} {have} completed {amount} quests',
    'HOLDER_BARE': 'if my faction has completed {amount} quests',
    'SMALLER': 'fewer',
}
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('completed', 'not completed'),)
