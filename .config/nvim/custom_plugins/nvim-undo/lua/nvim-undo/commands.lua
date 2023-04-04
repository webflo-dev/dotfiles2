local core = require("nvim-undo.core")

local M = {}

M.setup = function()
  vim.api.nvim_create_user_command("Undo", function()
    core.list()
  end, {})
end

return M
