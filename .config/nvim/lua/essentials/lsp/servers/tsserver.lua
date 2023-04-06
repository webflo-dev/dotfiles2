local M = {}

function M.on_attach(client, buffer)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(buffer, ...)
  end

  client.server_capabilities.documentFormattingProvider = false

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

M.settings = {
  codeActions = {
    ["source.removeUnused"] = true,
    ["source.removeUnusedImports"] = true,
    ["source.addMissingImports"] = true,
  },
  typescript = {
    inlayHints = {
      includeInlayParameterNameHints = 'literals',
      -- includeInlayParameterNameHints = 'all',
      -- includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      -- includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      -- includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      -- includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }
  },
  javascript = {
    inlayHints = {
      includeInlayParameterNameHints = 'literals',
      -- includeInlayParameterNameHints = 'all',
      -- includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      -- includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      -- includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      -- includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }
  }
}

return M
