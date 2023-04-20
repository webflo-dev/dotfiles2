local wibox = require("wibox")
local beautiful = require("beautiful")
local util = require("themes.spring.util")

local dpi = beautiful.xresources.apply_dpi

return function(child)
  local widget = wibox.widget {
    {
      child,
      widget = wibox.container.margin,
      margins = {
        left = dpi(10),
        right = dpi(10),
      }
    },
    widget = wibox.container.background,
    shape = util.shape.rounded_rect(),
    bg = beautiful.bg_normal,
    border_color = beautiful.bg_focus,
    -- border_color = beautiful.,
    border_width = dpi(2),
  }

  return widget
end
