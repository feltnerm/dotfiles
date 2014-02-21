### profiler
## set the trace prompt to include seconds, nanoseconds, script name and line number
#PS4='+$(date "+%s:%N") %N:%i> '
## save file stderr to file descriptor 3 and redirect stderr (including trace
## output) to a file with the script's PID as an extension
#exec 3>&2 2>/tmp/startlog.$$
## set options to turn on tracing and expansion of commands contained in the prompt
#setopt xtrace prompt_subst

## debugger
#source ~/bin/zshdb/dbg-trace.sh
# start debgguing with:
# _Dbg_debugger


# vim. +1 to dexterity
bindkey -v

ZSH=$HOME/.oh-my-zsh
#ZSH_THEME=kphoen
DISABLE_UNTRACKED_FILES_DIRTY="true"
COMPLETION_WAITING_DOTS=true
CASE_SENSITIVE="true"
DISABLE_CORRECTION="true"
PLUGINS=(git-extras git-flow gnu-utils nyan tmux vi-mode virtualenvwrapper z tmuxinator)

# env shared between bash and zsh
[ -f "$HOME/.profile" ] && [ -n "$PS1" ] && source "$HOME/.profile"


## Options
setopt correctall
setopt autocd
setopt auto_resume
setopt extendedglob

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source /Users/mfeltner/.travis/travis.sh

[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

### /profiler
## turn off tracing
## unsetopt xtrace
## restore stderr to the value saved in FD 3
#exec 2>&3 3>&-
