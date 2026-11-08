"""`FailQuest` -- an effect doing one game action."""
WORD = 'FailQuest'
# its family on the catalogue
KIN = 'Quest'
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'fail quest'
TARGET = 'optional'
# the editor text
PHRASE = '[::target::]'
BARE = 'a random active quest'
AMOUNT = 'one'
# its with-`val` form: its own spelling and wordings
WITH_VAL = {
    'WORD': 'FailQuests',
    'TARGET': 'never',
    'PHRASE': '::value:: active quests',
}
# what a trailing word on its right may attach to
OFFERS = ('a quest pick',)
# with `Not` after 'Fail': the editor text, a random pick that skips the one named
TURNED_AFTER = 'Fail'
TURNED_PHRASE = 'a random active quest other than [::target::]'
