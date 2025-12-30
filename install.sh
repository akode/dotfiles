#!/bin/bash

set -euo pipefail

if command -v zsh >/dev/null; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi

if ! command -v mise >/dev/null; then
  sh -c "$(curl https://mise.run/zsh | sh)"
fi

if ! command -v chezmoi >/dev/null; then
  sh -c "$(curl -fsLs get.chezmoi.io)" -- init --apply akode
fi

if [ ! -d "$HOME/.zsh" ]; then
  mkdir -p "$HOME/.zsh"
fi
