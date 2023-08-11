local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- "sourcery",
        -- "python-lsp-server",
        "jedi-language-server",
        -- "diagnostic-languageserver",
        "autoflake",
        "lua-language-server",
        "prettier",
        "stylua",
        "golangci-lint-langserver",
        "gopls",
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "eslint-lsp",
        "json-lsp",
        "tailwindcss-language-server",
        "shfmt",
        "shellcheck",
        "vue-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        -- "svelte",

        -- low level
        "python",
        "java",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    -- lazy = false,
    config = function()
      -- require "custom.configs.null-ls" -- require your null-ls config here (example below)
      require "custom.configs.null-ls"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    event = "VeryLazy",
    -- lazy = false,
    config = function()
      require "custom.configs.toggleterm_conf"
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "equalsraf/neovim-gui-shim",
    lazy = false,
  },
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
  {
    "wfxr/minimap.vim",
    -- lazy = false,
    event = "VeryLazy",
    build = "cargo install --locked code-minimap",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
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
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    config = function()
      require "custom.configs.notice_conf"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  -- {
  --   "stevearc/dressing.nvim",
  --   opts = {},
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.dressing_conf"
  --   end,
  -- },
  -- {
  --   "glepnir/dashboard-nvim",
  --   event = "VimEnter",
  --   config = function()
  -- require "custom.configs.dashboard_conf"
  --   end,
  --   dependencies = { { "nvim-tree/nvim-web-devicons" } },
  -- },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
}
return plugins
