# Markdown Presentation Template

This repository is a **GitHub Template** for creating **reveal.js** presentations from Markdown using **mkslides**. It is designed to work seamlessly with **VSCode Dev Containers** or **GitHub Codespaces**, requiring no additional setup beyond Docker and the Dev Container extension.

## Features

- **No local setup required**: All tools are pre-installed in the Dev Container.
- **Offline PlantUML support**: Render PlantUML diagrams locally without an internet connection.

## Using this template

1. On GitHub, click **Use this template → Create a new repository**.
2. Open the repository in **GitHub Codespaces** or locally in **VSCode** with the **Dev Containers** extension (see instructions below).
3. Write your slides in the `docs/` folder (Markdown files).
4. Use the following commands to build and preview your presentation:

   ```bash
   # Build the presentation in the 'out' folder
   mkslides build -o out docs/01.md

   # Serve with live preview
   mkslides serve docs/01.md
   ```

   The live preview will be available at <http://localhost:8000>.

## Dev Container environment

The `.devcontainer/` folder configures a containerized development environment with the following tools:

- **Python 3** with the `mkslides` package for building presentations.
- **PlantUML** and **Graphviz** for rendering diagrams.

### Working inside the Dev Container

| Environment           | How to open                                                                                                                                                               |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **GitHub Codespaces** | On the repository page, click **Code → Codespaces → Create codespace**.                                                                                                   |
| **VSCode (local)**    | 1. Install the *Dev Containers* extension.<br>2. Open the Command Palette <kbd>F1</kbd> → **Dev Containers: Open Workspace in Container…**. |

Once the container is built, all tools will be ready to use.

## Learn more

For detailed usage instructions, refer to the [mkslides documentation](https://github.com/MartenBE/mkslides).

## License

Released under the MIT License. See `LICENSE` for details.

Happy presenting!
