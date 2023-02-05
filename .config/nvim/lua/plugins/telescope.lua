return {
  { "folke/todo-comments.nvim", enabled = false },

  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xr", "<cmd>TroubleToggle lsp_references<CR>", desc = "LSP references (Trouble)" },
    }
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end
      },
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--follow",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--no-ignore",
          "--trim",
        },
        file_ignore_patterns = { "^./.git/", "^node_modules/" },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        winblend = 0,
        color_devicons = true,
        layout_config = {
          prompt_position = 'top',
          horizontal = {
            preview_width = function(_, cols, _)
              if cols > 200 then
                return math.floor(cols * 0.4)
              else
                return math.floor(cols * 0.6)
              end
            end,
          },
          vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
          flex = { horizontal = { preview_width = 0.9 } },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
          -- layout_config = {
          --   width = 120,
          -- },
        },
        oldfiles = {
          prompt_title = 'History',
        },
        lsp_references = {
          previewer = false,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        file_browser = {
          hijack_netrw = false,
          hidden = true,
        },
      }
    }
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade",
      timeout = 2000,
    },
    config = function()
      require("telescope").load_extension("notify")
    end
  }
}
