return {
  "akinsho/git-conflict.nvim",
  after = "tokyonight.nvim",
  lazy = true,
  config = function()
    require("git-conflict").setup({
      highlights = {
        ancestor = "DiffDelete",
        current = "DiffAdd",
        incoming = "DiffChange",
      },
    })
  end,
}
