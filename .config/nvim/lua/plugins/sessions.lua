return {
  {
    "webflo-dev/nvim-sessions",
    dependencies = {
      "fzf-lua",
    },
    config = true,
    keys = {
      { "<leader>pl", "<cmd>Session list<cr>",   desc = "show sessions" },
      { "<leader>pn", "<cmd>Session new<cr>",    desc = "create new session" },
      { "<leader>pu", "<cmd>Session update<cr>", desc = "update session" },
    },
  }
}
