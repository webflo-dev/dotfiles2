local has_words_before = function()
	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require("cmp")
local lspkind = require("lspkind")

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

cmp.setup({
	experimental = {
		ghost_text = true,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[BUF]",
			},
		}),
	},
	-- mapping = {
	--   ['<C-p>'] = cmp.mapping.select_prev_item(),
	--   ['<C-n>'] = cmp.mapping.select_next_item(),
	--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
	--   ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	--   ['<C-f>'] = cmp.mapping.scroll_docs(4),
	--   ['<C-Space>'] = cmp.mapping.complete(),
	--   ['<C-e>'] = cmp.mapping.close(),
	--   -- ['<CR>'] = cmp.mapping.confirm {
	--   --   behavior = cmp.ConfirmBehavior.Replace,
	--   --   select = false,
	--   -- },
	--   ['<CR>'] = cmp.mapping(function(fallback)
	--     if not cmp.confirm(option) then
	--       fallback()
	--     end
	--     -- .confirm {
	--     -- behavior = cmp.ConfirmBehavior.Replace,
	--     -- select = false,
	--   end, { 'i', 's' }),

	--   -- disable completion with tab
	--   -- this helps with copilot setup
	--   ['<Tab>'] = nil,
	--   ['<S-Tab>'] = nil,

	--   -- ['<Tab>'] = cmp.mapping(function(fallback)
	--   --   if cmp.visible() then
	--   --     cmp.select_next_item()
	--   --   elseif has_words_before() then
	--   --     cmp.complete()
	--   --   else
	--   --     fallback()
	--   --   end
	--   -- end, { 'i', 's' }),
	--   -- ['<S-Tab>'] = cmp.mapping(function(fallback)
	--   --   if cmp.visible() then
	--   --     cmp.select_prev_item()
	--   --   else
	--   --     fallback()
	--   --   end
	--   -- end, { 'i', 's' }),
	-- },

	-- mapping = cmp.mapping.preset.insert {
	--   ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	--   ['<C-f>'] = cmp.mapping.scroll_docs(4),
	--   ['<C-Space>'] = cmp.mapping.complete(),
	--   ['<CR>'] = cmp.mapping.confirm {
	--     behavior = cmp.ConfirmBehavior.Replace,
	--     select = true,
	--   },
	--   ['<Tab>'] = cmp.mapping(function(fallback)
	--     if cmp.visible() then
	--       cmp.select_next_item()
	--     else
	--       fallback()
	--     end
	--   end, { 'i', 's' }),
	--   ['<S-Tab>'] = cmp.mapping(function(fallback)
	--     if cmp.visible() then
	--       cmp.select_prev_item()
	--     else
	--       fallback()
	--     end
	--   end, { 'i', 's' }),
	-- },

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-l>"] = cmp.mapping(function(fallback)
			fallback()
		end, {
			"i",
			"s",
		}),
		["<C-h>"] = cmp.mapping(function(fallback)
			fallback()
		end, {
			"i",
			"s",
		}),
	}),

	sorting = {
		comparators = {
			cmp.config.compare.exact,
			cmp.config.compare.locality,
			cmp.config.compare.recently_used,
			cmp.config.compare.score,
			cmp.config.compare.offset,
			cmp.config.compare.sort_text,
			cmp.config.compare.order,
		},
	},

	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp", priority = 9 },
		{ name = "nvim_lsp_signature_help", priority = 8 },
		{ name = "buffer", priority = 7, keyword_length = 5, option = buffer_option, max_item_count = 8 },
		{ name = "nvim_lua", priority = 5 },
		{ name = "path", priority = 4 },
		-- { name = 'fuzzy_path' },
	},

	window = {
		completion = {
			border = border("CmpBorder"),
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		},
		documentation = {
			border = border("CmpDocBorder"),
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})
