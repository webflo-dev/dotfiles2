local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local util = require("themes.summer.util")
local box = require("themes.summer.widgets.base.box")

local widget = {}

local function worker(user_args)

  local icon_widget = wibox.widget {
    widget = wibox.widget.textbox,
    text = "",
    align = 'center',
    valign = 'center',
    forced_width = dpi(20),
    font = util.font_glyph(12),
  }

  local value_widget = wibox.widget {
    widget = wibox.widget.textbox,
    text = "---",
    align = "right",
    valign = "center",
    font = util.font(12),
    forced_width = dpi(30),
  }


  widget = box(
    icon_widget,
    value_widget
  )
  awesome.connect_signal("memory::update", function(used, used_ram_percentage, total, available)
    value_widget:set_text(math.floor(used_ram_percentage) .. "%")
  end)

  return widget
end

return setmetatable(widget, { __call = function(_, ...)
  return worker(...)
end })
