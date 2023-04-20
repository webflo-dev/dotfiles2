local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local util = require("themes.spring.util")
local box = require("themes.spring.widgets.box")

local cpu = require("themes.spring.widgets.cpu")
local memory = require("themes.spring.widgets.memory")
local gpu = require("themes.spring.widgets.gpu")

local seperator = wibox.widget {
  widget = wibox.widget.textbox,
  markup = util.colorize_text(" | ", beautiful.accent_color),
  align = 'center',
  valign = 'center',
}


local system = wibox.widget {
  cpu,
  -- seperator,
  memory,
  -- seperator,
  gpu,
  layout = wibox.layout.fixed.horizontal,
  spacing = dpi(20),
}

return box(system)
