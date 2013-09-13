dotfiles
========

### What's this?
Just my dotfiles.

### What's inside?
* zsh configuration (`zlogin`, `zprofile`, `zshenv`, `zshrc`)
    * oh-my-zsh
* vim configuration (`vimrc`, `vim/`)
    * vundle
* screen configuration
* a tool to manage this mess (`dots.py`)
* submodules to other useful tools (`bin/`)

### How do I dotfile?
Use `.py` to manage the symlinking of files in the dotfiles directory to your home directory.
System-specific configurations can be thrown into the `.system-confs/` directory which is automagically loaded on a per-hostname basis.

### Requirements?
Minimum requirements:
* git
* zsh (v5+ recommended)

Suggested requirements:
* [arch] linux / Mac OS X
* screen
* vim

#### Instructions

```shell
% git clone https://github.com/feltnerm/dotfiles.git
% python dots.py init
```

##### Other useful .py commands:
###### Init
```shell
% python dots.py init # initializes a new dotfiles structure in your $HOME
```

###### Link
```shell
% python dots.py link # create symlinks between source-files in ~/dotfiles and $HOME
```

###### Clean
```shell
% python dots.py clean # clean the $HOME dir of files that are in the source-files directory
```

###### Status
```shell
% python dots.py status # show the update status of the dotfiles repo
```

###### Update
```shell
% python dots.py update # checks for updates and downloads them via git
```

###### Diff
```shell
% python dots.py diff # show a diff between the files in your current $HOME and the source-files repository
```

###### Options
`-e [--exclude]` a regex of files to exclude

`-f [--force]` disregards all user input

`-i [--interactive]` asks the user before doing anything substantial

`-n [--dry-run]` run, but don't _actually_ do anything

`-d [--dest-dir]` changes the default  destination directory (default is: `~/`)

`-s [--source-dir]` changes the default source directory (default is: `~/dotfiles`)

`-v [--version]` flag that prints out the current version of this tool (not implemented)

`-V [--verbose]` flag that runs in verbose (print everything to console) mode if present


###### Extras
You can also chain commands. It's what the `init` command uses to run.
```shell
% python .py update link
```


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/feltnerm/dotfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

