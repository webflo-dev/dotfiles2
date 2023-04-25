local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local utilUi = require("helpers.ui")
local box = require("themes.spring.widgets.box")


local volume_icon = wibox.widget {
  widget = wibox.widget.textbox,
  -- text = "VOL",
  markup = utilUi.colorize_text("VOL", beautiful.accent_color),
  align = 'center',
  valign = 'center',
  -- forced_width = dpi(20),
  font = utilUi.font_glyph(),
}

local volume_text = wibox.widget {
  widget = wibox.widget.textbox,
  text = "---",
  align = "right",
  valign = "center",
  forced_width = dpi(40),
  font = utilUi.font_monospace(),
}


local volume_icon_block = wibox.widget {
  volume_icon,
  widget = wibox.container.background
}

local volume_text_block = wibox.widget {
  volume_text,
  widget = wibox.container.background
}


local volume = wibox.widget {
  volume_icon_block,
  volume_text_block,
  layout = wibox.layout.fixed.horizontal,
  spacing = dpi(5)
}

local default_fg = volume_text.fg

awesome.connect_signal("signal::volume", function(volume, mute)
  volume_text:set_text(volume .. "%")
  if (mute == true) then
    volume_icon:set_markup(utilUi.colorize_text(beautiful.icons.volume_mute, beautiful.red))
    volume_icon_block:set_fg(beautiful.red)
    volume_text_block:set_fg(beautiful.red)
  else
    volume_icon:set_markup(utilUi.colorize_text(beautiful.icons.volume, beautiful.accent_color))
    volume_icon_block:set_fg(default_fg)
    volume_text_block:set_fg(default_fg)
  end
end)

return volume
