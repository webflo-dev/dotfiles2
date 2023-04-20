-- print array of json objec

return {
  -- { 'Exafunction/codeium.vim' },
  -- { "github/copilot.vim" }
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- build = ":Copilot auth",
    opts = {
      filetypes = {
        markdown = true,   -- overrides default
        terraform = false, -- disallow specific filetype
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
            -- disable for .env files
            return false
          end
          return true
        end,
      },
    },
  },
}
