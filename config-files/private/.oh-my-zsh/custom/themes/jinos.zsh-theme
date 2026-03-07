autoload -Uz add-zsh-hook

function update_prompt() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    GIT_COMMIT=$(git rev-parse --short HEAD)
    GIT_REPO=$(basename $(git rev-parse --show-toplevel))

    GIT_NEW_FILES=$(git ls-files --others --exclude-standard | wc -l)
    GIT_DELETED_FILES=$(git diff --name-only --diff-filter=D | wc -l)
    GIT_CHANGES=$(git diff --name-only --diff-filter=M | wc -l)

    GIT_DISPLAY="%F{208}%K{208}%F{white} $GIT_REPO $GIT_BRANCH"
  else
    GIT_DISPLAY=""
  fi

  export PROMPT="%K{124}%F{white}  %n 󰣇 $GIT_DISPLAY%F{237} %K{237}%F{white}  %~ %k%F{237}%{$reset_color%} "
}

add-zsh-hook precmd update_prompt

# ZSH Styles
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' switch-group ',' '.'