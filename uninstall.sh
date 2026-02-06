#!/usr/bin/env bash
set -euo pipefail

remove_if_symlink() {
  local path="$1"
  if [ -L "$path" ]; then
    rm -f "$path"
    echo "Rimosso symlink: $path"
  else
    echo "Skip (non è symlink): $path"
  fi
}

remove_if_symlink "$HOME/.bashrc"
remove_if_symlink "$HOME/.zshrc"
remove_if_symlink "$HOME/.tmux.conf"
remove_if_symlink "$HOME/.vimrc"
remove_if_symlink "$HOME/.vim"

echo "✅ Done."
