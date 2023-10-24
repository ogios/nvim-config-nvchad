return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "xiyaowong/telescope-emoji.nvim",
      keys = {
        { "<A-.>", "<CMD>Telescope emoji<CR>", "telescope emoji select" },
      },
      config = function()
        require("telescope").load_extension("emoji")
      end,
    },
  },
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
