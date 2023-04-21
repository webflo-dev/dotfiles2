local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local util = require("themes.spring.util")
local box = require("themes.spring.widgets.box")


local mic_icon = wibox.widget {
  widget = wibox.widget.textbox,
  -- text = "MIC",
  markup = util.colorize_text("MIC", beautiful.accent_color),
  align = 'center',
  valign = 'center',
  -- forced_width = dpi(20),
  font = util.font_glyph(),
}

local mic_icon_block = wibox.widget {
  mic_icon,
  widget = wibox.container.background
}

local default_fg = mic_icon.fg


awesome.connect_signal("signal::mic", function(volume, mute)
  if (mute == true) then
    mic_icon:set_markup(util.colorize_text(beautiful.icons.microphone_mute, beautiful.red))
    mic_icon_block:set_fg(beautiful.red)
  else
    mic_icon:set_markup(util.colorize_text(beautiful.icons.microphone, beautiful.accent_color))
    mic_icon_block:set_fg(default_fg)
  end
end)


return mic_icon_block