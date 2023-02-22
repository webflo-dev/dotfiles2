return {
  {
    "webflo-dev/nvim-possession",
    dependencies = {
      "fzf-lua",
    },
    dev = true,
    config = true,
    keys = {
      { "<leader>pl", "<cmd>Session list<cr>",   desc = "show sessions" },
      { "<leader>pn", "<cmd>Session new<cr>",    desc = "create new session" },
      { "<leader>pu", "<cmd>Session update<cr>", desc = "update session" },
    },
  }


  --   {
  --     "folke/persistence.nvim",
  --     config = true,
  --   }
}
