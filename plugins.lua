local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- "sourcery",
        -- "python-lsp-server",
        "jedi-language-server",
        "lua-language-server",
        "prettier",
        "stylua",
        "golangci-lint-langserver",
        "gopls",
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "eslint-lsp",
        "json-lsp",
        "tailwindcss-language-server",
        "shfmt",
        "shellcheck",
		"vue-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
    lazy = false,
    config = function()
      require "custom.configs.null-ls" -- require your null-ls config here (example below)
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    event = "VeryLazy",
    -- lazy = false,
    config = function()
      require "custom.configs.toggleterm_conf"
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "equalsraf/neovim-gui-shim",
    lazy = false,
  },
}
return plugins
