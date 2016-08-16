function tmuxn
  [[ -z $1 ]]; and tmux new-session -s (basename (pwd))
  [[ -n $1 ]]; tmux new-session -s $1
end
