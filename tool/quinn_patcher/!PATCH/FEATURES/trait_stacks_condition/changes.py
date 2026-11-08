"""This tick's changes, in the order the build applies them."""
from standalone import traitstacks

CHANGES = (
    ("Entity_HasTTraitStacks: a condition reads a trait's stacks", traitstacks.install),
)
