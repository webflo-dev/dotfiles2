return {
  { "ThePrimeagen/vim-be-good" },

  {
    "theprimeagen/harpoon",
    keys = function()
      return {
        {
          "<leader>ha",
          function()
            require("harpoon.mark").add_file()
          end,
          desc = "Add file (harpoon)",
        },
        {
          "<leader>ht",
          function()
            require("harpoon.ui").toggle_quick_menu()
          end,
          desc = "Toggle menu (harpoon)",
        },
        {
          "<leader>hj",
          function()
            require("harpoon.ui").nav_file(1)
          end,
          desc = "Go to file #1 (harpoon)",
        },
        {
          "<leader>hk",
          function()
            require("harpoon.ui").nav_file(2)
          end,
          desc = "Go to file #2 (harpoon)",
        },
        {
          "<leader>hl",
          function()
            require("harpoon.ui").nav_file(3)
          end,
          desc = "Go to file #3 (harpoon)",
        },
      }
    end,
    init = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>h"] = { name = "+harpoon" },
      })
    end,
  },

  {
    "mbbill/undotree",
    keys = {
      { "<C-z>", "<cmd>UndotreeToggle<CR>", desc = "toggle (undo tree)" },
    },
  },

  {
    "phaazon/mind.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "MindOpenMain",
      "MindOpenProject",
      "MindOpenSmartProject",
    },
  },

  { "folke/twilight.nvim" },
  { "folke/zen-mode.nvim" },
}
