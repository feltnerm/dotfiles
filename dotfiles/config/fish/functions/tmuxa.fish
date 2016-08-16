function tmuxa
  [[ -z $1 ]]; and tmux attach -t (basename (pwd))
  [[ -n $1 ]]; and tmux attach -t $1
end
