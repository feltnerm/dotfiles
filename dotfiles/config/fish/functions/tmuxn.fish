function tmuxn
  if count $argv > /dev/null
      tmux new-session -s $argv
  else
      tmux new-session -s (basename (pwd))
  end
end
