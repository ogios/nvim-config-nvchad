return {

  {
    "wavded/vim-stylus",
    event = { "BufEnter" },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = function(_, opts)
      opts.multiline_threshold = 6
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        -- origin
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "hyprlang",
        "kdl",

        -- other
        "tsx",
        "typescript",
        -- add
        "css",
        "vue",
        "java",
        "go",
        "jsonc",
        "scss",
      })
    end,
  },
}
