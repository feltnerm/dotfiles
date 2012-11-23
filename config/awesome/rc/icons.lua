-- Lookup function for icons
local iconsdir = awful.util.getdir("config") .. "/icons"

local formats = {
   ".png",
   ".xpm"
}

local assert = assert
local type   = type
local pairs  = pairs
local awful  = require("awful")

function get_icon(arg, type)
    local path = iconsdir .. "/" .. type .. "/"  .. arg .. ".png"  
    if awful.util.file_readable(path) then
        return path
    end
end


-- Lookup for an icon. Return full path.
function lookup(arg)
   local inames = assert(arg.name)
   local isizes = arg.size or sizes
   local itypes = arg.type or types
   local ipaths = paths
   local iformats = formats
   if type(isizes) ~= "table" then isizes = { isizes } end
   if type(itypes) ~= "table" then itypes = { itypes } end
   if type(inames) ~= "table" then inames = { inames } end

   for _, path in pairs(ipaths) do
       for _, size in pairs(isizes) do
           for _, t in pairs(itypes) do
               for _, name in pairs(inames) do
                   if name then
                       for _, name in pairs({name, name:lower()}) do
                           for _, ext in pairs(iformats) do
                               local icon = path .. "/" .. size .. "/" .. t .. "/" .. name .. ext
                               if awful.util.file_readable(icon) then
                                   return icon
                               end 
                           end
                       end
                   end
               end
           end
       end
   end
end
