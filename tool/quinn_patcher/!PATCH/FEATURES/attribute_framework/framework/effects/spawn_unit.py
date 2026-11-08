"""`SpawnUnit` -- an effect doing one game action; `SpawnUnits`, its with-`val` form, makes val."""
# NO: no `SpawnTUnit_OrTUnit`; a random pick of two kinds is not free, so the user dropped it
WORD = 'SpawnUnit'
# its family on the catalogue
KIN = 'Unit'
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'recruit unit'
TARGET = 'optional'
# the editor text
PHRASE = 'a [::target::]'
BARE = 'a unit of a random kind'
AMOUNT = 'one'
# its with-`val` form: its own spelling and wordings
WITH_VAL = {
    'WORD': 'SpawnUnits',
    'TARGET': 'optional',
    'PHRASE': '::value:: [::target::]',
    'BARE': '::value:: units of random kinds',
    'TURNED_PHRASE': '::value:: units of random kinds other than [::target::]',
}
# with `Not` after 'Spawn': the editor text, a random pick that skips the one named
TURNED_AFTER = 'Spawn'
TURNED_PHRASE = 'a unit of a random kind other than [::target::]'
