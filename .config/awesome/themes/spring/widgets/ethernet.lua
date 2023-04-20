local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local util = require("themes.spring.util")
local box = require("themes.spring.widgets.box")


local ethernet_icon = wibox.widget {
  widget = wibox.widget.textbox,
  text = "ETH",
  align = 'center',
  valign = 'center',
  -- forced_width = dpi(20),
  font = util.font_glyph(),
}

local ethernet_icon_block = wibox.widget {
  ethernet_icon,
  widget = wibox.container.background
}

local default_fg = ethernet_icon_block.fg

local icons = {
  ethernet_connected = beautiful.icons.ethernet,
  ethernet_connecting = beautiful.icons.ethernet_connecting,
  ethernet_disconnected = beautiful.icons.ethernet_disconnected,
}

awesome.connect_signal("network::update", function(devices)
  local text = ''
  for _, device in ipairs(devices) do
    if device.type == "ethernet" then
      local key = device.type .. "_" .. device.state
      local icon = icons[key]
      local icon_color = (device.state == "disconnected" and beautiful.red) or beautiful.fg_normal
      local device_text = "<span foreground='" .. icon_color .. "'>" .. icon .. "</span>"
      text = text .. device_text .. " "
    end
    ethernet_icon:set_markup(text:sub(1, -2))
  end
end)


return ethernet_icon_block
