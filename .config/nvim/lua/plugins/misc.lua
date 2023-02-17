return {
  { "folke/twilight.nvim" },

  {
    "folke/zen-mode.nvim",
    cmd = {
      "ZenMode",
    },
  },

  {
    "lalitmee/browse.nvim",
    bookmarks = {
      ["github"] = {
        ["name"] = "search github from neovim",
        ["code_search"] = "https://github.com/search?q=%s&type=code",
        ["repo_search"] = "https://github.com/search?q=%s&type=repositories",
        ["issues_search"] = "https://github.com/search?q=%s&type=issues",
        ["pulls_search"] = "https://github.com/search?q=%s&type=pullrequests",
      },
    },
  },


  { "gbprod/stay-in-place.nvim" },

  -- {
  --   "lewis6991/satellite.nvim",
  --   config = function()
  --     require('satellite').setup()
  --   end
  -- },

}
