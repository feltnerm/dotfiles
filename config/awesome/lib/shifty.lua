require("shifty/shifty")
shifty.config.guess_name = true
shifty.config.remember_index = true
shifty.config.layouts = layouts
shifty.config.clientkeys = clientkeys
shifty.config.globalkeys = globalkeys
shifty.config.taglist = mytaglist -- for some reason we need to specify the taglist to shifty...
shifty.prompt_sources = {
  "config_tags",
  "config_apps",
  "existing",
  "history"
}
shifty.prompt_matchers = {"^", ":", ""}
shifty.config.tags = 
{
  ["sys"] = {
    init = true,
    position = 2,
    screen = 2,
  },
  ["audio"] = {
    persist = true,
    position = 3 
  },
  ["video"] = {
    position = 3,
  },
  ["term"] = {
    persist = true,
    screen = 1,
    position = 5
  },
  ["dev"] = {
    persist = true,
    screen = 1,
    position = 6
  },
  ["www"] = {
    persist = true,
    position = 1,
    exclusive = true,
  },
}

shifty.config.apps = {
  
  {
    match = {"htop", "wicd-curses", "slurm", "iftop", "ranger"},
    tag   = "sys",
  },
  {
    match = {"gvim"}, 
    tag = "dev"
  },
  {
    match = {"terminal"},
    tag = "term"
  },
  {
    match = {"Chromium"},
    tag = "www"
  },
  {
    match = {"ncmpcpp", "alsamixer"},
    tag = "audio"
  },
  {
    match = {"MPlayer"}, 
    tag = "video"
  },

  {
    match, {""},
    buttons = {
      button( {}, 1, function(c) client.focus = c; c.raise() end),
      button( {}, 2, function(c) awful.mouse.client.move() end),
      button( {}, 3, awful.mouse.client.resize())
    },
  
  }

}

shifty.config.defaults = {
    layout = "max",
    mwfact = 0.5,
    run = function(tag) naughty.notify({text = tag.name}) end,
}
-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
