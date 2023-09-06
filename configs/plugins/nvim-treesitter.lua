return {
  "nvim-treesitter/nvim-treesitter",
  opts = {

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    ensure_installed = {
      -- defaults
      "vim",
      "lua",
      "markdown",

      -- web dev
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "vue",
      -- "svelte",

      "python",
      "java",
      "go",
    },
    indent = {
      enable = true,
    },
  },
}
