return {
  {
    'ibhagwan/fzf-lua',
    event = { "VeryLazy" },
    config = function()
      require("fzf-lua").setup("telescope")
    end
  },
}
