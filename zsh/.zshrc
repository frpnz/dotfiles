# =========================
# ~/.zshrc — oh-my-zsh clean
# =========================

[[ -o interactive ]] || return

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

HISTSIZE=5000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE SHARE_HISTORY

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(fc -ln -1 | sed -e "s/[;&|]\s*alert$//")"'

if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
