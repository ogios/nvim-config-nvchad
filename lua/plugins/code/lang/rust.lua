return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     local ra = opts.servers.rust_analyzer or {}
  --     ra.mason = false
  --     opts.servers.rust_analyzer = ra
  --   end,
  -- },
  --
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

      require("lazyvim.util").info("rust features: " .. vim.inspect(specify_features))
      local cargo = opts.server.default_settings["rust-analyzer"].cargo or {}
      -- local check = opts.server.default_settings["rust-analyzer"].check or {}
      cargo.allFeatures = false
      cargo.features = specify_features
      -- check.features = specify_features
      opts.server.default_settings["rust-analyzer"].cargo = cargo
      -- opts.server.default_settings["rust-analyzer"].check = check
    end,
  },
}
