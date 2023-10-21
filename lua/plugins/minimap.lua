-- {
--   "wfxr/minimap.vim",
--   build = "cargo install --locked code-minimap",
--   lazy = false,
--   cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
--   init = function()
--     vim.cmd "let g:minimap_width = 10"
--     vim.cmd "let g:minimap_auto_start = 1"
--     vim.cmd "let g:minimap_auto_start_win_enter = 1"
--   end,
--   -- config = function()
--   --     vim.cmd("let g:minimap_width = 10")
--   --     vim.cmd("let g:minimap_auto_start = 1")
--   --     vim.cmd("let g:minimap_auto_start_win_enter = 1")
--   -- end,
-- },

return {
  "wfxr/minimap.vim",
  -- lazy = false,
  event = "VeryLazy",
  build = "cargo install --locked code-minimap",
  cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  keys = {
    { "<leader>mm", "<CMD>MinimapToggle<CR>", desc = "Toggle Minimap" },
  },
  config = function()
    vim.g.minimap_width = 10
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
    vim.g.minimap_left = 0
    vim.g.minimap_block_filetypes = { "fugitive", "nvim-tree", "tagbar", "fzf", "telescope", "NvimTree" }
    vim.g.minimap_block_buftypes = { "nofile", "nowrite", "quickfix", "terminal", "prompt", "NvimTree" }
    vim.g.minimap_close_filetypes = { "startify", "netrw", "vim-plug", "NvimTree" }
    vim.g.minimap_highlight_range = 1
    vim.g.minimap_highlight_search = 1
    vim.g.minimap_git_colors = 1
  end,
}
