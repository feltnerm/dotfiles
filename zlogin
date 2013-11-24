for i in ${HOME}/.ssh/* ; do
    [ -r $i.pub ] && eval $(keychain --eval --agents ssh -Q --quiet $i)
done

if [[ -n $(whence _which) ]]; then
    if _which fortune; then
        if _which cowsay; then
            if _which lolcat; then
                fortune | cowsay | lolcat
            fi
        fi
    fi
fi
