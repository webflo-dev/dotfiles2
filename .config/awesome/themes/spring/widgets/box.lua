local wibox = require("wibox")
local beautiful = require("beautiful")
local utilUi = require("helpers.ui")

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
    shape = utilUi.rounded_shape(),
    bg = beautiful.bg_normal,
    border_color = beautiful.bg_focus,
    -- border_color = beautiful.,
    border_width = dpi(2),
  }

  return widget
end
