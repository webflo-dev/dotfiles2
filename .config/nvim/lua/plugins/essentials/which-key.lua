return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = false,
      },
      presets = {
        operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
      },
      -- presets = {
      --   operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      --   motions = true, -- adds help for motions
      --   text_objects = true, -- help for text objects triggered after entering an operator
      --   windows = true, -- default bindings on <c-w>
      --   nav = true, -- misc bindings to work with windows
      --   z = false, -- bindings for folds, spelling and others prefixed with z
      --   g = true, -- bindings for prefixed with g
      -- },
    },
    icons = {
      group = "+ ",
    },
  },
}
