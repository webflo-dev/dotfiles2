require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")


vim.filetype.add({
  extension = {
    eslintrc = "json",
    mdx = "markdown",
    prettierrc = "json",
  },
  pattern = {
        [".*%.env.*"] = "sh",
  },
})
