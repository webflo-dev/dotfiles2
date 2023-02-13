return {
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
  },

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
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
}
