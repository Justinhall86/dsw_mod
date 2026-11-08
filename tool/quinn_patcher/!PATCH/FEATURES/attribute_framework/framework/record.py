#!/usr/bin/env python3
"""One authored row per (row, reader), the only thing a stage is handed."""
from types import MappingProxyType

from tools.project import guard
from framework.columns import emit_walk
from framework.names import parse

# the fields, and nothing else: `owner` (who is paid) is not `holder` (read on behalf of)
FIELDS = ("source", "holder", "owner", "name", "columns", "value", "reader",
          "foreign", "whose_rule", "region_held_by",
          # whether this is the region's pass; the factions, counts and main base a pass opens
          "from_region",
          "every_faction", "how_many_factions",
          "counted", "main_base",
          # who the numbers are drawn to, and `ticked`: the thing that RECEIVES (a reach moves not)
          "shown_to",
          "ticked",
          "notes")

# the one part above that two files name, spelled once here
FROM_REGION = "from_region"


class Source:
    """Where a row came from: authoring place, row id, and the game's application for the pair."""

    __slots__ = ("place", "row", "application")

    def __init__(self, place, row, application=None):
        self.place = place
        self.row = row
        # nothing has one when we build: the game makes it, and the road carries it
        self.application = application

    def __eq__(self, other):
        return isinstance(other, Source) and (self.place, self.row) == (other.place, other.row)

    def __hash__(self):
        return hash((self.place, self.row))

    def __repr__(self):
        return "%s / %s" % (self.place, self.row)


class Record:
    """One row as a stage sees it. The seven are readable; nothing else can be put on it."""

    # the two stores are private, so a stage cannot write them behind the rules below
    __slots__ = ("source", "holder", "owner", "name", "value", "reader",
                 "foreign", "whose_rule", "region_held_by", "from_region",
                 "every_faction", "how_many_factions", "counted",
                 "main_base", "shown_to", "ticked",
                 "_columns", "_notes")

    def __init__(self, source, holder, name, columns, value, reader, owner=None,
                 from_foreign=None, whose_rule=None, region_held_by=None,
                 from_region=None,
                 every_faction=None, how_many_factions=None, counted=None,
                 main_base=None, shown_to=None,
                 ticked=None):
        self.source = source
        self.holder = holder
        # nothing has one when we build: the road reaches it, once per holder, while the game runs
        self.owner = owner
        self.name = name
        self.value = value
        self.reader = reader
        # which kind of pass found this row: set for every store the foreign walk added
        self.foreign = from_foreign
        # which faction HOLDS this row (the walked store's, on a foreign pass)
        self.whose_rule = whose_rule
        # and who holds the region the holder stands in (nothing, if none)
        self.region_held_by = region_held_by
        # and whether this pass is the region's, which only the owner gate asks
        self.from_region = from_region
        # the game's own factions, opened once a pass by the road
        self.every_faction = every_faction
        self.how_many_factions = how_many_factions
        # what each multiplier word counts on the holder, by the word
        self.counted = counted
        self.main_base = main_base
        # who this row's numbers are drawn to: the road's own payee until an act moves it
        self.shown_to = shown_to
        # what may RECEIVE the grant, which a reach never moves
        self.ticked = ticked
        self._columns = dict(columns)
        self._notes = {}

    @property
    def columns(self):
        # readable, never writable: a stage that could add a column could invent authoring
        return MappingProxyType(self._columns)

    @property
    def notes(self):
        # readable, never writable: every note goes through `note` and its one-writer rule
        return MappingProxyType(self._notes)

    def note(self, stage, what):
        """Leave one annotation for a later stage. Two stages cannot write the same note."""
        guard(stage not in self._notes,
              "`%s` has already left a note on %s, and a note has one writer"
              % (stage, self.source))
        self._notes[stage] = what
        return what

    def noted(self, stage, otherwise=None):
        # what an earlier stage left, or nothing when it left none
        return self._notes.get(stage, otherwise)

    def column(self, number, otherwise=None):
        # one target column by its own number, never by counting along
        return self._columns.get(number, otherwise)

    def __repr__(self):
        return "Record(%s, reader %s)" % (self.source, self.reader)


class Records:
    """Every record built so far, plus every row that could not have one, each remembered once."""

    def __init__(self):
        self.made = {}
        self.refused = {}

    def of(self, place, row_id, holder, columns, value, reader, words, owner=None):
        """The record for this row and this reader, or nothing when its name does not parse."""
        # the ROW is the place and the id together, so two attributes on one trait are two rows
        source = Source(place, row_id)
        key = (source, reader)
        if key in self.made:
            return self.made[key]
        if source in self.refused:
            return None
        # the id is read ONCE, here, and every stage below reads the answer instead
        name = parse(row_id, words)
        if name.problem:
            self.refused[source] = name.problem
            return None
        self.made[key] = Record(source, holder, name, columns, value, reader, owner)
        return self.made[key]

    def complaints(self):
        # every row that could not be read, once each, however often the table is built
        return [(source, why) for source, why in sorted(self.refused.items(), key=str)]

    def __len__(self):
        return len(self.made)


def install(bc):
    """Check the record's shape against the plan, and count who reads the cdb."""
    return ("RECORD: %d fields, one record per row AND reader, and none at all for a name "
            "that does not parse -- and the payee is its own field, not the holder"
            % len(FIELDS))
