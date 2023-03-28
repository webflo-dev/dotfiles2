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



local function get_lsp_keymaps(buffer)
  local keymaps = require("config.commands").get_commands()
  local functionOrCommand = require("config.utils").functionOrCommand
  local wk = require("which-key")

  local function keybind(keys, category)
    return function(bind, action, description)
      local cmd = functionOrCommand(keymaps[category][action])
      if cmd == nil then
        return
      end

      table.insert(keys, { bind, cmd, desc = description })
    end
  end


  local lsp_keys = {}

  -- diagnostics
  local keybind_diagnostics = keybind(lsp_keys, "diagnostics")
  keybind_diagnostics("<leader>cd", "show_diagnostic", "Show line diagnostics")
  keybind_diagnostics("]d", "next_diagnostic", "Next diagnostic")
  keybind_diagnostics("[d", "previous_diagnostic", "Previous diagnostic")

  -- LSP
  wk.register({ ["<leader>c"] = { name = "Code", buffer = buffer } })
  local keybind_lsp = keybind(lsp_keys, "lsp")
  keybind_lsp("K", "hover", "Hover")
  keybind_lsp("gK", "signature_help", "Signature Help")
  keybind_lsp("<leader>ca", "code_action", "Code action")
  keybind_lsp("<leader>cr", "rename", "Rename")
  keybind_lsp("gd", "definition", "Go to definition")
  keybind_lsp("gD", "declaration", "Go to declaration")
  keybind_lsp("gr", "references", "Go to reference")
  keybind_lsp("gt", "type_definition", "Go to type definition")
  keybind_lsp("gi", "implementation", "Go to implementation")
  keybind_lsp("gci", "incoming_calls", "Incoming calls")
  keybind_lsp("gco", "outgoing_calls", "Outgoing calls")
  keybind_lsp("gs", "document_symbol", "Document symbols")

  return lsp_keys
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

  for _, value in ipairs(get_lsp_keymaps(buffer)) do
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

function M.attach_popup_diagnostics(client, buffer)
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
