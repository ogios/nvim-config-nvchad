return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  opts = function(_, opts)
    if opts.hooks == nil then
      opts.hooks = {}
    end
    if opts.mappings == nil then
      opts.mappings = {}
    end

    opts.hooks.pre = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end
    opts.mappings.comment = "<c-/>"
    opts.mappings.comment_line = "<c-/><c-/>"
    -- opts.mappings.textobject = "<leader>//"
  end,
}
