local setup = function()
  require("nvterm").setup {
    terminals = {
      -- shell = vim.o.shell,
      shell = "pwsh.exe",
      list = {},
      type_opts = {
        float = {
          relative = "editor",
          row = 0.15,
          col = 0.15,
          width = 0.7,
          height = 0.7,
          border = "single",
        },
        horizontal = { location = "rightbelow", split_ratio = 0.3 },
        vertical = { location = "rightbelow", split_ratio = 0.5 },
      },
    },
    behavior = {
      autoclose_on_quit = {
        enabled = false,
        confirm = true,
      },
      close_on_exit = true,
      auto_insert = true,
    },
  }
end

return {
  "NvChad/nvterm",
  event = { "VeryLazy" },
  keys = {
    {
      [[<A-\>]],
      function()
        require("nvterm.terminal").toggle "float"
      end,
      desc = "nvterm",
    },
    -- {
    --   "<leader>gg",
    --   function()
    --     require("nvterm.terminal").send("gitui", "float")
    --   end,
    -- },
  },
  config = function()
    setup()
  end,
}
