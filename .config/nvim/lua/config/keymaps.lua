local wk = require("which-key")
local utils = require("config.utils")
local keymaps = require("config.commands").get_commands()

local map = utils.map


-- Some useful commands
-- =ap  => ident all file

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })


-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })


-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
map("v", "y", "myy`y")
map("v", "Y", "myY`y")


-- Paste replace visual selection without copying it
-- keymap('v', 'p', '"_dP')
map("x", "<leader>p", [["_dP]], { desc = "Past without copy" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank without copy" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank without copy" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copy" })


-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')


-- keeping it centered
map("n", "z", "zz")
map("n", "G", "Gzz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-b>", "<C-b>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


-- map("n", "<C-S-a>", "<cmd>%y+<CR>", { desc = "Select all and copy" })


-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })


-- wk.register({ ["gw"] = "which_key_ignore" })
-- map("n", "gw", "*N")
-- map("x", "gw", "*N")


-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })


-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")


-- floating terminal
map("n", "<leader>t", utils.float_term, { desc = "floating terminal" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })



local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)



-- buffers
wk.register({ ["<leader>b"] = { name = "Buffers" } })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bq", "<cmd>bdelete<cr>", { desc = "Close buffer" })


-- windows
wk.register({ ["<leader>w"] = { name = "Windows" } })
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wq", "<C-W>c", { desc = "Close window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-S-h>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-S-h>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-S-j>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-S-k>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })


-- tabs
wk.register({ ["<leader><tab>"] = { name = "Tabs" } })
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })



-- quick keys
map("n", "<leader>/", utils.functionOrCommand(keymaps.search.search_string), { desc = "Find in files (grep)" })
map("n", "<leader>,", utils.functionOrCommand(keymaps.lists.buffers), { desc = "Show buffers" })

-- find
wk.register({ ["<leader>f"] = { name = "Files" } })
map("n", "<leader>ff", utils.functionOrCommand(keymaps.lists.files), { desc = "Find files" })
map("n", "<leader>fr", utils.functionOrCommand(keymaps.lists.oldfiles), { desc = "Recent files" })

-- search
wk.register({ ["<leader>s"] = { name = "Search" } })
map("n", "<leader>sw", utils.functionOrCommand(keymaps.search.search_word), { desc = "Search word under cursor" })


-- colorschemes
wk.register({ ["<leader>u"] = { name = "UI" } })
map("n", "<leader>ut", utils.functionOrCommand(keymaps.search.colorschemes), { desc = "Colorschemes with preview" })

-- git
wk.register({ ["<leader>g"] = { name = "Git" } })
map("n", "<leader>gc", utils.functionOrCommand(keymaps.git.commits), { desc = "Git commits" })
map("n", "<leader>gb", utils.functionOrCommand(keymaps.git.branches), { desc = "Git branches" })
map("n", "<leader>gs", utils.functionOrCommand(keymaps.git.status), { desc = "Git status" })
map("n", "<leader>gS", utils.functionOrCommand(keymaps.git.stash), { desc = "Git stash" })
map("n", "<leader>gC", utils.functionOrCommand(keymaps.git.branch_commits), { desc = "Git branch commits" })





-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end
