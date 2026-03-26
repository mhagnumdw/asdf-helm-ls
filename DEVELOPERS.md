# Developer Guide <!-- omit in toc -->

- [Pre-commit Hooks](#pre-commit-hooks)
  - [Installation](#installation)
  - [Running](#running)
- [Testing in Development](#testing-in-development)
  - [Clone the repository](#clone-the-repository)
  - [Install the local plugin](#install-the-local-plugin)
  - [Testing](#testing)
- [Reverting to Official Plugin](#reverting-to-official-plugin)

## Pre-commit Hooks

This project uses `pre-commit` to maintain code quality, ensuring standards for `.editorconfig`, as well as checking shell scripts using `shellcheck` and formatting them with `shfmt`.

### Installation

Make sure you have the required dependencies installed via `asdf` plugin manager:

```bash
asdf install
```

Install the pre-commit hook into your local git repository:

```bash
pre-commit install
```

### Running

To manually run the checks on all files, use:

```bash
pre-commit run --all-files
```

## Testing in Development

### Clone the repository

If you haven't cloned the project locally yet:

```bash
git clone https://github.com/mhagnumdw/asdf-helm-ls.git
cd asdf-helm-ls
git checkout <branch-name>
```

### Install the local plugin

```bash
asdf plugin remove helm-ls  # before you proceed, you might want to back up ~/.asdf/plugins/helm-ls
asdf plugin add helm-ls "$(pwd)"  # must be the asdf-helm-ls git directory
```

> Note: `asdf plugin add` only copies **committed** files. After making changes, commit them and reinstall the plugin with steps above to sync changes.

### Testing

Test installing a local version:

```bash
rm -rf ~/.asdf/installs/helm-ls/0.5.0
asdf install helm-ls 0.5.0
~/.asdf/installs/helm-ls/0.5.0/bin/helm_ls --version
```

## Reverting to Official Plugin

To remove your local version and use the official one:

```bash
asdf plugin remove helm-ls
asdf plugin add helm-ls https://github.com/mhagnumdw/asdf-helm-ls.git
```
