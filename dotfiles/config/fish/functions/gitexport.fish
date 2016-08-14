# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
end
