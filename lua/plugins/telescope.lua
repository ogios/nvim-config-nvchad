return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    if opts.defaults.vimgrep_arguments ~= nil then
      vim.list_extend(opts.defaults.vimgrep_arguments, {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--hidden",
        "--smart-case",
      })
    else
      opts.defaults.vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      }
    end
  end,
}
