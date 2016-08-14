set --global --export NPM_PACKAGES "$HOME/.npm-packages"
set --global --export NODE_PATH "$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
set --global --export PATH "$NPM_PACKAGES/bin" $PATH

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
# MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# # nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
