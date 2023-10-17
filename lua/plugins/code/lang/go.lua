local function GoRunWithArgs()
  local args = require("neoconf").get("go.run.args", {})
  local cmd = "GoRun . -F "
  if next(args) ~= nil then
    cmd = cmd .. "-a "
    for key, val in pairs(args) do
      cmd = cmd .. key .. "\\ " .. val .. "\\ "
    end
  end
  vim.notify(cmd)
  vim.cmd(cmd)
end

return {
  "olexsmir/gopher.nvim",
  event = { "BufEnter *.go" },
  ft = { "go", "gomod" },
  keys = {
    {
      "<leader>gr",
      GoRunWithArgs,
      desc = "Run Go Project",
    },
  },
  config = function(_, opts)
    require("gopher").setup(opts)
  end,
}
