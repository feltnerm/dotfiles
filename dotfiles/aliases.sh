#!/usr/bin/env bash

# aliases
alias brewski=brew update && brew upgrade && brew cleanup && brew cask cleanup && brew doctor
alias rmpyc="find . -name \*.pyc -exec rm -v {} \;"
# Recursively delete `.DS_Store` files
alias rmdstore="find . -name \*.DS_Store -exec rm -v {} \;"
alias clean="rmpyc && rmdstore"
alias cp="cp -i"
alias cpv="rsync -pogr --progress"
alias cpp="rsync -WavP --human-readable --progress $1 $2"
alias mv="mv -i"
alias rm="rm -i"
alias oracow="fortune | cowsay | lolcat"
alias ls="exa"
alias l="ls"
alias ll="ls -l"
alias lh="ls -h"
alias la="ls -la"
alias lad="ls -lah"
alias lsd="ls -l | grep '^d'"
# if _which k; then
#     alias lsk "k"
# fi
# Shortcuts
alias g="git"
alias v="vim"
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcr="docker-compose down; and docker-compose up"

alias cat="bat"
alias weather="curl wttr.in"

# count lines of code
alias cloc="cloc --exclude-dir=.git,.hg"

# `cat` with pretty colors
alias hilite="pygmentize -O style=monokai -f console256 -g"

# OS stuff
alias ports="lsof -i -P -sTCP:LISTEN"
alias pm="ps ax | grep -v grep | grep $@"
alias ssh-keygen2="ssh-keygen -t rsa -C (whoami)@(hostname)-(date -u)"

# df < pydf < cdf
# if _which pydf; then
#     alias df='pydf'
# else
#     if _which cdf; then
#         alias df='cdf'
#     fi
# fi

