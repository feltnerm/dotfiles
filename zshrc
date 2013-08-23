# env shared between bash and zsh
if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

COMPLETION_WAITING_DOTS=true

# vim. +1 to dexterity
bindkey -v

if [ -f "$HOME/.antigen/antigen.zsh" ]; then
    source "$HOME/.antigen/antigen.zsh"
    antigen use oh-my-zsh
    
    antigen bundle autoenv
    antigen bundle extract
    antigen bundle git
    antigen bundle history
    antigen bundle screen
    antigen bundle vi-mode
    antigen bundle virtualenv
    antigen bundle virtualenvwrapper 
    #antigen bundle autojump
    #antigen bundle cake
    #antigen bundle clauswitt/zsh-grunt-plugin
    #antigen bundle coffee
    #antigen bundle compleat
    #antigen bundle encode64
    #antigen bundle django
    #antigen bundle history-substring-search
    #antigen bundle heroku
    #antigen bundle node
    #antigen bundle python
    #antigen bundle ssh-agent
    #antigen bundle svn
    #antigen bundle ruby
    #antigen bundle vundle
    #antigen bundle zsh-users/zsh-syntax-highlighting 
    #antigen bundle zsh-users/zsh-completions src
        
    for i in "${ANTIGEN_BUNDLES[@]}"
    do
        antigen bundle $i
    done
    antigen theme ${ANTIGEN_THEME}
    antigen apply
fi

## Options
#setopt correctall
#setopt autocd
#setopt auto_resume
#
### Extended globbing
#setopt extendedglob

## History
export HISTSIZE=25000
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
