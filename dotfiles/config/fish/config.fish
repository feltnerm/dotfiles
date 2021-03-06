# Path to fish config
set --global --export FISH_HOME "$HOME/.config/fish"

# Path to Oh My Fish install.
set --global --export OMF_PATH "$HOME/.local/share/omf"

set --global vi_mode_default vi_mode_normal
set --global fish_key_bindings fish_vi_key_bindings

source "$FISH_HOME/lib/init.fish"
# Load oh-my-fish configuration.
source "$OMF_PATH/init.fish"

function fish_greeting
    math -s0 (random) \% 2 > /dev/null; and fortune | cowsay -W 80; or fortune | cowthink -W 80
end

#
# Editor
#
set --global --export EDITOR nvim

#
# Virtualfish
#
eval (python -m virtualfish)

#
# SSH Agent
#
setenv SSH_ENV $HOME/.ssh/environment

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        source $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

# source "$HOME/.extras.fish"

