return {
  {
    "CRAG666/code_runner.nvim",
    keys = {
      -- { "<leader><leader>r", [[<CMD>RunCode<CR>]], desc="Run code" }
      {
        "<leader><leader>r",
        function()
          local command = require("neoconf").get("runner", nil)
          if command == "" or command == nil then
            vim.cmd("RunCode")
          else
            require("util.util").run_command(command)
          end
        end,
        desc = "Run code",
      },
    },
    event = { "VeryLazy" },
    config = true,
  },
}
