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
          -- null_ls.builtins.formatting.shfmt,
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
        lua_ls = require("plugins.lsp.lua_ls").settings(),
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
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gh", "<cmd>Lspsaga lsp_finder<CR>" }
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<CR>" }
      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<CR>" }
      keys[#keys + 1] = { "gr", "<cmd>Lspsaga rename<CR>" }

      -- keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc ++keep<CR>" }
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>" }

      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<CR>" }

      keys[#keys + 1] = { "<leader>o", "<cmd>Lspsaga outline<CR>" }

      -- Call hierarchy
      keys[#keys + 1] = { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" }
      keys[#keys + 1] = { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" }

      keys[#keys + 1] = { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>" }
      -- keys[#keys + 1] = {}
    end,
  },

  -- {
  --   "weilbith/nvim-code-action-menu",
  --   cmd = "CodeActionMenu",
  -- },

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
  },
}
