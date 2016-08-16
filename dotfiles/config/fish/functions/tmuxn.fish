function tmuxn
  eval [[ -z $1 ]]; and tmux new-session -s (basename (pwd))
  eval [[ -n $1 ]]; and tmux new-session -s $1
end
