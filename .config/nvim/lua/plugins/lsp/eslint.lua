local M = {}

function M.setup(_, opts)
  local S = {}

  local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  end

  S.on_attach = on_attach;

  S.settings = {
    autoFixOnSave = true,
    format = {
      enable = true
    },
    validate = "on",
    workingDirectory = {
      mode = "location"
    }
  }

  return S
end

return M
