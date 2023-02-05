-- require('null-ls').setup({
--   sources = {
--     require('null-ls').builtins.code_actions.eslint_d.with({
--       condition = function(utils)
--         return utils.root_has_file({ '.eslintrc.json' }) or utils.root_has_file({ '.eslintrc.js' }) or utils.root_has_file({ '.eslintrc' })
--       end,
--     }),
--     require('null-ls').builtins.code_actions.gitsigns,
--     require('null-ls').builtins.diagnostics.eslint_d.with({
--       condition = function(utils)
--         return utils.root_has_file({ '.eslintrc.json' }) or utils.root_has_file({ '.eslintrc.js' }) or utils.root_has_file({ '.eslintrc' })
--       end,
--     }),
--     require('null-ls').builtins.diagnostics.proselint,
--     require('null-ls').builtins.diagnostics.gitlint,
--     require('null-ls').builtins.diagnostics.luacheck.with({
--       extra_args = { '--config', vim.fn.stdpath('config') .. '/.luacheckrc' },
--     }),
--     require('null-ls').builtins.formatting.eslint_d.with({
--       condition = function(utils)
--         return utils.root_has_file({ '.eslintrc.json' }) or utils.root_has_file({ '.eslintrc.js' }) or utils.root_has_file({ '.eslintrc' })
--       end,
--     }),
--     require('null-ls').builtins.formatting.prettierd,
--   },
-- })

local null_ls = require('null-ls')
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
  }
}
