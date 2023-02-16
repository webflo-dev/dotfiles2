return {
  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true
    },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "[Trouble] toggle" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "[Trouble] workspace_diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "[Trouble] document_diagnostics" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               desc = "[Trouble] loclist" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "[Trouble] quickfix" },
      { "gR",         "<cmd>TroubleToggle lsp_references<cr>",        desc = "[Trouble] lsp_references" },
    },
  },



  -- {
  --   "glepnir/lspsaga.nvim",
  --   event = "BufRead",
  --   opts = {
  --     ui = {
  --       border = "rounded",
  --     },
  --     lightbulb = {
  --       enable = true,
  --       enable_in_insert = false,
  --       sign = true,
  --       sign_priority = 40,
  --       virtual_text = true,
  --     },
  --     symbol_in_winbar = {
  --       enable = true,
  --       -- separator = "  ",
  --       separator = " 󰄾 ",
  --       hide_keyword = true,
  --       show_file = true,
  --       folder_level = 2,
  --       respect_root = false,
  --       color_mode = false,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("lspsaga").setup(opts)
  --   end,
  -- },
}
