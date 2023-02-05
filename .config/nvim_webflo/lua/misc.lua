-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--     group = vim.api.nvim_create_augroup('myGroup', {}),
--     pattern = "*",
--     command = [[%s/\s\+$//e]],
-- })



-- Auto sync plugins on save of plugins.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync"
})

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})


vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
  group = vim.api.nvim_create_augroup("format_on_save", { clear = false })
})

-- Disable diagnostics in node_modules (0 is current buffer only)
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*/node_modules/*",
  command = "lua vim.diagnostic.disable(0)"
})
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*/node_modules/*",
  command = "lua vim.diagnostic.disable(0)"
})

-- Enable spell checking for certain file types
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--     pattern = { "*.txt", "*.md", "*.tex" },
--     command = "setlocal spell"
-- })
--
