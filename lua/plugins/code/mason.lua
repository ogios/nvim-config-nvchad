return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        powershell_es = {
          settings = {
            powershell = {
              codeFormatting = {
                Preset = "OTBS",
              },
            },
          },
        },
        pyright = {},
        ansiblels = {},
        bashls = {},
        clangd = {},
        cssls = {},
        dockerls = {},
        html = {},
        gopls = {},
        marksman = {},
        volar = {},
        sqlls = {},
        jdtls = {},
        gradle_ls = {},
      },
      setup = {
        eslint = function(server, opts)
          local disabled = require("util.util").is_disabled(server)
          if disabled then
            return true
          end
        end,
        tailwindcss = function(server, opts)
          local disabled = require("util.util").is_disabled(server)
          if disabled then
            return true
          end
        end,
        tsserver = function(server, opts)
          local disabled = require("util.util").is_disabled(server)
          if disabled then
            return true
          end
          -- require("typescript").setup({ server = opts })
          -- return true
        end,
      },
    },
  },

  { import = "plugins.code.lang.go" },
  { import = "plugins.code.lang.vue" },

  {
    "nvimtools/none-ls.nvim",
    lazy = true,
  },
  { import = "lazyvim.plugins.extras.lsp.none-ls" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.python-semshi" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.java" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
}
