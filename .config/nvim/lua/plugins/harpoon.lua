local utils = require("config.utils")

return {
  {
    "theprimeagen/harpoon",
    config = function(_, opts)
      if utils.has_plugin("telescope.nvim") then
        require("telescope").load_extension("harpoon")
      end
    end
  }
}
