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
}
