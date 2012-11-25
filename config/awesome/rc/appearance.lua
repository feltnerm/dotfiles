-- Appearance
-- ---------------------------------------------------------------------------

config.theme    = "/usr/share/awesome/themes/zenburn/theme.lua"

-- load theme
-- ------------------------------------
beautiful.init(config.theme)

-- @overrides:
theme.font = "Ubuntu 9" 
theme.taglist_font = "Terminus 14"
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.bg_widget        = "#494B4F"
theme.border_widget    = "#3F3F3F"

-- Set cursor theme
-- ------------------------------------
os.execute("xsetroot -cursor_name left_ptr")
