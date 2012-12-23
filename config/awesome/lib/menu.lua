local menubar = require("menubar")
-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "xrandr", "xrandr --auto"},
   { "arandr", "arandr"},
   { "edit config", env.editor .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "terminal", env.terminal },
                                    { "browser", env.browser }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

print("[awesome] Menu created")

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
