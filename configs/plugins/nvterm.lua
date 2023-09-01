local setup = function ()
  require("nvterm").setup({
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.15,
        col = 0.15,
        width = 0.7,
        height = 0.7,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
})
end


return {
  "NvChad/nvterm",
  event={ "VeryLazy" },
  keys = {
    { [[<A-\>]],
      function ()
        require("nvterm.terminal").toggle("float")
      end,
      desc="nvterm"
    }
  },
  config = function ()
    setup()
  end,
}
