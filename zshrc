# debugger
#source ~/bin/zshdb/dbg-trace.sh
# start debgguing with:
# _Dbg_debugger

# env shared between bash and zsh
[ -f "$HOME/.profile" ] && [ -n "$PS1" ] && source "$HOME/.profile"

# vim. +1 to dexterity
bindkey -v

ZSH=$HOME/.oh-my-zsh
#ZSH_THEME=kphoen
DISABLE_UNTRACKED_FILES_DIRTY="true"
COMPLETION_WAITING_DOTS=true
CASE_SENSITIVE="true"
DISABLE_CORRECTION="true"
PLUGINS=(git)

[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

## Options
setopt correctall
setopt autocd
setopt auto_resume
setopt extendedglob

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source /Users/mfeltner/.travis/travis.sh
