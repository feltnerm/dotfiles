function tmuxa
  eval [[ -z $1 ]]; and tmux attach-session -t (basename (pwd))
  eval [[ -n $1 ]]; and tmux attach-session -t $1
end
