# Note di review (dai file caricati)

## Bash
- La `.bashrc` è pulita e modulare: carica `~/.bash_aliases` e `~/.bashrc.local`.
- OK: guardia non-interactive (`case $- in *i* ...)`).

Suggerimento (opzionale):
- Se vuoi evitare che `pyenv init` venga eseguito se non presente, è già gestito correttamente.

## Zsh
- Richiede oh-my-zsh in `~/.oh-my-zsh`.
- Carica `~/.zshrc.local` se esiste (bene).
- `pyenv init - zsh` ok.

Suggerimento (opzionale):
- Se usi spesso macchine senza oh-my-zsh, aggiungi una guardia:
  `[[ -d "$ZSH" ]] && source "$ZSH/oh-my-zsh.sh"`.

## Vim
- Config minimale, `vim-plug` con auto-install tramite `curl`.
- NERDTree sempre aperto con root corretto (come da README).

Suggerimenti (opzionali):
- Se vuoi essere “zero download”, rimuovi l’auto-install e committa `autoload/plug.vim`
  (oppure installalo manualmente una volta).
- Consigliato non versionare `vim/.vim/plugged/` (già in `.gitignore`).

## Tmux
- Prefix su `C-a` ok, `default-terminal` ok.
- Copy-mode vi e mouse sono commentati.

Suggerimenti (opzionali):
- Se vuoi copy-mode in stile vim:
  `setw -g mode-keys vi`
- Se vuoi mouse:
  `set -g mouse on`
