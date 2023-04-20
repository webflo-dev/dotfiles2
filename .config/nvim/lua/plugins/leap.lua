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
  {
    "ggandor/flit.nvim",
    dependencies = {
      "ggandor/leap.nvim",
    },
    keys = {
      { "f", mode = { "n", "x", "o" }, desc = "f" },
      { "F", mode = { "n", "x", "o" }, desc = "F" },
      { "t", mode = { "n", "x", "o" }, desc = "t" },
      { "T", mode = { "n", "x", "o" }, desc = "T" },
    },
    opts = {
      labeled_modes = "nx",
      multiline = true,
    },
  },
}
