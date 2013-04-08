#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
# env shared between bash and zsh
if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi
