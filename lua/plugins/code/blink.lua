return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        documentation = {
          auto_show_delay_ms = 0,
        },
      },
      keymap = {
        ["<Tab>"] = {
          "select_next",
          "fallback",
        },
        ["<S-Tab>"] = {
          "select_prev",
          "fallback",
        },
      },
    },
  },
}
