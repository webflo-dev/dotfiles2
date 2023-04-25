local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

local utilsUi = require("helpers.ui")
local box = require("themes.spring.widgets.box")

local function update_tag(item, tag, index)
  local subIndex = "<sub>" .. index .. "</sub>"
  if tag.selected then
    item:get_children_by_id("tag")[1].markup = "<span foreground='" .. beautiful.yellow .. "'></span>" .. subIndex
  elseif #tag:clients() > 0 then
    item:get_children_by_id("tag")[1].markup = "<span foreground='" .. beautiful.sky .. "'></span>" .. subIndex
  else
    item:get_children_by_id("tag")[1].markup = "<span foreground='" .. beautiful.gray .. "'></span>" .. subIndex
  end
end

local buttons = awful.button({}, 1, function(t) t:view_only() end)

local tag_list = function(s)
  return awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = buttons,
    layout = {
      spacing = dpi(4),
      layout = wibox.layout.fixed.horizontal,
    },
    style = {
      spacing = dpi(10),
    },
    widget_template = {
      id = "tag",
      font = utilsUi.font(14),
      widget = wibox.widget.textbox,
      create_callback = function(self, c3, index, object)
        update_tag(self, c3, index)
      end,
      update_callback = function(self, c3, index, object)
        update_tag(self, c3, index)
      end
    }
  }
end


return function(s)
  return box(tag_list(s))
end
