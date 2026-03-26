#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/mrjosh/helm-ls"
TOOL_NAME="helm-ls"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -E -o 'refs/tags/v[0-9].*' |
    grep -E -o '[0-9]+\.[0-9]+\.[0-9]+'
}

get_os() {
  local os
  os=$(uname -s | tr '[:upper:]' '[:lower:]')

  case "$os" in
  linux) echo "linux" ;;
  darwin) echo "darwin" ;;
  *) fail "Unsupported OS: $os. Only linux and darwin (macOS) are supported." ;;
  esac
}

get_arch() {
  local arch
  arch=$(uname -m)

  case "$arch" in
  x86_64) echo "amd64" ;;
  aarch64 | arm64) echo "arm64" ;;
  armv7l | armv6l) echo "arm" ;;
  *) fail "Unsupported architecture: $arch" ;;
  esac
}

get_download_url() {
  local version="$1"
  local os arch
  os=$(get_os)
  arch=$(get_arch)

  echo "$GH_REPO/releases/download/v${version}/helm_ls_${os}_${arch}"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    local bin_install_path="$install_path/bin"
    local binary_path="$bin_install_path/helm_ls"
    local download_url

    mkdir -p "$bin_install_path"

    download_url=$(get_download_url "$version")
    echo "* Downloading $TOOL_NAME release $version from $download_url..."
    curl "${curl_opts[@]}" -o "$binary_path" "$download_url" || fail "Could not download $download_url"

    chmod +x "$binary_path"
    ln -s helm_ls "$bin_install_path/helm-ls"

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "${install_path:?}"
    fail "An error occurred while installing $TOOL_NAME $version."
  )
}
