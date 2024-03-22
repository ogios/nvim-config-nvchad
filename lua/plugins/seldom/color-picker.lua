return {
  "ziontee113/color-picker.nvim",
  lazy = true,
  cmd = {
    "PickColor",
    "PickColorInsert",
  },
  keys = {
    { "<M-c>", "<CMD>PickColor<CR>", mode = "n", desc = "Pick Color" },
    { "<M-c>", "<CMD>PickColorInsert<CR>", mode = "i", desc = "Pick Color Insert" },
  },
  -- setup = function()
  --   local set_keymap = vim.keymap.set
  --   local opts = { noremap = true, silent = true }
  --
  --   set_keymap("n", "<M-c>", "<CMD>PickColor<CR>", opts)
  --   set_keymap("i", "<M-c>", "<CMD>PickColorInsert<CR>", opts)
  -- end,
  config = function()
    require("color-picker").setup()
  end,
}
