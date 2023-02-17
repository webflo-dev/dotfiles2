local M = {}

function M.on_attach(client, buffer)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(buffer, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

return M
