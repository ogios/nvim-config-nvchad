local setup = function(_, opts)
  local on_attach = require("plugins.configs.lspconfig").on_attach
  local capabilities = require("plugins.configs.lspconfig").capabilities

  -- personal
  local util = require "lspconfig.util"

  local global_ts = "C:/Users/moiiii/AppData/Roaming/npm/node_modules/typescript/lib"
  local function get_typescript_server_path(root_dir)
    -- Alternative location if installed as root:
    -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
    local found_ts = ""
    local function check_dir(path)
      found_ts = util.path.join(path, "node_modules", "typescript", "lib")
      if util.path.exists(found_ts) then
        return path
      end
    end

    if util.search_ancestors(root_dir, check_dir) then
      return found_ts
    else
      return global_ts
    end
  end

  local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  local custom_capa = cmp_nvim_lsp.default_capabilities()
  custom_capa.workspace = {
    didChangeWatchedFiles = {
      dynamicRegistration = true,
    },
  }

  -- after
  local lspconfig = require "lspconfig"

  -- List of servers to install
  local servers =
    { "luals", "gopls", "html", "cssls", "tsserver", "jedi_language_server", "jsonls", "bashls", "prismals", "graphql", "volar" }

  -- require("mason").setup(opts)
  require("mason").setup()

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
        -- capabilities = capabilities,
        -- capabilities = require("custom.configs.utils.capa_dianamic").capabilities,
        capabilities = custom_capa,
        on_attach = function(client, bufnr)
          -- on_attach(client, bufnr)
          pcall(function()
            client.resolved_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
          end)
          if client.resolved_capabilities then
            client.resolved_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
            vim.notify "dynamicRegistration loaded for volar"
          end
        end,
        on_new_config = function(new_config, new_root_dir)
          new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
        end,
        filetypes = require("custom.configs.utils.npm_func").is_npm_package_installed "vue"
            and { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
          or { "vue" },
        root_dir = require("lspconfig").util.root_pattern "package.json",
        documentFeatures = {
          documentFormatting = {
            defaultPrintWidth = 60,
          },
        },
        settings = {
          vue = {
            autoInsert = {
              dotValue = true,
            },
            updateImportsOnFileMove = {
              enabled = true,
            }
          },
          -- typescript = {
          --   preferences = {
          --     -- "relative" | "non-relative" | "auto" | "shortest"(not sure)
          --     importModuleSpecifier = "non-relative",
          --   },
          -- },
        },
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
      -- "tailwindcss-language-server",
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
