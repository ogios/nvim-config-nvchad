local util = require("lspconfig.util")

-- -- local global_ts = "~/AppData/Roaming/npm/node_modules/typescript/lib"
local function get_typescript_server_path(root_dir)
  require("lazyvim.util").info(root_dir)
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
    require("lazyvim.util").error("No typescript server path found!")
    -- vim.notify("No typescript server path found!", vim.log.levels.ERROR)
    return
  end
end
--
-- local changeWorkspaveCapa = function(capabilities)
--   local params = {
--     "fileOperations",
--     "didCreate",
--     "didRename",
--     "didDelete",
--     "didChangeWorkspaceFolders",
--     "didChangeWatchedFiles",
--     "symbol",
--   }
--   for _, v in ipairs(params) do
--     if capabilities.workspace[v] == nil then
--       capabilities.workspace[v] = {}
--     end
--     capabilities.workspace[v].dynamicRegistration = true
--     capabilities.workspace.fileOperations[v] = true
--   end
--   return capabilities
--   -- return changeCapa(capabilities)
-- end

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

  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     "pmizio/typescript-tools.nvim",
  --   },
  --   opts = {
  --     servers = {
  --       tsservercontext = {},
  --     },
  --
  --     setup = {
  --       tsservercontext = function(_, opts)
  --         local neoconf = require("neoconf")
  --         local lspconfig = require("lspconfig")
  --
  --         if neoconf.get("is-volar-project") then
  --           lspconfig["volar"].setup({
  --             server = opts,
  --             settings = {},
  --           })
  --
  --           require("typescript-tools").setup({
  --             server = opts,
  --             settings = {
  --               tsserver_plugins = {
  --                 "@vue/typescript-plugin",
  --               },
  --             },
  --             filetypes = {
  --               "javascript",
  --               "typescript",
  --               "vue",
  --             },
  --           })
  --         else
  --           require("typescript-tools").setup({
  --             server = opts,
  --           })
  --         end
  --
  --         return true
  --       end,
  --     },
  --   },
  -- },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.volar
        volar = {
          root_dir = require("util.util").root_dir_setting("vue", "package.json"),
          vueserver = { useSecondServer = true },
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
          -- on_new_config = function(new_config, new_root_dir)
          --   new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
          --   new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
          -- end,
        },
      },
    },
  },
}
