# Markdown Presentation Template

This repository is a **GitHub Template** for building HTML5 slide decks from Markdown using **Pandoc** and **reveal.js**. A pre‑configured **Dev Container** (via `.devcontainer/`) guarantees that all required tools are available in VS Code or GitHub Codespaces—no local setup hassle.

## Features

| Make target | Description |
|-------------|-------------|
| `make` / `make all` | Build `presentation.html` from every `src/*.md` file |
| `make serve` | Start a local server on <http://localhost:8000> with automatic rebuild & live‑reload |
| `make pdf` | Export a `presentation.pdf` hand‑out via Pandoc‑Beamer |
| `make images` | Render every `src/images/*.plantuml` / `.puml` to `images/*.png` |
| `make clean` | Remove generated HTML, PDF & PNG artefacts |

## Using this template

1. On GitHub click **Use this template → Create a new repository**.
2. Open the repository either in **GitHub Codespaces** *or* locally with **VS Code Dev Containers** (see next section).
3. Write your slides in `src/` (one or more Markdown files).
4. In the integrated terminal run:

   ```bash
   # Build once
   make

   # or edit with live preview
   make serve
   ```

All commands run *inside* the container, ensuring consistent tooling across all machines.

## Dev Container environment

The `.devcontainer/` folder installs:

- **Pandoc ≥ 3.0** (plus LaTeX for PDF export)
- **PlantUML** + **Graphviz** (diagram generation)
- **Python 3** with the *livereload* package
- **entr** (file‑watching)
- **make** and other build essentials

Opening the project in a supported environment automatically builds this container so every tool is ready without touching your host machine.

### Working inside the Dev Container

| Where | How to open |
|-------|-------------|
| **GitHub Codespaces** | On the repo page click **Code → Codespaces → Create codespace**. A browser‑based VS Code session starts in the container. |
| **VS Code (local)** | 1. Install the *Dev Containers* extension.<br>2. Open the Command Palette <kbd>F1</kbd> → **Dev Containers: Open Folder in Container…** and pick the repository folder.<br>3. VS Code builds the container and re‑opens the workspace inside it. |

## Directory structure

```
.
├── Makefile
├── src/                # Markdown slide decks
│   └── images/         # PlantUML sources (*.plantuml | *.puml)
├── images/             # Auto‑generated PNGs from PlantUML
├── styles/             # Optional custom CSS files
├── .devcontainer/      # Dev‑container configuration
└── presentation.html   # Built slideshow (generated)
```

## Customising the presentation

- **CSS** – Drop any `*.css` into `styles/`; the Makefile passes them to Pandoc so they load after the default reveal.js theme.
- **Pandoc options** – Edit `PANDOC_OPTS` and `PANDOC_PDF_OPTS` in the Makefile to tweak slide level, theme, Beamer options, etc.
- **PlantUML style** – Adjust skin parameters in each `.plantuml` file or globally in `~/.plantuml`.

## PDF export

```bash
make pdf   # produces presentation.pdf
```

The default uses the Beamer template; override `PANDOC_PDF_OPTS` if you need other LaTeX options.

## License

Released under the MIT License. See `LICENSE` for details.

Happy presenting!
