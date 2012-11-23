--local volume = loadrc("volume", "vbe/volume")
--local brightness = loadrc("brightness", "vbe/brightness")
-- local volume = require("rc/volume")

-- Global Keybindings
-- --------------------------------------------------------------------------
config.keys.global = awful.util.table.join(
    
    awful.key({ modkey }, "Left",   awful.tag.viewprev),
    awful.key({ modkey }, "Right",  awful.tag.viewnext),
    awful.key({ modkey }, "Escape", awful.tag.history.restore),

    awful.key({ modkey }, "j",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),

    awful.key({ modkey }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),

    awful.key({ modkey, "Shift" },      "j", function() awful.client.swap.byidx(1) end),
    awful.key({ modkey, "Shift" },      "k", function() awful.client.swap.byidx(-1) end),
    awful.key({ modkey, "Control" },    "j", function() awful.screen.focus_relative(1) end),
    awful.key({ modkey }, "u", function() awful.screen.focus_relative(-1) end),
    awful.key({ modkey }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),


    awful.key({ modkey }, "Return", function() awful.util.spawn(config.terminal) end),
    awful.key({ modkey, "Control" },    "r", awesome.restart),
    awful.key({ modkey, "Shift" },      "q", awesome.quit),

    awful.key({ modkey },               "l", function () awful.tag.incmwfact(0.05) end),
    awful.key({ modkey },               "h", function () awful.tag.incmwfact(-0.05) end),
    awful.key({ modkey, "Shift" },      "l", function () awful.tag.incnmaster(1) end),
    awful.key({ modkey, "Shift" },      "h", function () awful.tag.incnmaster(-1) end),
    awful.key({ modkey, "Control" },    "l", function () awful.tag.incncol(1) end),
    awful.key({ modkey, "Control" },    "h", function () awful.tag.incncol(-1) end),
    awful.key({ modkey },               "space", function () awful.layout.inc(config.layouts, 1) end),
    awful.key({ modkey, "Control" },    "space", function () awful.layout.inc(config.layouts, -1) end),

    awful.key({ modkey, "Control" },    "n", awful.client.restore),

   -- Screenshot
   awful.key({}, "Print", screenshot),
   
   -- Multimedia keys
   --awful.key({ }, "XF86MonBrightnessUp",   brightness.increase),
   --awful.key({ }, "XF86MonBrightnessDown", brightness.decrease),
   awful.key({ }, "XF86AudioRaiseVolume", 
        function() os.execute("amixer -q sset Master 5%+") end),
   awful.key({ }, "XF86AudioLowerVolume", 
        function() os.execute("amixer -q sset Master 5%-") end),
   awful.key({ }, "XF86AudioMute",        
        function() os.execute("amixer -q sset Master toggle") end),

   -- Help
   -- awful.key({ modkey }, "F1", nil),

   -- Screenshot
   awful.key({ modkey }, "Print", screenshot, "Screenshot")
)


-- Client Keybindings
-- --------------------------------------------------------------------------
config.keys.client = awful.util.table.join(
   awful.key({ modkey }, "f", function (c) c.fullscreen = not c.fullscreen end),
   awful.key({ modkey }, "x", function (c) c:kill() end),

   awful.key({ modkey }, "m",
    function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c.maximized_vertical = not c.maximized_vertical
    end),
    
    awful.key({ modkey }, "o",
        function (c)
            local s = awful.util.cycle(screen.count(), c.screen + 1)
            if awful.tag.selected(s) then
               c.screen = s
               client.focus = c
               c:raise()
            end
        end),
        
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle),
    awful.key({ modkey, "Control" }, "Return", 
        function (c) 
            c:swap(awful.client.getmaster()) 
        end),
   awful.key({ modkey }, "t", function (c) c:raise() end),
   awful.key({ modkey }, "s", function (c) c.sticky = not c.sticky end),
   awful.key({ modkey }, "i", dbg)

)

-- apply bindings to config
config.mouse.global = awful.util.table.join(
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
)

config.mouse.client = awful.util.table.join(
   awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
   awful.button({ modkey }, 1, awful.mouse.client.move),
   awful.button({ modkey }, 3, awful.mouse.client.resize))
