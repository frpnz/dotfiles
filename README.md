# dotfiles (Ubuntu)

Repo di configurazione per shell (bash + zsh), tmux e vim con installazione **senza dipendenze** (symlink + backup).

## Prerequisiti (Ubuntu)

Questi dotfiles **non installano pacchetti automaticamente**.

Installare manualmente:

```bash
sudo apt update
sudo apt install -y \
  vim \
  tmux \
  git \
  curl
```

## Installazione

```bash
git clone git@github.com:frpnz/dotfiles.git
cd ~/dotfiles
./install.sh
```

### Cosa fa `install.sh`
- crea un backup timestampato di eventuali file esistenti in `~/.dotfiles_backup/<timestamp>/`
- crea symlink verso i file del repo
- non sovrascrive i tuoi override locali: usa `~/.bashrc.local` e `~/.zshrc.local`

## Override locali (consigliato)

Copia gli esempi e personalizza:

```bash
cp bash/.bashrc.local.example ~/.bashrc.local
cp zsh/.zshrc.local.example ~/.zshrc.local
```

## Note

- `.zshrc` richiede **oh-my-zsh** in `~/.oh-my-zsh`.
- La config Vim usa **vim-plug**: se `plug.vim` manca, prova a scaricarlo con `curl`.
  Se preferisci evitare download automatici, vedi `vim/.vimrc` (sezione vim-plug).

## Disinstallazione

```bash
./uninstall.sh
```

> `uninstall.sh` rimuove i symlink creati (non ripristina automaticamente i backup).
