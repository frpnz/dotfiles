# vim-config (NERDTree always-on, rooted correctly)

Configurazione Vim minimale e stabile con **NERDTree sempre attivo** e
radicato automaticamente nella directory del file aperto.

Leader: `,`

---

## Fix importante: root di NERDTree

In alcune combinazioni di autocmd, `NERDTree` aperto “prima” non cambiava root.
Questa versione apre NERDTree **una sola volta** al `VimEnter`:

- se avvii Vim con un file (`argc() > 0`) → `NERDTree <dir del file>`
- altrimenti → `NERDTree` nella directory corrente (`$PWD`)

Esempio:
```bash
vim .ssh/id_rsa.pub
```
NERDTree si aprirà in `~/.ssh/` (non in `~`).

---

## Plugin inclusi
- **NERDTree**
- **NERDCommenter**
- **Iceberg** (colorscheme)

Gestione plugin: **vim-plug** (auto-installante).

---

## Struttura del pacchetto

```
~/.vim/
├── autoload/
│   └── plug.vim        # vim-plug (scaricato automaticamente se manca)
└── plugged/
    ├── nerdtree/
    ├── nerdcommenter/
    └── iceberg.vim/

~/.vimrc
```

---

## Navigazione finestre

- `Tab` / `Shift-Tab` → finestra successiva / precedente
- `Ctrl-h/j/k/l` → muovi tra finestre

---

## Utility

- `jk` → Esc (insert)
- `<F5>` → rimuove trailing spaces
- `,h` → toggle highlight ricerca
- `,r` → toggle relative numbers

---

## NERDTree: chiusura manuale

Nessun mapping di toggle.
- chiudi con `q` nel pannello
- oppure `:NERDTreeClose`

Se resta solo NERDTree aperto → Vim esce (standard).

---

_Revision: 2026-02-05_
