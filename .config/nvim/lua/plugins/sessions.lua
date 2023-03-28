return {
  {
    "webflo-dev/nvim-sessions",
    dependencies = {
      "fzf-lua",
    },
    config = true,
    keys = function()
      local wk = require("which-key")
      wk.register({ ["<leader>p"] = { name = "Sessions" } })
      return {
        { "<leader>pl", "<cmd>Session list<cr>",   desc = "show sessions" },
        { "<leader>pn", "<cmd>Session new<cr>",    desc = "create new session" },
        { "<leader>pu", "<cmd>Session update<cr>", desc = "update session" },
      }
    end,
  }
}
