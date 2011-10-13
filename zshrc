# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux django extract gem github pip python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
## Options
setopt correctall
setopt autocd
setopt auto_resume

## Extended globbing
setopt extendedglob

## History
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

## Self Settings
export EDITOR="gvim"
export PAGER="less"
export SHELL="/bin/zsh"
export BROWSER="chromium"
export PATH="${PATH}:${HOME}/bin"
export GREP_COLOR="1;33"
export PYTHONSTARTUP=~/.pystartup

## Aliasi
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -lh"
alias .='cd ../'
alias ..='cd ../..'
alias ...='cd ../../../'
alias ....='cd ../../../../'

alias emacs='emacs -nw'

## Python stuff
alias py='python'
alias ipy='ipython'
alias bpy='bpython'

## Mac Only Stuff
#alias fndr='open .'
#alias rmtrsh='rm -rf ~/.Trash/*'

## Safeness!
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

## Git
alias g='git'

## Pacman
alias pacman='pacman-color'

## Productivity Aliai
