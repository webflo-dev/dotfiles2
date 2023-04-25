local gears = require("gears")
local beautiful = require("beautiful")

local helpers = {}


function helpers.font(size)
  return beautiful.font_name .. " " .. (size or beautiful.font_size)
end

function helpers.font_monospace(size)
  return beautiful.font_monospace_name .. " " .. (size or beautiful.font_size)
end

function helpers.font_glyph(size)
  return beautiful.font_glyph_name .. " " .. (size or beautiful.font_size)
end

function helpers.font_glyph_alt(size)
  return beautiful.font_glyph_alt_name .. " " .. (size or beautiful.font_size)
end

function helpers.custom_font(font_name, size)
  return font_name .. " " .. (size or beautiful.font_size)
end

function helpers.colorize_text(text, color, weight)
  return "<span weight='" .. (weight or 'normal') .. "' foreground='" .. color .. "'>" .. text .. "</span>"
end

function helpers.rounded_shape(radius)
  return function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, radius or beautiful.radius)
  end
end

-- Add a hover cursor to a widget by changing the cursor on
-- mouse::enter and mouse::leave
-- You can find the names of the available cursors by opening any
-- cursor theme and looking in the "cursors folder"
-- For example: "hand1" is the cursor that appears when hovering over
-- links
function helpers.add_hover_cursor(w, hover_cursor)
  local original_cursor = "left_ptr"

  w:connect_signal(
    "mouse::enter", function()
      local w = mouse.current_wibox
      if w then
        w.cursor = hover_cursor or "hand1"
      end
    end
  )

  w:connect_signal(
    "mouse::leave", function()
      local w = mouse.current_wibox
      if w then
        w.cursor = original_cursor
      end
    end
  )
end

function helpers.float_and_resize(c, width, height)
  c.width = width
  c.height = height
  awful.placement.centered(
    c, {
      honor_workarea = true,
      honor_padding = true
    }
  )
  awful.client.property.set(c, 'floating_geometry', c:geometry())
  c.floating = true
  c:raise()
end

return helpers
