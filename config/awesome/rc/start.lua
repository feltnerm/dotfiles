-- Spawn a compositing manager
--awful.util.spawn("xcompmgr_mgr", false)

-- Start idempotent commands
local execute = {
   -- Read resources
   "xrdb -merge " .. os.getenv("HOME") .. "/.Xresources",
   --"xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55",
   --"xscreensaver -no-splash",
   -- Start PulseAudio
   "pulseaudio --check || start-pulseaudio-x11",
   "xset -b",	-- Disable bell
   -- Enable numlock
   "numlockx on",

   "urxvtd -q -f -o",

   -- Default browser
   "xdg-mime default " .. config.browser .. ".desktop x-scheme-handler/http",
   "xdg-mime default " .. config.browser .. ".desktop x-scheme-handler/https",
   "xdg-mime default " .. config.browser .. ".desktop text/html"
}

os.execute(table.concat(execute, ";"))

-- Spawn various X programs
--xrun("wicd-gtk", "wicd-gtk --tray")
--xrun("nitrogen", "nitrogen --restore")
--xrun("conky", "conky")
