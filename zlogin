for i in ${HOME}/.ssh/* ; do
    eval $(keychain --eval --agents ssh -Q --quiet $i)
done

CMD=""
if _which fortune; then
    CMD+="fortune | "
    if _which cowsay; then
        CMD+="cowsay | "
        if which lolcat; then
            CMD+="lolcat"
        fi
    fi
fi
eval $CMD
