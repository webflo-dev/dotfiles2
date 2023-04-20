local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local util = require("themes.spring.util")
local box = require("themes.spring.widgets.box")

local w_icon = wibox.widget {
  widget = wibox.widget.textbox,
  markup = util.colorize_text(beautiful.icons.clock, beautiful.accent_color, 'bold'),
  align = 'center',
  valign = 'center',
  font = util.font_glyph(),
}

local w_text = wibox.widget {
  widget = wibox.widget.textclock,
  format = "%H:%M",
  align = "center",
  valign = "center",
  -- font = util.font(),
  font = beautiful.font_name .. " Bold " .. beautiful.font_size,
}

local time = wibox.widget {
  w_icon,
  w_text,
  layout = wibox.layout.fixed.horizontal,
  spacing = dpi(10),
}

return box(time)
