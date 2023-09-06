return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  event = { "VeryLazy" },
  keys = {
    { "<leader>gg", "<CMD>LazyGit<CR>", desc="Stratup lazygit" }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
