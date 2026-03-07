# hyprland variables
XDG_CONFIG_HOME="$HOME/.config/hypr"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="jinos" # set by `omz`

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"

plugins=(git z sudo history-substring-search zsh-autosuggestions zsh-syntax-highlighting fzf-tab systemd)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

[ -s "$HOME/.bun/_bun" ] && source "/$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(ssh-agent -s) > /dev/null
