# Project outline — Dune: Spice Wars Mod Toolkit

This document describes high-level goals, milestones, and the planned structure for the `dsw_mod` project.

Vision
- Provide a small toolkit to author, validate, and package mods for Dune: Spice Wars.

Milestones
- 0.1: Project skeleton (this commit) — core API, CLI, tests, docs.
- 0.2: Exporters for game data formats (e.g., XML/TOML exporters).
- 0.3: Asset pipeline (images, sounds) and packaging into a mod archive.
- 0.4: Test suite with fixtures for real mod examples and CI integration.

Repository layout

- `pyproject.toml` — project metadata and build config
- `requirements.txt` — development runtime deps
- `src/dsw_mod/` — package source
  - `core.py` — core model and validators
  - `cli.py` — lightweight command line
- `tests/` — pytest tests
- `project_outline.md` — this file
- `COPILOT_INSTRUCTIONS.md` — guidance for automated edits

Next steps
- Wire a simple build command and add a GitHub Actions workflow.
- Add a sample mod directory used by tests or examples.
