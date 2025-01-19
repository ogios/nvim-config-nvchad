return {
  {
    "folke/neoconf.nvim",
    config = function()
      require("neoconf.plugins").register({
        name = "rust",
        on_schema = function(schema)
          schema:import("rust", { features = {}, no_default_feature = false, cfgs = {} })
          schema:set("rust.features", {
            description = "Specify features to enable, leave empty to enable all",
            type = "string",
          })
          schema:set("rust.no_default_feature", {
            description = "no default feature, default false",
            type = "boolean",
          })
          schema:set("rust.cfgs", {
            description = "Specify cfgs to enable, leave empty to do nothing",
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

        local cargo = opts.server.default_settings["rust-analyzer"].cargo or {}
        cargo.features = specify_features
        opts.server.default_settings["rust-analyzer"].cargo = cargo
      end

      local function setup_no_default_target()
        local no_default_feature = require("neoconf").get("rust.no_default_feature", nil)
        if no_default_feature == nil then
          return
        end
        if no_default_feature ~= true then
          return
        end
        local cargo = opts.server.default_settings["rust-analyzer"].cargo or {}
        cargo.noDefaultFeatures = true
        opts.server.default_settings["rust-analyzer"].cargo = cargo
      end

      local setup_cfgs = function()
        local cfgs = require("neoconf").get("rust.cfgs", nil)
        if cfgs == nil then
          return
        end
        if vim.islist(cfgs) == false then
          require("lazyvim.util").warn("rust.cfgs provided in neoconf, but it's not a list, ignored")
          return
        end
        if vim.tbl_count(cfgs) == 0 then
          return
        end

        local cargo = opts.server.default_settings["rust-analyzer"].cargo or {}
        cargo.cfgs = cargo.cfgs or {}
        vim.list_extend(cargo.cfgs, cfgs)
        opts.server.default_settings["rust-analyzer"].cargo = cargo
      end

      setup_cfgs()
      setup_no_default_target()
      setup_feature()

      LazyVim.info(vim.inspect(opts.server.default_settings["rust-analyzer"].cargo))
    end,
  },
}
