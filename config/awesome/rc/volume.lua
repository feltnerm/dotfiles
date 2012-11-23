local volid = nil
local function change(what)
   os.execute("amixer -q sset Master " .. what, false)
   -- Read the current value
   local out = awful.util.pread("amixer sget Master")
   local vol, mute = out:match("([%d]+)%%.*%[([%l]*)")
   if not mute or not vol then return end

   vol = tonumber(vol)
end

function increase()
   change("5%+")
end

function decrease()
   change("5%-")
end

function toggle()
   change("toggle")
end
