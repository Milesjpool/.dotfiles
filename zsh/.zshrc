#!/bin/zsh

set -o emacs

alias rezsh='source ~/.zshrc'
alias zshrc='$EDITOR ~/.zshrc'
alias x='read -q -t 5 -s "?Exit? " && exit'

# profiler
#zmodload zsh/zprof

ANTIGEN_PATH=~/.dotfiles
source $ANTIGEN_PATH/antigen/antigen.zsh
antigen init ~/.antigenrc

### oh-my-zsh plugins pre-reqs
export ZSH_CACHE_DIR=~/.zsh/cache
mkdir -p $ZSH_CACHE_DIR
autoload -Uz compinit
compinit

### sources
source ~/.sh_aliases
source ~/.sh_functions
source ~/.sh_settings

### history
HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt share_history
setopt incappendhistory

### split words into arrays
setopt shwordsplit

### lazy loading

kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}

kops() {
    if ! type __start_kops >/dev/null 2>&1; then
        source <(command kops completion zsh)
    fi

    command kops "$@"
}

nvm() {
  NVM_DIR="$HOME/.nvm"
  if [[ -d "$NVM_DIR" ]]; then
    export NVM_DIR

    source "${NVM_DIR}/nvm.sh"
    if [[ -e ~/.nvm/alias/default ]]; then
      PATH="${PATH}:${HOME}.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
    fi

    nvm "$@"
  else
    echo "nvm is not installed" >&2
    return 1
  fi
}

command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"
command -v fnm >/dev/null 2>&1 && eval "$(fnm env)"

# profiler
#zprof
