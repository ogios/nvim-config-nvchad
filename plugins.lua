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
    "folke/neoconf.nvim",
    lazy = false,
    config = function()
      require("neoconf").setup({})
    end,
    priority = 1000
  },
  {
    "folke/neodev.nvim",
    lazy = false,
    config = function()
      require("neodev").setup({})
    end,
    priority = 999
  },
  { import = "custom.configs.mason-extra" },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      -- git = {
      --   enable = true,
      -- },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        -- "svelte",

        "python",
        "java",
        "go",
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    -- lazy = false,
    config = function()
      -- require "custom.configs.null-ls" -- require your null-ls config here (example below)
      require "custom.configs.null-ls"
    end,
  },
  -- { import = "custom.configs.snippets" },
  { import = "custom.configs.plugins.nvterm" },
  { import = "custom.configs.plugins.nvim-dap" },
  { import = "custom.configs.plugins.nvim-dap-ui" },
  { import = "custom.configs.plugins.nvim-dap-virtual-text" },
  { import = "custom.configs.plugins.toggleterm" },
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
  -- { import = "custom.configs.plugins.satellite" },
  -- { import = "custom.configs.tokyonight" },
}
return plugins
