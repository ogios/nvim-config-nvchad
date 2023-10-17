return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        ansiblels = {},
        bashls = {},
        clangd = {},
        -- denols = {},
        cssls = {},
        dockerls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        html = {},
        gopls = {},
        marksman = {},
        volar = {},
        sqlls = {},
        powershell_es = {},
        jdtls = {},
        gradle_ls = {},
      },
      setup = {
        eslint = function(server, opts)
          if require("util.util").is_disabled(server) then
            return true
          end
        end,
        tailwindcss = function(server, opts)
          if require("util.util").is_disabled(server) then
            return true
          end
        end,
        tsserver = function(server, opts)
          if require("util.util").is_disabled(server) then
            return true
          end
          -- require("typescript").setup({ server = opts })
          -- return true
        end,
      },
    },
  },

  { import = "plugins.code.lang.go" },

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
