local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local util = require("themes.spring.util")
local box = require("themes.spring.widgets.box")


local cpu_icon = wibox.widget {
  widget = wibox.widget.textbox,
  -- markup = util.colorize_text(beautiful.icons.processor, beautiful.accent_color),
  markup = util.colorize_text(beautiful.icons.processor, beautiful.lime),
  align = 'center',
  valign = 'center',
  -- forced_width = dpi(20),
  font = util.font_glyph(),
}

local cpu_text = wibox.widget {
  widget = wibox.widget.textbox,
  text = "---",
  align = "right",
  valign = "center",
  forced_width = dpi(30),
  font = util.font_monospace(),
}


awesome.connect_signal("cpu::update", function(value)
  cpu_text:set_text(value .. '%')
end)

local cpu = wibox.widget {
  cpu_icon,
  cpu_text,
  layout = wibox.layout.fixed.horizontal,
  spacing = dpi(5)
}

return cpu
