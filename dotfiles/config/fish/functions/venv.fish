#!/usr/bin/env bash

function venv
    local venv_name=$1
    [[ -z $venv_name ]] && venv_name=$(basename `pwd`)

    local activate="$WORKON_HOME/$venv_name/bin/activate"
    local default_virtualenvs="~/.virtualenvs/$venv_name/bin/activate"
    if [ -e "$activate" ] ; then
        source "$activate"
    elif [ -e "$default_virtualenvs" ] ; then
        source "$default_virtualenvs"
    else
        echo "Error: Not found: $activate"
    fi
end
