local awful = require "awful"
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local theme = require("themes/summer/theme")
beautiful.init(theme)

require(... .. ".bar")
require(... .. ".notification")


-- Rounded corners
-- client.connect_signal("request::manage", function(c)
--   if c.fullscreen or c.maximized then
--     c.shape = function(cr, w, h) gears.shape.rectangle(cr, w, h) end
--   else
--     c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 12) end
--   end
-- end)

-- Disable Rounded Corners when fullscreen or maximized
-- local function disable_rounded(c)
--   if c.fullscreen or c.maximized then
--     c.shape = function(cr, w, h) gears.shape.rectangle(cr, w, h) end
--   else
--     c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 15) end
--   end
-- end

-- client.connect_signal("property::maximized", function(c)
--   disable_rounded(c)
-- end)

-- client.connect_signal("property::fullscreen", function(c)
--   disable_rounded(c)
-- end)

-- Wallpaper
screen.connect_signal("request::wallpaper", function(s)

  awful.spawn.easy_async_with_shell("xdpyinfo | awk '/dimensions/{print $2}'", function(stdout)
    local theme_dir = gears.filesystem.get_configuration_dir() .. "themes/summer/"
    awful.wallpaper {
      screen = s,
      widget = {
        {
          image     = theme_dir .. "wallpaper-" .. stdout:sub(1, -2) .. ".jpg",
          upscale   = true,
          downscale = true,
          widget    = wibox.widget.imagebox,
        },
        valign = "center",
        halign = "center",
        tiled  = false,
        widget = wibox.container.tile,
      }
    }
  end)
end)



-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = {
    awful.button({}, 1, function()
      c:activate { context = "titlebar", action = "mouse_move" }
    end),
    awful.button({}, 3, function()
      c:activate { context = "titlebar", action = "mouse_resize" }
    end),
  }

  awful.titlebar(c).widget = {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        halign = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.floatingbutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton(c),
      awful.titlebar.widget.ontopbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)
