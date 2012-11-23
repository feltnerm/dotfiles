-- Tags
local tags = {}
local tagnames = { "⌨", "⍜", "✉", "❁", "✣" }
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tagnames, s, config.layouts[1])
end
config.tags = tags
