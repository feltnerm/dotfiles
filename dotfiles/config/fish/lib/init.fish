# defaults

# Default Lang
set --global --export LC_ALL "en_US.UTF-8"
set --global --export LANG "en_US"

# Default Pager
set --global --export PAGER "less -X"
set --global --export MANPAGER $PAGER

# Default Editor
set --global --export EDITOR "vi"

# Base Directories
set --global --export CODE_HOME $HOME/code
set --global --export PROJECTS $CODE_HOME

# Base Paths
set --global --export PATH "/usr/local/bin" "/usr/local/sbin" "$HOME/bin" $PATH

source "$FISH_HOME/lib/aliases/init.fish"
source "$FISH_HOME/lib/dropbox.fish"
source "$FISH_HOME/lib/go.fish"
source "$FISH_HOME/lib/node.fish"
source "$FISH_HOME/lib/python.fish"
source "$FISH_HOME/lib/ruby.fish"
source "$FISH_HOME/lib/rust.fish"
