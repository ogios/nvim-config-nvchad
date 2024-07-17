return {
  "petertriho/nvim-scrollbar",
  event = { "VeryLazy" },
  dependencies = {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  config = function()
    require("scrollbar").setup()
  end,
}
