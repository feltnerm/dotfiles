-- Tags
local tags = {}
--local tagnames = { "⌨", "⍜", "✉", "❁", "✣" }
--local tagnames = { "⌨", "❁", "✣" }
local tagnames = {"☕", "⌨", "⌘", "☭"}

if false then
    local screens = screen.count()
    if screens == 1 then
        tags[1] = awful.tag(screen1_tagnames, 1, config.layouts[1])
    elseif screens == 2 then
        tags[1] = awful.tag(screen1_tagnames, 1, config.layouts[1])
        tags[2] = awful.tag(screen2_tagnames, 2, config.layouts[1])
    end
end

for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tagnames, s, config.layouts[1])
end
config.tags = tags
