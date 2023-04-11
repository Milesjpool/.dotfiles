#!/bin/zsh

set -o emacs

alias rezsh='source ~/.zshrc'
alias zshrc='$EDITOR ~/.zshrc'

# profiler
#zmodload zsh/zprof

### sources
source ~/.sh_settings
source ~/.sh_aliases
source ~/.sh_functions
source ~/.sh_lazy_load

### Antigen
source $DOTFILES_PATH/antigen/antigen.zsh
antigen init ~/.antigenrc

### oh-my-zsh plugins pre-reqs
export ZSH_CACHE_DIR=~/.zsh/cache
mkdir -p $ZSH_CACHE_DIR
autoload -Uz compinit
compinit

### history
HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_SPACE
setopt appendhistory
setopt share_history
setopt incappendhistory

### split words into arrays
setopt shwordsplit

### include dotfiles with asterisk
setopt globdots

### Styling
PURE_PROMPT_SYMBOL=👾

# profiler
#zprof
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
