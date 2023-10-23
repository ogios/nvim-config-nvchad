return {
  { import = "lazyvim.plugins.extras.formatting.black" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "windwp/nvim-autopairs", opts = {} },
    },
    opts = function()
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- Insert parentheses after selecting method/function
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
