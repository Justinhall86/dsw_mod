"""Lookups by name over a list of the file the build cuts back and grows at its end only."""


class Index:
    """Each name and its (place, item) entries in list order, moved only where the list changed."""

    def __init__(self, names_of):
        self.names_of, self.each, self.by_name = names_of, [], {}

    def current(self, items):
        """The lookup for `items` as it is now: what was cut off dropped, what was added read."""
        keep = min(len(self.each), len(items))
        # ⛔ BY IDENTITY, NOT BY COUNT: a list cut back and grown again to its old length changed
        while keep and self.each[keep - 1][0] is not items[keep - 1]:
            keep -= 1
        for item, names in reversed(self.each[keep:]):
            for called in names:
                self.by_name[called].pop()
                if not self.by_name[called]:
                    del self.by_name[called]
        del self.each[keep:]
        for at in range(keep, len(items)):
            names = self.names_of(items[at])
            self.each.append((items[at], names))
            for called in names:
                self.by_name.setdefault(called, []).append((at, items[at]))
        return self.by_name


def on(bc, slot, names_of):
    """The one index kept on the file under `slot`, made the first time it is asked."""
    made = getattr(bc, slot, None)
    if made is None:
        made = Index(names_of)
        setattr(bc, slot, made)
    return made
