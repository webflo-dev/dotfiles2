local keymap = vim.keymap.set

keymap({ "n", "v" }, "<Space>", "<Nop>")
keymap("n", "<Esc>", "<cmd> noh <CR>", { desc = "clear highlight" })
keymap("n", "<leader>n", "<cmd> enew <CR>", { desc = "new buffer" })

-- Disable annoying command line thing
keymap("n", "q:", ":q<CR>")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap("v", "y", "myy`y")
keymap("v", "Y", "myY`y")

-- Paste replace visual selection without copying it
-- keymap('v', 'p', '"_dP')
keymap("x", "<leader>p", [["_dP]])
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
keymap("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

-- Open the current file in the default program (on Mac this should just be just `open`)
-- keymap('n', '<leader>x', ':!xdg-open %<cr><cr>')

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move text up and downLpSaga
keymap("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
keymap("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")
keymap("v", "J", ":move '>+1<CR>gv=gv")
keymap("v", "K", ":move '<-2<CR>gv=gv")

-- keeping it centered
keymap("n", "z", "zz", { desc = "z + keep it center" })
keymap("n", "G", "Gzz", { desc = "G + keep it center" })
keymap("n", "<C-f>", "<C-f>zz", { desc = "<C-f> + keep it center" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "<C-d> + keep it center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "<C-u> + keep it center" })
keymap("n", "<C-b>", "<C-b>zz", { desc = "<C-b> + keep it center" })
keymap("n", "n", "nzzzv", { desc = "n + keep it center" })
keymap("n", "N", "Nzzzv", { desc = "N + keep it center" })

keymap("n", "gP", "i<CR><Esc>PkJxJx", { desc = "Paste on cursor" })
keymap("n", "gp", "a<CR><Esc>PkJxJx", { desc = "Paste on cursor" })

-- Switching buffer/tab
keymap("n", "<TAB>", ":bn<CR>", { desc = "go to next buffer/tab" })
keymap("n", "<S-TAB>", ":bp<CR>", { desc = "go to previous buffer/tab" })
keymap("n", "<leader>x", ":bp|:bd #<CR>", { desc = "close buffer/tab" })

--  Jump to next/previous error
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "cnext + keep it center" })
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "cprev + keep it center" })
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "lnext + keep it center" })
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "lprev + keep it center" })

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "[Diagnostic] goto prev" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "[Diagnostic] goto next" })
keymap("n", "<leader>df", vim.diagnostic.open_float, { desc = "[Diagnostic] open float" })
keymap("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "[Diagnostic] set loclist" })

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
keymap("n", "<leader>a", mark.add_file, { desc = "[harpoon] add file" })
keymap("n", "<C-e>", ui.toggle_quick_menu, { desc = "[harpoon] quick menu" })
keymap("n", "<C-h>", function()
	ui.nav_file(1)
end, { desc = "[harpoon] nav file 1" })
keymap("n", "<C-t>", function()
	ui.nav_file(2)
end, { desc = "[harpoon] nav file 2" })
keymap("n", "<C-s>", function()
	ui.nav_file(3)
end, { desc = "[harpoon] nav file 3" })
-- keymap("n", "<C-n>", function() ui.nav_file(4) end, { desc = "[harpoon] nav file 4" })

-- undotree
keymap("n", "<leader>u", vim.cmd.UndotreeToggle)

local telescope_builtin = require("telescope.builtin")
keymap("n", "<leader>f", function()
	telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[Telescope] Fuzzily search in current buffer]" })

keymap("n", "<leader>ff", "<cmd> Telescope find_files hidden=true <CR>", { desc = "[Telescope] Search files" })
keymap(
	"n",
	"<leader>fF",
	'<cmd> Telescope find_files hidden=true no_ignore=true prompt_title="All Files" follow=true <CR>',
	{ desc = "[Telescope] Search all files" }
)
keymap("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "[Telescope] Find existing buffers" })
keymap("n", "<leader>fh", "<cmd> Telescope oldfiles <CR>", { desc = "[Telescope] Find recently opened files" })
keymap("n", "<leader>fg", "<cmd> Telescope  live_grep_args <CR>", { desc = "[Telescope] Search by Grep" })
keymap("n", "<leader>fw", "<cmd> Telescope grep_string <CR>", { desc = "[Telescope] Search current word" })
keymap("n", "<leader>fd", telescope_builtin.diagnostics, { desc = "[Telescope] Search diagnostics" })
keymap("n", "<leader>h", "<cmd> Telescope help_tags <CR>", { desc = "[Telescope] Search help" })
keymap("n", "<leader>tk", "<cmd> Telescope keymaps <CR>", { desc = "[Telescope] show keymaps" })

-- keymap('n', '<leader>ff', ":Telescope file_browser<CR>",{  desc = "[Telescope] File browser" })
-- keymap('n', '<C-p>', builtin.git_files, {})

-- ## TroubleToggle
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "[Trouble] toggle" })
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "[Trouble] workspace_diagnostics" })
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "[Trouble] document_diagnostics" })
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "[Trouble] loclist" })
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "[Trouble] quickfix" })
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "[Trouble] lsp_references" })

