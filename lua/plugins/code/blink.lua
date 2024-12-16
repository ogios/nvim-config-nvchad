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
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          "fallback",
        },
        ["<S-Tab>"] = {
          "select_prev",
          LazyVim.cmp.map({ "snippet_backward", "ai_accept" }),
          "fallback",
        },
      },
    },
  },
}
