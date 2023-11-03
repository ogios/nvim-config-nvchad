return {
  "folke/persistence.nvim",
  keys = {
    { "<leader>sl", '<cmd>lua require("persistence").load()<cr>', desc = "Load session of this dir" },
  },
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
    dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"), -- directory where session files are saved
    options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
    pre_save = nil, -- a function to call before saving the session
  },
}
