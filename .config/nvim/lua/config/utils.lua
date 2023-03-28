local M = {}

function M.map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

function M.float_term(cmd, opts)
  opts = vim.tbl_deep_extend("force", {
    size = { width = 0.9, height = 0.9 },
  }, opts or {})
  require("lazy.util").float_term(cmd, opts)
end

function M.has_plugin(name)
  return require("lazy.core.config").plugins[name] ~= nil
end

function M.functionOrCommand(functionOrCmd)
  if type(functionOrCmd) == "function" then
    return functionOrCmd
  end

  if type(functionOrCmd) == "string" then
    return "<cmd>" .. functionOrCmd .. "<cr>"
  end
end

return M
