return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        protols = {},
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
        },
      },
    },
  },
}
