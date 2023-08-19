local plugins = {
  {
    "neovim/nvim-lspconfig",
    event = { "VeryLazy", "BufRead" },
    config = function()
      -- require "plugins.configs.lspconfig"
      -- require "custom.configs.lspconfig"
    end,
    dependencies = {
      require "custom.configs.mason-extra",
      "williamboman/mason-lspconfig",
    },
  },
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
    -- dependencies = {
    --   require "custom.configs.plugins.ts-autotag_conf",
    -- },
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

        -- low level
        "python",
        "java",
        "go",
      },
      indent = {
        enable = true,
      },
      -- autotag = {
      --   enable = true,
      --   enable_rename = true,
      --   enable_close = true,
      --   enable_close_on_slash = true,
      -- },
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
  { import = "custom.configs.plugins.toggleterm_conf" },
  { import = "custom.configs.plugins.go_conf" },
  {
    "equalsraf/neovim-gui-shim",
    lazy = false,
  },
  { import = "custom.configs.plugins.minimap_conf" },
  { import = "custom.configs.plugins.noice_conf" },
  -- { import = "custom.configs.plugins.dressing_conf" },
  -- { import = "custom.configs.plugins.dashboard_conf" },
  { import = "custom.configs.plugins.flash_conf" },
  { import = "custom.configs.plugins.search-replace_conf" },
  { import = "custom.configs.plugins.symbols-outline_conf" },
  { import = "custom.configs.plugins.trouble_conf" },
  { import = "custom.configs.plugins.nvim-surround_conf" },
  { import = "custom.configs.plugins.neogen_conf" },
  { import = "custom.configs.plugins.drop_conf" },
  { import = "custom.configs.plugins.windows_conf" },
  { import = "custom.configs.plugins.ts-autotag_conf" },
  { import = "custom.configs.plugins.neorg_conf" },
  { import = "custom.configs.plugins.vim-matchup_conf" },
  -- { import = "custom.configs.plugins.satellite_conf" },
  -- { import = "custom.configs.tokyonight_conf" },
}
return plugins
