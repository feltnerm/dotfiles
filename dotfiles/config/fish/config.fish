# Path to fish config
set --global --export FISH_HOME "$HOME/.config/fish"

# Path to Oh My Fish install.
set --global --export OMF_PATH "$HOME/.local/share/omf"

source "$FISH_HOME/lib/init.fish"
#
# Editor
#
set --global --export EDITOR nvim

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

#
# Virtualfish
#
eval (python -m virtualfish)


# source "$HOME/.extras.fish"
# Load oh-my-fish configuration.
source "$OMF_PATH/init.fish"
