-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end


-- Install plugins
require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    -- ### Treesitter

    -- Needed to load first
    use 'lewis6991/impatient.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Treesitter and Addons
    use { 'nvim-treesitter/nvim-treesitter', config = function() require('plugins.treesitter') end, }
    -- use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }
    use { 'numToStr/Comment.nvim', after = 'nvim-treesitter' } -- "gc" to comment visual regions/lines

    -- use { 'm-demare/hlargs.nvim', after = 'nvim-treesitter'}
    -- use { 'ChristianChiarulli/nvim-gps', branch = 'text_hl', after = 'nvim-treesitter', config = function() require('plugins.gps') end, }
    -- use { 'axelvc/template-string.nvim', after = 'nvim-treesitter' }
    -- use { 'numToStr/Comment.nvim' }


    -- ### Navigation

    -- Telescope/Tree/Refactor
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'kyazdani42/nvim-web-devicons' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
      },
      config = function() require('plugins.telescope') end,
    }

    -- Navigating Addons
    use { 'gbprod/stay-in-place.nvim' }
    use { 'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = function() require('plugins.tree') end,
    }


    -- ### LSP

    -- LSP Base
    use {
      'neovim/nvim-lspconfig',
      requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'j-hui/fidget.nvim',
        -- Autocompletion
        -- 'hrsh7th/nvim-cmp',
        -- 'hrsh7th/cmp-nvim-lsp',
      },
      -- config = function() require("plugins.lspconfig") end
    }

    -- LSP Completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'onsails/lspkind-nvim',
        'hrsh7th/cmp-cmdline',
      },
      config = function() require("plugins.cmp") end
    }
    use 'rafamadriz/friendly-snippets'
    use {
      'L3MON4D3/LuaSnip',
      wants = 'rafamadriz/friendly-snippets',
      after = 'nvim-cmp',
    }

    -- LSP Addons
    use 'lvimuser/lsp-inlayhints.nvim'
    use { 'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons", }
    use {
      'glepnir/lspsaga.nvim', branch = "main",
      after = 'nvim-lspconfig',
      config = function() require("plugins.lspsaga") end
    }


    -- ### Git

    use { 'lewis6991/gitsigns.nvim', config = function() require('plugins.gitsigns') end, }
    use 'tpope/vim-fugitive'
    use 'kdheepak/lazygit.nvim'
    -- use { 'sindrets/diffview.nvim', config = "require('plugins.diffview')" }
    -- use { 'akinsho/git-conflict.nvim', tag = "*", config = "require('plugins.git.conflict')" }
    -- use { 'ThePrimeagen/git-worktree.nvim', config = "require('plugins.git.worktree')" }


    -- ### Help
    use { 'folke/which-key.nvim', config = function() require('plugins.which-key') end, }


    -- ### GUI

    -- Status bar
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function() require('plugins.lualine') end,
    }

    -- Tabs
    use {
      'akinsho/bufferline.nvim', tag = "v3.*",
      requires = 'nvim-tree/nvim-web-devicons',
      config = function() require('plugins.bufferline') end,
    }
    -- use { 'romgrk/barbar.nvim',
    --   requires = { 'kyazdani42/nvim-web-devicons' },
    --   config = function() require('plugins.barbar') end,
    -- }



    -- ### Editor
    use {
      'lewis6991/satellite.nvim',
      config = function() require('satellite').setup() end
    }
    use 'tpope/vim-surround'
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function() require('plugins.indent-blankline') end,
    }

    use {
      "windwp/nvim-autopairs",
      config = function() require('plugins.autopairs') end,
    }
    use {
      'windwp/nvim-ts-autotag',
      config = function() require('nvim-ts-autotag').setup {} end,
    }

    use {
      'weilbith/nvim-code-action-menu',
      cmd = 'CodeActionMenu',
      requires = { 'kosayoda/nvim-lightbulb' }
    }
    use {
      'NvChad/nvim-colorizer.lua',
      config = function() require('plugins.colorizer') end,
    }

    use {
      'MunifTanjim/prettier.nvim',
      requires = { 'jose-elias-alvarez/null-ls.nvim' },
      config = function() require('plugins.prettier') end,
    }

    -- ### Misc.
    use 'ThePrimeagen/vim-be-good'
    use {
      'goolord/alpha-nvim', -- startup dashboard
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('alpha').setup(require('alpha.themes.startify').config)
      end
    }
    use {
      'kazhala/close-buffers.nvim',
      after = 'bufferline.nvim',
      config = function()
        require('close_buffers').setup({
          preserve_window_layout = { 'this' },
          next_buffer_cmd = function(windows)
            require('bufferline').cycle(1)
            local bufnr = vim.api.nvim_get_current_buf()

            for _, window in ipairs(windows) do
              vim.api.nvim_win_set_buf(window, bufnr)
            end
          end,
        })
      end
    }

    use 'theprimeagen/harpoon'
    use 'ThePrimeagen/git-worktree.nvim'
    use 'mbbill/undotree'
    -- use 'folke/twilight.nvim'
    -- use 'ggandor/leap.nvim'


    -- ### Themes
    use 'EdenEast/nightfox.nvim'
    use 'tomasiser/vim-code-dark'
    use 'catppuccin/nvim'
    -- use 'Mofiqul/dracula.nvim'
    -- use 'sonph/onehalf'
    -- use 'dracula/vim'
    -- use 'jacoborus/tender.vim'
    -- use 'arcticicestudio/nord-vim'
    -- use 'drewtempelmeyer/palenight.vim'
    -- use 'Shatur/neovim-ayu'
    use 'rose-pine/neovim'
    -- use 'frenzyexists/aquarium-vim'
    use "rebelot/kanagawa.nvim"

    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
      plugins(use)
    end

    -- Automatically install plugins on first run
    if is_bootstrap then
      require('packer').sync()
    end


  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
