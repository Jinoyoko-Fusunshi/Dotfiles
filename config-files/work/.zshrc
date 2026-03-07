# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnosta" # set by `omz`

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"

plugins=(git z sudo history-substring-search systemd)

source $ZSH/oh-my-zsh.sh

export EDITOR='code'

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(ssh-agent -s) > /dev/null
