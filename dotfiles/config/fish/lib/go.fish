set --global --export GOPATH "$HOME/.go"

# _is_osx && export GOROOT="$(brew --prefix go)/libexec"

set --global --export PATH $GOROOT/bin $PATH
set --global --export PATH $GOPATH/bin $PATH