-- ## LspSaga
-- use <C-t> to jump back
keymap("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", { desc = "[LSP] finder" })
keymap({ "n", "v" }, "<leader>lca", "<cmd>Lspsaga code_action<CR>", { desc = "[LSP] code action" })
keymap("n", "<leader>lpd", "<cmd>Lspsaga peek_definition<CR>", { desc = "[LSP] Peek definition" })
keymap("n", "<leader>lgd", "<cmd>Lspsaga goto_definition<CR>", { desc = "[LSP] Go to definition" })
keymap("n", "<leader>lrn", "<cmd>Lspsaga rename<CR>", { desc = "[LSP] rename" })
keymap("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "[LSP] outline toggle" })
keymap("n", "<leader>l", "<cmd>Lspsaga hover_doc<CR>", { desc = "[LSP] hover doc" })

-- Callhierarchy
keymap("n", "<Leader>lci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "[LSP] Incoming calls" })
keymap("n", "<Leader>lco", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "[LSP] Outgoing calls" })

-- support tagstack C-t jump back
keymap("n", "<leader>ldl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "[LSP] show line diagnostics" })
keymap("n", "<leader>ldc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "[LSP] show cursor diagnostic" })
-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "[LSP] jump to previous diagnostic" })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "[LSP] jump to next diagnostic" })

-- ## Comment
keymap("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "[Comment] toggle comment" })
keymap(
	"v",
	"<leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "[Comment] toggle comment" }
)

-- ## NvimTree
keymap("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "[Tree] toggle" })
keymap("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { desc = "[Tree] focus" })

-- ## WhichKey
keymap("n", "<leader>wK", "<cmd> WhichKey <CR>", { desc = "[WhichKey] all keymaps" })

-- keymap('n', "]c",
--   function()
--     if vim.wo.diff then
--       return "]c"
--     end
--     vim.schedule(function()
--       require("gitsigns").next_hunk()
--     end)
--     return "<Ignore>"
--   end,
--   { expr = true, desc = "[Gitsigns] Jump to next hunk" })
--
-- keymap('n', "[c",
--   function()
--     if vim.wo.diff then
--       return "[c"
--     end
--     vim.schedule(function()
--       require("gitsigns").prev_hunk()
--     end)
--     return "<Ignore>"
--   end,
--   { expr = true, desc = "[Gitsigns] Jump to prev hunk" })
--
-- keymap('n', "<leader>rh",
--   function()
--     require("gitsigns").reset_hunk()
--   end,
--   { desc = "[Gitsigns] Reset hunk" })
--
-- keymap('n', "<leader>ph",
--   function()
--     require("gitsigns").preview_hunk()
--   end,
--   { desc = "[Gitsigns] Preview hunk" })
--
-- keymap('n', "<leader>gb",
--   function()
--     package.loaded.gitsigns.blame_line()
--   end,
--   { desc = "[Gitsigns] Blame line" })
--
-- keymap('n', "<leader>td",
--   function()
--     require("gitsigns").toggle_deleted()
--   end,
--   { desc = "[Gitsigns] Toggle deleted" })
