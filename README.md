# asdf-helm-ls

[![Build](https://github.com/mhagnumdw/asdf-helm-ls/actions/workflows/build.yml/badge.svg)](https://github.com/mhagnumdw/asdf-helm-ls/actions/workflows/build.yml) [![Lint](https://github.com/mhagnumdw/asdf-helm-ls/actions/workflows/lint.yml/badge.svg)](https://github.com/mhagnumdw/asdf-helm-ls/actions/workflows/lint.yml)

[helm-ls](https://github.com/mrjosh/helm-ls) plugin for the [asdf version manager](https://asdf-vm.com).

## Dependencies

- `bash`, `curl`, `git`: generic POSIX utilities.

## Install

```shell
asdf plugin add helm-ls https://github.com/mhagnumdw/asdf-helm-ls.git
```

## Usage

```shell
# Show all installable versions
asdf list all helm-ls

# Install a specific version
asdf install helm-ls latest

# Set a version globally (in ~/.tool-versions)
asdf set --home helm-ls latest

# Now helm_ls commands are available
helm_ls version
```

Check the [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to install & manage versions.

> **Note:** The official binary name is `helm_ls` (with underscore), but it also responds to `helm-ls` (with hyphen).

## Tested on the following platforms

- Linux x86_64
- Linux arm64
- MacOS arm64

## Development

See the [Developer Guide](DEVELOPERS.md).

## License

See [LICENSE](LICENSE).
