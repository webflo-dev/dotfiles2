return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim", lazy = true },
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    opts = function()
      local icons = require("config.icons")
      return {
        enable_diagnostics = true,
        default_component_configs = {
          -- indent = {
          --   padding = 0
          -- },
          git_status = {
            symbols = {
              added = icons.git.added,
              deleted = icons.git.removed,
              modified = icons.git.modified,
              renamed = icons.git.renamed,
              untracked = icons.git.untracked,
              ignored = icons.git.ignored,
              unstaged = icons.git.untracked,
              staged = icons.git.staged,
              conflict = icons.git.conflict,
            },
          },
        },
        filesystem = {
          bind_to_cwd = false,
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
      }
    end
  }

}
