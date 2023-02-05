local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


return {
  { "L3MON4D3/LuaSnip", enabled = false },
  { "echasnovski/mini.surround", enabled = false },


  {
    "dcampos/cmp-snippy",
    lazy = true,
    dependencies = {
      "dcampos/nvim-snippy"
    },
  },

  {
    "dcampos/nvim-snippy",
    lazy = true,
    keys = {
      { '<Tab>', mode = { 'i', 'x' } },
      'g<Tab>',
    },
    ft = 'snippets',
    cmd = { 'SnippyEdit', 'SnippyReload' },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- sources
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-emoji",
      -- icons
      "onsails/lspkind-nvim",
      -- snippets
      "dcampos/cmp-snippy",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "nvim_lsp_signature_help" },
        { name = "buffer", keyword_length = 5 },
        { name = "nvim_lua" },
        { name = 'snippy' },
        { name = "emoji" },
      }))

      opts.sorting = {
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.offset,
          cmp.config.compare.sort_text,
          cmp.config.compare.order,
        },
      }

      local snippy = require("snippy")
      opts.mappings = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
          select = false,
          behavior = cmp.ConfirmBehavior.Replace
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif snippy.can_expand_or_advance() then
            snippy.expand_or_advance()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif snippy.can_jump(-1) then
            snippy.previous()
          else
            fallback()
          end
        end, { "i", "s" }),
      })


      local lspkind = require("lspkind")
      local icons = require("lazyvim.config").icons.kinds
      opts.formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = {
            Text = icons.Text,
            Method = icons.Method,
            Function = icons.Function,
            Constructor = icons.Constructor,
            Field = icons.Field,
            Variable = icons.Variable,
            Class = icons.Class,
            Interface = icons.Interface,
            Module = icons.Module,
            Property = icons.Property,
            Unit = icons.Unit,
            Value = icons.Value,
            Enum = icons.Enum,
            Keyword = icons.Keyword,
            Snippet = icons.Snippet,
            Color = icons.Color,
            File = icons.File,
            Reference = icons.Reference,
            Folder = icons.Folder,
            EnumMember = icons.EnumMember,
            Constant = icons.Constant,
            Struct = icons.Struct,
            Event = icons.Event,
            Operator = icons.Operator,
            TypeParameter = icons.TypeParameter,
          },
          menu = {
            buffer = "BUFFER",
            nvim_lsp = "LSP",
            path = "PATH",
            luasnip = "SNIPPET",
            emoji = "EMOJI"
          },
        })
      }

      opts.snippet = {
        expand = function(args)
          require("snippy").expand_snippet(args.body)
        end
      }

      opts.window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        }
      }

    end,
  },

}
