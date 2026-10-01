---
name: easyeda2kicad
description: Import LCSC or EasyEDA components into project-local KiCad libraries with easyeda2kicad. Use when adding or updating symbols, footprints, or 3D models from an LCSC C-number.
---

# EasyEDA2KiCad

Use the installed `easyeda2kicad` CLI and its `--help`. It imports an LCSC `C` number as a KiCad symbol, footprint, and/or 3D model.

- Reuse the project's existing library layout; otherwise prefer a project-local library with project-relative 3D paths.
- If only an MPN is known, use the `pcbparts` MCP to resolve the exact LCSC part and package.
- Do not overwrite existing library content unless replacement is intended.
- Treat generated assets as unverified. Before use, compare pin numbers, pad mapping, package variant, dimensions, and pin-one orientation with the manufacturer's datasheet.
