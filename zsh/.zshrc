#!/bin/zsh

set -o emacs

alias rezsh='source ~/.zshrc'
alias zshrc='$EDITOR ~/.zshrc'
alias x='read -q -t 5 -s "?Exit? " && exit'

# profiler
#zmodload zsh/zprof

ANTIGEN_PATH=~/.dotfiles/antigen
source $ANTIGEN_PATH/antigen.zsh
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

BREW_DIR="/opt/homebrew/bin"
[ -d "$BREW_DIR" ] && eval "$($BREW_DIR/brew shellenv)"


export PATH="$HOME/.pyenv/shims:$PATH"
[ -x "$(command -v pyenv)" ] && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"
[ -x "$(command -v fnm)" ] && eval "$(fnm env)"

# profiler
#zprof
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
