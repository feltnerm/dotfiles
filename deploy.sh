#!/bin/sh
#
# deploy
#
# Symlink dotfiles in the user's home directory

BASE = $HOME
DOTFILE_DIR = $BASE/dotfiles

if [ !  -d "$DOTFILE_DIR" ]; then
    # download using git
    cd $HOME
    git clone https://feltnerm@github.com/feltnerm/dotfiles.git
    cd $DOTFILE_DIR
    git branch $HOST
    git checkout $HOST
fi

for f in $DOTFILE_DIR
do
    ln -s $f $BASE/.$f
done

