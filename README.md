dotfiles
========

# What's is this?
Just my dotfiles.

# What's inside?
* zsh configuration (zlogin, zprofile, zshenv, zshrc)
    * antigen
    * oh-my-zsh
* vim configuration (vimrc, vim)
    * vundle

# How do I dotfile?
Minimum requirements:
* git
* zsh

Suggested requirements:
* [arch] linux / Mac OS X
* ncmpcpp
* screen
* vim

## Instructions

```shell
% git clone https://github.com/feltnerm/dotfiles.git
% python .py init
```

### Other useful .py commands:
#### Init
```shell
% python .py init # initializes a new dotfiles structure in your $HOME 
```

#### Link
```shell
% python .py link # create symlinks between source-files in ~/dotfiles and $HOME 
```

#### Clean
```shell
% python .py clea # clean the $HOME dir of files that are in the source-files directory 
```

#### Status
```shell
% python .py status # show the update status of the dotfiles repo 
```

#### Update
```shell
% python .py update # checks for updates and downloads them via git
```

#### Diff
```shell
% python .py diff # show a diff between the files in your current $HOME and the source-files repository 
```

#### Options
`-d [--dest-dir]` changes the default  destination directory (default is: `~/`)
`-e [--exclude]` a regex of files to exclude
`-f [--force]` disregards all user input
`-i [--interactive]` asks the user before doing anything substantial
`-n [--dry-run]` run, but don't _actually_ do anything
`-s [--source-dir]` changes the default source directory (default is: `~/dotfiles`)
`-v [--version]` flag that prints out the current version of this tool (not implemented)
`-V [--verbose]` flag that runs in verbose (print everything to console) mode if present

#### Extras
You can also chain commands. It's what the `init` command uses to run.
```shell
% python .py update link
```
