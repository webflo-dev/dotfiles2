return {
  {
    "ggandor/leap.nvim",
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      leap.add_default_mappings()
      --   vim.keymap.del({ "x", "o" }, "x")
      --   vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  -- {
  --   "ggandor/flit.nvim",
  --   dependencies = {
  --     "ggandor/leap.nvim",
  --   },
  --   keys = {
  --     { "f", mode = { "n", "x", "o" }, desc = "f" },
  --     { "F", mode = { "n", "x", "o" }, desc = "F" },
  --     { "t", mode = { "n", "x", "o" }, desc = "t" },
  --     { "T", mode = { "n", "x", "o" }, desc = "T" },
  --   },
  --   config = function(_, opts)
  --     local flit = require("flit")
  --     flit.setup({
  --       keys = { f = "f", F = "F", t = "t", T = "T" },
  --       labeled_modes = "nx",
  --       multiline = true,
  --     })
  --   end,
  -- },

  -- { "echasnovski/mini.jump2d", version = false },

  -- {
  --   "drybalka/tree-climber.nvim",
  --   init = function()
  --     local keyopts = { noremap = true, silent = true }
  --     vim.keymap.set({ "n", "v", "o" }, "H", require("tree-climber").goto_parent, keyopts)
  --     vim.keymap.set({ "n", "v", "o" }, "L", require("tree-climber").goto_child, keyopts)
  --     vim.keymap.set({ "n", "v", "o" }, "J", require("tree-climber").goto_next, keyopts)
  --     vim.keymap.set({ "n", "v", "o" }, "K", require("tree-climber").goto_prev, keyopts)
  --     vim.keymap.set({ "v", "o" }, "in", require("tree-climber").select_node, keyopts, { desc = "select node" })
  --     vim.keymap.set("n", "<c-k>", require("tree-climber").swap_prev, keyopts)
  --     vim.keymap.set("n", "<c-j>", require("tree-climber").swap_next, keyopts)
  --     vim.keymap.set("n", "<c-h>", require("tree-climber").highlight_node, keyopts)
  --   end,
  -- },
}
