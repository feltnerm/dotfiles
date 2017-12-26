function tmuxa
    if count $argv > /dev/null
        tmux attach-session -t $argv
    else
        tmux attach-session -t (basename (pwd))
    end
end
