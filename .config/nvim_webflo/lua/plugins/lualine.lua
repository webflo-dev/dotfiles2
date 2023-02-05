local separator = { '"▏"', color = 'StatusLineNonText' }

require('lualine').setup({
  options = {
    section_separators = '',
    component_separators = '',
    globalstatus = true,
    theme = 'auto',
  },
  extensions = { 'fugitive', 'fzf', 'nvim-tree', 'quickfix', 'symbols-outline' },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff',
      {
        'diagnostics',
        sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic' },
        symbos = { error = "", warn = "", hint = "", info = " " },
      }
    },
    lualine_c = { 'searchcount', {
      'filename',
      path = 1,
      -- 0: Just the filename
      -- 1: Relative path
      -- 2: Absolute path
      -- 3: Absolute path, with tilde as the home directory
    }
    },
    -- lualine_c = { 'searchcount', 'filename', "require('lspsaga.symbolwinbar'):get_winbar()" },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
})
