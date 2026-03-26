#!/usr/bin/env bash

if ! shfmt -d -s "$@"; then
  echo -e "\n\n💡 TIP: shfmt (Shell Format) found formatting issues."
  echo -e "To automatically fix all scripts, run in your terminal:\n"
  echo -e "    shfmt -w -s .\n"
  exit 1
fi
