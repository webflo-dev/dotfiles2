local config = require("nvim-undo.config")
local commands = require("nvim-undo.commands")

local M = {}

M.setup = function(opts)
  config.setup(opts)
  commands.setup()
  -- vim.pretty_print(config.options)
end

return M
