function tmuxa
  eval [[ -z $1 ]]; and tmux attach -t (basename (pwd))
  eval [[ -n $1 ]]; and tmux attach -t $1
end
