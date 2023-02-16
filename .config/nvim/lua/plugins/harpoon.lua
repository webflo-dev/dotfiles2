return {
  { "ThePrimeagen/vim-be-good" },

  {
    "theprimeagen/harpoon",
    -- dependencies = {
    --   "telescope.nvim"
    -- },
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
        -- {
        --   "<leader>hT", "<cmd>Telescope harpoon marks<cr>",
        --   desc = "Toggle menu with preview (harpoon)",
        -- },
        {
          "<tab>", function()
          require("harpoon.ui").nav_next()
        end,
          desc = "Navigates to next mark "
        },
        {
          "<S-tab>", function()
          require("harpoon.ui").nav_prev()
        end,
          desc = "Navigates to previous mark"
        },
        {
          "<leader>1",
          function()
            require("harpoon.ui").nav_file(1)
          end,
          desc = "Go to mark 1 (harpoon)",
        },
        {
          "<leader>2",
          function()
            require("harpoon.ui").nav_file(2)
          end,
          desc = "Go to mark 2 (harpoon)",
        },
        {
          "<leader>3",
          function()
            require("harpoon.ui").nav_file(3)
          end,
          desc = "Go to mark 3 (harpoon)",
        },
        {
          "<leader>4",
          function()
            require("harpoon.ui").nav_file(4)
          end,
          desc = "Go to mark 4 (harpoon)",
        },
      }
    end,
    init = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>h"] = { name = "+harpoon" },
      })
    end,
    -- config = function(_, opts)
    --   require("telescope").load_extension("harpoon")
    -- end
  },
}
