#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR"

backup_if_exists() {
  local dst="$1"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$BACKUP_DIR/"
  fi
}

link() {
  local src="$1"
  local dst="$2"

  # se la destinazione esiste, la spostiamo nel backup
  backup_if_exists "$dst"

  # creiamo la cartella padre se serve
  mkdir -p "$(dirname "$dst")"

  ln -s "$src" "$dst"
  echo "OK: $dst -> $src"
}

echo "Backup in: $BACKUP_DIR"
echo

# bash
link "$REPO_DIR/bash/.bashrc" "$HOME/.bashrc"
# opzionale: se vuoi usare bash aliases separati, creane uno in ~/.bash_aliases
# (la tua .bashrc già lo include)

# zsh
link "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"

# tmux
link "$REPO_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# vim
link "$REPO_DIR/vim/.vimrc" "$HOME/.vimrc"
link "$REPO_DIR/vim/.vim" "$HOME/.vim"

echo
echo "✅ Installazione completata."
echo "Suggerito: copia gli override locali:"
echo "  cp $REPO_DIR/bash/.bashrc.local.example ~/.bashrc.local"
echo "  cp $REPO_DIR/zsh/.zshrc.local.example ~/.zshrc.local"
