require('nvim-tree').setup({
  filters = {
    dotfiles = false,
    custom = {
      vim.fn.stdpath "config" .. "/lua/custom",
      "^node_modules/",
    },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = { "alpha" },
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
  },
  git = {
    ignore = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    icons = { error = "", warn = "", hint = "", info = " " },
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "~",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "+",
          deleted = "-",
          ignored = "◌",
        },
      },
    },
  }
})
