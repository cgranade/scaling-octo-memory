# Quantum Computing Research Project Template #

This template repository contains everything needed to quickly start working on a research project in quantum computing within a Visual Studio Code remote development container (*a.k.a.* devcontainer).
The devcontainer in this repository installs a full LaTeX compiler toolchain, as well as the .NET Core SDK and the Quantum Development Kit, making it easy to use Q# in your reproducible research papers.

## Getting Started ##

**TODO**

## Folder Layout in Detail ##

- `.devcontainer`: Metadata needed by Visual Studio Code to create your reproducible research environment.
- `.vscode`: Settings and preferences for Visual Studio Code.
- `fig`: Figures and images for your manuscript.
- `src`: Q# source code and classical host programs for your research project.
- `tex`: LaTeX source code for your research manuscript.

## Publishing to arXiv ##

When you're ready to publish your work to arXiv, use the [`Export-ArXiv.ps1`](./Export-ArXiv.ps1) script to prepare a single ZIP file that you can upload to arxiv.org, and that includes all the relevant source code for your project.

Since the arXiv has a few restrictions on folder layouts, this export script will automatically add commands to your LaTeX file to locate your source code and figures in arXiv's preferred folder layout.
This is done using the `RenewCommands` part of the arXiv manifest in `Export-ArXiv.ps1`.
