local gears = require("gears")

local theme_path = awful.util.getdir("config") .. "/themes/" .. env.theme .. "/theme.lua"

beautiful.init(theme_path)
theme.font = "Ubuntu 9"
theme.taglist_font = "Terminus 14"

print("[awesome] Theme Intialized: " .. env.theme)

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
    print("[awesome] Wallpaper set")
end
-- }}}

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
