return {
  {
    "CRAG666/code_runner.nvim",
    keys = {
      -- { "<leader><leader>r", [[<CMD>RunCode<CR>]], desc="Run code" }
      {
        "<leader>rr",
        function()
          vim.cmd("RunCode")
        end,
        desc = "Run code",
      },
      {
        "<leader>rc",
        function()
          local runner = require("neoconf").get("runner", nil)
          if runner == nil then
            require("lazyvim.util").error("no runner defined in neocon")
          else
            local command = runner["command"]
            local name = runner["name"]
            if command == "" or name == "" or command == nil or name == nil then
              require("lazyvim.util").error("missing runner property: " .. vim.inspect(runner))
            else
              require("util.util").run_command(runner["command"], runner["name"])
            end
          end
        end,
        "Run Code in neoconf",
      },
    },
    event = { "VeryLazy" },
    config = true,
  },
}
