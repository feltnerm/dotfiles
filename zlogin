for i in ${HOME}/.ssh/* ; do
    [ -r $i.pub ] && eval $(keychain --eval --agents ssh -Q --quiet $i)
done
