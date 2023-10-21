return {
  { import = "lazyvim.plugins.extras.coding.tabnine" },
  { import = "lazyvim.plugins.extras.editor.navic" },
  { import = "lazyvim.plugins.extras.ui.edgy" },
  { import = "lazyvim.plugins.extras.editor.symbols-outline" },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    event = { "BufEnter" },
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          visual = "+",
        },
      })
    end,
  },

  {
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
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      })
    end,
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

        -- other
        "tsx",
        "typescript",
        -- add
        "css",
        "vue",
        "java",
        "go",
        "jsonc",
      })
    end,
  },
}
