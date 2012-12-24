require("lib/tags")

function load_prog(cmd, tag)
   awful.tag.viewonly(tags[1][tag])
   awful.util.spawn(cmd)
end

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule_any = { name = {"ncmpcpp", "alsamixer"}}, properties = { tag = tags[1][3] }},
    { rule_any = { name = {"slurm", "htop", "wicd", "ranger"}}, properties = { tag = tags[1][2], switchtotag = true}},
    { rule = { class = "Gvim" }, properties = { tag = tags[1][6], switchtotag = true }},
    { rule = { name = "console" }, properties = { tag = tags[1][5], switchtotag = true }},
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

print("[awesome] rules initialized")

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
