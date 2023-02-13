return {
  { "folke/neoconf.nvim", enabled = false },
  { "folke/neodev.nvim", enabled = false },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        debug = false,
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
    opts = {
      diagnostics = {
        signs = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      },
      servers = {
        bashls = {},
        cssls = {},
        eslint = {},
        graphql = {},
        html = {},
        jsonls = require("plugins.lsp.jsonls").settings(),
        sumneko_lua = require("plugins.lsp.sumneko_lua").settings(),
        tsserver = {},
        prismals = {},
        cssmodules_ls = {},
        awk_ls = {},
        yamlls = {},
        gopls = {},
        rust_analyzer = {},
      },
    },
    setup = {
      tsserver = require("plugins.lsp.tsserver").setup,
      eslint = require("plugins.lsp.eslint").setup,
    },
  },

  -- {
  --   "weilbith/nvim-code-action-menu",
  --   cmd = "CodeActionMenu",
  -- },
}
