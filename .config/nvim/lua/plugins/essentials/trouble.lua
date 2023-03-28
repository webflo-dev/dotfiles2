return {
  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true
    },
    keys = function()
      local wk = require("which-key")
      wk.register({ ["<leader>x"] = { name = "Trouble" } })
      return {
        { "<cmd>TroubleToggle<cr>", "<leader>xx",                                   desc = "toggle" },
        { "<leader>xw",             "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "workspace_diagnostics" },
        { "<leader>xd",             "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "document_diagnostics" },
        { "<leader>xl",             "<cmd>TroubleToggle loclist<cr>",               desc = "loclist" },
        { "<leader>xq",             "<cmd>TroubleToggle quickfix<cr>",              desc = "quickfix" },
        { "<leader>xR",             "<cmd>TroubleToggle lsp_references<cr>",        desc = "LSP references" },
        { "<leader>xT",             "<cmd>TroubleToggle lsp_type_definitions<cr>",  desc = "LSP type definitions" },
        { "<leader>xD",             "<cmd>TroubleToggle lsp_definitions<cr>",       desc = "LSP definitions" },
        { "<leader>xI",             "<cmd>TroubleToggle lsp_implementations<cr>",   desc = "LSP implementations" },
      }
    end,
  },
}
