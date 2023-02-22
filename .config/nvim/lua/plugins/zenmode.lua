return {
  { "folke/twilight.nvim" },

  {
    "folke/zen-mode.nvim",
    cmd = {
      "ZenMode",
    },
    opts = {
      window = {
        width = 200
      },
      plugins = {
        twilight = { enabled = false },
        gitsigns = { enabled = true },
        kitty = {
          enabled = true,
          -- font = "+4",
        },
        alacritty = {
          enabled = true,
          font = "14",
        },
      },
      -- callback where you can add custom code when the Zen window opens
      on_open = function(win)
        if require("lazy.core.config").plugins["pets.nvim"] ~= nil then
          vim.cmd("PetsHideToggle")
        end
      end,
      -- callback where you can add custom code when the Zen window closes
      on_close = function()
        if require("lazy.core.config").plugins["pets.nvim"] ~= nil then
          vim.cmd("PetsHideToggle")
        end
      end,
    },
  },

}
