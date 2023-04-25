local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local box = require("themes.spring.widgets.box")

local volume = require("themes.spring.widgets.volume")
local microphone = require("themes.spring.widgets.mic")

local seperator = wibox.widget {
  widget = wibox.widget.textbox,
  text = " ",
  align = 'center',
  valign = 'center',
}


local audio = wibox.widget {
  microphone,
  seperator,
  volume,
  layout = wibox.layout.fixed.horizontal,
  spacing = dpi(5),
}

return box(audio)
