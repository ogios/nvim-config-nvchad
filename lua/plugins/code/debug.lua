return {
  { import = "lazyvim.plugins.extras.dap.core", cond = not vim.g.vscode },
  -- {
  --   "folke/neodev.nvim",
  --   opts = function(_, opts)
  --     if opts.library == nil then
  --       opts.library = { plugins = { "nvim-dap-ui" } }
  --     elseif opts.library.plugins == nil or opts.library.plugins == true then
  --       opts.library.plugins = { "nvim-dap-ui" }
  --     else
  --       vim.list_extend(opts.library.plugins, { "nvim-dap-ui" })
  --     end
  --   end,
  -- },
}
