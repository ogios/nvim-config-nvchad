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

return function(on_attach, capabilities)
  require("lspconfig").volar.setup {
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
        },
      },
      typescript = {
        preferences = {
          -- "relative" | "non-relative" | "auto" | "shortest"(not sure)
          importModuleSpecifier = "non-relative",
        },
      },
    },
  }
end
