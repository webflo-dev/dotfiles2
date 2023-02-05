require('gitsigns').setup({
  sign_priority = 20,
  signs = {
    add          = { text = '+', },
    change       = { text = '│', },
    delete       = { text = '_', },
    topdelete    = { text = '‾', },
    changedelete = { text = '~', },
    untracked    = { text = '?', },
  },
  -- on_attach = function(bufnr)
  --   vim.keymap.set('n', ']h', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, buffer = bufnr, desc = "gitsigns next hunk" })
  --   vim.keymap.set('n', '[h', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, buffer = bufnr, desc = "gitsigns previous hunk" })
  -- end,
})

