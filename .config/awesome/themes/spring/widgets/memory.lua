local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local utilUi = require("helpers.ui")


local memory_icon = wibox.widget {
  widget = wibox.widget.textbox,
  -- markup = util.colorize_text(beautiful.icons.memory, beautiful.accent_color),
  markup = utilUi.colorize_text(beautiful.icons.memory, beautiful.lime),
  align = 'center',
  valign = 'center',
  -- forced_width = dpi(20),
  font = utilUi.font_glyph(),
}

local memory_text = wibox.widget {
  widget = wibox.widget.textbox,
  text = "---",
  align = "right",
  valign = "center",
  forced_width = dpi(30),
  font = utilUi.font_monospace(),
}


awesome.connect_signal("memory::update", function(used, used_ram_percentage, total, available)
  memory_text:set_text(math.floor(used_ram_percentage) .. "%")
end)


local memory = wibox.widget {
  memory_icon,
  memory_text,
  layout = wibox.layout.fixed.horizontal,
  spacing = dpi(5)
}

return memory
