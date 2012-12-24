require("lib/layouts")

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "☭", "⌘", "‣", "ᴥ", "λ", "⌨", }, s, layouts[1])
end
-- }}}

print("[awesome] tags set")

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
