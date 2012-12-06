dotfiles
========

Just my dotfiles

To symlink all files in this directory to your ~/
```shell
ruby bin/deploy.rb --verbose --backup --what dotfiles
```

Minimum requirements:
* zsh

You'll be able to fully experience The Awesome if you find yourself using any combination of the following:

_(these are not requirements, but I'd *highly* suggest them)_
* [arch] linux
* awesomewm
* vim or gvim (for included plugins see vimrc)
* virtualenv + virtualenvwrapper
* git
* screen

.profile does a decent job of figuring out what the system has and enables/disables things based on that. This is a win
because it allows my layout to be modular and work on a variety of *nix boxes.
Feel free to use the _which() bash function to check whether or not a program exists on your machine before operating
on it.

And some goodies:
* xinitrc
  * xset - set keyboard/mouse settings
  * numlockx - enable numlock
  * xflux - set the color temperature of the monitor based on geographic location and time of day
  * nitrogen - set/save/restore wallpaper
  * pulseaudio 
  * xscreensaver
  * xcompmgr
  * rxvt-unicode
* ncmpcpp
* cmus

bin/ has more requirements, but I think most of them are obvious on inspection.