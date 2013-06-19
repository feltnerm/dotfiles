# env shared between bash and zsh
if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

COMPLETION_WAITING_DOTS=true

if [ -f "$HOME/.antigen/antigen.zsh" ]; then
    source "$HOME/.antigen/antigen.zsh"
    antigen use oh-my-zsh
    
    antigen bundle autojump
    antigen bundle vi-mode
    antigen bundle autoenv
    antigen bundle compleat
    antigen bundle ssh-agent
    antigen bundle screen
    antigen bundle urltools
    antigen bundle encode64
    antigen bundle dircycle
    antigen bundle git
    antigen bundle svn
    antigen bundle node
    antigen bundle extract
    antigen bundle python
    antigen bundle pip
    antigen bundle virtualenv
    antigen bundle virtualenvwrapper 
    antigen bundle django
    antigen bundle ruby
    antigen bundle cake
    antigen bundle coffee
    antigen bundle brew
    antigen bundle node
    antigen bundle npm
    antigen bundle lein
    antigen bundle vundle
    antigen bundle heroku
    antigen bundle history-substring-search
    antigen bundle history
    antigen bundle nyan
    antigen bundle zsh-users/zsh-completions src
    antigen bundle zsh-users/zsh-syntax-highlighting 
        
    for i in "${ANTIGEN_BUNDLES[@]}"
    do
        antigen bundle $i
    done
    antigen apply
fi

## Options
setopt correctall
setopt autocd
setopt auto_resume

## Extended globbing
setopt extendedglob

## History
export HISTSIZE=25000
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
