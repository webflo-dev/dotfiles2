local gears = require("gears")

local helpers = {}

function helpers.colorize_text(txt, fg)

  if fg == "" then
    fg = "#ffffff"
  end

  return "<span foreground='" .. fg .. "'>" .. txt .. "</span>"
end

function helpers.rounded_shape(radiusOffset)
  return function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 8 + (radiusOffset or 0)) end
end

return helpers
