return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = true,
      },
      ---@type lspconfig.options
      servers = {
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        unocss = {},
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
        tsserver = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "/usr/lib/node_modules/@vue/typescript-plugin",
                languages = {
                  "vue",
                  "javascript",
                  "javascriptreact",
                  "javascript.jsx",
                  "typescript",
                  "typescriptreact",
                  "typescript.tsx",
                },
              },
            },
          },
          filetypes = {
            "vue",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
        },
      },

      setup = {
        --
        ["*"] = function(server, opts)
          local disabled = require("util.util").is_disabled(server)
          if disabled then
            return true
          end

          -- if not opts.root_dir then
          --   opts.root_dir = require("util.util").root_dir_setting(server, ".git")
          -- end
        end,
        --   eslint = function(server, opts)
        --     local disabled = require("util.util").is_disabled(server)
        --     if disabled then
        --       return true
        --     end
        --   end,
        --   tailwindcss = function(server, opts)
        --     local disabled = require("util.util").is_disabled(server)
        --     if disabled then
        --       return true
        --     end
        --   end,
        --   tsserver = function(server, opts)
        --     local disabled = require("util.util").is_disabled(server)
        --     if disabled then
        --       return true
        --     end
        --     -- require("typescript").setup({ server = opts })
        --     -- return true
        --   end,
      },
    },
    -- config = function(a, b)
    --   -- require("lazyvim.util").info(vim.inspect(a))
    --   local servers = b.servers
    --   for key, _ in pairs(servers) do
    --     local setup_func = b.setup[key] or function(...) end
    --     b.setup[key] = function(server, opts)
    --       local disabled = require("util.util").is_disabled(server)
    --       if disabled then
    --         return true
    --       end
    --
    --       return setup_func(server, opts)
    --     end
    --   end
    --   require("lazyvim.util").info(vim.inspect(b))
    -- end,
  },

  { import = "plugins.code.lang.go" },
  -- { import = "plugins.code.lang.vue" },
  { import = "plugins.code.lang.sql" },

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
