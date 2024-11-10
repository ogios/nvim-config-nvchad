-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local D = {
  n = {
    "<leader>/",
    "<M-\\>",
    "<c-/>",
  },

  t = {
    "<M-\\>",
    "<C-/>",
  },
}

-- delete keymap
for mode, modeval in pairs(D) do
  for _, val in pairs(modeval) do
    pcall(function()
      vim.keymap.del(mode, val, { clear = true })
    end)
  end
end

local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
---@type LazyKeysLspSpec[]
local M = {
  { "p", 'p:let @+=@0<CR>:let @"=@0<CR>', desc = "Dont copy replaced text", mode = { "x", "v", "n" } },
  { "<M-\\>", "<cmd>close<cr>", desc = "Close terminal (root dir)", mode = "t" },
  { "<M-\\>", lazyterm, desc = "Terminal (root dir)", mode = "n" },
  { "<C-b>", "<ESC>^i", desc = "Beginning of line", mode = "i" },
  { "<C-e>", "<End>", desc = "End of line", mode = "i" },
  { "<C-h>", "<Left>", desc = "Move left", mode = "i" },
  { "<C-l>", "<Right>", desc = "Move right", mode = "i" },
  { "<C-j>", "<Down>", desc = "Move down", mode = "i" },
  { "<C-k>", "<Up>", desc = "Move up", mode = "i" },
  { "jk", "<ESC>", desc = "Exit insert mode", mode = "i" },

  { "<Esc>", ":noh <CR>", desc = "Clear highlights", mode = "n" },
  { "<C-c>", "<cmd> %y+ <CR>", desc = "Copy whole file", mode = "n" },
  { "qw", "viw", desc = "select word in visual mode", mode = "n" },

  -- telescope
  -- { "<leader>fw", "<cmd> Telescope live_grep <CR>", desc = "Live grep", mode = "n", remap = true, nowait = true },
  -- { "<leader>md", "<cmd> Telescope commands <CR>", desc = "telescope builtin command", mode = "n" },
  -- telescope

  -- fzf-lua
  { "<leader>fw", "<cmd> FzfLua live_grep <CR>", desc = "Live grep", mode = "n", remap = true, nowait = true },
  { "<leader>md", "<cmd> FzfLua commands <CR>", desc = "Find Command", mode = "n" },
  -- fzf-lua

  -- lsp
  { "<A-CR>", require("actions-preview").code_actions, mode = { "n", "v" }, desc = "Code action menu" },
  {
    "<leader>lfm",
    function()
      require("lazyvim.util").format({ force = true })
    end,
    desc = "LSP formatting",
    mode = "n",
  },
  { "<leader>ld", "<CMD>Glance definitions<CR>", desc = "Goto Definition", mode = "n" },
  { "<leader>lr", "<CMD>Glance references<CR>", desc = "Goto References", mode = "n" },
  { "<leader>lY", "<CMD>Glance type_definitions<CR>", desc = "Goto Type Definition", mode = "n" },
  { "<leader>lI", "<CMD>Glance implementations<CR>", desc = "Goto Implementation", mode = "n" },
  { "<leader>lD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
  {
    "<leader>lf",
    function()
      vim.diagnostic.open_float({ border = "rounded" })
    end,
    desc = "Float diagnostic",
    mode = "n",
  },
  { "<leader>lra", ":IncRename ", desc = "IncRename", mode = "n" },
  -- lsp

  -- window size
  { "<C-A-Up>", "<CMD>resize +5<CR>", desc = "increase window height", mode = "n" },
  { "<C-A-Down>", "<CMD>resize -5<CR>", desc = "increase window height", mode = "n" },
  { "<C-A-Left>", "<CMD>vertical resize -5<CR>", desc = "increase window height", mode = "n" },
  { "<C-A-Right>", "<CMD>vertical resize +5<CR>", desc = "increase window height", mode = "n" },
  -- window size

  -- buffer
  {
    "<leader>dq",
    function()
      Snacks.bufdelete()
    end,
    "remove buffer",
    mode = "n",
  },
  { "<Tab>", "<CMD>bnext<CR>", "Next tab", mode = "n" },
  { "<S-Tab>", "<CMD>bprevious<CR>", "Previous tab", mode = "n" },
  -- buffer
}
local map = LazyVim.safe_keymap_set
for _, m in pairs(M) do
  if vim.isarray(m.mode) then
    for _, mode in ipairs(m.mode) do
      map(mode, m[1], m[2], { desc = m.desc, remap = m.remap, nowait = m.nowait, silent = m.silent })
    end
  elseif m.mode then
    map(m.mode, m[1], m[2], { desc = m.desc, remap = m.remap, nowait = m.nowait, silent = m.silent })
  else
    map("n", m[1], m[2], { desc = m.desc, remap = m.remap, nowait = m.nowait, silent = m.silent })
  end
end
