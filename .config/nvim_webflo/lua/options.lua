-- See ":help vim.o"
vim.opt.shiftwidth     = 2 --- Change a number of space characeters inseted for indentation
vim.opt.tabstop        = 2 --- Insert 2 spaces for a tab
vim.opt.softtabstop    = 2 --- Insert 2 spaces for a tab
vim.opt.expandtab      = true --- Use spaces instead of tabs
vim.opt.smartindent    = true --- Makes indenting smart
vim.opt.number         = true --- Shows current line number
vim.opt.relativenumber = true --- Enables relative number
vim.opt.title          = true
vim.opt.termguicolors  = true --- Correct terminal colors
vim.opt.spell          = false
vim.opt.hlsearch       = true
vim.opt.ignorecase     = true --- Needed for smartcase
vim.opt.smartcase      = true --- Uses case in search
vim.opt.wrap           = false --- Display long lines as just one line
vim.opt.breakindent    = true --- maintain indent when wrapping indented lines
vim.opt.list           = true --- enable the below listchars
vim.opt.listchars      = { tab = '▸ ', trail = '·' }
vim.opt.mouse          = "a" --- Enable mouse
vim.opt.splitright     = true --- Vertical splits will automatically be to the right
vim.opt.splitbelow     = true
vim.opt.scrolloff      = 8 --- Always keep space when scrolling to bottom/top edge
vim.opt.sidescrolloff  = 8
vim.opt.clipboard      = "unnamed,unnamedplus" --- Copy-paste between vim and everything else
vim.opt.confirm        = true --- ask for confirmation instead of erroring
vim.opt.undofile       = true --- Sets undo to file
vim.opt.backup         = true --- automatically save a backup file
vim.opt.wildmode       = 'longest:full,full' --- complete the longest common match and allow tabbing the results to fully complete them
vim.opt.signcolumn     = "yes" --"yes:2" --- Add extra sign column next to line number
vim.opt.showmode       = false --- Don't show things like -- INSERT -- anymore
vim.opt.updatetime     = 100 --- Faster completion
vim.opt.redrawtime     = 10000 --- Allow more time for loading syntax on large files
-- vim.opt.completeopt     = "menu,menuone,noselect" --- Better autocompletion
vim.opt.completeopt    = "menu,menuone,noselect,longest,preview" --- Better autocompletion
vim.opt.cmdheight      = 1 --- Give more space for displaying messages
vim.opt.cursorline     = true --- Highlight of current line
vim.opt.emoji          = false --- Fix emoji display
vim.opt.foldcolumn     = "0"
vim.opt.foldnestmax    = 0
vim.opt.foldlevel      = 99 --- Using ufo provider need a large value
vim.opt.foldlevelstart = 99 --- Expand all folds by default
vim.opt.laststatus     = 3 --- Have a global statusline at the bottom instead of one for each window
vim.opt.lazyredraw     = true --- Makes macros faster & prevent errors in complicated mappings
vim.opt.pumheight      = 10 --- Max num of items in completion menu
vim.opt.showtabline    = 2 --- Always show tabs
vim.opt.smarttab       = true --- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.swapfile       = false --- Swap not needed
vim.opt.timeoutlen     = 200 --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
vim.opt.viminfo        = "'1000" --- Increase the size of file history
vim.opt.wildignore     = "*node_modules/**" --- Don't search inside Node.js modules (works for gutentag)
vim.opt.writebackup    = false --- Not needed
-- Neovim defaults
vim.opt.autoindent     = true --- Good auto indent
vim.opt.backspace      = "indent,eol,start" --- Making sure backspace works
vim.opt.conceallevel   = 0 --- Show `` in markdown files
vim.opt.encoding       = "utf-8" --- The encoding displayed
vim.opt.errorbells     = false --- Disables sound effect for errors
vim.opt.fileencoding   = "utf-8" --- The encoding written to file
vim.opt.incsearch      = true --- Start searching before pressing enter

-- vim.opt.numberwidth = 3
-- vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

vim.opt.backupdir:remove('.') --- keep backups out of the current directory
vim.opt.shortmess:append('c')
vim.opt.formatoptions:remove('c')
vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')
vim.opt.fillchars:append('stl: ')
vim.opt.fillchars:append('eob: ')
vim.opt.fillchars:append('fold: ')
vim.opt.fillchars:append('foldopen: ')
vim.opt.fillchars:append('foldsep: ')
vim.opt.fillchars:append('foldclose:')
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"



-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- vim.wo.stl = require('lspsaga.symbolwinbar'):get_winbar()
