return {

  {
    "wavded/vim-stylus",
    event = { "BufEnter" },
  },

  -- { import = "lazyvim.plugins.extras.ui.edgy" },
  -- -- edgy integration
  -- {
  --   "folke/edgy.nvim",
  --   opts = function(_, opts)
  --     opts.left = opts.left or {}
  --     local deletions = { "Neo-Tree Buffers", "Neo-Tree Git" }
  --
  --     -- delete
  --     local del = {}
  --     for index, val in ipairs(opts.left) do
  --       if type(val) == "table" then
  --         if vim.tbl_contains(deletions, val.title) then
  --           table.insert(del, 1, index)
  --         end
  --       end
  --     end
  --     for _, val in ipairs(del) do
  --       table.remove(opts.left, val)
  --     end
  --   end,
  -- },

  -- override file explorer keymap
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (root dir)", remap = true },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer explorer",
      },
    },
  },

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
      -- opts.mappings.comment = "<c-/>"
      -- opts.mappings.comment_line = "<c-/><c-/>"
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
        "hyprlang",

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
