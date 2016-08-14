# ssh
# User's ssh keys
function add_keys
    local login=$1
    local KEYS=""
    local keychain_cmd="keychain --eval --agents ssh "

    for i in ${HOME}/.ssh/* ; do
        if [[ -r $i.pub && -r $i ]]; then
            [[ -n $KEYS ]] && KEYS=$KEYS" "$i
            [[ -z $KEYS ]] && KEYS=$i
        fi
    done

    [[ -n $login ]] && keychain_cmd="$keychain_cmd --stop others $KEYS"
    [[ -z $login ]] && keychain_cmd="$keychain_cmd --quiet -Q $KEYS"
end
