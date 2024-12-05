return {
  "folke/twilight.nvim",
  keys = {
    { "<leader>oo", "<CMD>Twilight<CR>", desc = "Toggle twilight" },
  },
  opts = {
    dimming = {
      inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
