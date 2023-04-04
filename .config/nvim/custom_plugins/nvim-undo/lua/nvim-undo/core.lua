local config = require("nvim-undo.config")
local time_ago = require("nvim-undo.time-ago")
local fzf_utils = require("fzf-lua.utils")
local fzf_core = require("fzf-lua.core")

local M = {}

local function get_undo_list()
  -- get all diffs
  local ut = vim.fn.undotree()
  local undolist = {}
  -- create diffs for each entry in our undotree
  for i = #ut.entries, 1, -1 do
    local entry = ut.entries[i]
    table.insert(undolist, string.format("%-15s %s",
      fzf_utils.ansi_codes.yellow(tostring(entry.seq)),
      fzf_utils.ansi_codes.blue(time_ago.time_ago(entry.time))))
    if (entry.alt ~= nil) then
      table.insert(undolist, string.format("%-15s %s",
        fzf_utils.ansi_codes.yellow(tostring(entry.seq)),
        fzf_utils.ansi_codes.blue(time_ago.time_ago(entry.time))))
    end
  end

  return undolist
end

M.list = function()
  local undo_list = get_undo_list()

  local opts = {
    fzf_opts = {
          ["--no-multi"] = ""
    },
    prompt = "Undo>",
    file_icons = false,
    show_cwd_header = true,
    preview_opts = "nohidden",
    winopts = config.options.fzf_winopts,
  }

  fzf_core.fzf_exec(undo_list, opts)
end
return M
