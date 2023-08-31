local setup = function(_, opts)
  require("mason").setup()
  local is_disabled = function(client)
    return require("neoconf").get(client .. ".disable")
  end

  local on_attach = require("plugins.configs.lspconfig").on_attach
  local capabilities = require("plugins.configs.lspconfig").capabilities

  -- after
  local lspconfig = require "lspconfig"

  -- List of servers to install
  local servers = {
    "lua_ls",
    "gopls",
    "html",
    "cssls",
    "tsserver",
    -- "jedi_language_server",
    "jsonls",
    "bashls",
    "prismals",
    "graphql",
    "volar",
    "sqlls",
    "pyright",
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }

  require("mason-lspconfig").setup_handlers {
    -- Default setup for all servers, unless a custom one is defined below
    function(server_name)
      if is_disabled(server_name) then
        return
      end
      lspconfig[server_name].setup {
        on_attach = on_attach,
        -- on_attach = function(client, bufnr)
        --   on_attach(client, bufnr)
        --   -- Add your other things here
        --   -- Example being format on save or something
        -- end,
        capabilities = capabilities,
      }
    end,
    ["lua_ls"] = function()
      require "custom.configs.mason-lsp.lua_ls"(on_attach, capabilities)
    end,
    ["volar"] = function()
      require "custom.configs.mason-lsp.volar"(on_attach, capabilities)
    end,
  }
end

local extra = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/neoconf.nvim",
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "pmizio/typescript-tools.nvim",
  },
  event = {"VeryLazy"},

  -- lazy = false,
  opts = {
    ensure_installed = {
      -- "sourcery",
      -- "python-lsp-server",
      -- "jedi-language-server",
      -- "diagnostic-languageserver",
      "pyright",
      "autoflake",
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
      -- "tailwindcss-language-server",
      "shfmt",
      -- "shellcheck",
      "vue-language-server",
      "bash-language-server",
      "sqlls",
    },
  },
  config = function(plugin, opts)
    setup(plugin, opts)
  end,
}

return extra
