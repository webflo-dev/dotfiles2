local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local helperUi = require("helpers.ui")
local clickable_container = require("themes.spring.widgets.clickable-container")
local box = require("themes.spring.widgets.box")


local layout_list = awful.widget.layoutlist {
  base_layout = wibox.widget {
    spacing = dpi(4),
    forced_num_cols = 4,
    layout = wibox.layout.grid.vertical
  },
  widget_template = {
    {
      {
        id     = "icon_role",
        widget = wibox.widget.imagebox
      },
      margins = dpi(12),
      widget = wibox.container.margin
    },
    id = "background_role",
    forced_width = dpi(64),
    forced_height = dpi(64),
    widget = wibox.container.background,
  }
}

local layout_popup = awful.popup {
  widget            = wibox.widget {
    layout_list,
    margins = dpi(12),
    widget = wibox.container.margin
  },
  bg                = beautiful.black,
  border_width      = beautiful.border_width,
  border_color      = beautiful.lime,
  ontop             = true,
  visible           = false,
  preferred_anchors = "middle",
  shape             = helperUi.rounded_shape()
}




local function layout_box(screen)
  local layout_box = awful.widget.layoutbox(screen)


  local layout_popup = awful.popup {
    widget            = wibox.widget {
      awful.widget.layoutlist {
        source          = awful.widget.layoutlist.source.default_layouts,
        screen          = screen,
        base_layout     = wibox.widget {
          spacing         = 5,
          forced_num_cols = 3,
          layout          = wibox.layout.grid.vertical,
        },
        widget_template = {
          {
            {
              id            = 'icon_role',
              forced_height = 22,
              forced_width  = 22,
              widget        = wibox.widget.imagebox,
            },
            margins = 4,
            widget  = wibox.container.margin,
          },
          id            = 'background_role',
          forced_width  = 24,
          forced_height = 24,
          shape         = gears.shape.rounded_rect,
          widget        = wibox.container.background,
        },
      },
      margins = 4,
      widget  = wibox.container.margin,
    },
    preferred_anchors = "middle",
    border_color      = beautiful.border_color,
    border_width      = beautiful.border_width,
    shape             = gears.shape.infobubble,
    visible           = false,
    ontop             = true,
  }

  local widget = clickable_container({
    widget = box({
      {
        forced_height = dpi(24),
        forced_width = dpi(24),
        widget = layout_box
      },
      widget = wibox.container.place
    }),
    bg_focused = beautiful.light_gray,
  })

  -- layout_popup:bind_to_widget(layout_box)

  widget:buttons(
    gears.table.join(
      awful.button(
        {}, 1, function(c)
          awful.layout.inc(1)
        end
      ), awful.button(
        {}, 3, function(c)
          awful.layout.inc(-1)
        end
      ), awful.button(
        {}, 4, function()
          awful.layout.inc(1)
        end
      ), awful.button(
        {}, 5, function()
          awful.layout.inc(-1)
        end
      )
    )
  )

  return widget
end



return layout_box
