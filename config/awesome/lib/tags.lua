require("lib/layouts")

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "☕", "⌨", "⌘", "☭" }, s, layouts[1])
end
-- }}}

print("[awesome] tags set")
