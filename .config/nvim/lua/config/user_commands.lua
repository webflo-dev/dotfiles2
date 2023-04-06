local function plug_list()
  local plugins_file = vim.fn.stdpath("config") .. "/init.lua"

  local loc_list = {}
  for _, p in pairs(require("lazy").plugins()) do
    if p[1] ~= nil then
      local plugin_pattern = '"' .. p[1]:gsub("/", "\\/") .. '"'
      local row = vim.fn.search(plugin_pattern)
      local col =
          tonumber(vim.api.nvim_exec("g/" .. plugin_pattern .. '/execute "normal! ^" | echo col(".")-1', true))
      if row ~= 0 then
        table.insert(loc_list, {
          filename = plugins_file,
          lnum = row,
          col = col + 1,
          text = p[1],
        })
      end
    end
  end
  table.sort(loc_list, function(a, b)
    return string.upper(a.text:gsub(".*/", "")) < string.upper(b.text:gsub(".*/", ""))
  end)
  vim.fn.setloclist(0, loc_list, " ")
  vim.cmd("lopen")
end
vim.api.nvim_create_user_command("PluginList", plug_list, {})
