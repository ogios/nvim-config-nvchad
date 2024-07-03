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

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "hypr")
    end,
  },
}
