"""One file per effect: what a use does."""
# each FAMILY's verb before an effect's editor text: your faction, another, your thing, another's
VERBS = {"pays": ("gain", "gains", "gives you", "gives its owner"),
         "loses": ("lose", "loses", "costs you", "costs its owner"),
         "lands": ("gain", "gains", "gains", "gains"),
         "spawns": ("spawn", "spawns", "spawns for you", "spawns for its owner"),
         "starts": ("start", "starts", "starts for you", "starts for its owner"),
         "completes": ("complete", "completes", "completes for you", "completes for its owner"),
         "fails": ("fail", "fails", "fails for you", "fails for its owner"),
         "raises": ("raise", "raises", "shows you", "shows its owner")}
