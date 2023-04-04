local M = {}

local defaults = {
  fzf_opts = {
    hl = { normal = "Normal" },
    border = "rounded",
    height = 0.5,
    width = 0.25,
    preview = {
      horizontal = "down:40%",
    },
  },
}

M.options = {}

M.setup = function(opts)
  M.options = vim.tbl_deep_extend("force", {}, defaults, opts or {})
end

return M
