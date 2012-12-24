Mark Feltner's awesome configuration
--------------------------------------

shamelessly inspired by: https://github.com/vincentbernat/awesome-configuration

This is my [awesome](http://awesome.naquadah.org) configuration.

Here some of the things you may be interested in:

 - It is modular. I am using `config` as a table to pass different
   things between "modules".

 - In `rc/xrun.lua`, there is a `xrun` function which runs a program
   only if it is not already running. Instead of relying on tools like
   `ps`, it looks at the list of awesome clients and at the list of
   connected clients with `xwininfo`. Seems reliable.

 - I use a light transparency effect to tell if a window has the focus
   or not. It needs a composite manager.

 - I am using notifications when changing volume or brightness. I am
   also using notifications to change xrandr setup. This is pretty
   cool.
 
 - Keybindings are "autodocumented". See `lib/keydoc.lua` to see how
   this works. The list of key bindings can be accessed with Mod4 +
   F1.
   
 - On the debug front, I am quite happy with `dbg()` in
   `rc/debug.lua`.

Things in `lib/` are meant to be reused. I am using my own `loadrc()`
function to load modules and therefore, I prefix my modules with
`vbe/`. Before reusing a module, you may want to change this. Another
way to load them is to use:

	require("lib/quake")
	local quake = package.loaded["vbe/quake"]
