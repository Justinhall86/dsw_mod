"""Core functionality for building and validating a mod project."""
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Any


@dataclass
class ModProject:
    """Represents a mod project for Dune: Spice Wars.

    Attributes:
        root: Path to the project root
        metadata: dictionary with mod metadata (name, version, author)
    """

    root: Path
    metadata: Dict[str, Any]

    def validate(self) -> bool:
        """Perform lightweight validation of the mod metadata and structure.

        Returns True if the project looks valid, otherwise False.
        """
        required = ["name", "version", "author"]
        for k in required:
            if k not in self.metadata or not self.metadata[k]:
                return False

        # example: check for an assets folder
        assets = self.root / "assets"
        if not assets.exists():
            return False

        return True

    def build_manifest(self) -> Dict[str, Any]:
        """Return a manifest dict that could be exported to the game's format."""
        return {
            "mod": {
                "name": self.metadata.get("name"),
                "version": self.metadata.get("version"),
                "author": self.metadata.get("author"),
            }
        }
