return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      transparent = true,
      dim_inactive = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(highlights, colors)
        highlights.CursorLineNr = {
          fg = "#FFFFFF"
        }
        highlights.LineNr = {
          fg = colors.dark5
        }
        highlights.TreesitterContextLineNumber = {
          fg = highlights.CursorLineNr.fg
        }
        -- highlights.TreesitterContextBottom = {
        --   underline = true,
        -- }
      end
    },
  },
  { "Mofiqul/vscode.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
    }
  },
  { "decaycs/decay.nvim",   as = "decay" },
  { "maxmx03/dracula.nvim", config = true },
  { "Yazeed1s/minimal.nvim" },
  { "rebelot/kanagawa.nvim" },
  {
    "frenzyexists/aquarium-vim",
    init = function()
      vim.g.aqua_transparency = 1
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      --- @usage "auto"|"main"|"moon"|"dawn"
      variant = "auto",
      --- @usage "main"|"moon"|"dawn"
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = true,
      disable_float_background = true,
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
        colorblind = {
          enable = true,
        }
      }
    }
  },
  { "marko-cerovac/material.nvim" },
  {
    "bluz71/vim-moonfly-colors",
    init = function()
      vim.g.moonflyTransparent = true
      vim.g.moonflyWinSeparator = 2
    end
  },
  {
    "bluz71/vim-nightfly-colors",
    init = function()
      vim.g.nightflyTransparent = true
      vim.g.nightflyWinSeparator = 2
    end
  },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "kvrohit/substrata.nvim" },
  { "kaiuri/nvim-juliana" },
  {
    "Mofiqul/adwaita.nvim",
    init = function()
      vim.g.adwaita_darker = true             -- for darker version
      vim.g.adwaita_disable_cursorline = true -- to disable cursorline
      vim.g.adwaita_transparent = true        -- makes the background transparent
    end
  },
  {
    "olivercederborg/poimandres.nvim",
    opts = {
      disable_background = true,
      disable_float_background = true,
    }
  },
  { "yazeed1s/oh-lucy.nvim" },
}
