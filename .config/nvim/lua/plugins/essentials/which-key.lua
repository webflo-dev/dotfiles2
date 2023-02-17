return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      spelling = {
        enabled = false,
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    -- local keymaps = {
    --   mode = { "n", "v" },
    --   ["g"] = { name = "+goto" },
    --   ["gz"] = { name = "+surround" },
    --   ["]"] = { name = "+next" },
    --   ["["] = { name = "+prev" },
    --   ["<leader><tab>"] = { name = "+tabs" },
    --   ["<leader>b"] = { name = "+buffer" },
    --   ["<leader>c"] = { name = "+code" },
    --   ["<leader>f"] = { name = "+file/find" },
    --   ["<leader>g"] = { name = "+git" },
    --   ["<leader>gh"] = { name = "+hunks" },
    --   ["<leader>q"] = { name = "+quit/session" },
    --   ["<leader>s"] = { name = "+search" },
    --   ["<leader>u"] = { name = "+ui" },
    --   ["<leader>w"] = { name = "+windows" },
    --   ["<leader>x"] = { name = "+diagnostics/quickfix" },
    -- }
    -- if Util.has("noice.nvim") then
    --   keymaps["<leader>sn"] = { name = "+noice" }
    -- end
    -- wk.register(keymaps)
  end,
}
