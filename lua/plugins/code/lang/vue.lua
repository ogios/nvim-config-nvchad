local util = require("lspconfig.util")

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

-- return
return {
  -- add typescript to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vue" })
      end
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.volar
        volar = {
          filetypes = require("util.npm_func").is_npm_package_installed("vue")
              and { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
            or { "vue" },
          single_file_support = false,
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
            vue = {
              inlayHints = {
                inlineHandlerLeading = true,
                missingProps = true,
                optionsWrapper = true,
              },
              server = {
                petiteVue = {
                  supportHtmlFile = true,
                },
                diagnosticModel = "push",
              },
              autoInsert = {
                bracketSpacing = true,
                dotValue = true,
                parentheses = true,
              },
              updateImportsOnFileMove = {
                enabled = true,
              },
            },
          },
          on_new_config = function(new_config, new_root_dir)
            new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
            new_config.init_options.vue.autoInsert.dotValue = true
          end,
        },
      },
      setup = {
        volar = function(server, opts)
          local disabled = require("util.util").is_disabled(server)
          if disabled then
            return true
          end
          require("lazyvim.util").lsp.on_attach(function(client, buffer)
            if client.name == "volar" then
              client.server_capabilities = changeWorkspaveCapa(client.server_capabilities)
              client.config.capabilities = changeWorkspaveCapa(client.config.capabilities)
            end
          end)
        end,
      },
    },
  },
}
