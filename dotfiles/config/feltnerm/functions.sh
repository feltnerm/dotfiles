#!/usr/bin/env bash

# functions

# tmux
## attach to a tmux session via arg, or current directory
function tmuxa() {
    if [[ -z "$1" ]]; then
        tmux attach-session -t $(basename $(pwd))
    else
        tmux attach-session -t "$1"
    fi
}

## create a new tmux session via arg, or current directory
function tmuxn() {
    if [[ -z "$1" ]]; then
        tmux new-session -s $(basename $(pwd))
    else
        tmux new-session -s "$1"
    fi
}

# ssh and auth
function add_keys() {
    local login KEYS keychain_cmd
    login=$1
    KEYS=""
    keychain_cmd="keychain --eval --agents ssh "

    for i in ${HOME}/.ssh/* ; do
        if [[ -r $i.pub && -r $i ]]; then
            [[ -n $KEYS ]] && KEYS=$KEYS" "$i
            [[ -z $KEYS ]] && KEYS=$i
        fi
    done

    [[ -n $login ]] && keychain_cmd="$keychain_cmd --stop others $KEYS"
    [[ -z $login ]] && keychain_cmd="$keychain_cmd --quiet -Q $KEYS"
    echo "$keychain_cmd"
}

function kubefmt() {
    local position

    if [ -z "$1" ]
    then
        position=1
    else
        position="$1"
    fi

    tail -n +2 | cut -f"$position" -d' ' < /dev/stdin
}

function nlsp() {
    tr '\r\n' ' ' < /dev/stdin
}

function axargs () {
        local expandalias
        if [[ $(which $1) =~ "alias" ]]; then
                expandalias=$(builtin alias $1)
                expandalias="${${(s.'.)expandalias}[2]}"
        else
                expandalias="$1"
        fi
        command xargs ${(z)expandalias} "${(z)@[2,-1]}"
}

# source <(elog --completion zsh)

function _source_if_file_exists() {
    local file="$1"
    ([ -e "$file" ] || [ -f "$file" ]) && . "$file"
}

# Check existence of a program
function _which() {
    command -v "$1" > /dev/null 2>&1;
}

# Are we sudo?
function _root() {
    [ "$EUID" = "0" ]
}

function _is_osx() {
    [ "$(uname)" = "Darwin" ]
}

function _is_linux() {
    [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
}

# Fun stuff
function greet() {
    fortune | cowsay -W 80
    #math -s0 (random) \% 2 > /dev/null && fortune | cowsay -W 80 || fortune | cowthink -W 80
}

function gifify() {
    if [[ -n "$1" ]]; then
        if [[ $2 == '--good' ]]; then
            ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
            time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
            rm out-static*.png
        else
            ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
        fi
    else
        echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
    fi
}

function screensaver() {
    while true; do
        clear && \
        archey && \
        oracow && \
        sleep 30
    done
}

# todo(@feltnerm): fix keys on login ??
# if [[ -n $LOGIN ]]; then
#     eval `add_keys 1`
#     src
# else
#     eval $(`add_keys`)
# 	export SSH_AUTH_SOCK=''
# 	eval $(keychain --eval --quiet)
# fi
### /profiler
## turn off tracing
## unsetopt xtrace
## restore stderr to the value saved in FD 3
#exec 2>&3 3>&-


