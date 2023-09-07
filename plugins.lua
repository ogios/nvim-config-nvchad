local plugins = {
  {
    "neovim/nvim-lspconfig",
    event = { "VeryLazy", "BufRead" },
    -- config = function()
    --   -- require "plugins.configs.lspconfig"
    --   -- require "custom.configs.lspconfig"
    -- end,
    -- dependencies = {
    --   require "custom.configs.mason-extra",
    --   "williamboman/mason-lspconfig",
    -- },
  },
  {
    "echasnovski/mini.cursorword",
    version = false,
    event = { "VeryLazy" },
    config = function ()
      require("mini.cursorword").setup({
        delay = 50,
      })
    end
  },
  { import = "custom.configs.plugins.neoconf" },
  { import = "custom.configs.plugins.neodev" },
  { import = "custom.configs.mason-extra" },
  { import = "custom.configs.plugins.nvim-tree" },
  { import = "custom.configs.plugins.nvim-treesitter" },
  { import = "custom.configs.plugins.mason-null-ls" },
  { import = "custom.configs.plugins.nvterm" },
  { import = "custom.configs.plugins.nvim-dap" },
  { import = "custom.configs.plugins.nvim-dap-ui" },
  { import = "custom.configs.plugins.nvim-dap-virtual-text" },
  { import = "custom.configs.plugins.go" },
  {
    "equalsraf/neovim-gui-shim",
    lazy = false,
  },
  { import = "custom.configs.plugins.minimap" },
  { import = "custom.configs.plugins.noice" },
  -- { import = "custom.configs.plugins.dressing" },
  -- { import = "custom.configs.plugins.dashboard" },
  { import = "custom.configs.plugins.flash" },
  { import = "custom.configs.plugins.search-replace" },
  { import = "custom.configs.plugins.symbols-outline" },
  { import = "custom.configs.plugins.trouble" },
  { import = "custom.configs.plugins.nvim-surround" },
  { import = "custom.configs.plugins.neogen" },
  { import = "custom.configs.plugins.drop" },
  -- { import = "custom.configs.plugins.windows" },
  { import = "custom.configs.plugins.ts-autotag" },
  { import = "custom.configs.plugins.neorg" },
  { import = "custom.configs.plugins.vim-matchup" },
  { import = "custom.configs.plugins.code-action-menu" },
  { import = "custom.configs.plugins.firenvim" },
  { import = "custom.configs.plugins.markdown-preview" },
  { import = "custom.configs.plugins.lazygit" },
  -- { import = "custom.configs.plugins.satellite" },
  -- { import = "custom.configs.tokyonight" },
}
return plugins
