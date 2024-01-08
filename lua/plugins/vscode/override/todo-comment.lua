return {
  "folke/todo-comments.nvim",
  opts = function(_, opts)
    opts.highlight = opts.highlight or {}
    opts.highlight.comments_only = false
  end,
}
