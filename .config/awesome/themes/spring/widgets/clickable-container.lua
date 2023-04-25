local awful_button = require("awful.button")
local beautiful = require("beautiful")
local gshape = require("gears.shape")
local gtable = require("gears.table")
local wibox_container = require("wibox.container")
local wibox_widget = require("wibox.widget")

local helperUi = require("helpers.ui")

local function clickable_container(args)
  local container = wibox_widget {
    {
      args.widget,
      margins = args.margins or 0,
      widget = wibox_container.margin
    },
    bg = args.bg or "#00000000",
    shape = args.shape or gshape.rounded_rect,
    widget = wibox_container.background
  }
  container.focused = false

  helperUi.add_hover_cursor(container, "hand2")

  -- Hover bg change
  container:connect_signal(
    "mouse::enter", function()
      container.bg = args.bg_focused or beautiful.bg_focus
    end
  )

  container:connect_signal(
    "mouse::leave", function()
      if not container.focused then
        container.bg = args.bg or "#00000000"
      end
    end
  )

  container:connect_signal(
    "button::press", function()
      container.bg = beautiful.bg_minimize
    end
  )

  if args.action then
    container:buttons(gtable.join(awful_button({}, 1, nil, args.action)))
  end

  return container
end

return clickable_container
