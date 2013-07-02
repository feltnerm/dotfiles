for i in ${HOME}/.ssh/* ; do
    if [[ -r $i.pub ]]; then
        eval $(keychain --eval --agents ssh -Q --quiet $i)
    fi;
done

CMD=""
if [[ -n $(whence _which) ]]; then
    if _which fortune; then
        CMD+="fortune | "
        if _which cowsay; then
            CMD+="cowsay | "
            if _which lolcat; then
                CMD+="lolcat"
            fi
        fi
    fi
fi
eval $CMD
