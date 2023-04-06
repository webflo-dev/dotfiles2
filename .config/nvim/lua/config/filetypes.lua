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
