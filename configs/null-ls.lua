-- custom/configs/null-ls.lua

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local sources = {
  formatting.prettier,
  -- formatting.stylua,

  -- lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

-- require("mason").setup()
require("mason-null-ls").setup {
  ensure_installed = {
    "stylelint",
    "prettier",
    -- "prettierd",
    -- "eslint",
    "stylua",
    -- "shellcheck",
    -- "flake8",
    -- "autoflake",
    -- "mypy",
    -- "ruff",
    "black",
    "goimports",
    "sql-formatter",
    "buf",
    "powershell_es",
  },
  automatic_setup = true,
  handlers = {},
  automatic_installation = true,
}
