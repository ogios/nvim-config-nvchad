vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = "hyprlang",
      root = {
        "hyprland.conf",
      },
    })
  end,

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "hyprlang" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hyprls = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "hyprls" } },
  },
}
