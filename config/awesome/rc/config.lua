-- Configuration
-- ---------------------------------------------------------------------------

awful.rules = require("awful.rules")


-- defaults
config = {}
config.keys = {}
config.mouse = {}


config.hostname = awful.util.pread("uname -n"):gsub('\n', '')

config.terminal         = "urxvtc"
config.browser          = "chromium"
config.exec             = config.terminal .. " -e"
config.exec_editor      = config.exec .. "vim" 
config.exec_screen      = config.exec .. "screen -X"

config.layouts = {
   awful.layout.suit.tile,
   awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   awful.layout.suit.fair,
   awful.layout.suit.floating,
   awful.layout.suit.spiral,
   -- awful.layout.suit.tile.top,
   -- awful.layout.suit.fair.horizontal,
   -- awful.layout.suit.spiral.dwindle,
   -- awful.layout.suit.max,
   -- awful.layout.suit.max.fullscreen,
   -- awful.layout.suit.magnifier
}
