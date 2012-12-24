local vicious = require("vicious")
local wibox = require("wibox")

require("obvious/battery")


-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mystatusbox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))


local space = wibox.widget.textbox(" ")
local spacer = wibox.widget.textbox("  ")
local extended_spacer = wibox.widget.textbox("    ")

local memwidget_text = wibox.widget.textbox("MEM:")
local memwidget = awful.widget.progressbar()
memwidget:set_width(8)
memwidget:set_height(10)
memwidget:set_vertical(true)
memwidget:set_background_color("#494B4F")
memwidget:set_border_color(nil)
memwidget:set_color("#AECF96")
--memwidget:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })
vicious.register(memwidget, vicious.widgets.mem, "$1", 13)

local cpuwidget_text = wibox.widget.textbox("CPU:")
local cpuwidget = awful.widget.progressbar()
cpuwidget:set_width(8)
cpuwidget:set_height(10)
cpuwidget:set_vertical(true)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_border_color(nil)
cpuwidget:set_color("#AECF96")
vicious.register(cpuwidget, vicious.widgets.mem, "$1", 13)

local batwidget_text = wibox.widget.textbox("BAT:")
local batwidget = awful.widget.progressbar()
batwidget:set_width(8)
batwidget:set_height(10)
batwidget:set_vertical(true)
batwidget:set_background_color("#494B4F")
batwidget:set_border_color(nil)
batwidget:set_color("#AECF96")
vicious.register(batwidget, vicious.widgets.bat, "$2", 60, "BAT0")


for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)

    mystatusbox[s] = awful.wibox({ position = "bottom", screen = s})
    local st_left_layout = wibox.layout.fixed.horizontal()
    st_left_layout:add(spacer)
    st_left_layout:add(batwidget_text)
    st_left_layout:add(batwidget)
    st_left_layout:add(space)
    st_left_layout:add(cpuwidget_text)
    st_left_layout:add(cpuwidget)
    st_left_layout:add(space)
    st_left_layout:add(memwidget_text)
    st_left_layout:add(memwidget)
    st_left_layout:add(space)
    st_left_layout:add(extended_spacer)
    local st_middle_layout = wibox.layout.fixed.horizontal()
    local st_right_layout = wibox.layout.fixed.horizontal()
    st_right_layout:add(spacer)
    --st_right_layout:add(mpdwidget)
    local st_layout = wibox.layout.align.horizontal()
    st_layout:set_left(st_left_layout)
    st_layout:set_middle(st_middle_layout)
    st_layout:set_right(st_right_layout)
    mystatusbox[s]:set_widget(st_layout)
end
-- }}}

print("[awesome] widgets initialized")

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
