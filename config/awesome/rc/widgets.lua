-- Widgets

local vicious   = require("vicious")
local wibox     = require("wibox")
local menubar   = require("menubar")

local awesome_menu = {}
local main_menu = {}
local launcher = {}


-- Awesome Menu
-- ---------------------
awesome_menu = {
   { "settings", config.exec_editor .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

main_menu = awful.menu({ 
    items = { 
        { "terminal", config.terminal },
        { "browser", config.browser },
        { "awesome", awesome_menu, beautiful.awesome_icon },
    }
})

launcher = awful.widget.launcher({ 
    image = beautiful.awesome_icon,
    menu = main_menu
})

-- Helpful Icons
local iconsdir = awful.util.getdir("config") .. "/icons"
local separator = wibox.widget.imagebox()
separator:set_image(iconsdir .. "/widgets/separator.png")
local spacer    = wibox.widget.imagebox()
spacer:set_image(iconsdir .. "/widgets/spacer.png")
local left      = wibox.widget.imagebox()
left:set_image(iconsdir .. "/widgets/left.png")
local right     = wibox.widget.imagebox()
right:set_image(iconsdir .. "/widgets/right.png")


-- Menubar configuration
-- ---------------------
menubar.utils.terminal = config.terminal -- Set the terminal for applications that require it

-- Wibox
-- ---------------------
-- date
local datewidget = wibox.widget.textbox()
vicious.register(datewidget, vicious.widgets.date, "%H:%M %d/%m/%Y", 60)

-- CPU
local cpuwidget = awful.widget.graph()
--local cpuwidget = wibox.widget.graph()
cpuwidget:set_width(50)
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

-- Memory Usage
local memwidget = awful.widget.graph()
memwidget:set_width(50)
vicious.register(memwidget, vicious.widgets.mem, "$1")

-- Battery
--local batterywidget = wibox.widget.textbox()
--vicious.register(batterywidget, vicious.widgets.bat, "$1%", 60)


--local systray = wibox.widget.systray()
local a_wibox = {}
local a_promptbox = {}
local a_layoutbox = {}

-- The Taglist
local a_taglist   = {}
a_taglist.buttons = awful.util.table.join(
    awful.button({ }, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
)

-- The Tasklist
local a_tasklist  = {}
a_tasklist.buttons = awful.util.table.join(
    awful.button({ }, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            if not c:isvisible() then
                awful.tag.viewonly(c:tags()[1])
            end
            client.focus = c
            c:raise()
        end
    end),
    
    awful.button({ }, 3, function ()
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ width = 250, })
        end
    end),

    awful.button({ }, 4, function ()
        awful.client.focus.byidx(1)
        if client.focus then client.focus.raise() end
    end),

    awful.button({ }, 5, function ()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
    end)
)


for s = 1, screen.count() do
    a_promptbox[s] = awful.widget.prompt()
    a_layoutbox[s] = awful.widget.layoutbox(s)

    -- create taglist
    a_taglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, 
        a_taglist.buttons)

    -- create tasklist
    a_tasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, 
        a_tasklist.buttons)

    -- create the wibox
    a_wibox[s] = awful.wibox({
        screen = s,
        position = "top",
        height = 16,
    })

    -- Left Aligned Widgets
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(launcher)
    left_layout:add(a_taglist[s])
    left_layout:add(a_promptbox[s])
    left_layout:add(separator)

    -- Right Aligned Widgets
    local right_layout = wibox.layout.fixed.horizontal()
    --if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(cpuwidget)
    right_layout:add(memwidget)
    right_layout:add(separator)
    right_layout:add(datewidget)
    --right_layout:add(batterywidget)

    -- Bring it all together
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(a_tasklist[s])
    layout:set_right(right_layout)

    a_wibox[s]:set_widget(layout)
end

-- Append Modkey+r to global keys to allow run in promptbox
config.keys.global = awful.util.table.join(
       config.keys.global,
       awful.key({ modkey }, "r", function() a_promptbox[mouse.screen]:run() end,
        "Prompt for a command"))
config.taglist = a_taglist
