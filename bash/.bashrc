[ -f ~/.bashrc.private ] && source ~/.bashrc.private

source ~/.sh_settings
source ~/.sh_aliases
source ~/.sh_functions
source ~/.sh_lazy_load

alias bashrc='$EDITOR ~/.bashrc'

export HISTCONTROL=ignoreboth