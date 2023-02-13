return {

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "windwp/nvim-ts-autotag", lazy = true },
      -- { "nvim-treesitter/playground", lazy = true },
    },
    opts = {
      ensure_installed = {
        "awk",
        "bash",
        "cmake",
        "css",
        "diff",
        "dockerfile",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "graphql",
        "help",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "jsonnet",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "prisma",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree = true,
      },
      indent = {
        enable = true
      },
      autopairs = {
        enable = true
      },
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["if"] = "@function.inner",
            ["af"] = "@function.outer",
            ["ic"] = "@class.inner",
            ["ac"] = "@class.outer",
            ['ia'] = '@parameter.inner',
            ['aa'] = '@parameter.outer',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  }
}
