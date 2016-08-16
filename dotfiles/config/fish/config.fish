# Path to fish config 
set --global --export FISH_HOME "$HOME/.config/fish"

# Path to Oh My Fish install.
set --global --export OMF_PATH "$HOME/.local/share/omf"

source "$FISH_HOME/lib/init.fish"

# source "$HOME/.extras.fish"
# Load oh-my-fish configuration.
source "$OMF_PATH/init.fish"
