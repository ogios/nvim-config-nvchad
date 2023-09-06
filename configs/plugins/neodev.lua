return {
  "folke/neodev.nvim",
  lazy = false,
  config = function()
    require("neodev").setup {}
  end,
  priority = 999,
}
