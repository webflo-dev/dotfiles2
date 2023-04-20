local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local util = {}

util.shape = {
  rounded_rect = function(radius)
    return function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, radius or beautiful.radius)
    end
  end
}


util.font = function(size)
  return beautiful.font_name .. " " .. (size or beautiful.font_size)
end

util.font_monospace = function(size)
  return beautiful.font_monospace_name .. " " .. (size or beautiful.font_size)
end


util.font_glyph = function(size)
  return beautiful.font_glyph_name .. " " .. (size or beautiful.font_size)
end

util.font_glyph_alt = function(size)
  return beautiful.font_glyph_alt_name .. " " .. (size or beautiful.font_size)
end

util.custom_font = function(font_name, size)
  return font_name .. " " .. (size or beautiful.font_size)
end

util.colorize_text = function(text, color, weight)
  return "<span weight='" .. (weight or 'normal') .. "' foreground='" .. color .. "'>" .. text .. "</span>"
end

return util
