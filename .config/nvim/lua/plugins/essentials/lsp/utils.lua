local M = {}

local function format()
  local buf = vim.api.nvim_get_current_buf()
  if vim.b.autoformat == false then
    return
  end
  -- local ft = vim.bo[buf].filetype
  -- local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format({
    bufnr = buf,
    -- filter = function(client)
    --   if have_nls then
    --     return client.name == "null-ls"
    --   end
    --   return client.name ~= "null-ls"
    -- end,
  })
end

local function diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end


local function get_lsp_keymaps()
  local keys_fzflua = {
    { "<leader>cd", vim.diagnostic.open_float,               desc = "Line Diagnostics" },
    { "]d",         diagnostic_goto(true),                   desc = "Next Diagnostic" },
    { "[d",         diagnostic_goto(false),                  desc = "Prev Diagnostic" },
    { "]e",         diagnostic_goto(true, "ERROR"),          desc = "Next Error" },
    { "[e",         diagnostic_goto(false, "ERROR"),         desc = "Prev Error" },
    { "]w",         diagnostic_goto(true, "WARN"),           desc = "Next Warning" },
    { "[w",         diagnostic_goto(false, "WARN"),          desc = "Prev Warning" },
    { "K",          vim.lsp.buf.hover,                       desc = "Hover" },
    { "gK",         vim.lsp.buf.signature_help,              desc = "Signature Help",                has = "signatureHelp" },
    { "<c-k>",      vim.lsp.buf.signature_help,              desc = "Signature Help",                mode = "i",           has = "signatureHelp" },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>",      desc = "Code Action",                   mode = { "n", "v" },  has = "codeAction" },
    { "<leader>cr", vim.lsp.buf.rename,                      desc = "Rename",                        has = "rename" },
    { "gd",         "<cmd>FzfLua lsp_definitions<cr>",       desc = "Goto Definition" },
    { "gD",         "<cmd>FzfLua lsp_declarations<cr>",      desc = "Goto Declaration" },
    { "gt",         "<cmd>FzfLua lsp_typedefs<cr>",          desc = "Goto Type Definition" },
    { "gi",         "<cmd>FzfLua lsp_implementations<cr>",   desc = "Goto Implementation" },
    { "gh",         "<cmd>FzfLua lsp_references<cr>",        desc = "References" },
    { "gr",         "<cmd>FzfLua lsp_references<cr>",        desc = "References" },
    { "gci",        "<cmd>FzfLua lsp_incoming_calls<cr>",    desc = "Incoming calls" },
    { "gco",        "<cmd>FzfLua lsp_outgoing_calls<cr>",    desc = "Outgoing calls" },
    { "gs",         "<cmd>FzfLua lsp_document_symbols<cr>",  desc = "Symbols" },

    -- Trouble
    { "td",         "<cmd>Trouble lsp_definitions<cr>",      desc = "Goto Definition (trouble)" },
    { "ti",         "<cmd>Trouble lsp_implementations<cr>",  desc = "Goto Implementation (trouble)" },
    { "th",         "<cmd>Trouble lsp_references<cr>",       desc = "References (trouble)" },
    { "tt",         "<cmd>Trouble lsp_type_definitions<cr>", desc = "Goto Type Definition (trouble)" },
  }

  local keys_telescope = {
    { "<leader>cd", vim.diagnostic.open_float,                 desc = "Line Diagnostics" },
    { "]d",         diagnostic_goto(true),                     desc = "Next Diagnostic" },
    { "[d",         diagnostic_goto(false),                    desc = "Prev Diagnostic" },
    { "]e",         diagnostic_goto(true, "ERROR"),            desc = "Next Error" },
    { "[e",         diagnostic_goto(false, "ERROR"),           desc = "Prev Error" },
    { "]w",         diagnostic_goto(true, "WARN"),             desc = "Next Warning" },
    { "[w",         diagnostic_goto(false, "WARN"),            desc = "Prev Warning" },
    { "K",          vim.lsp.buf.hover,                         desc = "Hover" },
    { "gK",         vim.lsp.buf.signature_help,                desc = "Signature Help",                has = "signatureHelp" },
    { "<c-k>",      vim.lsp.buf.signature_help,                desc = "Signature Help",                mode = "i",           has = "signatureHelp" },
    { "<leader>ca", vim.lsp.buf.code_action,                   desc = "Code Action",                   mode = { "n", "v" },  has = "codeAction" },
    { "<leader>cr", vim.lsp.buf.rename,                        desc = "Rename",                        has = "rename" },
    { "gd",         "<cmd>Telescope lsp_definitions<cr>",      desc = "Goto Definition" },
    { "gD",         vim.lsp.buf.declaration,                   desc = "Goto Declaration" },
    { "gt",         "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
    { "gi",         "<cmd>Telescope lsp_implementations<cr>",  desc = "Goto Implementation" },
    { "gh",         "<cmd>Telescope lsp_references<cr>",       desc = "References" },
    { "gr",         "<cmd>Telescope lsp_references<cr>",       desc = "References" },
    { "gci",        "<cmd>Telescope lsp_incoming_calls<cr>",   desc = "Incoming calls" },
    { "gco",        "<cmd>Telescope lsp_outgoing_calls<cr>",   desc = "Outgoing calls" },
    { "gs",         "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },

    -- Trouble
    { "td",         "<cmd>Trouble lsp_definitions<cr>",        desc = "Goto Definition (trouble)" },
    { "ti",         "<cmd>Trouble lsp_implementations<cr>",    desc = "Goto Implementation (trouble)" },
    { "th",         "<cmd>Trouble lsp_references<cr>",         desc = "References (trouble)" },
    { "tt",         "<cmd>Trouble lsp_type_definitions<cr>",   desc = "Goto Type Definition (trouble)" },
  }

  if (require("lazy.core.config").plugins["telescope.nvim"] ~= nil) then
    return keys_telescope
  end

  return keys_fzflua
end


function M.attach_format(client, buf)
  -- dont format if client disabled it
  if
      client.config
      and client.config.capabilities
      and client.config.capabilities.documentFormattingProvider == false
  then
    return
  end

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormat." .. buf, {}),
      buffer = buf,
      callback = function()
        format()
      end,
    })
  end
end

function M.attach_keymaps(client, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = {}

  for _, value in ipairs(get_lsp_keymaps()) do
    local keys = Keys.parse(value)
    if keys[2] == vim.NIL or keys[2] == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end

  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
      local opts = Keys.opts(keys)
      opts.has = nil
      opts.silent = true
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
    end
  end
end

function M.attach_diagnostics(client, buffer)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = buffer,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end

function M.attach_highligh_reference(client, buffer)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false
    })
    vim.api.nvim_clear_autocmds({
      buffer = buffer,
      group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = buffer,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      group = 'lsp_document_highlight',
      buffer = buffer,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

return M
