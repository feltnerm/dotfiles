
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

if _which cdf; then
    alias df="cdf"
fi

if _which sp-sc; then
    function sop()
    {
        sp-sc $1 3908 8908 > /dev/null &
        sleep 3;
        mplayer http://localhost:8908/tv.asf;
        killall sp-sc;
    }
fi

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

function aa_power_settings ()
{ 
  sudo bash -c '
    for i in `find /sys/devices -name "bMaxPower"`;
    do
        for ii in `find $i -type f`;
        do
            bd=`dirname $ii`;
            busnum=`cat $bd/busnum`;
            devnum=`cat $bd/devnum`;
            title=`lsusb -s $busnum:$devnum`;
            echo -e "\n\n+++ $title\n  -$bd\n  -$ii";
            for ff in `find $bd/power -type f ! -empty 2>/dev/null`;
            do
                v=`cat $ff 2>/dev/null|tr -d "\n"`;
                [[ ${#v} -gt 0 ]] && echo -e " `basename $ff`=$v";
                v=;
            done | sort -g;
        done;
    done;
    echo -e "\n\n\n+++ Kernel Modules\n";
    for m in `command lspci -k|sed -n "/in use:/s,^.*: ,,p"|sort -u`;
    do
        echo "+ $m";
        systool -v -m $m 2> /dev/null | sed -n "/Parameters:/,/^$/p";
    done
  ';
}

eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/{id_rsa_github,id_rsa_io_uwplatt,id_rsa_saraswati})
