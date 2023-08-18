local setup = function(_, opts)
  local on_attach = require("plugins.configs.lspconfig").on_attach
  local capabilities = require("plugins.configs.lspconfig").capabilities

  local lspconfig = require "lspconfig"

  -- List of servers to install
  local servers = { "html", "cssls", "tsserver", "jedi_language_server", "jsonls", "bashls", "prismals", "graphql" }

  require("mason").setup(opts)

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }

  -- This will setup lsp for servers you listed above
  -- And servers you install through mason UI
  -- So defining servers in the list above is optional
  require("mason-lspconfig").setup_handlers {
    -- Default setup for all servers, unless a custom one is defined below
    function(server_name)
      lspconfig[server_name].setup {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- Add your other things here
          -- Example being format on save or something
        end,
        capabilities = capabilities,
      }
    end,
    -- custom setup for a server goes after the function above
    -- Example, override rust_analyzer
    -- ["rust_analyzer"] = function ()
    --   require("rust-tools").setup {}
    -- end,
    -- Another example with clangd
    -- Users usually run into different offset_encodings issue,
    -- so this is how to bypass it (kindof)
    -- ["clangd"] = function()
    --   lspconfig.clangd.setup {
    --     cmd = {
    --       "clangd",
    --       "--offset-encoding=utf-16", -- To match null-ls
    --       --  With this, you can configure server with
    --       --    - .clangd files
    --       --    - global clangd/config.yaml files
    --       --  Read the `--enable-config` option in `clangd --help` for more information
    --       "--enable-config",
    --     },
    --     on_attach = function(client, bufnr)
    --       on_attach(client, bufnr)
    --     end,
    --     capabilities = capabilities,
    --   }
    -- end,

    ["volar"] = function()
      lspconfig.volar.setup {
        on_attach = function(client, bufnr)
          if client.resolved_capabilities then
            client.resolved_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
            vim.notify("dynamicRegistration loaded for volar");
          end
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
      }
    end,

    -- Example: disable auto configuring an LSP
    -- Here, we disable lua_ls so we can use NvChad's default config
    -- ["lua_ls"] = function() end,
  }
end

local extra = {
  "williamboman/mason.nvim",

  -- lazy = false,
  opts = {
    ensure_installed = {
      -- "sourcery",
      -- "python-lsp-server",
      "jedi-language-server",
      -- "diagnostic-languageserver",
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
      "tailwindcss-language-server",
      "shfmt",
      "shellcheck",
      "vue-language-server",
      "bash-language-server",
    },
  },
  config = function(plugin, opts)
    setup(plugin, opts)
  end,
}

return extra
