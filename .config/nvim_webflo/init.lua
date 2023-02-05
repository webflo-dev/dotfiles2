vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require("plugins")
require("lsp")
require("options")
require("keymaps")
require("misc")

vim.cmd("colorscheme catppuccin-mocha")
