return {
  {
    "folke/neoconf.nvim",
    config = function()
      require("neoconf.plugins").register({
        name = "rust",
        on_schema = function(schema)
          schema:import("rust", { features = {} })
          schema:set("rust.features", {
            description = "Specify features to enable, leave empty to enable all",
            type = "string",
          })
        end,
      })
      require("neoconf").setup()
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server.on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>ce", function()
          vim.cmd.RustLsp("expandMacro")
        end, { desc = "Expand Macro (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<leader>co", function()
          vim.cmd.RustLsp("openDocs")
        end, { desc = "Open Docs (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<leader>cO", function()
          vim.cmd.RustLsp("openCargo")
        end, { desc = "Open Cargo.toml (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<leader>cp", function()
          vim.cmd.RustLsp("parentModule")
        end, { desc = "Open Parent Module (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<leader>dR", function()
          vim.cmd.RustLsp("debuggables")
        end, { desc = "Debuggables (Rust)", buffer = bufnr })

        vim.keymap.set("n", "K", function()
          vim.cmd.RustLsp({ "hover", "actions" })
        end, { desc = "Hover action (Rust)", buffer = bufnr })
      end

      local setup_feature = function()
        local specify_features = require("neoconf").get("rust.features", nil)
        if specify_features == nil then
          return
        end
        if vim.islist(specify_features) == false then
          require("lazyvim.util").warn("rust.features provided in neoconf, but it's not a list, ignored")
          return
        end
        if vim.tbl_count(specify_features) == 0 then
          return
        end

        LazyVim.info("rust features: " .. vim.inspect(specify_features))
        local cargo = opts.server.default_settings["rust-analyzer"].cargo or {}
        -- local check = opts.server.default_settings["rust-analyzer"].check or {}
        cargo.allFeatures = false
        cargo.features = specify_features
        -- check.features = specify_features
        opts.server.default_settings["rust-analyzer"].cargo = cargo
        -- opts.server.default_settings["rust-analyzer"].check = check

        require("lazyvim.util").info("rust features: " .. vim.inspect(opts.server.default_settings["rust-analyzer"]))
      end

      setup_feature()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    keys = {
      -- See opts.combo from nvim-cmp-lsp-rs below
      {
        "<leader>bc",
        "<cmd>lua require'cmp_lsp_rs'.combo()<cr>",
        desc = "(nvim-cmp) switch comparators",
      },
    },
    dependencies = {
      {
        "zjp-CN/nvim-cmp-lsp-rs",
        ---@type cmp_lsp_rs.Opts
        opts = {
          -- Filter out import items starting with one of these prefixes.
          -- A prefix can be crate name, module name or anything an import
          -- path starts with, no matter it's complete or incomplete.
          -- Only literals are recognized: no regex matching.
          unwanted_prefix = { "color", "ratatui::style::Styled" },
          -- make these kinds prior to others
          -- e.g. make Module kind first, and then Function second,
          --      the rest ordering is merged from a default kind list
          kind = function(k)
            -- The argument in callback is type-aware with opts annotated,
            -- so you can type the CompletionKind easily.
            return { k.Module, k.Function }
          end,
          -- Override the default comparator list provided by this plugin.
          -- Mainly used with key binding to switch between these Comparators.
          combo = {
            -- The key is the name for combination of comparators and used
            -- in notification in swiching.
            -- The value is a list of comparators functions or a function
            -- to generate the list.
            alphabetic_label_but_underscore_last = function()
              local comparators = require("cmp_lsp_rs").comparators
              return { comparators.sort_by_label_but_underscore_last }
            end,
            recentlyUsed_sortText = function()
              local compare = require("cmp").config.compare
              local comparators = require("cmp_lsp_rs").comparators
              -- Mix cmp sorting function with cmp_lsp_rs.
              return {
                compare.recently_used,
                compare.sort_text,
                comparators.sort_by_label_but_underscore_last,
              }
            end,
          },
        },
      },
    },
    --@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp_lsp_rs = require("cmp_lsp_rs")
      local comparators = cmp_lsp_rs.comparators
      local compare = require("cmp").config.compare

      opts.sorting.comparators = {
        compare.exact,
        compare.score,
        -- comparators.inherent_import_inscope,
        comparators.inscope_inherent_import,
        comparators.sort_by_label_but_underscore_last,
      }

      for _, source in ipairs(opts.sources) do
        cmp_lsp_rs.filter_out.entry_filter(source)
      end

      require("lazyvim.util").info("cmp_lsp_rs: " .. vim.inspect(opts.sorting.comparators))

      return opts
    end,
  },
}
