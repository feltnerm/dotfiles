# env shared between bash and zsh
if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

# vim. +1 to dexterity
bindkey -v

ZSH=$HOME/.oh-my-zsh
ZSH_THEME=kphoen
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

## History
export HISTSIZE=25000
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# added by travis gem
source /Users/mfeltner/.travis/travis.sh
