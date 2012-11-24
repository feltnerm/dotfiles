
_which() {
    which "$1" &>/dev/null;
}

_root() {
    [ "$EUID" = "0" ]
}

# ruby
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
if [ -d "$HOME/.gem" ]; then
    export GEM_HOME=$HOME/.gem
    export PATH=$PATH:$GEM_HOME/bin
fi
if [ -d "$HOME/.rvm" ]; then
    export PATH=$PATH:$HOME/.rvm/bin
fi

# node
if [ -d "$HOME/node_modules" ]; then
    export PATH=$PATH:$HOME/node_modules/.bin
fi

# python
if [ -d "$HOME/.virtualenvs" ]; then
    export WORKON_HOME=$HOME/.virtualenvs
fi
if [ -d "$HOME/.pystartup" ]; then
    export PYTHONSTARTUP=~/.pystartup
fi
if [ -d "$HOME/projects" ]; then
    export PROJECT_HOME=$HOME/projects
fi
if _which virtualenvwrapper_lazy.sh; then
    source /usr/bin/virtualenvwrapper_lazy.sh
fi

# local bin
if [ -d "$HOME/bin" ]; then
    export PATH=$PATH:$HOME/bin
fi

# editor
if _which vim; then
    export EDITOR="$(which vim)"
    export VISUAL="$EDITOR"
fi

# pager
if _which less; then
    export PAGER=less

    export LESS="-F -X -R"
    export LESS_TERMCAP_mb=$'\E[01;31m'
    export LESS_TERMCAP_md=$'\E[01;31m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;44;33m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[01;32m'
fi

# term
if _which urxvtc; then
    export TERM="rxvt-unicode"
fi

# browser
if _which chromium; then
    export BROWSER="$(which chromium)"
fi

# shell
if _which zsh; then
    export SHELL="$(which zsh)"
fi

# grep
alias grep='grep --color=auto'
export GREP_COLOR="1;33"

# aliases
alias ls="ls -hF --color"
alias ls="ls --color=auto"
alias ll="ls -lh"
#alias .="cd ../"
#alias ..="cd ../../"
#alias ...="cd ../../../"
#alias ....="cd ../../../../"
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vimwiki="vim -c VimwikiIndex"
alias vimdiary="vim -c VimiwikiDiaryIndex"
alias ndiary="vim -c VimwikiMakeDiaryNote"

alias rmpyc='find . -name \*.pyc -exec rm -v {} \;'
if _which bc; then
    alias bc='bc -ql'
fi

if _which lsof; then
    alias ports='lsof -i -P -sTCP:LISTEN'
fi

if _root; then
    if _which pacman; then
        alias pacman-orphans='pacman -Qtdq && pacman -Rs $(pacman -Qtdq)'
    fi
fi

if _which cloc; then
    alias cloc="cloc --exclude-dir=.git,.hg"
fi

if _which pacman-color; then
    alias pacman="pacman-color"
fi

if _which packer-color; then
    alias packer="packer-color"
fi

