return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
  config = function()
    -- local info = require("lazyvim.util").info
    require("diffview").setup({
      -- hooks = {
      --   view_opened = function(view)
      --     info(vim.inspect(view))
      --   end,
      --   diff_buf_read = function(bufnr, ctx)
      --     info("view diff_buf_read: " .. tostring(bufnr))
      --   end,
      --   diff_buf_win_enter = function(bufnr, winid, ctx)
      --     info("diff_buf_win_enter：" .. tostring(bufnr) .. " " .. tostring(winid))
      --   end,
      -- },
    })
  end,
  module = "diffview",
  keys = {
    { "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
    { "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Diffview" },
  },
}
