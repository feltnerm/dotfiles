
local execute = {
    -- Read resources
    "xrdb -merge " .. os.getenv("HOME") .. "/.Xresources",

    -- Default browser
    "xdg-mime default " .. env.browser .. ".desktop x-scheme-handler/http",
    "xdg-mime default " .. env.browser .. ".desktop x-scheme-handler/https",
    "xdg-mime default " .. env.browser .. ".desktop text/html",
}
