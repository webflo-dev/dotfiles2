-- local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function float_term(cmd, opts)
  opts = vim.tbl_deep_extend("force", {
    size = { width = 0.9, height = 0.9 },
  }, opts or {})
  require("lazy.util").float_term(cmd, opts)
end

local function get_root()
  return nil
end


-- Some useful commands
-- =ap  => ident all file

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

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
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

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

map("n", "<C-S-a>", "<cmd>%y+<CR>", { desc = "Select all and copy" })


map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

map("n", "gw", "*N")
map("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })


-- save file
-- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
-- map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })


-- -- toggle options
-- map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
-- map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>ul", function()
--   Util.toggle("relativenumber", true)
--   Util.toggle("number")
-- end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
--   { desc = "Toggle Conceal" })

-- lazygit
map("n", "<leader>gg", function() float_term({ "lazygit" }, { cwd = get_root() }) end,
  { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function() float_term({ "lazygit" }) end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
map("n", "<leader>ft", function() float_term(nil, { cwd = get_root() }) end, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function() float_term() end, { desc = "Terminal (cwd)" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- tabs
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>j", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>k", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })


-- nap.vim (https://github.com/liangxianzhe/nap.nvim)
local Nap = {}

-- Record the last navigation operation.
local _next = nil
local _prev = nil

-- Catch and print the error when executing the command.
---@param command string|function Command to execute.
local call = function(command)
  local ok, result
  if type(command) == "string" then
    ok, result = pcall(vim.cmd, command)
  else
    ok, result = pcall(command)
  end
  if not ok then
    vim.notify(string.format(result), vim.log.levels.WARN, { title = "nap.nvim" })
  end
end

-- Execute either next or prev command based on parameter norp (next_or_prev).
---@param next string|function Command to jump next.
---@param prev string|function Command to jump prev.
---@param norp boolean Next or prev.
local exec = function(next, prev, norp)
  -- Save both command so that we can jump forth and back.
  _next = next
  _prev = prev
  if norp then call(next) else call(prev) end
end

-- Execute the last navigation operation based on parameter norp (next_or_prev).
---@param norp boolean Next or prev.
local exec_last = function(norp)
  if norp and _next ~= nil then
    call(_next)
  elseif not norp and _prev ~= nil then
    call(_prev)
  else
    vim.notify(
      string.format('[nap.nvim] [%s] Nothing to repeat.', norp and 'Next' or 'Previous'),
      vim.log.levels.INFO,
      { title = "nap.nvim", icon = norp and '-->' or '<--' }
    )
  end
end

-- Add keymaps to navigate between Next And Previous.
---@param key string Operator key, usually is a single character.
---@param next string|function Command to jump next.
---@param prev string|function Command to jump next.
---@param next_desc string Description of jump next.
---@param prev_desc string Description of jump next.
---@param modes table|nil Mode for the keybindings.
function Nap.nap(key, next, prev, next_desc, prev_desc, modes)
  local next_prefix = '<c-n>'
  local prev_prefix = '<c-p>'
  local next_key = next_prefix .. key
  local prev_key = prev_prefix .. key
  modes = modes or { "n" }
  for _, mode in pairs(modes) do
    vim.keymap.set(mode, next_key, function() exec(next, prev, true) end, { desc = next_desc })
    vim.keymap.set(mode, prev_key, function() exec(next, prev, false) end, { desc = prev_desc })
  end
end

-- map({ "n", "v", "o" }, "<C-n>", function() exec_last(true) end, { desc = "Repeat next" })
-- map({ "n", "v", "o" }, "<C-p>", function() exec_last(false) end, { desc = "Repeat previous" })

Nap.nap("a", "tabnext", "tabprevious", "Next tab", "Previous tab")
Nap.nap("A", "tablast", "tabfirst", "Last tab", "First tab")

Nap.nap("b", "bnext", "bprevious", "Next buffer", "Previous buffer")
Nap.nap("B", "blast", "bfirst", "Last buffer", "First buffer")

Nap.nap("c", "normal! g,", "normal! g;", "Next change-list item", "Previous change-list item")

Nap.nap("d", vim.diagnostic.goto_next, vim.diagnostic.goto_prev, "Next diagnostic", "Previous diagnostic",
  { "n", "v", "o" })

Nap.nap("f", Nap.next_file, Nap.prev_file, "Next file", "Previous file")
Nap.nap("F", Nap.last_file, Nap.first_file, "Last file", "First file")

Nap.nap("j", Nap.next_jump_list, Nap.prev_jump_list, "Next jump-list item", "Previous jump-list item")

Nap.nap("l", "lnext", "lprevious", "Next item in location list", "Previous item in location list")
Nap.nap("L", "llast", "lfist", "Last item in location list", "First item in location list")
Nap.nap("<C-l>", "lnfile", "lpfile", "Next item in different file in location list",
  "Previous item in different file in location list")

Nap.nap("m", "normal! ]`", "normal [`", "Next lowercase mark", "Previous lowercase mark")

Nap.nap("q", "cnext", "cprevious", "Next item in quickfix list", "Previous item in quickfix list")
Nap.nap("Q", "clast", "cfirst", "Last item in quickfix list", "First item in quickfix list")
Nap.nap("<C-q>", "cnfile", "cpfile", "Next item in different file in quickfix list",
  "Previous item in different file in quickfix list")

Nap.nap("s", "normal! ]s", "normal! [s", "Next spell error", "Previous spell error", { "n", "v", "o" })

Nap.nap("t", "tnext", "tprevious", "Next tag", "Previous tag")
Nap.nap("T", "tlast", "tfirst", "Last tag", "First tag")
Nap.nap("<C-t>", "ptnext", "ptprevious", "Next tag in previous window", "Previous tag in previous window")

Nap.nap("z", "normal! zj", "normal! zk", "Next fold", "Previous fold", { "n", "v", "o" })
