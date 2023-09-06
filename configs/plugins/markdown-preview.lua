return {
  "iamcco/markdown-preview.nvim",
  event = { "BufEnter *.md" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
