function tmuxa
  [[ -z $1 ]] && tmux attach -t (basename (pwd))
  [[ -n $1 ]] && tmux attach -t $1
end
