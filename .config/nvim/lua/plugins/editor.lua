return {
  -- {
  --   "axelvc/template-string.nvim",
  --   ft = {
  --     "javascript",
  --     "javascriptreact",
  --     "typescript",
  --     "typescriptreact",
  --   }
  -- }

  { "gbprod/stay-in-place.nvim" },
  { "lewis6991/satellite.nvim" },
  {
    "stevearc/aerial.nvim",
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle (Aerial)" },
    },
    opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = {
        min_width = 28,
      },
      show_guides = true,
      filter_kind = false,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
    },
  },

  -- { "LeonHeidelbach/trailblazer.nvim" },

  {
    "boltlessengineer/bufterm.nvim",
    cmd = {
      "BufTermEnter",
      "Terminal",
    }
  },
}
