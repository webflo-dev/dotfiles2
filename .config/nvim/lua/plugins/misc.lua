return {
  --liangxianzhe/nap-nvim { "gbprod/stay-in-place.nvim" },

  -- {
  --   "liangxianzhe/nap-nvim",
  --   config = true,
  -- },


  { "brenoprata10/nvim-highlight-colors" },


  -- { "rebelot/terminal.nvim", },


  -- {
  --   "drybalka/tree-climber.nvim",
  --   init = function()
  --     local keyopts = { noremap = true, silent = true }
  --     vim.keymap.set({ 'n', 'v', 'o' }, 'H', require('tree-climber').goto_parent, keyopts)
  --     vim.keymap.set({ 'n', 'v', 'o' }, 'L', require('tree-climber').goto_child, keyopts)
  --     vim.keymap.set({ 'n', 'v', 'o' }, 'J', require('tree-climber').goto_next, keyopts)
  --     vim.keymap.set({ 'n', 'v', 'o' }, 'K', require('tree-climber').goto_prev, keyopts)
  --     vim.keymap.set({ 'v', 'o' }, 'in', require('tree-climber').select_node, keyopts, { desc = "select node" })
  --     vim.keymap.set('n', '<c-k>', require('tree-climber').swap_prev, keyopts)
  --     vim.keymap.set('n', '<c-j>', require('tree-climber').swap_next, keyopts)
  --     vim.keymap.set('n', '<c-h>', require('tree-climber').highlight_node, keyopts)
  --   end
  -- },

  -- {
  --   "james1236/backseat.nvim",
  --   opts = {
  --     openai_api_key = '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',
  --     openai_model_id = 'gpt-3.5-turbo', --gpt-4
  --   },
  -- },
}
