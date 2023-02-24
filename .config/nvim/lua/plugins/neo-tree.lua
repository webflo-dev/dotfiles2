return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
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
          follow_current_file = true,
          -- use_libuv_file_watcher = true,
          components = {
            harpoon_index = function(config, node, state)
              local Marked = require("harpoon.mark")
              local path = node:get_id()
              local succuss, index = pcall(Marked.get_index_of, path)
              if succuss and index and index > 0 then
                return {
                  text = string.format(" ⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
                  highlight = config.highlight or "NeoTreeDirectoryIcon",
                }
              else
                return {}
              end
            end
          },
          renderers = {
            file = {
              { "icon" },
              { "name",         use_git_status_colors = true },
              { "harpoon_index" }, --> This is what actually adds the component in where you want it
              { "diagnostics" },
              { "git_status",   highlight = "NeoTreeDimText" },
            }
          }
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
              --auto close
              require("neo-tree").close_all()
            end
          },
        }
      }
    end
  }

}
