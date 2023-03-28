local has_words_before = function()
  ---@diagnostic disable-next-line: deprecated
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",

      -- snippet engine
      "dcampos/nvim-snippy",

      -- sources
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      -- "petertriho/cmp-git",
      -- "David-Kunz/cmp-npm",
      -- "hrsh7th/cmp-emoji",
    },
    opts = function()
      local cmp = require("cmp")

      local format_menu = {
        buffer = "BUFFER",
        nvim_lsp = "LSP",
        path = "PATH",
        snippy = "SNIPPET",
        emoji = "EMOJI",
      }

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require('snippy').expand_snippet(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
              ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
              ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-e>"] = cmp.mapping.abort(),
              ["<C-d>"] = cmp.mapping.scroll_docs(-4),
              ["<C-u>"] = cmp.mapping.scroll_docs(4),
              ["<CR>"] = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
              ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
              ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp_document_symbol" },
          { name = "codeium" },
          { name = "buffer",                  keyword_length = 5 },
          { name = "path" },
          -- { name = "git" },
          -- { name = 'npm',                     keyword_length = 4 },
          -- { name = "emoji" },
        }),
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.sort_text,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
          -- comparators = {
          --   cmp.config.compare.exact,
          --   cmp.config.compare.locality,
          --   cmp.config.compare.recently_used,
          --   cmp.config.compare.score,
          --   cmp.config.compare.offset,
          --   cmp.config.compare.sort_text,
          --   cmp.config.compare.order,
          -- },
        },
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, item)
            local icons = require("config.icons").kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            item.menu = format_menu[entry.source.name]
            return item
          end,
        },
        window = {
          completion = {
            border = "rounded",
            -- col_offset = -3,
            -- side_padding = 0,
          },
          documentation = {
            border = "rounded",
          },
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
}
