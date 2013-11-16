# debugger
#source ~/bin/zshdb/dbg-trace.sh
# start debgguing with:
# _Dbg_debugger

# env shared between bash and zsh
if [[ -f "$HOME/.profile" && -n "$PS1" ]]; then
    source "$HOME/.profile"
fi

# vim. +1 to dexterity
bindkey -v

ZSH=$HOME/.oh-my-zsh
#ZSH_THEME=kphoen
DISABLE_UNTRACKED_FILES_DIRTY="true"
COMPLETION_WAITING_DOTS=true
CASE_SENSITIVE="true"
DISABLE_CORRECTION="true"
PLUGINS=(git)

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    source "$ZSH/oh-my-zsh.sh"
fi

## Options
setopt correctall
setopt autocd
setopt auto_resume
setopt extendedglob

# added by travis gem
source /Users/mfeltner/.travis/travis.sh
