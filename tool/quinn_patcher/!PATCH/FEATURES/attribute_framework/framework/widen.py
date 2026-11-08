#!/usr/bin/env python3
"""One more place, at the END, on the two carriers a row's columns travel in; not in the save."""
from crashlink.core import Field

from tools.project import guard
from tools.hlcode import function_named, kind_named, returns_type
from framework import tray
from framework.parsed import HELD_BY as THE_FILED_THING

# the new place on each carrier (named by its owning file), holding a list of the row's columns
PLACE = "spineTargets"
# ⛔ a COMPILED write into an appended place on a virtual corrupts it, so write it BY NAME
WRITE_BY_NAME = "$Reflect.setField"
HOLDS = tray.ARRAY_OF_ENTRIES


def _a_string(bc, text):
    """Where that text sits in the file's own list of them, added if it is not there."""
    from armoury_lib import str_ref
    return str_ref(bc, text)


def the_registration(bc):
    """The kind the game makes per authored row, off what its registrar returns."""
    from framework.atload import REGISTRAR
    return returns_type(function_named(bc, REGISTRAR), REGISTRAR)


def places_on(bc, kind):
    """That kind's OWN places, in the order it declares them -- not the flattened chain."""
    definition = getattr(bc.types[kind], "definition", None)
    guard(definition is not None and hasattr(definition, "fields"),
          "t@%s declares no places of its own" % kind)
    return definition


def widen(bc, kind, name, holds, what):
    """Add one place at the END of that kind (⛔ anywhere else renumbers); say if it went in."""
    definition = places_on(bc, kind)
    named = [f.name.resolve(bc) for f in definition.fields]
    if name in named:
        return False
    added = Field()
    added.name.value = _a_string(bc, name)
    added.type.value = holds
    definition.fields.append(added)
    definition.nfields.value = len(definition.fields)
    guard(definition.fields[-1].name.resolve(bc) == name,
          "the new place on %s did not take the name it was given" % what)
    return True


def place_on(bc, kind, what):
    """Which numbered place on that carrier is ours, asked by NAME and never counted to."""
    from tools.hlcode import field_by_name
    at, holds = field_by_name(bc, kind, PLACE, what)
    return at, holds


def on_the_filed_thing(bc):
    """Our place on what the game files, and what it holds."""
    return place_on(bc, kind_named(bc, THE_FILED_THING), THE_FILED_THING)


def on_the_registration(bc):
    """Our place on the registration the game makes per authored row."""
    return place_on(bc, the_registration(bc), "the registration")


def install(bc):
    """Widen both carriers by one, and change nothing else in the whole file."""
    holds = kind_named(bc, HOLDS)
    filed = kind_named(bc, THE_FILED_THING)
    registration = the_registration(bc)
    guard(filed != registration, "the two carriers resolved to one kind")
    before = (len(places_on(bc, filed).fields), len(places_on(bc, registration).fields))
    went = [widen(bc, filed, PLACE, holds, THE_FILED_THING),
            widen(bc, registration, PLACE, holds, "the registration")]
    after = (len(places_on(bc, filed).fields), len(places_on(bc, registration).fields))
    return ("WIDEN: %d of 2 carrier(s) gained a `%s` -- %s went from %d place(s) of its own to "
            "%d, and the registration from %d to %d. Nothing reads or writes either yet"
            % (sum(went), PLACE, THE_FILED_THING, before[0], after[0], before[1], after[1]))
