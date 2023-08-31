local util = require "lspconfig.util"
local utils = require "core.utils"

-- local global_ts = "~/AppData/Roaming/npm/node_modules/typescript/lib"
local function get_typescript_server_path(root_dir)
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
    vim.notify("No typescript server path found!", vim.log.levels.ERROR)
    return
  end
end

local changeCapa = function (capabilities)
  local td = {
    "callHierarchy",
    "codeAction",
    "completion",
    "documentHighlight",
    "documentSymbol",
    "hover",
    "references",
    "rename",
    "semanticTokens",
    "signatureHelp",
    "synchronization",
  }
  for _, v in ipairs(td) do
    if capabilities.textDocument[v] == nil then
      capabilities.textDocument[v] = {}
    end
    capabilities.textDocument[v].dynamicRegistration = true
  end
  return capabilities
end

local changeWorkspaveCapa = function(capabilities)
  local params = {
    "fileOperations",
    "didCreate",
    "didRename",
    "didDelete",
    "didChangeWorkspaceFolders",
    "didChangeWatchedFiles",
    "symbol",
  }
  for _, v in ipairs(params) do
    if capabilities.workspace[v] == nil then
      capabilities.workspace[v] = {}
    end
    capabilities.workspace[v].dynamicRegistration = true
    capabilities.workspace.fileOperations[v] = true
  end
  return capabilities
  -- return changeCapa(capabilities)
end

return function(on_attach, capabilities)
  -- ps: the dynamicRegistration didn't seems to work, is there something wrong?
  capabilities = changeWorkspaveCapa(require("custom.configs.utils.deepcopy")(capabilities))

  require("lspconfig").volar.setup {
    capabilities = capabilities,

    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      client.server_capabilities = changeWorkspaveCapa(client.server_capabilities)

      client.capabilities = changeWorkspaveCapa(client.capabilities)
    end,

    on_new_config = function(new_config, new_root_dir)
      new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      new_config.init_options.vue.autoInsert.dotValue = true
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

    init_options = {
      vue = {
        server = {
          diagnosticModel = "push",
        },
        autoInsert = {
          dotValue = true,
        },
        updateImportsOnFileMove = {
          enabled = true,
        },
      },
      -- typescript = {
      --   preferences = {
      --     -- "relative" | "non-relative" | "auto" | "shortest"(not sure)
      --     importModuleSpecifier = "non-relative",
      --   },
      -- },
    },

    -- ps: don't know why, these settings never works
    settings = {
      vue = {
        server = {
          diagnosticModel = "push",
        },
        autoInsert = {
          dotValue = true,
        },
        updateImportsOnFileMove = {
          enabled = true,
        },
      },
      -- typescript = {
      --   preferences = {
      --     -- "relative" | "non-relative" | "auto" | "shortest"(not sure)
      --     importModuleSpecifier = "non-relative",
      --   },
      -- },
    },
  }
end
