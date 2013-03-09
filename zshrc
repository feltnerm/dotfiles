# env shared between bash and zsh
if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

COMPLETION_WAITING_DOTS=true

if [ -f "$HOME/.antigen/antigen.zsh" ]; then
    source "$HOME/.antigen/antigen.zsh"
    antigen-lib
    
    antigen-bundles <<EOBUNDLES
autojump
compleat
ssh-agent
screen
archlinux
urltools
encode64
dircycle
git
github
svn
node
extract
python
pip
virtualenvwrapper 
django
ruby
vundle
heroku
lein
command-not-found
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting 
kennethreitz/autoenv 
EOBUNDLES
    
    antigen-theme kphoen
    antigen-apply
fi
#ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="kphoen"

#plugins=(ssh-agent screen autojump compleat node git github archlinux extract pip python ruby virtualenvwrapper urltools encode64 django dircycle vundle)

## Options
setopt correctall
setopt autocd
setopt auto_resume

## Extended globbing
setopt extendedglob

## History
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
