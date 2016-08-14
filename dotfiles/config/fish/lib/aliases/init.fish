source "$FISH_HOME/lib/aliases/cd.fish"
source "$FISH_HOME/lib/aliases/clean.fish"
source "$FISH_HOME/lib/aliases/cp.fish"
source "$FISH_HOME/lib/aliases/df.fish"
source "$FISH_HOME/lib/aliases/find.fish"
source "$FISH_HOME/lib/aliases/ls.fish"
source "$FISH_HOME/lib/aliases/ps.fish"
source "$FISH_HOME/lib/aliases/shortcuts.fish"
source "$FISH_HOME/lib/aliases/ssh.fish"

alias mv "mv -i"
alias rm "rm -i"
alias oracow "fortune | cowsay | lolcat"

# count lines of code
alias cloc "cloc --exclude-dir=.git,.hg"

# `cat` with pretty colors
alias hilite "pygmentize -O style=monokai -f console256 -g"

# OS stuff
alias ports "lsof -i -P -sTCP:LISTEN"
