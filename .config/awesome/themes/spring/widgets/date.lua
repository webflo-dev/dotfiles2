local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local utilUi = require("helpers.ui")
local box = require("themes.spring.widgets.box")

local w_icon = wibox.widget {
  widget = wibox.widget.textbox,
  markup = utilUi.colorize_text(beautiful.icons.calendar, beautiful.accent_color, 'bold'),
  align = 'center',
  valign = 'center',
  font = utilUi.font_glyph(),
}

local w_text = wibox.widget {
  widget = wibox.widget.textclock,
  format = "%A %d %B",
  align = "center",
  valign = "center",
  font = beautiful.font_name .. " Bold " .. beautiful.font_size,
}

local date = wibox.widget {
  w_icon,
  w_text,
  layout = wibox.layout.fixed.horizontal,
  spacing = dpi(10),
}

return box(date)
