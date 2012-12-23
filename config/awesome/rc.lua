-- AwesomeWM Configuration
--
-- @author: Mark Feltner
-- ---------------------------------------------------------------------------

print("[awesome] Entering awesome: ".. os.date())
-- Standard awesome library
awful       = require("awful")
awful.rules = require("awful.rules")
              require("awful.autofocus")
beautiful   = require("beautiful")
revelation  = require("revelation")
--toolbox     = require("toolbox")
--shifty      = require("shifty")
require("awesome-freedesktop/freedesktop/utils")

-- {{{ Variable definitions
-- Themes define colours, icons, apps, and wallpapers
root_dir        = awful.util.getdir("config")
env = {
    theme       = "wombat",
    themes_dir  = root_dir .. "/themes/",
    icons_dir   = root_dir .. "/icons/",
    terminal    = "terminal",
    editor      = "gvim",
    browser     = "chromium",
    modkey      = "Mod4",
}
-- }}}

-- {{{ Dependencies
require("lib/debug")
require("lib/theme")
require("lib/bindings")
require("lib/menu")
require("lib/layouts")
require("lib/tags")
require("lib/widgets")
require("lib/rules")
require("lib/signals")
require("lib/startup")
-- }}}
print("[awesome] WM initialized")

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80

