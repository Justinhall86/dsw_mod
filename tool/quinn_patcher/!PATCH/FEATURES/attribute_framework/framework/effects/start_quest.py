"""`StartQuest` -- an effect doing one game action."""
WORD = 'StartQuest'
# its family on the catalogue
KIN = 'Quest'
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'start quest'
TARGET = 'optional'
# the editor text
PHRASE = '[::target::]'
BARE = 'a random quest'
AMOUNT = 'one'
# its with-`val` form: its own spelling and wordings
WITH_VAL = {
    'WORD': 'StartQuests',
    'TARGET': 'never',
    'PHRASE': '::value:: random quests',
}
# what a trailing word on its right may attach to
OFFERS = ('a quest pick', 'a quest start')
# with `Not` after 'Start': the editor text, a random pick that skips the one named
TURNED_AFTER = 'Start'
TURNED_PHRASE = 'a random quest other than [::target::]'
