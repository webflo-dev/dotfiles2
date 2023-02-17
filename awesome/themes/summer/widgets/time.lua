local wibox = require("wibox")

local box = require("themes.summer.widgets.base.box")
local util = require("themes.summer.util")

local widget = {}

local function worker()
  widget = box(
    {
      widget = wibox.widget.textbox,
      text = "",
      align = 'center',
      valign = 'center',
      font = util.font_glyph(12),
    },
    {
      widget = wibox.widget.textclock,
      format = "%H:%M",
      align = "center",
      valign = "center",
      font = util.font(12),
    }
  )

  return widget
end

return setmetatable(widget, { __call = function(_, ...)
  return worker(...)
end })
