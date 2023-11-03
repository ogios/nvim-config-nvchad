return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
  config = function()
    require("diffview").setup({})
  end,
  keys = {
    { "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
    { "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Diffview" },
  },
}
