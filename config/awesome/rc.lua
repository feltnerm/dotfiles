-- Awesome configuration
--
-- Author: Mark Feltner
-- 04 Nov 2012
-- ---------------------------------------------------------------------------

-- Awesome Core
gears       = require("gears")
awful       = require("awful")
awful.rules = require("awful.rules")
              require("awful.autofocus")
beautiful   = require("beautiful")
naughty     = require("naughty")
revelation  = require("revelation")


-- Debugging & error helper
require("rc/errors")

-- Global configuration
modkey = "Mod4"
require("rc/config")

-- Modules
require("rc/utils")
require("rc/appearance")
require("rc/debug")

require("rc/start")
require("rc/bindings")
require("rc/wallpaper")
require("rc/widgets")
require("rc/tags")
require("rc/signals")
require("rc/rules")

root.keys(config.keys.global)
root.buttons(config.mouse.global)
