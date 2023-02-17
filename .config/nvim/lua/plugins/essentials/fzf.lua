return {
  {
    'ibhagwan/fzf-lua',
    event = { "VeryLazy" },
    keys = {
      -- quick keys
      { "<leader>,",       "<cmd>FzfLua buffers<cr>",          desc = "Show buffers" },
      { "<leader>/",       "<cmd>FzfLua live_grep_resume<cr>", desc = "Find in files (grep)" },
      { "<leader><space>", "<cmd>FzfLua resume<cr>",           desc = "Resume" },

      -- find
      { "<leader>fb",      "<cmd>FzfLua buffers<cr>",          desc = "Show buffers" },
      { "<leader>ft",      "<cmd>FzfLua tabs<cr>",             desc = "Show tabs" },
      { "<leader>ff",      "<cmd>FzfLua files<cr>",            desc = "Find files" },
      { "<leader>fr",      "<cmd>FzfLua oldfiles<cr>",         desc = "Recent files" },

      -- git
      { "<leader>gc",      "<cmd>FzfLua git_commits<cr>",      desc = "Git commits" },
      { "<leader>gf",      "<cmd>FzfLua git_files<cr>",        desc = "Git files" },
      { "<leader>gs",      "<cmd>FzfLua git_status<cr>",       desc = "Git status" },
      { "<leader>gb",      "<cmd>FzfLua git_branches<cr>",     desc = "Git branches" },
      { "<leader>gt",      "<cmd>FzfLua git_stash<cr>",        desc = "Git stash" },

      -- search
      { "<leader>sw",      "<cmd>FzfLua grep_cword<cr>",       desc = "" },
      { "<leader>s",       "<cmd>FzfLua<cr>",                  desc = "" },
      { "<leader>s",       "<cmd>FzfLua<cr>",                  desc = "" },
      { "<leader>s",       "<cmd>FzfLua<cr>",                  desc = "" },
    },
    opts = "telescope"
  },
}
