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
source ~/.sh_settings
source ~/.sh_aliases
source ~/.sh_functions
source ~/.sh_lazy_load

### history
HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt share_history
setopt incappendhistory

### split words into arrays
setopt shwordsplit

# profiler
#zprof
