#if [ -x /usr/bin/ssh-agent ]; then
#    eval "$(ssh-agent -s)"
#fi
if [[ "$(hostname -s)" == "saraswati" ]]; then
    eval $(keychain --eval --agents ssh -Q --quiet /home/mark/.ssh/id_rsa.github)
fi

if [[ "$(hostname -s)" == "trotsky" ]]; then
    eval $(keychain --eval --agents ssh -Q --quiet /home/mark/.ssh/id_rsa)
fi
#ssh-add ~/.ssh/{id_rsa.saraswati,id_rsa.github,id_rsa.io}
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
