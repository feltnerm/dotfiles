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
systemd
debian
urltools
encode64
dircycle
git
svn
node
extract
python
pip
virtualenvwrapper 
django
ruby
cake
coffee
node
npm
nyan
lein
vundle
heroku
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting 
kennethreitz/autoenv 
EOBUNDLES
    
    if [[ "$(hostname -s)" == "trotsky" ]]; then
        antigen-theme wedisagree
    elif [[ "$(hostname -s)" == "saraswati" ]]; then
        antigen-theme kphoen
    elif [[ "$(hostname -s)" == "io" ]]; then
        antigen-theme norm
    else
        antigen-theme agnoster
    fi
    antigen-apply
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
