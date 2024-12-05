return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      --- --- @type lsp.InlayHint
      --- inlay_hints = {
      ---   enabled = true,
      --- },
      --- --- @type lsp.CodeLens
      --- codelens = {
      ---   -- enabled = true,
      ---   enabled = false,
      --- },
      --- @type vim.diagnostic.Opts
      diagnostics = {
        --- @type vim.diagnostic.Opts.Float
        float = {
          border = "rounded",
        },
        underline = true,
        virtual_text = {
          spacing = 4,
          -- source = "if_many",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          prefix = "icons",
        },
        -- severity_sort = true,
      },
      ---@type lspconfig.options
      servers = {
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        unocss = {},
        -- powershell_es = {
        --   settings = {
        --     powershell = {
        --       codeFormatting = {
        --         Preset = "OTBS",
        --       },
        --     },
        --   },
        -- },
        -- pyright = {},
        -- ansiblels = {},
        bashls = {},
        clangd = {},
        cssls = {},
        -- dockerls = {},
        -- html = {},
        -- gopls = {},
        -- marksman = {},
        -- volar = {},
        -- sqlls = {},
        -- jdtls = {},
        -- gradle_ls = {},
        -- tsserver = {},
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
}
