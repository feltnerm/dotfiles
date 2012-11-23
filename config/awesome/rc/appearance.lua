-- Appearance
-- ---------------------------------------------------------------------------

config.theme    = "/usr/share/awesome/themes/zenburn/theme.lua"

-- load theme
-- ------------------------------------
beautiful.init(config.theme)

-- @overrides:
theme.font = "Ubuntu 9" 
theme.taglist_font = "Terminus 14"

-- Set cursor theme
-- ------------------------------------
os.execute("xsetroot -cursor_name left_ptr")
