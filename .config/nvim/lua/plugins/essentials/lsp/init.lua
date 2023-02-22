return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "shellcheck",
      },
      ui = {
        border = "rounded",
      },
    },
    config = function(plugin, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },


  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          -- prefix = "●",
          prefix = "■",
        },
        severity_sort = true,
        signs = true,
        float = {
          focusable = false,
          -- style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      },
      autoformat = true,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {
        "bashls",
        "cssls",
        "eslint",
        --"graphql",
        "html",
        "jsonls",
        "lua_ls",
        "tsserver",
        "prismals",
        "cssmodules_ls",
        "awk_ls",
        "yamlls",
        "gopls",
        "rust_analyzer",
      },
    },
    config = function(plugin, opts)
      -- setup formatting and keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          local lsp_utils = require("plugins.essentials.lsp.utils")
          lsp_utils.attach_format(client, buffer)
          lsp_utils.attach_keymaps(client, buffer)
          -- lsp_utils.attach_popup_diagnostics(client, buffer)
          lsp_utils.attach_highligh_reference(client, buffer)
        end,
      })

      -- diagnostics
      for name, icon in pairs(require("config.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)


      -- setup lsconfig
      require("mason-lspconfig").setup({ ensure_installed = opts.servers })



      -- setup LSP servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      if require("lazy.core.config").plugins["cmp-nvim-lsp"] ~= nil then
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      end



      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true }),
      }

      local function setup(server)
        local custom_config_exists, custom_config = pcall(require, "plugins.essentials.lsp.servers." .. server)
        local server_opts = {
          capabilities = capabilities,
          handlers = handlers,
        }
        if custom_config_exists then
          if type(custom_config) == "function" then
            server_opts = vim.tbl_deep_extend("force", server_opts, custom_config())
          else
            server_opts = vim.tbl_deep_extend("force", server_opts, custom_config)
          end
        end

        if require("lazy.core.config").plugins["coq_nvim"] ~= nil then
          require("lspconfig")[server].setup(require("coq").lsp_ensure_capabilities(server_opts))
        else
          require("lspconfig")[server].setup(server_opts)
        end
      end

      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = { "mason.nvim" },
  --   opts = function()
  --     local nls = require("null-ls")
  --     return {
  --       sources = {
  --         nls.builtins.formatting.prettier,
  --       },
  --     }
  --   end,
  -- },
}
