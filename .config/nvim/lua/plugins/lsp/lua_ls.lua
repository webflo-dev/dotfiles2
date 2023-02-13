local M = {}

function M.settings()
  return {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = { enable = false },
        diagnostics = { globals = { 'vim' } },
        runtime = { version = 'LuaJIT' },
      },
    }
  }
end

return M
