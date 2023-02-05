-- require('bufferline').setup({
--   options = {
--     indicator = {
--       icon = ' ',
--     },
--     show_close_icon = false,
--     tab_size = 0,
--     max_name_length = 25,
--     offsets = {
--       {
--         filetype = 'NvimTree',
--         text = '  Files',
--         highlight = 'StatusLine',
--         text_align = 'left',
--       },
--     },
--     separator_style = 'slant',
--     modified_icon = '',
--     custom_areas = {
--       left = function()
--         return {
--           { text = '    ', fg = '#8fff6d' },
--         }
--       end,
--     },
--   },
--   highlights = {
--     fill = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     background = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     tab = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     tab_close = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     close_button = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--       fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
--     },
--     close_button_visible = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--       fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
--     },
--     close_button_selected = {
--       fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
--     },
--     buffer_visible = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     modified = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     modified_visible = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     duplicate = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     duplicate_visible = {
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     separator = {
--       fg = { attribute = 'bg', highlight = 'StatusLine' },
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--     separator_selected = {
--       fg = { attribute = 'bg', highlight = 'StatusLine' },
--       bg = { attribute = 'bg', highlight = 'Normal' }
--     },
--     separator_visible = {
--       fg = { attribute = 'bg', highlight = 'StatusLine' },
--       bg = { attribute = 'bg', highlight = 'StatusLine' },
--     },
--   },
-- })


require("bufferline").setup({
  options = {
    buffer_close_icon = "",
    close_icon = "",
    indicator = {
      style = "icon",
      icon = " ",
    },
    left_trunc_marker = "",
    modified_icon = "●",
    offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center", separator = true } },
    right_trunc_marker = "",
    show_tab_indicators = true,
    diagnostics = 'nvim_lsp',
    separator_style = 'thick',
  },
  highlights = {
    fill = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLineNC" },
    },
    background = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    buffer_visible = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    buffer_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    separator = {
      fg = { attribute = "bg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    separator_selected = {
      fg = { attribute = "fg", highlight = "Special" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    separator_visible = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLineNC" },
    },
    close_button = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    close_button_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    close_button_visible = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
  },
})

