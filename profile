
_which() {
    which "$1" &>/dev/null;
}

_root() {
    [ "$EUID" = "0" ]
}

# local bin
# PATH
if [ -d "$HOME/bin" ]; then
    export PATH=$PATH:$HOME/bin
fi

# EDITOR
if _which vim; then
    export EDITOR="$(which vim)"
    export VISUAL="$EDITOR"
fi

# SHELL
if _which zsh; then
    export SHELL="$(which zsh)"
fi

export GREP_COLOR="1;33"
# PAGER
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

if [[ "$(hostname -s)" == "saraswati" ]] then
    export PATH=$PATH:$HOME/admin
    eval $(keychain --eval --agents ssh -Q --quiet /home/mark/.ssh/{id_rsa_github,})
fi

if [[ "$(hostname -s)" == "pioneerpete" ]] then

    # TERM
    if _which urxvtc; then
        export TERM="rxvt-unicode"
    fi

    # BROWSER 
    if _which chromium; then
        export BROWSER="$(which chromium)"
    fi
    
    # Pacman
    if _which pacman; then
        alias pacman-orphans='pacman -Qtdq && pacman -Rs $(pacman -Qtdq)'
    fi

    if _which pacman-color; then
        alias pacman="pacman-color"
    fi

    if _which packer-color; then
        alias packer="packer-color"
    fi

    if _root; then
       alias pacman-clean='pacman -Rs $(pacman -Qtdq)' 
    fi

    # sopcast
    if _which sp-sc; then
        function sop()
        {
            sp-sc $1 3908 8908 > /dev/null &
            sleep 3;
            mplayer http://localhost:8908/tv.asf;
            killall sp-sc;
        }
    fi

    # Keychain
    eval $(keychain --eval --agents ssh -Q --quiet /home/mark/.ssh/{id_rsa_github,id_rsa_io_uwplatt,id_rsa_saraswati,})
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


## DEVELOPMENT
##############

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

source ~/.aliases
